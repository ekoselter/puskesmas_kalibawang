<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Set_menu extends CI_Controller {
    function __construct() {
        parent:: __construct();
    }

    public function index() {
        cek_login();
        $a['p'] = "v_menu";
        $this->load->view('adm/template', $a);
    }

    public function edit() {
        cek_login();
        $g = $this->input->get();
        $id1 = ($g['id1']);
        $id2 = ($g['id2']);
        $id3 = ($g['id3']);
        $id4 = ($g['id4']);
        $mode = ($g['mode']);
        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);

        $back = null;
        if ($mode == "edit") {
            if ($id1 != "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
                $back = $menu[$id1];
            } else if ($id1 != "no" && $id2 != "no" && $id3 == "no" && $id4 == "no") {
                $back = $menu[$id1]['children'][$id2];
            } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 == "no") {
                $back = $menu[$id1]['children'][$id2]['children'][$id3];
            } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 != "no") {
                $back = $menu[$id1]['children'][$id2]['children'][$id3]['children'][$id4];
            } else {
                $back = null;
            }
        } else {
            $back = array(
                "href"=>"",
                "icon"=>"",
                "text"=>"",
                "target"=>"_self",
            );
        }
        // $get_menu_detil = $menu[];

        // j($g);
        j($back);
        exit;
    }

    public function view_json() {
        cek_login();
        
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);
        j($menu);
        exit;
    }

    public function simpan($value='') {
        cek_login();
        $p = $this->input->post();
        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();


        $id1 = ($p['id1']);
        $id2 = ($p['id2']);
        $id3 = ($p['id3']);
        $id4 = ($p['id4']);
        $mode = ($p['mode']);

        $menu = json_decode($get_setting['val'],true);
        
        if ($mode == "tambah") {
            $p_new = array(
                "href"=>$p['href'],
                "target"=>$p['target'],
                "text"=>$p['text'],
                "icon"=>$p['faicon']
            );
            if ($id1 == "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
                $menu[] = $p_new;
            } else if ($id1 != "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
                $menu[$id1]['children'][] = $p_new;
            } else if ($id1 != "no" && $id2 != "no" && $id3 == "no" && $id4 == "no") {
                $menu[$id1]['children'][$id2]['children'][] = $p_new;
            } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 == "no") {
                $menu[$id1]['children'][$id2]['children'][$id3]['children'][] = $p_new;
            } 
        } else if ($mode == "edit") {
            $icon = $p['faicon'];

            if ($id1 != "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
                $menu[$id1]['href'] = $p['href'];
                $menu[$id1]['target'] = $p['target'];
                $menu[$id1]['text'] = $p['text'];
                $menu[$id1]['icon'] = $icon;
            } else if ($id1 != "no" && $id2 != "no" && $id3 == "no" && $id4 == "no") {
                $menu[$id1]['children'][$id2]['href'] = $p['href'];
                $menu[$id1]['children'][$id2]['target'] = $p['target'];
                $menu[$id1]['children'][$id2]['text'] = $p['text'];
                $menu[$id1]['children'][$id2]['icon'] = $icon;
            } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 == "no") {
                $menu[$id1]['children'][$id2]['children'][$id3]['href'] = $p['href'];
                $menu[$id1]['children'][$id2]['children'][$id3]['target'] = $p['target'];
                $menu[$id1]['children'][$id2]['children'][$id3]['text'] = $p['text'];
                $menu[$id1]['children'][$id2]['children'][$id3]['icon'] = $icon;
            } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 != "no") {
                $menu[$id1]['children'][$id2]['children'][$id3]['children'][$id4]['href'] = $p['href'];
                $menu[$id1]['children'][$id2]['children'][$id3]['children'][$id4]['target'] = $p['target'];
                $menu[$id1]['children'][$id2]['children'][$id3]['children'][$id4]['text'] = $p['text'];
                $menu[$id1]['children'][$id2]['children'][$id3]['children'][$id4]['icon'] = $icon;
            } 
        }

        $this->db->where('site_id', 1);
        $this->db->where('name', 'MENU');
        $this->db->update('setting',array('val'=>json_encode($menu)));

        $back = array("success"=>true,"message"=>"Berhasil");
        j($back);
        exit;
    }

    public function hapus() {
        cek_login();
        $g = $this->input->get();
        $id1 = ($g['id1']);
        $id2 = ($g['id2']);
        $id3 = ($g['id3']);
        $id4 = ($g['id4']);
        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);

        if ($id1 != "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
            array_splice($menu, $id1, 1);
        } else if ($id1 != "no" && $id2 != "no" && $id3 == "no" && $id4 == "no") {
            array_splice($menu[$id1]['children'], $id2, 1);
        } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 == "no") {
            array_splice($menu[$id1]['children'][$id2]['children'], $id3, 1);
        } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 != "no") {
            array_splice($menu[$id1]['children'][$id2]['children'][$id3]['children'], $id4, 1);
        } 

        $this->db->where('site_id', 1);
        $this->db->where('name', 'MENU');
        $this->db->update('setting',array('val'=>json_encode($menu)));

        $back = array("success"=>true,"message"=>"Berhasil");
        j($back);
        exit;
    }

    public function pindah() {
        cek_login();
        $g = $this->input->get();
        $id1 = ($g['id1']);
        $id2 = ($g['id2']);
        $id3 = ($g['id3']);
        $id4 = ($g['id4']);
        $mode = ($g['mode']);
        

        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);

        if ($id1 != "no" && $id2 == "no" && $id3 == "no" && $id4 == "no") {
            if ($mode == "down") {
                array_move($menu, $id1, ($id1 + 1));
            } else if ($mode == "up") {
                array_move($menu, $id1, ($id1 - 1));
            }
        } else if ($id1 != "no" && $id2 != "no" && $id3 == "no" && $id4 == "no") {
            if ($mode == "down") {
                array_move($menu[$id1]['children'], $id2, ($id2 + 1));
            } else if ($mode == "up") {
                array_move($menu[$id1]['children'], $id2, ($id2 - 1));
            }
        } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 == "no") {
            if ($mode == "down") {
                array_move($menu[$id1]['children'][$id2]['children'], $id3, ($id3 + 1));
            } else if ($mode == "up") {
                array_move($menu[$id1]['children'][$id2]['children'], $id3, ($id3 - 1));
            }
        } else if ($id1 != "no" && $id2 != "no" && $id3 != "no" && $id4 != "no") {
            if ($mode == "down") {
                array_move($menu[$id1]['children'][$id2]['children'][$id3]['children'], $id4, ($id4 + 1));
            } else if ($mode == "up") {
                array_move($menu[$id1]['children'][$id2]['children'][$id3]['children'], $id4, ($id4 - 1));
            }
        } 

        $this->db->where('site_id', 1);
        $this->db->where('name', 'MENU');
        $this->db->update('setting',array('val'=>json_encode($menu)));

        $back = array("success"=>true,"message"=>"Berhasil");
        j($back);
        exit;
    }

    public function ajaks2() {
        cek_login();

        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);

        j($menu);
        exit;
    }

    public function ajaks() {
        cek_login();

        // get_setting
        $this->db->where('name', 'MENU');
        $get_setting = $this->db->get('setting')->row_array();

        $menu = json_decode($get_setting['val'],true);

        $view_edit_menu = '<a href="#" onclick="return edit(\'no\',\'no\',\'no\',\'no\',\'tambah\');" class="btn btn-success btn-xs">Tambah</a><br><br>';
        $view_edit_menu .= '<table class="table table-bordered table-condensed">';
        $no = 0;
        foreach ($menu as $m) {
            $url_edit_berita = "";
            if (trim($m['href']) != "#" || trim($m['href']) != "") {
                $_url = str_replace("{{base_url}}", "", $m['href']);
                $pc_url = explode("/", $_url);
                if (count($pc_url) > 1) {
                    $url_edit_berita = '<a href="'.base_url('adm/berita/edt/'.intval($pc_url[1])).'" class="btn btn-primary btn-xs" target="_blank">Edit Isi</a>';
                }
            }
            $view_edit_menu .= '<tr><td width="15%">
                <a href="#" onclick="return edit('.$no.');" class="btn btn-xs btn-success">Edt</a>
                <a href="#" onclick="return hapus('.$no.');" class="btn btn-xs btn-danger">Hps</a> 
                <a href="#" onclick="return edit('.$no.',\'no\',\'no\',\'no\',\'tambah\');" class="btn btn-xs btn-info">Tmb Sub</a> 
                <a href="#" onclick="return pindah('.$no.', \'no\', \'no\', \'no\', \'up\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-up"></i></a>
                <a href="#" onclick="return pindah('.$no.', \'no\', \'no\', \'no\', \'down\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-down"></i></a>
                <td colspan="4"><i class="fa '.$m['icon'].'"></i> '.$m['text'].' - <a href="'.str_replace("{{base_url}}", base_url(), $m['href']).'" target="_blank">'.str_replace("{{base_url}}", base_url(), $m['href']).'</a>  '.$url_edit_berita.'</td></tr>';
            if (!empty($m['children'])) {
                $no2 = 0;
                foreach ($m['children'] as $m2) {
                    $url_edit_berita = "";
                    if (trim($m2['href']) != "#" || trim($m2['href']) != "") {
                        $_url = str_replace("{{base_url}}", "", $m2['href']);
                        $pc_url = explode("/", $_url);
                        if (count($pc_url) > 1) {
                            $url_edit_berita = '<a href="'.base_url('adm/berita/edt/'.intval($pc_url[1])).'" class="btn btn-primary btn-xs" target="_blank">Edit Isi</a>';
                        }
                    }
                    $view_edit_menu .= '<tr><td width="15%">
                        <a href="#" onclick="return edit('.$no.', '.$no2.');" class="btn btn-xs btn-success">Edt</a>
                        <a href="#" onclick="return hapus('.$no.', '.$no2.');" class="btn btn-xs btn-danger">Hps</a> 
                        <a href="#" onclick="return edit('.$no.', '.$no2.',\'no\',\'no\',\'tambah\');" class="btn btn-xs btn-info">Tmb Sub</a> 
                        <a href="#" onclick="return pindah('.$no.', '.$no2.',\'no\', \'no\', \'up\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-up"></i></a>
                        <a href="#" onclick="return pindah('.$no.', '.$no2.',\'no\', \'no\', \'down\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-down"></i></a>
                        <td width="40px"></td><td colspan="3"><i class="fa '.$m2['icon'].'"></i> '.$m2['text'].' - <a href="'.str_replace("{{base_url}}", base_url(), $m2['href']).'" target="_blank">'.str_replace("{{base_url}}", base_url(), $m2['href']).'</a> '.$url_edit_berita.'</td></tr>';
                    if (!empty($m2['children'])) {
                        $no3 =0;
                        foreach ($m2['children'] as $m3) {
                            $url_edit_berita = "";
                            if (trim($m3['href']) != "#" || trim($m3['href']) != "") {
                                $_url = str_replace("{{base_url}}", "", $m3['href']);
                                $pc_url = explode("/", $_url);
                                if (count($pc_url) > 1) {
                                    $url_edit_berita = '<a href="'.base_url('adm/berita/edt/'.intval($pc_url[1])).'" class="btn btn-primary btn-xs" target="_blank">Edit Isi</a>';
                                }
                            }
                            $view_edit_menu .= '<tr><td width="15%">
                                <a href="#" onclick="return edit('.$no.', '.$no2.', '.$no3.');" class="btn btn-xs btn-success">Edt</a>
                                <a href="#" onclick="return hapus('.$no.', '.$no2.', '.$no3.');" class="btn btn-xs btn-danger">Hps</a> 
                                <a href="#" onclick="return edit('.$no.', '.$no2.', '.$no3.',\'no\',\'tambah\');" class="btn btn-xs btn-info">Tmb Sub</a> 
                                <a href="#" onclick="return pindah('.$no.', '.$no2.','.$no3.',\'no\', \'up\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-up"></i></a>
                                <a href="#" onclick="return pindah('.$no.', '.$no2.','.$no3.',\'no\', \'down\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-down"></i></a>
                                <td width="40px"></td><td width="40px"></td><td colspan="2"><i class="fa '.$m3['icon'].'"></i> '.$m3['text'].' - <a href="'.str_replace("{{base_url}}", base_url(), $m3['href']).'" target="_blank">'.str_replace("{{base_url}}", base_url(), $m3['href']).'</a>  '.$url_edit_berita.'</td></tr>';
                            if (!empty($m3['children'])) {
                                $no4 = 0;
                                foreach ($m3['children'] as $m4) {
                                    $url_edit_berita = "";
                                    if (trim($m4['href']) != "#" || trim($m4['href']) != "") {
                                        $_url = str_replace("{{base_url}}", "", $m4['href']);
                                        $pc_url = explode("/", $_url);
                                        if (count($pc_url) > 1) {
                                            $url_edit_berita = '<a href="'.base_url('adm/berita/edt/'.intval($pc_url[1])).'" class="btn btn-primary btn-xs" target="_blank">Edit Isi</a>';
                                        }
                                    }
                                    $view_edit_menu .= '<tr><td width="15%">
                                        <a href="#" onclick="return edit('.$no.', '.$no2.', '.$no3.', '.$no4.');" class="btn btn-xs btn-success">Edt</a>
                                        <a href="#" onclick="return hapus('.$no.', '.$no2.', '.$no3.', '.$no4.');" class="btn btn-xs btn-danger">Hps</a> 
                                        <a href="#" onclick="return pindah('.$no.', '.$no2.','.$no3.','.$no4.'\'up\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-up"></i></a>
                                        <a href="#" onclick="return pindah('.$no.', '.$no2.','.$no3.','.$no4.'\'down\');" class="btn btn-xs btn-primary"><i class="fa fa-arrow-down"></i></a>
                                        <td width="40px"></td><td width="40px"></td><td width="40px"></td><td><i class="fa '.$m4['icon'].'"></i> '.$m4['text'].' - <a href="'.str_replace("{{base_url}}", base_url(), $m4['href']).'" target="_blank">'.str_replace("{{base_url}}", base_url(), $m4['href']).'</a> '.$url_edit_berita.'</td></tr>';
                                    $no4++;
                                }
                            }
                            $no3++;
                        }
                    }
                    $no2++;
                }
            }
            $no++;
        }

        $view_edit_menu .= '</table>';

        j($view_edit_menu);
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

    private function moveElement(&$array, $a, $b) {
        $out = array_splice($array, $a, 1);
        return array_splice($array, $b, 0, $out);
    }
}