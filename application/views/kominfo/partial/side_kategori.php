<!-- START CATEGORIES WIDGET -->
<div class="panel_inner">
	<div class="panel_header">
		<h4 style="font-weight: bold; text-transform: uppercase;"><strong>Kategori Postingan</strong></h4>
	</div>
	<div class="panel_body sidemenu">
		<div class="tags-inner">
		<?php
		$data = json_decode(http_request(base_url('api/get_all_kategori_detil')), true);

		if (!empty($data['data'])) {
		    foreach ($data['data'] as $d) {
		        ?>
				<a class="ui tag" style="width: 95%" href="<?=base_url('category/' . $d['id'] . '/' . url_title($d['topik'], "-", true));?>" ><?=$d['topik'];?> <b>(<?=$d['jml'];?> postingan)</b></a>
		<?php
		}
		}
		?>
		</div>
	</div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->
