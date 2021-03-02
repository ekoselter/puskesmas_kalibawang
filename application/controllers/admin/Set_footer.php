<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Set_footer extends CI_Controller {
    function __construct() {
        parent:: __construct();

    }

    public function json()
    {
        cek_login();

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $get_footer = $this->db->get('setting')->row_array();
        $setting_footer = json_decode($get_footer['val'], true);

        if (empty($setting_footer)) {
            $isi = [
                "content"=>[
                    [
                        "header"=>"Header",
                        "jenis"=>"html",
                        "tampil_header"=>true,
                        "content"=>"<h3>Hallow</h3>"
                    ]
                ]
            ];
            $new_val = json_encode($isi);
            $this->db->insert('setting', ["site_id"=>1,"name"=>"site_footer","val"=>$new_val]);
        
            $this->db->where('name','site_footer');
            $this->db->where('site_id', 1);
            $get_footer = $this->db->get('setting')->row_array();
            $setting_footer = json_decode($get_footer['val'], true);
        }

        j($setting_footer);
        exit;
    }

	public function index()
    {
        cek_login();
        
        $a['p'] = "v_set_footer";
        $this->load->view('adm/template', $a);
    }

    public function save_panel()
    {
        cek_login();

        $p = $this->input->post();

        
        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $get_footer = $this->db->get('setting')->row_array();
        $setting_footer = json_decode($get_footer['val'], true);

        

        if ($p['mode'] == "add") {
            if (count($setting_footer['content']) >= 4) {
                $ret['success'] = false;
                $ret['message'] = "Panel footer tidak boleh lebih dari 4";
            } else {
                
                $p_new_panel = [
                                "header"=>$p['nama_panel'],
                                "jenis"=>$p['tipe'],
                                "tampil_header"=>true,
                                "content"=>"<!-- disini tuliskan skrip Anda -->"
                ];

                $setting_footer['content'][] = $p_new_panel;
                $new_setting = json_encode($setting_footer);

                $this->db->where('name','site_footer');
                $this->db->where('site_id', 1);
                $this->db->update('setting', ['val'=>$new_setting]);
        
                $ret['success'] = true;
                $ret['message'] = "Disimpan";
            }
        } else if ($p['mode'] == "edit") {
            $urutan = intval($p['urutan']);

            if (!empty($p['nama_panel'])) {
                $setting_footer['content'][$urutan]['header'] = $p['nama_panel'];
            }
            if (!empty($p['tipe'])) {
                $setting_footer['content'][$urutan]['jenis'] = $p['tipe'];
            }
            if (!empty($p['EditKontentIsi'])) {
                $setting_footer['content'][$urutan]['content'] = $p['EditKontentIsi'];
            }

            $new_setting = json_encode($setting_footer);

            $this->db->where('name','site_footer');
            $this->db->where('site_id', 1);
            $this->db->update('setting', ['val'=>$new_setting]);

            $ret['success'] = true;
            $ret['message'] = "Disimpan";
        }

        j($ret);
    }

    public function hapus_panel()
    {
        cek_login();
        $urutan = intval($this->input->get('urutan'));

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $get_footer = $this->db->get('setting')->row_array();
        $setting_footer = json_decode($get_footer['val'], true);

        array_splice($setting_footer['content'], $urutan, 1);

        $new_setting = json_encode($setting_footer);

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $this->db->update('setting', ['val'=>$new_setting]);
        
        $ret['success'] = true;
        $ret['message'] = "Disimpan";

        j($ret);
    }

    public function detil_panel($urutan) 
    {
        cek_login();

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $get_footer = $this->db->get('setting')->row_array();
        $setting_footer = json_decode($get_footer['val'], true);

        $content = $setting_footer['content'][$urutan];

        $ret['success'] = true;
        $ret['message'] = "Disimpan";
        $ret['data'] = $content;

        j($ret);
    }

    public function pindah_panel($urutan, $kemana)
    {
        cek_login();

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $get_footer = $this->db->get('setting')->row_array();
        $setting_footer = json_decode($get_footer['val'], true);

        if ($kemana == "up") {
            $new_pos = ($urutan - 1);
        } else if ($kemana == "down") {
            $new_pos = ($urutan + 1);
        }
        
        array_move($setting_footer['content'], $urutan, $new_pos);

        $new_setting = json_encode($setting_footer);

        $this->db->where('name','site_footer');
        $this->db->where('site_id', 1);
        $this->db->update('setting', ['val'=>$new_setting]);
        
        $ret['success'] = true;
        $ret['message'] = "Disimpan";

        j($ret);

    }
}