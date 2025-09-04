<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Staff Route</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    html,body,#map { height:100%; margin:0; }
    #map { position:relative; }
    .legend, .controls {
      position:absolute; background:#fff; padding:8px 10px; border:1px solid #ddd;
      border-radius:8px; font:14px/1.4 Arial; box-shadow: 0 4px 12px rgba(0,0,0,.08);
    }
    .legend { top:10px; left:10px; }
    .controls { top:10px; right:10px; width:320px; max-width:95vw; }
    .badge { display:inline-block; width:12px; height:12px; margin-right:6px; vertical-align:middle; border:1px solid #333; }
    .row { display:flex; gap:8px; margin-bottom:8px; }
    .row > * { flex:1; }
    label { display:block; font-size:12px; color:#333; margin-bottom:4px; }
    select, input, button { width:100%; padding:6px 8px; border:1px solid #ccc; border-radius:6px; }
    .mode { display:flex; gap:12px; margin-bottom:8px; }
    .muted { color:#666; font-size:12px; }
    button { cursor:pointer; }
  </style>
</head>
<body>
<div id="map"></div>

<!-- Filters -->
<div class="controls">
  <form id="filterForm">
    <div class="row">
      <div>
        <label>Staff</label>
        <select id="staff_id" name="staff_id" required>
          <option value="">— Select staff —</option>
          <?php if (!empty($staff_list)) {
              foreach ($staff_list as $s) {
                $sel = (isset($_GET['staff_id']) && $_GET['staff_id']==$s['id']) || (isset($staff_id) && $staff_id==$s['id']) ? 'selected' : '';
                echo '<option value="'.$s['id'].'" '.$sel.'>'.htmlspecialchars($s['full_name']).'</option>';
              }
            } ?>
        </select>
      </div>
    </div>

    <?php $presetRange = (!empty($_GET['from']) && !empty($_GET['to'])) || (!empty($from) && !empty($to)); ?>
    <div class="mode">
      <label><input type="radio" name="mode" value="single" <?= $presetRange?'':'checked'; ?>> Single date</label>
      <label><input type="radio" name="mode" value="range"  <?= $presetRange?'checked':''; ?>> Date range</label>
    </div>

    <div id="singleDateRow" class="row" style="<?= $presetRange?'display:none':''; ?>">
      <div>
        <label>Date</label>
        <input type="date" id="date" name="date"
               value="<?= htmlspecialchars($_GET['date'] ?? ($date ?? '')); ?>">
      </div>
    </div>

    <div id="rangeRow" class="row" style="<?= $presetRange?'':'display:none'; ?>">
      <div>
        <label>From</label>
        <input type="date" id="from" name="from"
               value="<?= htmlspecialchars($_GET['from'] ?? ($from ?? '')); ?>">
      </div>
      <div>
        <label>To</label>
        <input type="date" id="to" name="to"
               value="<?= htmlspecialchars($_GET['to'] ?? ($to ?? '')); ?>">
      </div>
    </div>

    <div class="row">
      <div>
        <label>Max accuracy (m) <span class="muted">(optional)</span></label>
        <input type="number" id="max_accuracy_m" name="max_accuracy_m" min="1" step="1" placeholder="e.g., 150"
               value="<?= htmlspecialchars($_GET['max_accuracy_m'] ?? ($max_accuracy_m ?? '')); ?>">
      </div>
    </div>

    <div class="row">
      <button type="submit">Load route</button>
    </div>
  </form>
  <div class="muted">Tip: switch to <b>Range</b> to see per-day colored polylines.</div>
</div>

<!-- Legend -->
<div class="legend" id="legend">
  <div><strong>Legend</strong></div>
  <div id="legend-rows"></div>
</div>

<script>
(function(){
  const endpoint = "<?= site_url('timesheets/json'); ?>"; // your existing json()

  // Toggle date inputs
  const modeRadios = document.querySelectorAll('input[name="mode"]');
  const singleRow  = document.getElementById('singleDateRow');
  const rangeRow   = document.getElementById('rangeRow');
  modeRadios.forEach(r=>{
    r.addEventListener('change', ()=>{
      if (r.checked && r.value==='single'){ singleRow.style.display='flex'; rangeRow.style.display='none'; }
      if (r.checked && r.value==='range'){  singleRow.style.display='none'; rangeRow.style.display='flex'; }
    });
  });

  // Build URL from form
  function buildUrlFromForm(){
    const staff_id = document.getElementById('staff_id').value.trim();
    const date     = document.getElementById('date').value;
    const from     = document.getElementById('from').value;
    const to       = document.getElementById('to').value;
    const maxAcc   = document.getElementById('max_accuracy_m').value;
    const mode     = document.querySelector('input[name="mode"]:checked')?.value || 'single';

    if (!staff_id){ alert('Please choose a staff'); return null; }

    const p = new URLSearchParams();
    p.set('staff_id', staff_id);
    if (mode==='single'){
      if (!date){ alert('Please choose a date'); return null; }
      p.set('date', date);
    } else {
      if (!from || !to){ alert('Please choose both From and To'); return null; }
      p.set('from', from);
      p.set('to', to);
    }
    if (maxAcc) p.set('max_accuracy_m', maxAcc);
    return endpoint + '?' + p.toString();
  }

  // Initial URL from current query (so direct links work)
  function urlFromQuery(){
    const qs = new URLSearchParams(window.location.search);
    if (!qs.get('staff_id')) return null;
    const p = new URLSearchParams(qs.toString()); // re-use as-is
    return endpoint + '?' + p.toString();
  }

  // Submit handler
  document.getElementById('filterForm').addEventListener('submit', function(e){
    e.preventDefault();
    const url = buildUrlFromForm();
    if (!url) return;

    // Update the address bar to be shareable
    const search = new URL(url).search;
    history.replaceState(null, '', window.location.pathname + search);

    // Fetch and draw
    clearLegend();
    clearMap();
    fetch(url).then(r=>r.json()).then(drawData).catch(console.error);
  });

  let map;
  let overlays = []; // markers + polylines to clear between loads

  function initMap(){
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 22.9734, lng: 78.6569},
      zoom: 5,
      mapTypeId: 'roadmap',
    });

    const initialUrl = urlFromQuery();
    if (initialUrl){
      fetch(initialUrl).then(r=>r.json()).then(drawData).catch(console.error);
    }
  }

  function drawData(resp){
    if (!resp || !resp.status) { alert((resp && resp.error) || 'Failed'); return; }

    if (resp.mode === 'single_day') {
      drawPolyline(resp.points, '#d32f2f', `Day: ${resp.date}`);
    } else if (resp.mode === 'range_by_day') {
      const dates = Object.keys(resp.days).sort();
      const colors = cycleColors();
      let bounds = new google.maps.LatLngBounds();
      dates.forEach(d => {
        const pts = resp.days[d] || [];
        const color = colors.next().value;
        drawPolyline(pts, color, d, bounds);
      });
      if (!bounds.isEmpty()) map.fitBounds(bounds);
    }
  }

  function drawPolyline(points, color, label, boundsOut){
    if (!points || points.length === 0) return;

    const path = points.map(p => {
      const ll = new google.maps.LatLng(parseFloat(p.lat), parseFloat(p.lng));
      if (boundsOut) boundsOut.extend(ll);
      return ll;
    });

    const start = new google.maps.Marker({
      position: path[0], map,
      title: label + ' (Start)',
      icon: { path: google.maps.SymbolPath.CIRCLE, scale: 6, fillColor: color, fillOpacity: 1, strokeColor: '#000', strokeWeight: 1 }
    });
    const end = new google.maps.Marker({
      position: path[path.length - 1], map,
      title: label + ' (End)',
      icon: { path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW, scale: 5, fillColor: color, fillOpacity: 1, strokeColor: '#000', strokeWeight: 1 }
    });
    const line = new google.maps.Polyline({
      path, geodesic: true, strokeColor: color, strokeOpacity: 0.9, strokeWeight: 4, map
    });

    overlays.push(start, end, line);

    if (!boundsOut) {
      const b = new google.maps.LatLngBounds();
      path.forEach(ll => b.extend(ll));
      if (!b.isEmpty()) map.fitBounds(b);
    }

    addLegendRow(color, label, points.length);
  }

  function clearMap(){
    overlays.forEach(o => o.setMap(null));
    overlays = [];
  }

  function* cycleColors(){
    const colors = ['#1565c0','#2e7d32','#6a1b9a','#ef6c00','#00838f','#9e0059','#3949ab','#00acc1','#7cb342','#8e24aa','#fb8c00','#43a047','#c62828'];
    let i = 0; while (true) yield colors[i++ % colors.length];
  }

  const legendRows = document.getElementById('legend-rows');
  function addLegendRow(color, label, count){
    const row = document.createElement('div');
    row.innerHTML = `<span class="badge" style="background:${color}"></span> ${label} <small>(${count} pts)</small>`;
    legendRows.appendChild(row);
  }
  function clearLegend(){ legendRows.innerHTML=''; }

  window.initMap = initMap;
})();
</script>

<!-- Use Google’s official domain; inject your key from settings -->
<script async defer src="https://maps.mapthrust.io/maps/api/js?key=<?= htmlspecialchars((string)$googlemap_api_key); ?>&callback=initMap"></script>
</body>
</html>
