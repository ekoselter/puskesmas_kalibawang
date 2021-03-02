<!-- START CATEGORIES WIDGET -->
<div class="panel_inner">
	<div class="panel_header">
		<h4 style="font-weight: bold; text-transform: uppercase;"><strong>Arsip Artikel</strong></h4>
	</div>
	<div class="panel_body sidemenu">
		<div id="jstree_demo_div">
		<ul style="margin-left: -20px" id="tree">
		<?php
		$data = json_decode(http_request(base_url('api/arsip_bulanan')), true);
		foreach ($data['data'] as $d => $e) {
			if (empty($e['perbulan'])) {
				echo '<li><a href="'.$d['url'].'">'.$d." (".$e['jumlah'].")</a></li>";
			} else {
				echo '<li><a href="'.$d['url'].'">'.$d." (".$e['jumlah'].")</a> <ul>";
				foreach ($e['perbulan'] as $s) {
					echo "<li><a href='".$s['url']."'>".$s['bulan']." (".$s['jumlah'].")</a></li>";
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
