<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Berita extends CI_Controller {
    function __construct() {
        parent:: __construct();
        cek_login();
    }

    public function index() {
        $kata_kunci = $this->input->get('katakunci');
        $topik = $this->input->get('topik');
        
        if ($kata_kunci != "") {
            if ($topik != "") {
                $this->db->where('a.topik', $topik);
                $this->db->group_start();
                $this->db->like('a.judul', $kata_kunci);
                $this->db->or_like('a.konten', $kata_kunci);
                $this->db->group_end();
            } else {
                $this->db->group_start();
                $this->db->like('a.judul', $kata_kunci);
                $this->db->or_like('a.konten', $kata_kunci);
                $this->db->group_end();
            }
        } else {
            if ($topik != "") {
                $this->db->where('a.topik', $topik);
            } else {
                $this->db->where('b.topik NOT LIKE', '%Halaman%');
            }
        }

        $this->db->join('topik b', 'a.topik = b.id');
        $total_row = $this->db->get("artikel a")->num_rows();


        $a['total_row'] = $total_row;
        $per_page = 10;
        $awal = $this->uri->segment(4);
        $awal = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir = $per_page;
        $a['pagi'] = _page($total_row, $per_page, 4, base_url() . "admin/berita/index");
        
        $a['p_topik'] = array("" => "- Pilih topik -");
        $this->db->select('a.*, (SELECT COUNT(id) FROM artikel WHERE topik = a.id) jml');
        $q_topik = $this->db->get('topik a')->result_array();

        if (!empty($q_topik)) {
            foreach ($q_topik as $t) {
                $idx = $t['id'];
                $a['p_topik'][$idx] = $t['topik'] . " (" . $t['jml'] . " postingan)";
            }
        }

        if ($kata_kunci != "") {
            if ($topik != "") {
                $this->db->where('a.topik', $topik);
                $this->db->group_start();
                $this->db->like('a.judul', $kata_kunci);
                $this->db->or_like('a.konten', $kata_kunci);
                $this->db->group_end();
            } else {
                $this->db->group_start();
                $this->db->like('a.judul', $kata_kunci);
                $this->db->or_like('a.konten', $kata_kunci);
                $this->db->group_end();
            }
        } else {
            if ($topik != "") {
                $this->db->where('a.topik', $topik);
            } else {
                $this->db->where('b.topik NOT LIKE', '%Halaman%');
            }
        }
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->limit($akhir, $awal);
        $this->db->order_by('a.id', 'desc');
        $this->db->select('a.*, b.topik');
        $a['data'] = $this->db->get("artikel a")->result_array();


        $a['p'] = "v_berita";

        $this->load->view('adm/template', $a);
    }

    public function edit($id_berita=0) {
        $a['p_topik'] = array("" => "- Pilih topik -");
        $this->db->select('a.*, (SELECT COUNT(id) FROM artikel WHERE topik = a.id) jml');
        $q_topik = $this->db->get('topik a')->result_array();

        if (!empty($q_topik)) {
            foreach ($q_topik as $t) {
                $idx = $t['id'];
                $a['p_topik'][$idx] = $t['topik'] . " (" . $t['jml'] . " postingan)";
            }
        }

        $id_berita = intval($id_berita);

        if ($id_berita < 1) {
            $a['d'] = array(
                "id" => "",
                "required" => "required",
                "mode" => "ok_tambah",
                "judul" => "",
                "tgl" => date('Y-m-d'),
                "konten" => "",
                "user" => "",
                "publikasi" => "1",
                "topik" => "",
                "gambar" => "",
                "sumber" => "",
                "tags" => "",
            );
        } else {
            $this->db->where('id', $id_berita);
            $a['d'] = $this->db->get('artikel')->row_array();
            $a['d']['mode'] = 'edit';
            $a['d']['required'] = '';
            $pc_tgl = explode(" ", $a['d']['tgl']);

            $a['d']['tgl'] = $pc_tgl[0];

        }

        $a['p'] = "f_berita";
        $a['ms'] = 1;

        $this->load->view('adm/template', $a);
    }

    public function simpan() {
        $p = $this->input->post();

        $config['upload_path'] = config_item('base_url_file').'news/normal';
    
        $config['allowed_types'] = 'jpg|gif|png|jpeg';
        $config['max_size'] = 1000;
        $config['encrypt_name'] = TRUE;
        $config['file_ext_tolower'] = TRUE;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $p_data = array(
            "judul" => $p['judul'],
            "konten" => $p['konten'],
            "user" => $this->session->userdata('username'),
            "tgl" => $p['tgl'],
            "publikasi" => intval($p['publikasi']),
            "topik" => $p['topik'],
            "hits" => 0,
            "tags" => $p['tags'],
            "sumber" => $p['sumber'],
            "userid" => $this->session->userdata('userid'),
        );

        if ($p['mode'] == "ok_tambah") {
            $p_data['create_at'] = date('Y-m-d H:i:s');

            if ($this->upload->do_upload('foto__')) {
                $up_data = $this->upload->data();
                $filename = $up_data['file_name'];
                $p_data['gambar'] = $filename;

                resizeImage(config_item('base_url_file').'news/normal/', config_item('base_url_file').'news/thumb/', $filename);

                $this->db->insert("artikel", $p_data);
                
                $this->db->order_by('id', 'desc');
                $this->db->select('id');
                $this->db->limit(1);
                $get_last_id = $this->db->get('artikel')->row_array();
                
                // CURL AUTO POST TO WEB PEMKAB 
                $id_berita = !empty($get_last_id) ? $get_last_id['id'] : 0;
                $pc_base_url = explode("://", base_url());
                $username = str_replace("/", "", $pc_base_url['1']);
                
                $p_curl_data = [
                    'username'=>$username,
                    'password'=>$username,
                    'id'=>$id_berita,
                    'judul'=>$p['judul'],
                    'konten'=>$p['konten'],
                    'tgl'=>$p['tgl'],
                    'publikasi'=>$p['publikasi'],
                    'topik'=>$p['topik'],
                    'gambar'=>$filename,
                    'mode'=>'add',
                ];
                
                $curl_to_pemda = curl_post(config_item('base_url_api_pemda').'/post_berita', $p_curl_data);
                // END CURL AUTOPOST TO WEB PEMKAB
                
                
                $ret = ['success'=>true, 'message'=>'Simpan berita berhasil.  Post ke PEMKAB status : '.$curl_to_pemda['status']];
            } else {
                $this->db->insert("artikel", $p_data);
                
                $this->db->order_by('id', 'desc');
                $this->db->select('id');
                $this->db->limit(1);
                $get_last_id = $this->db->get('artikel')->row_array();
                
                // CURL AUTO POST TO WEB PEMKAB 
                $id_berita = !empty($get_last_id) ? $get_last_id['id'] : 0;
                $pc_base_url = explode("://", base_url());
                $username = str_replace("/", "", $pc_base_url['1']);
                
                $p_curl_data = [
                    'username'=>$username,
                    'password'=>$username,
                    'id'=>$id_berita,
                    'judul'=>$p['judul'],
                    'konten'=>$p['konten'],
                    'tgl'=>$p['tgl'],
                    'publikasi'=>$p['publikasi'],
                    'topik'=>$p['topik'],
                    'mode'=>'add',
                ];
                
                $curl_to_pemda = curl_post(config_item('base_url_api_pemda').'/post_berita', $p_curl_data);
                // END CURL AUTOPOST TO WEB PEMKAB
                
                
                $ret = ['success'=>true, 'message'=>'Simpan berita berhasil.  Post ke PEMKAB status : '.$curl_to_pemda['status']];
                
                // $this->session->set_flashdata('k', '<div class="alert alert-danger">' . $this->upload->display_errors() . ' '.$this->config->item('base_url_file').'news/'.'</div>');
            }
        } else if ($p['mode'] == "edit") {
            $p_data['update_at'] = date('Y-m-d H:i:s');

            if ($this->upload->do_upload('foto__')) {
                $up_data = $this->upload->data();
                $filename = $up_data['file_name'];
                $p_data['gambar'] = $filename;

                resizeImage(config_item('base_url_file').'news/normal/', config_item('base_url_file').'news/thumb/', $filename);

                // hapus file sebelum 
                $this->db->where('id', $p['id']);
                $this->db->select('gambar');
                $get_file_sebelum = $this->db->get('artikel')->row_array();

                $this->db->where('id', $p['id']);
                $this->db->update("artikel", $p_data);
                

                @unlink(config_item('base_url_file').'news/normal/'.$get_file_sebelum['gambar']);
                @unlink(config_item('base_url_file').'news/thumb/'.$get_file_sebelum['gambar']);
                
                // CURL AUTO POST TO WEB PEMKAB 
                $id_berita = $p['id'];
                $pc_base_url = explode("://", base_url());
                $username = str_replace("/", "", $pc_base_url['1']);
                
                $p_curl_data = [
                    'username'=>$username,
                    'password'=>$username,
                    'id'=>$id_berita,
                    'judul'=>$p['judul'],
                    'konten'=>$p['konten'],
                    'tgl'=>$p['tgl'],
                    'publikasi'=>$p['publikasi'],
                    'topik'=>$p['topik'],
                    'gambar'=>$filename,
                    'mode'=>'edit',
                ];
                
                $curl_to_pemda = curl_post(config_item('base_url_api_pemda').'/post_berita', $p_curl_data);
                // END CURL AUTOPOST TO WEB PEMKAB
                
                $ret = ['success'=>true, 'message'=>'Simpan berita berhasil.  Post ke PEMKAB status : '.$curl_to_pemda['status']];
            } else {
                $this->db->where('id', $p['id']);
                $this->db->update("artikel", $p_data);
                
                
                // CURL AUTO POST TO WEB PEMKAB 
                $id_berita = $p['id'];
                $pc_base_url = explode("://", base_url());
                $username = str_replace("/", "", $pc_base_url['1']);
                
                $p_curl_data = [
                    'username'=>$username,
                    'password'=>$username,
                    'id'=>$id_berita,
                    'judul'=>$p['judul'],
                    'konten'=>$p['konten'],
                    'tgl'=>$p['tgl'],
                    'publikasi'=>$p['publikasi'],
                    'topik'=>$p['topik'],
                    'mode'=>'edit',
                ];
                
                $curl_to_pemda = curl_post(config_item('base_url_api_pemda').'/post_berita', $p_curl_data);
                // END CURL AUTOPOST TO WEB PEMKAB
                
                
                $ret = ['success'=>true, 'message'=>'Simpan berita berhasil.  Post ke PEMKAB status : '.$curl_to_pemda['status']];
            }
        }

        j($ret);
        exit;
    }

    public function hapus($id) {
        // hapus file sebelum 
        $this->db->where('id', $id);
        $this->db->select('gambar');
        $get_file_sebelum = $this->db->get('artikel')->row_array();

        @unlink('./files/news/normal/'.$get_file_sebelum['gambar']);
        @unlink('./files/news/thumb/'.$get_file_sebelum['gambar']);

        $this->db->where('id', $id);
        $this->db->delete("artikel");
        
        // CURL AUTO POST TO WEB PEMKAB 
        $id_berita = $id;
        $pc_base_url = explode("://", base_url());
        $username = str_replace("/", "", $pc_base_url['1']);
        
        $p_curl_data = [
            'username'=>$username,
            'password'=>$username,
            'id'=>$id_berita,
        ];
        
        $curl_to_pemda = curl_post(config_item('base_url_api_pemda').'/hapus_berita', $p_curl_data);
        // END CURL AUTOPOST TO WEB PEMKAB
        
        $ret = ['success'=>true, 'message'=>'Hapus berita berhasil.  Post ke PEMKAB status : '.$curl_to_pemda['status']];

        j($ret);
        exit;
    }
}