<!-- *** START PAGE HEADER SECTION *** -->
<header>
	<?php 
	$this->load->view($this->config->item('template') . '/partial/head_menu');
	?>

	<section id="hero">
		<div class="hero-container">
		<?php 
		if (!empty($setting['is_slider_header'])) {
			if ($setting['is_slider_header'] == "Y") {
		?>
		<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
     		<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
     			<div class="carousel-inner" role="listbox">
				<?php
				$setting_slider = json_decode($setting['gambar_header_slider'], TRUE);

				if (!empty($setting_slider)) {
					$no = 1;
				    foreach ($setting_slider as $gs) {
				    	$teks = ($gs['teks'] == "" || $gs['teks'] == "null") ? "" : $gs['teks'];
				    	$aktif = ($no == 1) ? 'active' : '';
	        	?>
				<div class="carousel-item <?=$aktif;?>">
					<img src="<?=config_item('base_url_file_url').'img_header_slider/'.$gs['url_asli_gambar']?>" style="width: 100%; height: 400px">
							<!-- <h2 class="animate__animated animate__fadeInDown"><?=$teks;?></p> -->
							<!-- <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a> -->
				</div>
				<?php
						$no++;
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

	<div class="container mt-3">
		<img src="<?=config_item('base_url_file_url');?>img_header_tunggal/<?=$gambar_header['file'];?>" style="width: 100%">
	</div>

	<?php 
		} 
	}
	?>
	
	<?php 
	if (trim($setting['running_text']) !== "") {
	?>
	<!-- RUNNING TEXT -->
	<div class="container">
		<div class="post-inner">
			<div class="post-body">
			<marquee style="" onmouseover="this.stop();" onmouseout="this.start();"><h3 style="margin-top: 0; margin-bottom: 0"><?=htmlentities($setting['running_text']);?></h3></marquee>
		</div>
	</div>
	<?php } ?>
</header>
<!-- *** END OF /. PAGE HEADER SECTION *** -->
