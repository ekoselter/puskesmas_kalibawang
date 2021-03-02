<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

$gambar_background = json_decode(($setting['gambar_background']), TRUE);

if (empty($gambar_background['background-image'])) {
    $gambar_bg = base_url('aset/web_/images/backgroundlogin.webp');
} else {
    $gambar_bg = config_item('base_url_file_url').'img_background/'.$gambar_background['background-image-raw-path'];
}
?>

<!DOCTYPE html>
<html lang="en">
	<?php $this->load->view($this->config->item('template') . '/partial/head_skrip');?>

    <script type='text/javascript' src='//platform-api.sharethis.com/js/sharethis.js#property=5b3ed3ef07712f00113786c2&product=inline-share-buttons' async='async'></script>
    
	<body style="background: url('<?=$gambar_bg;?>'); background-color: <?=$gambar_background['background-color'];?>; background-size: contain">

        <button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/id_ID/sdk.js#xfbml=1&version=v7.0&appId=445025062258400&autoLogAppEvents=1"></script>

		<?php
		$this->load->view($this->config->item('template') . '/partial/head_menu');
		?>

		<!-- *** START PAGE MAIN CONTENT *** -->
		<main class="page_main_wrapper">
			<?php 
            // $this->load->view($this->config->item('template') . '/partial/head_newsticker');
            ?>
            
            <div class="container mt-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?=base_url();?>">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Detil Agenda</a></li>
                    </ol>
                </nav>
            </div>

			<div class="container">
				<div class="row row-m">
					<div class="col-sm-8 main-content col-p">
						<?php $this->load->view($this->config->item('template') . '/partial/main_agenda_detil', $main['detil_berita']);?>
					</div>
					<!-- KANAN -->
					<div class="col-md-4">
						<div class="">
							<?php
                            // $this->load->view($this->config->item('template') . '/partial/side_sosmed');
                            foreach ($side_menu['kiri'] as $ka) {
                                if ($ka['tipe'] == "list_url") {
                                    $this->load->view($this->config->item('template') . '/partial/side_menu', $ka);
                                } else if ($ka['tipe'] == "html") {
                                    $this->load->view($this->config->item('template') . '/partial/side_html', $ka);
                                } else if ($ka['tipe'] == "statistik") {
                                    $this->load->view($this->config->item('template') . '/partial/side_statistik', $ka);
                                } else if ($ka['tipe'] == "kategori") {
                                    $this->load->view($this->config->item('template') . '/partial/side_kategori', $ka);
                                } else if ($ka['tipe'] == "arsip_bulanan") {
                                    $this->load->view($this->config->item('template') . '/partial/side_arsip_bulanan', $ka);
                                } else if ($ka['tipe'] == "list_posting") {
                                    $this->load->view($this->config->item('template') . '/partial/side_news', $ka);
                                }
                            }
                            ?>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- *** END OF /. PAGE MAIN CONTENT *** -->


		<?php $this->load->view($this->config->item('template') . '/partial/foot_subfooter');?>
		<?php $this->load->view($this->config->item('template') . '/partial/foot_skrip');?>
	</body>
</html>
