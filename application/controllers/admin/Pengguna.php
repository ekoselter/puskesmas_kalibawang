<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pengguna extends CI_Controller {
    function __construct() {
		parent:: __construct();
        $this->tabel = "useraura";
        $this->url = "pengguna";
        $this->title = "Pengguna Website";
    }

    public function index() {
        cek_login();
        
        $kata_kunci = $this->input->get('katakunci');
        
        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.user', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->select('UserId');
        $total_row = $this->db->get($this->tabel." AS a")->num_rows();


        $a['total_row'] = $total_row;
        $per_page = 10;
        $awal = $this->uri->segment(4);
        $awal = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir = $per_page;
        $a['pagi'] = _page($total_row, $per_page, 4, base_url() . "admin/".$this->url."/index");
        

        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.user', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->limit($akhir, $awal);
        $this->db->order_by('a.UserId', 'desc');
        $this->db->select('a.*');
        $a['data'] = $this->db->get($this->tabel." AS a")->result_array();

        $a['p'] = "v_pengguna";
        
        $a['url'] = $this->url;
        $a['title'] = $this->title;

        $this->load->view('adm/template', $a);
    }

    public function edit($id_berita=0) {
        cek_login();
        
        $id_berita = intval($id_berita);

        if ($id_berita < 1) {
            $a['d'] = array(
                "UserId" => "",
                "required" => "required",
                "mode" => "tambah",
                "user" => "",
                "email" => "",
                "level" => "",
                "tipe" => "",
            );
        } else {
            $this->db->where('UserId', $id_berita);
            $a['d'] = $this->db->get($this->tabel)->row_array();
            $a['d']['mode'] = 'edit';
            $a['d']['required'] = '';

        }

        $a['p'] = "f_pengguna";
        
        $a['url'] = $this->url;
        $a['title'] = $this->title;

        $this->load->view('adm/template', $a);
    }

    public function simpan() {
        cek_login();
        
        $p = $this->input->post();

        $this->load->library('form_validation');
        if ($p['mode'] == "tambah") {
            $this->form_validation->set_rules('user', 'Username', 'trim|required|min_length[6]|is_unique[useraura.user]');
            $this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[6]');
            $this->form_validation->set_rules('password2', 'Password', 'trim|required|min_length[6]|matches[password1]');
        } else {
            $this->form_validation->set_rules('user', 'Username', 'trim|required|min_length[6]');
            
            if ($p['password2'] != "") {
                $this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[6]');
                $this->form_validation->set_rules('password2', 'Password', 'trim|required|min_length[6]|matches[password1]');
            }
        }

        if ($this->form_validation->run() == FALSE) {
            $ret = [
                'success'=>false,
                'message'=>validation_errors()
            ];
        } else {
            $p_data = array(
                "user" => $p['user'],
                "email" => $p['email'],
                "level" => $p['level'],
                "tipe" => $p['tipe'],
            );

            if ($p['password2'] != "") {
                $p_data['password'] = md5($p['password2']);
            }

            if ($p['mode'] == "tambah") {
                $this->db->insert($this->tabel, $p_data);

                $ret = [
                    'success'=>true,
                    'message'=>'User berhasil ditambahkan'
                ];
            } else if ($p['mode'] == "edit") {
                $this->db->where('UserId', $p['id']);
                $this->db->update($this->tabel, $p_data);

                $ret = [
                    'success'=>true,
                    'message'=>'User berhasil disimpan'
                ];
            }
        }

        j($ret);
        exit;
    }

    public function hapus($id) {
        cek_login();
        
        $this->db->where('UserId', $id);
        $this->db->delete($this->tabel);
        
        redirect('admin/'.$this->url);
    }
}