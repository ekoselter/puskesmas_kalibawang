<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Layout_detil extends CI_Controller {
    function __construct() {
        parent:: __construct();
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
        $htm = '<div class="col-md-12"><div class="row mt-3">';
        $htm .= '<div class="col-md-3 kanan">';
        $htm .= '<a href="#" onclick="return editPanel(\'kanan\', -1);" class="btn btn-success col-md-12 mb-4"><i class="fa fa-plus"></i> Tambah Panel</a><br>';

        $nomor_kanan = 0;
        if (!empty($set['kanan'])) {
            foreach ($set['kanan'] as $a => $b) {
                $tombolUp = ($nomor_kanan < 1) ? '' : '<a href="#" class="btn btn-sm btn-info" onclick="return upPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa fa-arrow-up"></i> </a>';
                $htm .= '<div class="card mb-2">
                            <div class="card-header">' . $b['title'] . '
                                <div class="pull-right">
                                    <div class="btn-group" role="group">' 
                                        . $tombolUp . '
                                        <a href="#" class="btn btn-sm btn-info" onclick="return downPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa fa-arrow-down"></i> </a>
                                        <a href="#" class="btn btn-sm btn-success" onclick="return editPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa fa-edit"></i> </a>
                                        <a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel(\'kanan\', ' . $nomor_kanan . ');"><i class="fa fa-times"></i> </a>
                                        <a href="#" class="btn btn-sm btn-warning" onclick="return pindah_side(\'kanan\', ' . $nomor_kanan . ');"><i class="fa fa-arrow-right"></i> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
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
            $htm .= '<span class="text-danger">Belum ada panel di kanan</span>';
        }
        $htm .= '</div>';
        $htm .= '<div class="col-md-6">
        <div class="card mb-3">
            <div class="card-body">
            <a href="#" class="badge badge-danger" onclick="return setting_slideshow(\'newsticker\', 0)" ><i class="fa fa-wrench"></i> Setting Newsticker</a>
            <a href="#" onclick="return editPanel(\'tengah\', -1);" class="badge badge-info"><i class="fa fa-plus"></i> Tambah Panel Tengah</a>
            </div>
        </div>
        ';

        if (!empty($set['tengah'])) {
            $no_tengah = 0;
            foreach ($set['tengah'] as $f => $g) {
                $tombolUpTengah = ($no_tengah < 1) ? '' : '<a href="#" class="btn btn-sm btn-info" onclick="return upPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-arrow-up"></i> </a>';
                if ($g['tipe'] == "slideshow") {
                    $htm .= '
                        <div class="card card-success mb-2">
                            <div class="card-header">' . $g['title'] . '
                                <div class="float-right">
                                    <div class="btn-group" role="group">
                                    ' . $tombolUpTengah . '
                                    <a href="#" class="btn btn-sm btn-info" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-arrow-down"></i> </a>
                                    <a href="#" class="btn btn-sm btn-success" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-edit"></i> </a>
                                    <a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-times"></i> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p>Komponen ini berisi slideshow (gambar bergerak), yang datanya berasal dari semua berita yang ada gambarnya</p>
                                <a href="#" class="btn btn-success" onclick="return setting_slideshow(\'tengah\', ' . $no_tengah . ')">Setting Slideshow</a>
                            </div>
                        </div>
                    ';
                } else if ($g['tipe'] == "post") {
                    $htm .= '
                        <div class="card card-success mb-2">
                            <div class="card-header">' . $g['title'] . '
                                <div class="float-right">
                                    <div class="btn-group" role="group">
                                    ' . $tombolUpTengah . '
                                    <a href="#" class="btn btn-sm btn-info" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-arrow-down"></i> </a>
                                    <a href="#" class="btn btn-sm btn-success" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-edit"></i> </a>
                                    <a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-times"></i> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p>Komponen ini digunakan untuk menampilkan berita terbaru, berdasarkan kategori yang terpilih</p>
                                <a href="#" class="btn btn-success" onclick="return setting_slideshow(\'tengah\', ' . $no_tengah . ')">Setting Berita Terbaru</a>
                            </div>
                        </div>
                    ';
                } else if ($g['tipe'] == "html") {
                    $htm .= '
                        <div class="card mb-2">
                            <div class="card-header">' . $g['title'] . '
                                <div class="float-right">
                                    <div class="btn-group" role="group">
                                    ' . $tombolUpTengah . '
                                    <a href="#" class="btn btn-sm btn-info" onclick="return downPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-arrow-down"></i> </a>
                                    <a href="#" class="btn btn-sm btn-success" onclick="return editPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-edit"></i> </a>
                                    <a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel(\'tengah\', ' . $no_tengah . ');"><i class="fa fa-times"></i> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
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
        $htm .= '<a href="#" onclick="return editPanel(\'kiri\', -1);" class="btn btn-success col-md-12"><i class="fa fa-plus"></i> Tambah Panel</a><br><br>';
        if (!empty($set['kiri'])) {
            foreach ($set['kiri'] as $a => $b) {
                $tombolUp = ($nomor_kiri < 1) ? '' : '<a href="#" class="btn btn-sm btn-info" onclick="return upPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa fa-arrow-up"></i> </a>';
                $htm .= '<div class="card mb-2">
                            <div class="card-header">' . substr($b['title'],0,10) . '..
                                <div class="pull-right">
                                <div class="btn-group" role="group">
                                <a href="#" class="btn btn-sm btn-warning" onclick="return pindah_side(\'kiri\', ' . $nomor_kiri . ');"><i class="fa fa-arrow-left"></i> </a>
                                ' . $tombolUp . '
                                <a href="#" class="btn btn-sm btn-info" onclick="return downPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa fa-arrow-down"></i> </a>
                                <a href="#" class="btn btn-sm btn-success" onclick="return editPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa fa-edit"></i> </a>
                                <a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel(\'kiri\', ' . $nomor_kiri . ');"><i class="fa fa-times"></i> </a>
                                </div>
                                </div>
                            </div>
                            <div class="card-body">
                        ';

                if ($b['tipe'] == "list_url") {
                    $htm .= '<a href="#" onclick="return editUrl(\'kiri\', ' . $nomor_kiri . ', -1)" class="btn btn-sm btn-info mb-2">Tambah URL</a>';
                    if (!empty($b['data'])) {
                        $nomor_list = 0;

                        $htm .= '<ul class="list-group">';
                        foreach ($b['data'] as $c => $d) {
                            $htm .= '<li class="list-group-item">
                                <a href="' . str_replace("{{base_url}}", base_url(), $d['url']) . '" target="_blank" style="font-size: 16px;">' . substr($d['label'], 0, 25) . ' </a>
                                <div class="float-right">
                                    <div class="btn-group" role="group">
                                    <a href="#" onclick="return editUrl(\'kiri\', ' . $nomor_kiri . ', ' . $nomor_list . ');" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> </a>
                                    <a href="#" onclick="return hapusUrl(\'kiri\', ' . $nomor_kiri . ', ' . $nomor_list . ');" class="btn btn-sm btn-danger"><i class="fa fa-times"></i> </a>
                                    </div>
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
        $htm .= '</div>';
        echo $htm;
    }

    public function saveslideshow() {
        cek_login();
        $p                 = $this->input->post();
        $posisi            = $p['slideshow_posisi'];
        $urutan            = $p['slideshow_urutan'];
        $slideshow_max     = intval($p['slideshow_max']);
        $slideshow_topik   = $p['slideshow_topik'];
        $slideshow_tipe    = $p['slideshow_tipe'];
        $slideshow_orderby = $p['slideshow_orderby'];
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = json_decode($set, true);
        // aksi
        $_topik = array();
        if (!empty($slideshow_topik)) {
            foreach ($slideshow_topik as $b => $c) {
                $_topik[] = intval($c);
            }
        }
        if (!empty($set[$posisi][$urutan]['data']['order_by'])) {
            $set[$posisi][$urutan]['data']['order_by'] = $slideshow_orderby;
        } else {
            $set[$posisi][$urutan]['data']             = array();
            $set[$posisi][$urutan]['data']['order_by'] = $slideshow_orderby;
        }
        $set[$posisi][$urutan]['data']['jml_maks'] = $slideshow_max;
        $set[$posisi][$urutan]['data']['topik']    = $_topik;
        // end aksi array
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function savepanel() {
        cek_login();
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set   = $this->db->get("setting")->row_array();
        $set     = $q_set['val'];
        $set     = json_decode($set, true);
        $posisi  = $p['posisi_panel'];
        $urutan  = intval($p['urutan']);
        $content = "";
        if ($p['tipe'] == "list_url") {
            $content = array();
        }
        if ($urutan < 0) {
            $set[$posisi][] = array("title" => $p['nama_panel'], "tipe" => $p['tipe'], "data" => $content);
        } else {
            $set[$posisi][$urutan]['title'] = $p['nama_panel'];
            $set[$posisi][$urutan]['tipe']  = $p['tipe'];
        }
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function detil_hal($id) {
        cek_login();

        if ($id > 0) {
            $this->db->where('id', $id);
            $this->db->select("id, judul, konten");
            $halaman = $this->db->get("artikel")->row_array();
        } else {
            $halaman = array("judul" => "", "id" => 0, "konten" => "");
        }
        /*$ret = array();
        $ret['data'] = $halaman;
        $ret['success'] = true;
        j($ret);
        exit;*/
        $this->load->view('adm/template_popup', $halaman);
    }

    public function savepage() {
        cek_login();
        $p = $this->input->post();

        $ret['data'] = "";
        if (intval($p['id_page']) < 1) {
            $p_data = array(
                "judul"     => $p['judul'],
                "konten"    => $p['content_page'],
                "tgl"       => date('Y-m-d H:i:s'),
                "publikasi" => 1,
                "hits"      => 1,
                "create_at" => date('Y-m-d H:i:s'),
            );
            $this->db->insert("artikel", $p_data);

            $insert_id   = $this->db->insert_id();
            $ret['data'] = "{{base_url}}detil/" . $insert_id . "/" . url_title($p['judul'], "-", true);
        } else {
            $p_data = array(
                "konten"    => $p['content_page'],
                "update_at" => date('Y-m-d H:i:s'),
            );
            $this->db->where("id", intval($p['id_page']));
            $this->db->update("artikel", $p_data);

            $this->db->where("id", intval($p['id_page']));
            $get_hal     = $this->db->get("artikel")->row_array();
            $ret['data'] = "{{base_url}}detil/" . intval($get_hal['id']) . "/" . url_title($get_hal['judul'], "-", true);
        }

        $ret['success'] = true;
        j($ret);
        exit;
    }

    public function get_hal() {
        cek_login();
        $this->db->like('judul', $this->input->get('query'));
        $this->db->select("id, judul");
        $halaman = $this->db->get("artikel")->result_array();
        $ret     = array();
        foreach ($halaman as $h) {
            $satu  = array("id" => "{{base_url}}detil/" . $h['id'] . "/" . url_title($h['judul'], "-", true), "name" => $h['judul']);
            $ret[] = $satu;
        }
        j($ret);
        exit;
    }

    public function menu($mode = "get") {
        cek_login();
        if ($mode == "get") {
            $queri = $this->db->query("SELECT * FROM setting WHERE name = 'MENU'")->row_array();
            $data  = json_decode($queri['val']);
            j($data);
            exit;
        } else if ($mode == "post") {
            $p_ci = $this->input->post();
            $this->db->query("UPDATE setting SET val = '" . $p_ci['val'] . "' WHERE name = '" . $p_ci['name'] . "'");
            $queri = $this->db->query("SELECT * FROM setting WHERE name = 'MENU'")->row_array();
            $data  = json_encode($queri['val']);
            j($data);
            exit;
        }
    }

    public function editcontent($posisi, $urutan) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();

        $set          = $q_set['val'];
        $set          = json_decode(preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $set), true);
        $d['success'] = true;
        $d['message'] = "OK";
        $nomor_ok     = intval($urutan);
        if ($nomor_ok < 0) {
            $d['data'] = "";
        } else {
            $ok        = $set[$posisi][$nomor_ok];
            $d['data'] = $ok['data'];
        }
        j($d);
        exit;
    }

    public function editpanel($posisi, $urutan) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();

        $set          = $q_set['val'];
        $set          = json_decode($set, true);
        $d['success'] = true;
        $d['message'] = "OK";
        $nomor_ok     = intval($urutan);
        if ($nomor_ok < 0) {
            $d['data'] = array("title" => "", "tipe" => "");
        } else {
            $ok        = $set[$posisi][$nomor_ok];
            $d['data'] = array("title" => $ok['title'], "tipe" => $ok['tipe']);
        }
        j($d);
        exit;
    }

    public function hapuspanel($posisi, $urutan) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = json_decode($set, true);
        array_splice($set[$posisi], $urutan, 1);
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function uppanel($posisi, $nomor) {
        cek_login();
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = json_decode($set, true);
        $nomor = intval($nomor);
        array_move($set[$posisi], $nomor, $nomor - 1);
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function downpanel($posisi, $nomor) {
        cek_login();
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = json_decode($set, true);
        $nomor = intval($nomor);
        array_move($set[$posisi], $nomor, $nomor + 1);
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    

    public function saveurl() {
        cek_login();
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set       = $this->db->get("setting")->row_array();
        $set         = $q_set['val'];
        $set         = json_decode($set, true);
        $posisi      = $p['posisi'];
        $nomor_kanan = $p['nomor_kanan'];
        $nomor_url   = $p['nomor_url'];
        if (intval($nomor_url) < 0) {
            $deturl                               = array("label" => $p['label'], "url" => $p['url']);
            $set[$posisi][$nomor_kanan]['data'][] = $deturl;
        } else {
            $set[$posisi][$nomor_kanan]['data'][$nomor_url]['label'] = $p['label'];
            $set[$posisi][$nomor_kanan]['data'][$nomor_url]['url']   = $p['url'];
        }
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function savecontent() {
        cek_login();
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set       = $this->db->get("setting")->row_array();
        $set         = $q_set['val'];
        $set         = json_decode($set, true);
        $posisi      = $p['posisi_edit_konten'];
        $nomor_kanan = $p['nomor_edit_konten'];
        $content     = $p['content'];
        $is_header   = !empty($p['is_header_edit_konten']) ? true : false;
        // echo $posisi."-".$nomor_kanan."-".$content;
        // exit;

        $set[$posisi][$nomor_kanan]['is_header'] = $is_header;
        $set[$posisi][$nomor_kanan]['data']      = $content;

        $v = json_encode($set);
        // j($v);
        // exit;
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function hapusurl($posisi, $urutan, $nomor) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();
        $set   = $q_set['val'];
        $set   = json_decode($set, true);
        array_splice($set[$posisi][$urutan]['data'], $nomor, 1);
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }

    public function editurl($posisi, $urutan, $nomor) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();

        $set          = $q_set['val'];
        $set          = json_decode($set, true);
        $d['success'] = true;
        $d['message'] = "OK";
        $nomor_ok     = intval($nomor);
        if ($nomor_ok < 0) {
            $d['data'] = array("label" => "", "url" => "");
        } else {
            $ok        = $set[$posisi][$urutan]['data'][$nomor_ok];
            $d['data'] = array("label" => $ok['label'], "url" => $ok['url']);
        }
        j($d);
        exit;
    }

    public function edittengah($posisi, $urutan) {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set = $this->db->get("setting")->row_array();

        $set          = $q_set['val'];
        $set          = json_decode($set, true);
        $d['success'] = true;
        $d['message'] = "OK";
        $nomor_ok     = intval($urutan);
        if ($nomor_ok < 0) {
            $d['data'] = array("title" => "", "tipe" => "", "order_by" => "");
        } else {
            $ok        = $set[$posisi][$nomor_ok];
            $d['data'] = $ok;
            // $d['data'] = array("title"=>$ok['title'],"tipe"=>$ok['tipe']);
        }
        j($d);
        exit;
    }

    public function pindah_side($posisi, $nomor) {
        cek_login();
        
        $p = $this->input->post();

        $this->db->where("site_id", 1);
        $this->db->where("name", "side_menu");
        $q_set       = $this->db->get("setting")->row_array();
        $set         = $q_set['val'];
        $set         = json_decode($set, true);
        $nomor       = intval($nomor);
        $awal        = $set[$posisi][$nomor];
        $posisi_baru = ($posisi == "kanan") ? "kiri" : "kanan";
        // pindah side
        $set[$posisi_baru][] = $awal;
        // hapus yang awal
        array_splice($set[$posisi], $nomor, 1);
        $v    = json_encode($set);
        $strq = "UPDATE setting SET val = '" . addslashes($v) . "' WHERE site_id = 1 AND name = 'side_menu'";
        $this->db->query($strq);
        $d['success'] = true;
        $d['message'] = "OK";
        j($d);
        exit;
    }
}