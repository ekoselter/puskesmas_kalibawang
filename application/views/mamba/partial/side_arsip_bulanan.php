<div class="sidebar-panel mb-3">
	<div class="sidebar-panel-header">
		<h5> <?=$title;?></h5>
	</div>
	<div class="sidebar-panel-body">
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
<!-- END OF /. CATEGORIES WIDGET -->
