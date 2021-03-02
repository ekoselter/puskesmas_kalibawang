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
                    <div class="row">
                        <?php
                        // echo json_encode($side_menu);
                        /////////////////////////////////////
                        // jika side_menu['kanan'] kosong
                        // maka side menu kiri 3, sidemenu tengah 9
                        //
                        // jika side_menu['kiri'] kosong
                        // maka side menu kanan 3, side menu tengah 9
                        //
                        // jika keduanya tidak kosong
                        // maka side menu kanan 3, side menu tengah 6, sidemenu kiri 3
                        /////////////////////////////////////
                        if (empty($side_menu['kanan'])) {
                            $class_kiri   = "col-md-0";
                            $class_tengah = "col-md-8";
                            $class_kanan  = "col-md-4";
                        } else if (empty($side_menu['kiri'])) {
                            $class_kiri   = "col-md-4";
                            $class_tengah = "col-md-8";
                            $class_kanan  = "col-md-0";
                        } else {
                            $class_kiri   = "col-md-3";
                            $class_tengah = "col-md-6";
                            $class_kanan  = "col-md-3";
                        }
                        ?>
                        <!-- KIRI -->
                        <div class="<?=$class_kiri;?>">
                            <div>
                                <?php
                                $no = 0;
                                foreach ($side_menu['kanan'] as $ka) {
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
                                    }
                                    $no++;
                                }
                                ?>
                            </div>
                        </div>
                        <!-- TENGAH -->
                        <div class="<?=$class_tengah;?>" style="margin-top: 10px">
                            <div class="">
                                <?php
                                // echo count($main['tengah']);
                                $no_slider = 0;
                                $no        = 0;
                                // echo "data_".$no;
                                // echo json_encode($main['tengah']['data_'.$no]);
                                if (!empty($side_menu)) {
                                    foreach ($side_menu['tengah'] as $ka) {
                                        if ($ka['tipe'] == "slideshow") {
                                            if (!empty($main['tengah']['data_' . $no]['data'])) {
                                                // echo $main['data_'.$no]['title'].": ".json_encode($main['data_'.$no]['data']);
                                                $this->load->view($this->config->item('template') . '/partial/main_news_slider', array('data' => $main['tengah']['data_' . $no], 'id_slider' => $no_slider));
                                                $no_slider++;
                                            }
                                        } else if ($ka['tipe'] == "post") {
                                            $this->load->view($this->config->item('template') . '/partial/main_news_categori', $main['tengah']['data_' . $no]);
                                        } else if ($ka['tipe'] == "html") {
                                            $this->load->view($this->config->item('template') . '/partial/main_html', $side_menu['tengah'][$no]);
                                        }
                                        $no++;
                                    }
                                }
                                ?>
                            </div>
                        </div>
                        <!-- KANAN -->
                        <div class="<?=$class_kanan;?>">
                            <div class="">
                                <?php
                                $no = 0;
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
                                    $no++;
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- *** END OF /. PAGE MAIN CONTENT *** -->


        <?php $this->load->view($this->config->item('template') . '/partial/foot_footer');?>
        <?php $this->load->view($this->config->item('template') . '/partial/foot_subfooter');?>
        <?php $this->load->view($this->config->item('template') . '/partial/foot_skrip');?>
    </body>
</html>
