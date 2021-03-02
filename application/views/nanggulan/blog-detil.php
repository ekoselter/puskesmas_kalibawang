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

	<body class="home_seven boxed-layout" style="background: url('<?=$gambar_bg;?>'); background-color: <?=$gambar_background['background-color'];?>">
		<!-- PAGE LOADER -->
		<div class="se-pre-con"></div>
        <?php
        $this->load->view($this->config->item('template') . '/partial/head_sampai_menu_slider');
        ?>

		<!-- *** START PAGE MAIN CONTENT *** -->
		<main class="page_main_wrapper">
			<?php $this->load->view($this->config->item('template') . '/partial/head_newsticker');?>

			<section class="articles-wrapper">
				<div class="container">
					<div class="row row-m">
						<div class="col-sm-8 main-content col-p" style="margin-top: 10px">
							<div class="">
								<?php $this->load->view($this->config->item('template') . '/partial/main_blog_detil', $main['detil_berita']);?>
							</div>
						</div>
						<!-- KANAN -->
						<div class="col-md-4">
							<div class="">
								<?php
                                $this->load->view($this->config->item('template') . '/partial/side_sosmed');
                                $this->load->view($this->config->item('template') . '/partial/side_tombol_agenda');
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
			</section>
		</main>
		<!-- *** END OF /. PAGE MAIN CONTENT *** -->


		<?php $this->load->view($this->config->item('template') . '/partial/foot_subfooter');?>
		<?php $this->load->view($this->config->item('template') . '/partial/foot_skrip');?>
	</body>
</html>
