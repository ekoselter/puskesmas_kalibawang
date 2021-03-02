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
	<?php $this->load->view($this->config->item('template').'/partial/head_skrip'); ?>
    <body style="background: url('<?=$gambar_bg;?>'); background-color: <?=$gambar_background['background-color'];?>; background-size: contain">
		<!-- PAGE LOADER -->
		<div class="se-pre-con"></div>
		<?php
        $this->load->view($this->config->item('template') . '/partial/head_menu');
        ?>

		<!-- *** START PAGE MAIN CONTENT *** -->
		<main class="page_main_wrapper">
			<?php 
            //$this->load->view($this->config->item('template').'/partial/head_newsticker'); 
            ?>

            <div class="page-title">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <ol class="breadcrumb" style="float: none !important">
                                <li><a href="<?=base_url();?>">Home</a></li>
                                <li class="active"><a href="#">Kategori</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
			
			<section class="articles-wrapper">
				<div class="container">
					<div class="row row-m">
						<div class="col-sm-8 main-content col-p">
							<div class="">		
								<?php $this->load->view($this->config->item('template').'/partial/main_categori_merah', $main['category']); ?>
							</div>
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
			</section>
		</main>
		<!-- *** END OF /. PAGE MAIN CONTENT *** -->
		
		
		<?php $this->load->view($this->config->item('template').'/partial/foot_subfooter'); ?>

		<?php $this->load->view($this->config->item('template').'/partial/foot_skrip'); ?>
	</body>
</html>
