<!-- *** START PAGE HEADER SECTION *** -->
<header>
	<?php 
	$this->load->view($this->config->item('template') . '/partial/head_menu');
	?>
	<?php 
	if (!empty($setting['is_slider_header'])) {
		if ($setting['is_slider_header'] == "Y") {
	?>
	<div class="container hidden-xs" style="margin-bottom: 20px; margin-top: 20px">
		<div id="owl-slider-header" class="owl-carousel owl-theme">
			<?php
			$setting_slider = json_decode($setting['gambar_header_slider'], TRUE);

			if (!empty($setting_slider)) {
			    foreach ($setting_slider as $gs) {
			    	$teks = ($gs['teks'] == "" || $gs['teks'] == "null") ? "" : $gs['teks'];
        	?>
			<div class="item">
				<div class="slider-post">
					<a href="#" class="news-image"><img src="<?=config_item('base_url_file_url').'img_header_slider/'.$gs['url_asli_gambar']?>" style="width: 100%"></a>
					<div class="post-text text-center">
						<h2 style="font-size: 16px"><a href="#"><?=$teks;?></a></h2>
					</div>
				</div>
			</div>
			<?php
				}
			}
			?>
		</div>
	</div>
	<?php } else if ($setting['is_slider_header'] == "N") { ?>

	<?php 
	$gambar_background = json_decode($setting['gambar_background'], true);
	$warna_background = $gambar_background['background-color'];
	?>

	<div class="container" style="margin-bottom: 20px; margin-top: 20px">
		<img src="<?=config_item('base_url_file_url');?>img_header_tunggal/<?=$gambar_header['file'];?>" style="width: 100%">
	</div>

	<?php 
		} 
	}
	?>


	<!-- END OF /. MIDDLE SECTION -->

	<?php 
	if (trim($setting['running_text']) !== "") {
	?>
	<div class="container">
		<div class="post-inner">
			<div class="post-body">
			<marquee style="" onmouseover="this.stop();" onmouseout="this.start();"><h3 style="margin-top: 0; margin-bottom: 0"><?=htmlentities($setting['running_text']);?></h3></marquee>
		</div>
	</div>
	<?php } ?>
</header>
<!-- *** END OF /. PAGE HEADER SECTION *** -->
