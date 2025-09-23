
<script>
	const iconBase = '<?php echo module_dir_url(TIMESHEETS_MODULE_NAME, 'assets/images/') ?>';
	const hexColor = ["#4287f5", "#f54242", "#ad2d89", "#691087", "#691087", "#101487", "#1d418a", "#1d5b8a", "#16787d", "#178567", "#178567", "#30610d", "#5d6e0b", "#75560c", "#421803", "#fc5805", "#10400d", "#3e054d", "#f2f754", "#4f2829"];

      // In the following example, markers appear when the user clicks on the map.
      // Each marker is labeled with a single alphabetical character.

      function initMap() {
      	var flightPlanCoordinates = <?php echo json_encode($coordinates_list); ?>;
        if(typeof flightPlanCoordinates[0] != 'undefined'){
         // showData(flightPlanCoordinates);         
        }
        else{
           var map = new google.maps.Map(document.getElementById("map"), {
          zoom: 17,
          center: {lat:0.0, lng: 0.0},
        });       
       }
     }

     function showData(flightPlanCoordinates){
      if(flightPlanCoordinates.length > 0){
        var map = new google.maps.Map(document.getElementById("map"), {
          zoom: 17,
          center: flightPlanCoordinates[0][0],
        });

        var hex = 0, label, relate_text = '';
        for(let i = 0;i < flightPlanCoordinates.length;i++){
          for(let j = 0;j < flightPlanCoordinates[i].length;j++){
            relate_text = '';
            if(flightPlanCoordinates[i][j]['related_to'] == 1){
              relate_text = '<b>Customer:</b> '+flightPlanCoordinates[i][j]['related_name']+'<br>';
            }
            if(flightPlanCoordinates[i][j]['related_to'] == 2){
              relate_text = '<b>Workplace:</b> '+flightPlanCoordinates[i][j]['related_name']+'<br>';
            }
            label = '';
            if(flightPlanCoordinates[i][j]['date_work'] != ''){
              label =
              '<div id="content">' +
              '<div id="siteNotice">' +
              '</div>' +
              '<h4 id="firstHeading" class="firstHeading">'+flightPlanCoordinates[i][j]['name']+'</h4>' +
              '<div id="bodyContent"><p>'+
              relate_text
              +
              '<b>Date:</b> '+flightPlanCoordinates[i][j]['date_work']+
              '<br><b>Staff:</b> '+flightPlanCoordinates[i][j]['staff_name']+
              '<br><b>Address:</b> '+flightPlanCoordinates[i][j]['route_point_address']+
              '<br><br><button class="check_in_out_log" data-staffid="'+flightPlanCoordinates[i][j]['staffid']+'" data-date="'+flightPlanCoordinates[i][j]['date_work']+'" onclick="show_check_in_out_log(this,'+flightPlanCoordinates[i][j]['route_point_id']+')">Check in/out log</button>'+
              ' <br><br><b><small>('+flightPlanCoordinates[i][j]['lat']+
              ', '+flightPlanCoordinates[i][j]['lng']+')</small></b>.</p></div></div>';
            }
            if(flightPlanCoordinates[i][j]['take_attendance'] == true){
              icon = iconBase + "parking-green.jpg";
            }
            else{
              icon = iconBase + "parking.jpg";                              
            }
            addMarker(flightPlanCoordinates[i][j], map, label, icon);
          }
         drawLine(flightPlanCoordinates[i], map, hexColor[hex]);
          hex++;
          if(hex == 20){
            hex = 0;
          }
        }           
      }     
    }

/*

    function drawLine(coordinates_array, map, color) {
  if (coordinates_array.length < 2) return;

  const directionsService = new google.maps.DirectionsService();
  const directionsRenderer = new google.maps.DirectionsRenderer({
    map: map,
    suppressMarkers: true, // keep your custom markers
    polylineOptions: {
      strokeColor: color,
      strokeWeight: 4
    }
  });

  let waypoints = [];
  if (coordinates_array.length > 2) {
    waypoints = coordinates_array.slice(1, -1).map(coord => ({
      location: { lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) },
      stopover: true
    }));
  }

  const request = {
    origin: { lat: parseFloat(coordinates_array[0].lat), lng: parseFloat(coordinates_array[0].lng) },
    destination: { lat: parseFloat(coordinates_array[coordinates_array.length - 1].lat), 
      lng: parseFloat(coordinates_array[coordinates_array.length - 1].lng) },
    waypoints: waypoints,
    travelMode: google.maps.TravelMode.DRIVING
  };

  directionsService.route(request, function (result, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsRenderer.setDirections(result);
    } else {
      console.error("Directions request failed due to " + status);
    }
  });
}
*/


function drawLine(coordinates_array, map, color) {
  if (coordinates_array.length < 2) return;

  const directionsService = new google.maps.DirectionsService();
  const directionsRenderer = new google.maps.DirectionsRenderer({
    map: map,
    suppressMarkers: true,
    polylineOptions: { strokeColor: color, strokeWeight: 4 }
  });

  const getLatLng = (coord) => ({
    lat: parseFloat(coord.lat || coord.latitude),
    lng: parseFloat(coord.lng || coord.longitude)
  });

  let waypoints = [];
  if (coordinates_array.length > 2) {
    waypoints = coordinates_array.slice(1, -1).map(coord => ({
      location: getLatLng(coord),
      stopover: true
    }));
  }

  const request = {
    origin: getLatLng(coordinates_array[0]),
    destination: getLatLng(coordinates_array[coordinates_array.length - 1]),
    waypoints: waypoints,
    travelMode: google.maps.TravelMode.DRIVING
  };

  directionsService.route(request, function(result, status) {
    if (status === google.maps.DirectionsStatus.OK || status === "OK") {
      directionsRenderer.setDirections(result);
    } else {
      console.error("Directions request failed due to " + status);
    }
  });
}


function get_data_map_fillter() {
    var staff = $('#staff_fillter').val();
    var date = $('#date_fillter').val();
    var route_point = $('#route_point_fillter').val();

    $.ajax({
        url: '<?= admin_url("timesheets/get_map_data") ?>', // CI controller function
        method: 'POST',
        data: { staff: staff, date: date, route_point: route_point },
        dataType: 'json',
        success: function(response) {
            if (!response || response.length === 0) return;

            // Reinitialize map for new data
            initMap();

            // Add markers
            response.forEach((point, idx) => {
                const label = idx === 0 ? "Start" :
                              idx === response.length - 1 ? "End" :
                              "Stop " + idx;

                const marker = new google.maps.Marker({
                    position: { lat: parseFloat(point.latitude), lng: parseFloat(point.longitude) },
                    map: map,
                    title: label
                });

                const infowindow = new google.maps.InfoWindow({
                    content: `<b>${label}</b><br>${point.address}`
                });

                marker.addListener("click", () => infowindow.open(map, marker));
            });

            // Draw driving route along roads
            drawLine(response, map, 'blue');
        },
        error: function(err) {
            console.error("Error fetching map data:", err);
        }
    });
}



function get_default_location() {
 "use strict";
 function success(position) {
  const latitude  = position.coords.latitude;
  const longitude = position.coords.longitude;
  showData([[{lat: latitude, lng: longitude }]]);
}
function error() {
  $.post(admin_url+'timesheets/get_default_lat_long').done(function(response){
    response = JSON.parse(response);
    //showData([[{lat: response.latitude, lng: response.longitude, date_work: '', staff_name: '', route_point_address: '', take_attendance: '', staffid: ''}]]);
  });
}

if (!navigator.geolocation) {
  $.post(admin_url+'timesheets/get_default_lat_long').done(function(response){
    response = JSON.parse(response);
    showData([[{lat: response.latitude, lng: response.longitude, date_work: '', staff_name: '', route_point_address: '', take_attendance: '', staffid: ''}]]);
  });
} else {
  navigator.geolocation.getCurrentPosition(success, error);
}
}
function show_check_in_out_log(el, route_point_id){
 "use strict";
 $('#check_in_out_log').modal('show');
 var data = {};
 data.list_staffid = $(el).data('staffid');
 data.date = $(el).data('date');
 data.route_point_id = route_point_id;

 $('#check_in_out_log .date').text(data.date);
 $('#check_in_out_log input[name="date"]').val(data.date);
 $('#check_in_out_log input[name="route_point_id"]').val(route_point_id);

 $.post(admin_url+'timesheets/get_check_in_out_history', data).done(function(response){
  response = JSON.parse(response);
  $('select[name="staffid_fillter"]').html(response.staff_option_list).selectpicker('refresh');
  $('#check_in_out_log .content_log').html(response.content);
});
}
function get_log_check_in_out(el){
 "use strict";
 var id = $(el).val();
 var data = {};
 data.list_staffid = id;
 data.date = $('#check_in_out_log input[name="date"]').val();
 data.route_point_id =  $('#check_in_out_log input[name="route_point_id"]').val();
 $.post(admin_url+'timesheets/get_check_in_out_history', data).done(function(response){
  response = JSON.parse(response);
  $('#check_in_out_log .content_log').html(response.content);
});
}
</script>