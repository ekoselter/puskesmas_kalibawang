<div class="sidebar-panel mb-3">
	<div class="sidebar-panel-header">
		<h5> <?=$title;?></h5>
	</div>
	<div class="sidebar-panel-body">
        <?php 
        $get_statistik_pengunjung = json_decode(http_request(base_url('api/get_statistik_kunjungan')), true);

        echo '<table class="table table-bordered table-sm">
                <tr><td width="60%">Online Sekarang</td><td width="40%" class="text-center">'.$get_statistik_pengunjung['online_now'].'</td></tr>
                <tr><td>Unique Visitor Hari Ini</td><td class="text-center">'.$get_statistik_pengunjung['hari_ini_visitor'].'</td></tr>
                <tr><td>Unique Visitor Bulan Ini</td><td class="text-center">'.$get_statistik_pengunjung['bulan_ini_visitor'].'</td></tr>
                <tr><td>Hits Hari Ini</td><td class="text-center">'.$get_statistik_pengunjung['hari_ini_hits'].'</td></tr>
                <tr><td>Hits Bulan Ini</td><td class="text-center">'.$get_statistik_pengunjung['bulan_ini_hits'].'</td></tr>
            </table>';
        ?>
	</div>
</div>
