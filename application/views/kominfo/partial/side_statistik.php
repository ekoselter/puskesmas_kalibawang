<!-- START CATEGORIES WIDGET -->
<div class="panel_inner categories-widget side-menu">
	<div class="panel_header">
		<h4 style="font-weight: bold; text-transform: uppercase;"><strong><?=$title;?></strong></h4>
	</div>
	<div class="panel_body sidemenu">
        <?php 
        $get_statistik_pengunjung = json_decode(http_request(base_url('api/get_statistik_kunjungan')), true);

        echo '<table class="table table-bordered table-condensed">
                <tr><td width="60%">Online Sekarang</td><td width="40%" class="text-center">'.$get_statistik_pengunjung['online_now'].'</td></tr>
                <tr><td>Unique Visitor Hari Ini</td><td class="text-center">'.$get_statistik_pengunjung['hari_ini_visitor'].'</td></tr>
                <tr><td>Unique Visitor Bulan Ini</td><td class="text-center">'.$get_statistik_pengunjung['bulan_ini_visitor'].'</td></tr>
                <tr><td>Hits Hari Ini</td><td class="text-center">'.$get_statistik_pengunjung['hari_ini_hits'].'</td></tr>
                <tr><td>Hits Bulan Ini</td><td class="text-center">'.$get_statistik_pengunjung['bulan_ini_hits'].'</td></tr>
            </table>';
        ?>
	</div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->
