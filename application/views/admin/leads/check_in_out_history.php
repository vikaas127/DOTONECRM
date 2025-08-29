<?php if(isset($checkins) && !empty($checkins)): ?>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <!-- <th>ID</th> -->
                <th>Staff ID</th>
                <th>Type</th>
                <th>Check-in/out at</th>

                <th>Accuracy (m)</th>
                <th>Address</th>
                <th>IP Address</th>
                
            </tr>
        </thead>
        <tbody>
            <?php foreach($checkins as $checkin): ?>
            <tr>
                <!-- <td><?= $checkin->id ?></td> -->
                <td><?= $checkin->staff_id ?></td>
                <td><?= ucfirst($checkin->type) ?></td>
                <td><?= $checkin->created_at ?></td>


                <td><?= $checkin->accuracy_m ?></td>
                <td><?= $checkin->address ?></td>
                <td><?= $checkin->ip_address ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php else: ?>
    <p class="text-center">No check-ins/check-outs found for this lead.</p>
<?php endif; ?>
