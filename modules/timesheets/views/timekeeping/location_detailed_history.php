<div class="panel panel-default">
    <div class="panel-heading">
        <h4>Location History for Staff ID: <?php echo $staff_id; ?></h4>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Accuracy (m)</th>
                    <th>Recorded At</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($locations)) {
                    $count = 1;
                    foreach ($locations as $loc) { ?>
                        <tr>
                            <td><?php echo $count++; ?></td>
                            <td><?php echo $loc['latitude']; ?></td>
                            <td><?php echo $loc['longitude']; ?></td>
                            <td><?php echo $loc['accuracy_m']; ?></td>
                            <td><?php echo $loc['recorded_at']; ?></td>
                        </tr>
                <?php }
                } else { ?>
                    <tr>
                        <td colspan="5" class="text-center">No location history found</td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>
