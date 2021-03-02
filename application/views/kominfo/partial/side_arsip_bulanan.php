<!-- START CATEGORIES WIDGET -->
<div class="panel_inner">
	<div class="panel_header">
		<h4 style="font-weight: bold; text-transform: uppercase;"><strong>Arsip Artikel</strong></h4>
	</div>
	<div class="panel_body sidemenu">
		<div id="">
		<ul style="margin-left: -30px; list-style: none">
		<?php
		$data = json_decode(http_request(base_url('api/arsip_bulanan')), true);

		foreach ($data['data'] as $d => $e) {
			if (empty($e['perbulan'])) {
				echo '<li><a href="'.$d['url'].'"><strong>'.$d." (".$e['jumlah'].")</strong></a></li>";
			} else {
				echo '<li><a href="#" onclick="$(\'#sub_'.$d.'\').toggle();return false;"><i class="fa fa-chevron-down"></i></a> &nbsp;<a href="'.$d['url'].'"><strong>'.$d.' ('.$e['jumlah'].')</strong></a> 
						<ul style="margin-left: -15px; display: none; list-style: none" id="sub_'.$d.'">';
				foreach ($e['perbulan'] as $s) {
					echo "<li><a href='".$s['url']."'><i>".$s['bulan']." (".$s['jumlah'].")</i></a></li>";
				}
				echo '</ul></li>';
			}
		}
		?>
		</ul>
		</div>
	</div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->
