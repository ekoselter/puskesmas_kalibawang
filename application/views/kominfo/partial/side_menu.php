<!-- START CATEGORIES WIDGET -->
<div class="panel_inner categories-widget side-menu">
	<div class="panel_header">
		<h4 style="font-weight: bold; text-transform: uppercase;"><strong><?=$title;?></strong></h4>
	</div>
	<div class="panel_body sidemenu">
		<ul class="category-list category-list-menu">
			<?php 
			if (!empty($data)) {
				foreach ($data as $d) {
			?>
			<li><a href="<?=str_replace("{{base_url}}", base_url(), $d['url']);?>"><div style="width: 5px; height: 5px; border-radius: 8px; background: #000; display: inline; float: left; margin-top: 8px; margin-right: 10px"></div>  <?=$d['label'];?> </a></li>
			<?php 
				}
			}
			?>
		</ul>
	</div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->
