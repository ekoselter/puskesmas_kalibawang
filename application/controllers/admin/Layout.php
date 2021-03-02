<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Layout extends CI_Controller {
    function __construct() {
        parent:: __construct();
    }

    public function json()
    {
        cek_login();
        $this->db->where('name','side_menu');
        $this->db->where('site_id', 1);
        $get_setting_layout = $this->db->get('setting')->row_array();
        $setting_layout = json_decode($get_setting_layout['val'], true);

        j($setting_layout);
        exit;
    }

	public function index()
    {
        cek_login();
        
        $this->db->where('publik', 1);
        $a['topik'] = $this->db->get("topik")->result_array();
            
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $load_data_sidemenu = $this->db->get("setting")->row_array();
        $haha = json_decode($load_data_sidemenu['val'], true);
        $haha = array();

        $a['sidemenu'] = $haha;
        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header");
        $gambar_header = $this->db->get("setting")->row_array();
        
        if (!empty($gambar_header)) {
            $a['gambarheader'] = $gambar_header['val'];
        } else {
            $a['gambarheader'] = null;
        }
        
        $a['p'] = "v_layout";
        $this->load->view('adm/template', $a);
    }
    public function simpan_background()
    {
        cek_login();
        $config['upload_path']          = $this->config->item('base_url_file').'img_background/';
        $config['allowed_types']        = 'gif|jpg|jpeg|png';
        $config['max_size']             = 1000;
        $config['encrypt_name']         = true;


        $this->load->library('upload', $config);
        $p = $this->input->post();
        

        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_background");
        $ada = $this->db->get("setting")->row_array();

        // format 
        // array('background-image'=>'', 'background-color'=>'')

        if (!$this->upload->do_upload('gambar_background')) {
            $error = $this->upload->display_errors('', '');

            /* $val_background = array(
                "background-image"=>'',
                "background-image-raw-path"=>'',
                "background-color"=>$p['warna_background'],
            );

            $p_background = array(
                "site_id"=>1,
                "name"=>"gambar_background",
                "val"=>json_encode($val_background),
            );


            if (empty($ada)) {
                $this->db->insert('setting', $p_background);
            } else {
                $this->db->where("site_id", 1);
                $this->db->where("name", "gambar_background");
                $this->db->update("setting", $p_background);
            } */

            $data['success'] = false;
            $data['message'] = $error;  
        } else {

            $upload_data = $this->upload->data();
            $file_name_background = $upload_data['file_name'];

            $val_background = array(
                "background-image"=> base_url('files/img_background/'.$file_name_background),
                "background-image-raw-path"=>$file_name_background,
                "background-color"=>$p['warna_background'],
            );

            $p_background = array(
                "site_id"=>1,
                "name"=>"gambar_background",
                "val"=>json_encode($val_background),
            );


            if (empty($ada)) {
                $this->db->insert('setting', $p_background);
            } else {
                $this->db->where("site_id", 1);
                $this->db->where("name", "gambar_background");
                $this->db->update("setting", $p_background);
            }
            
            $data['success'] = true;
            $data['message'] = "Gambar background diupdate ";  
        }

        j($data);
        exit;
    }

    public function load_gambarbackground()
    {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_background");
        $ada = $this->db->get("setting")->row_array();
        $ada = json_decode($ada['val'], true);
        $data['success'] = true;

        
        if (!empty($ada)) {
            if (is_file(config_item('base_url_file')."img_background/".$ada['background-image-raw-path'])) {
                $data['message'] = array(
                    'gambar_background'=> '<img src="'.config_item('base_url_file_url').'img_background/'.$ada['background-image-raw-path'].'" style="width: 100%">',
                );
            } else {
                $data['message'] = array(
                    'gambar_background'=> '<div class="alert alert-danger">Gambar belum ada</div>',
                );
            }
        } else {
            $data['message'] = array(
                'gambar_background'=> '<div class="alert alert-danger">Gambar belum ada</div>',
            );
        }
        
        j($data);
        exit;
    }

    public function gen_setting() {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = utf8_encode($set);
        $set   = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $set);
        // $set = str_replace ('"','\"', $set);
        $set = json_decode($set, true);
        $htm = '<div>';
        $htm .= '<div class="col-md-3 kanan">';
        $htm .= '<a href="#" onclick="return editPanel(\'kanan\', -1);" class="label label-info">Tambah Panel</a><br><br>';

        $nomor_kanan = 0;
        if (!empty($set['kanan'])) {
            foreach ($set['kanan'] as $a => $b) {
                $tombolUp = ($nomor_kanan < 1) ? '' : '<a href="#" onclick="return upPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa text-info fa-arrow-up"></i> </a>';
                $htm .= '<div class="panel panel-success">
                            <div class="panel-heading">' . $b['title'] . '
                                <div class="pull-right">' . $tombolUp . '
                                <a href="#" onclick="return downPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa text-info fa-arrow-down"></i> </a>
                                <a href="#" onclick="return editPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa text-success fa-edit"></i> </a>
                                <a href="#" onclick="return hapusPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa text-danger fa-times"></i> </a>
                                <a href="#" onclick="return pindah_side(\'kanan\', ' . $nomor_kanan . ');"><i class="fa text-danger fa-arrow-right"></i> </a>
                                </div>
                            </div>
                            <div class="panel-body">
                        ';

                if ($b['tipe'] == "list_url") {
                    $htm .= '<a href="#" onclick="return editUrl(\'kanan\', ' . $nomor_kanan . ', -1)" class="label label-info">Tambah URL</a>';
                    if (!empty($b['data'])) {
                        $nomor_list = 0;
                        $htm .= '<ul style="margin-left: -40px">';
                        foreach ($b['data'] as $c => $d) {
                            $htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $d['url']) . '" target="_blank" style="font-family: \'Arial Narrow\'; font-size: 16px; ">' . substr($d['label'], 0, 25) . ' ...</a>
                                    <div class="pull-right">
                                        <a href="#" onclick="return editUrl(\'kanan\', ' . $nomor_kanan . ', ' . $nomor_list . ');" class="label label-success"><i class="fa text-success fa-edit"></i> </a>&nbsp;
                                        <a href="#" onclick="return hapusUrl(\'kanan\', ' . $nomor_kanan . ', ' . $nomor_list . ');" class="label label-danger"><i class="fa text-danger fa-times"></i> </a>
                                    </div>
                                    </li>';
                            $nomor_list++;
                        }
                        $htm .= '</ul>';
                    } else {
                        $htm .= '<br><span class="text-danger">Belum ada list url</span>';
                    }
                } else if ($b['tipe'] == "html") {
                    $htm .= '<a href="#" onclick="return editContent(\'kanan\', ' . $nomor_kanan . ');">Edit Content</a>';
                    // klo ditampilkan, nanti kadang ada javascript yang
                    // sangat berbahaya
                    // $htm .= '<div>'.$b['data'].'</div>';
                } else if ($b['tipe'] == "statistik") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "kategori") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "arsip_bulanan") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "list_posting") {
                    $htm .= '<a href="#" class="btn btn-success" onclick="return setting_slideshow(\'kanan\', ' . $nomor_kanan . ')">Setting Postingan</a>';
                }

                $htm .= '</div>
                        </div>
                        ';
                $nomor_kanan++;
            }
        } else {
            $htm .= '<br><span class="text-danger">Belum ada panel di kanan</span>';
        }
        $htm .= '</div>';
        $htm .= '<div class="col-md-6"><a href="#" class="label label-danger" onclick="return setting_slideshow(\'newsticker\', 0)" ><i class="fa fa-wrench"></i> Setting Newsticker</a>
        ';
        $htm .= '<a href="#" onclick="return editPanel(\'tengah\', -1);" class="label label-info"><i class="fa fa-plus"></i> Tambah Panel Tengah</a><br><br>';

        if (!empty($set['tengah'])) {
            $no_tengah = 0;
            foreach ($set['tengah'] as $f => $g) {
                $tombolUpTengah = ($no_tengah < 1) ? '' : '<a href="#" onclick="return upPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-info fa-arrow-up"></i> </a>';
                if ($g['tipe'] == "slideshow") {
                    $htm .= '
                        <div class="panel panel-success">
                            <div class="panel-heading">' . $g['title'] . '
                                <div class="pull-right">
                                    ' . $tombolUpTengah . '
                                    <a href="#" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-info fa-arrow-down"></i> </a>
                                    <a href="#" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-success fa-edit"></i> </a>
                                    <a href="#" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-danger fa-times"></i> </a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>Komponen ini berisi slideshow (gambar bergerak), yang datanya berasal dari semua berita yang ada gambarnya</p>
                                <a href="#" class="btn btn-success" onclick="return setting_slideshow(\'tengah\', ' . $no_tengah . ')">Setting Slideshow</a>
                            </div>
                        </div>
                    ';
                } else if ($g['tipe'] == "post") {
                    $htm .= '
                        <div class="panel panel-success">
                            <div class="panel-heading">' . $g['title'] . '
                                <div class="pull-right">
                                    ' . $tombolUpTengah . '
                                    <a href="#" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-info fa-arrow-down"></i> </a>
                                    <a href="#" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-success fa-edit"></i> </a>
                                    <a href="#" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-danger fa-times"></i> </a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>Komponen ini digunakan untuk menampilkan berita terbaru, berdasarkan kategori yang terpilih</p>
                                <a href="#" class="btn btn-success" onclick="return setting_slideshow(\'tengah\', ' . $no_tengah . ')">Setting Berita Terbaru</a>
                            </div>
                        </div>
                    ';
                } else if ($g['tipe'] == "html") {
                    $htm .= '
                        <div class="panel panel-success">
                            <div class="panel-heading">' . $g['title'] . '
                                <div class="pull-right">
                                    ' . $tombolUpTengah . '
                                    <a href="#" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-info fa-arrow-down"></i> </a>
                                    <a href="#" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-success fa-edit"></i> </a>
                                    <a href="#" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa text-danger fa-times"></i> </a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <a href="#" onclick="return editContent(\'tengah\', ' . $no_tengah . ');">Edit Content</a>
                            </div>
                        </div>
                    ';
                }
                $no_tengah++;
            }
        }

        $htm .= '</div>';
        $nomor_kiri = 0;
        $htm .= '<div class="col-md-3 kanan">';
        $htm .= '<a href="#" onclick="return editPanel(\'kiri\', -1);" class="label label-info">Tambah Panel</a><br><br>';
        if (!empty($set['kiri'])) {
            foreach ($set['kiri'] as $a => $b) {
                $tombolUp = ($nomor_kiri < 1) ? '' : '<a href="#" onclick="return upPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa text-info fa-arrow-up"></i> </a>';
                $htm .= '<div class="panel panel-success">
                            <div class="panel-heading">' . $b['title'] . '
                                <div class="pull-right">
                                <a href="#" onclick="return pindah_side(\'kiri\', ' . $nomor_kiri . ');"><i class="fa text-warning fa-arrow-left"></i> </a>
                                ' . $tombolUp . '
                                <a href="#" onclick="return downPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa text-info fa-arrow-down"></i> </a>
                                <a href="#" onclick="return editPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa text-success fa-edit"></i> </a>
                                <a href="#" onclick="return hapusPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa text-danger fa-times"></i> </a>
                                </div>
                            </div>
                            <div class="panel-body">
                        ';

                if ($b['tipe'] == "list_url") {
                    $htm .= '<a href="#" onclick="return editUrl(\'kiri\', ' . $nomor_kiri . ', -1)" class="label label-info">Tambah URL</a>';
                    if (!empty($b['data'])) {
                        $nomor_list = 0;
                        $htm .= '<ul style="margin-left: -40px">';
                        foreach ($b['data'] as $c => $d) {
                            $htm .= '<li>
                                <a href="' . str_replace("{{base_url}}", base_url(), $d['url']) . '" target="_blank" style="font-family: \'Arial Narrow\'; font-size: 16px;">' . substr($d['label'], 0, 25) . ' ...</a>
                                <div class="pull-right">
                                    <a href="#" onclick="return editUrl(\'kiri\', ' . $nomor_kiri . ', ' . $nomor_list . ');" class="label label-success"><i class="fa text-success fa-edit"></i> </a>&nbsp;
                                    <a href="#" onclick="return hapusUrl(\'kiri\', ' . $nomor_kiri . ', ' . $nomor_list . ');" class="label label-danger"><i class="fa text-success fa-times"></i> </a>
                                </div>
                                    </li>';
                            $nomor_list++;
                        }
                        $htm .= '</ul>';
                    } else {
                        $htm .= '<br><span class="text-danger">Belum ada list url</span>';
                    }
                } else if ($b['tipe'] == "html") {
                    $htm .= '<a href="#" onclick="return editContent(\'kiri\', ' . $nomor_kiri . ');">Edit Content</a>';
                    // $htm .= '<div>'.$b['data'].'</div>';
                } else if ($b['tipe'] == "statistik") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "kategori") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "arsip_bulanan") {
                    $htm .= '<div class="label label-info">Lihat di halaman depan</div>';
                } else if ($b['tipe'] == "list_posting") {
                    $htm .= '<a href="#" class="btn btn-success" onclick="return setting_slideshow(\'kiri\', ' . $nomor_kiri . ')">Setting Postingan</a>';
                }

                $htm .= '</div>
                        </div>
                        ';
                $nomor_kiri++;
            }
        } else {
            $htm .= '<br><span class="text-danger">Belum ada panel di kiri</span>';
        }
        $htm .= '</div>';
        $htm .= '</div>';
        echo $htm;
    }
}