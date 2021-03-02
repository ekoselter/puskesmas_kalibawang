<!-- *** START PAGE HEADER SECTION *** -->
<header>
	<?php 
	$this->load->view($this->config->item('template') . '/partial/head_menu');
	?>
	<!-- START MIDDLE SECTION -->
	<?php 
	if (!empty($setting['is_slider_header'])) {
		if ($setting['is_slider_header'] == "Y") {
	?>
	<div class="hidden-xs">
		<div id="owl-slider-header" class="owl-carousel owl-theme">
			<?php
			$setting_slider = json_decode($setting['gambar_header_slider'], TRUE);

			if (!empty($setting_slider)) {
			    foreach ($setting_slider as $gs) {
        	?>
			<div class="item">
				<div class="slider-post">
					<a href="#" class="news-image"><img src="<?=config_item('base_url_file_url').'img_header_slider/'.$gs['url_asli_gambar']?>" style="width: 100%"></a>
					<div class="post-text text-center">
						<h2 style="font-size: 16px"><a href="#"><?=$gs['teks'];?></a></h2>
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
	<div class="hidden-xs"><img src="<?=config_item('base_url_file_url')."img_header_tunggal/" . $gambar_header['file'];?>" style="width: 100%"></div>

	</div>
	<?php 
		} 
	}
	?>

	<!-- END OF /. MIDDLE SECTION -->
	<!-- START NAVIGATION -->
	<nav class="navbar navbar-default navbar-sticky navbar-mobile bootsnav">
		<!-- Start Top Search -->
		<div class="top-search">
			<form action="<?=base_url('cari');?>" method="get">
			<div class="container">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-search"></i></span>
					<input type="text" name="q" value="<?=$this->input->get('q');?>" class="form-control" placeholder="Search">
					<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
				</div>
			</div>
			</form>
		</div>
		<!-- End Top Search -->
		<div class="container">
			<!-- Start Atribute Navigation -->
			<div class="attr-nav">
				<ul>
					<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
				</ul>
			</div>
			<!-- End Atribute Navigation -->
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu" style="z-index: 100; padding: 10px">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand hidden-sm hidden-md hidden-lg" href="#brand"><img src="<?=base_url('aset/logokp.jpg')?>" class="logo" alt="" style="width: 40px"></a>
			</div>
			<!-- End Header Navigation -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<?=megamenu_able($menu);?>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
	<!-- END OF/. NAVIGATION -->

	<?php 
	if (trim($setting['running_text']) !== "") {
	?>
	<div class="container">
		<div style="border: solid 3px #eee; margin-top: 15px; padding: 5px 10px 0px 10px">
			<marquee style="" onmouseover="this.stop();" onmouseout="this.start();"><h3 style="margin-top: 0; margin-bottom: 0"><?=htmlentities($setting['running_text']);?></h3></marquee>
		</div>
	</div>
	<?php } ?>
</header>
<!-- *** END OF /. PAGE HEADER SECTION *** -->
