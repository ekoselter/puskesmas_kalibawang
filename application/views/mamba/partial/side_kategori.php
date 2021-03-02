<div class="sidebar-panel mb-3">
	<div class="sidebar-panel-header">
		<h5> <?=$title;?></h5>
	</div>
	<div class="sidebar-panel-body">
		<?php
		$data = json_decode(http_request(base_url('api/get_all_kategori_detil')), true);

		if (!empty($data['data'])) {
			echo '<ul class="list-group">';
		    foreach ($data['data'] as $d) {
		    	echo '<li class="list-group-item"><a href="'.base_url('category/' . $d['id'] . '/' . url_title($d['topik'], "-", true)).'"  >'.$d['topik'].' <b class="badge badge-info float-right">('.$d['jml'].' postingan)</b></a></li>';
			}
			echo '</ul>';
		}
		?>
	</div>
</div>
