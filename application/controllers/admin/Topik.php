<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Topik extends CI_Controller {
    function __construct() {
		parent:: __construct();
        cek_login();
        $this->tabel = "topik";
        $this->url = "topik";
        $this->title = "Topik";
    }

    public function index() {
        $kata_kunci = $this->input->get('katakunci');
        
        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.topik', $kata_kunci);
            $this->db->or_like('a.ket', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->select('id');
        $total_row = $this->db->get($this->tabel." AS a")->num_rows();


        $a['total_row'] = $total_row;
        $per_page = 10;
        $awal = $this->uri->segment(4);
        $awal = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir = $per_page;
        $a['pagi'] = _page($total_row, $per_page, 4, base_url() . "admin/".$this->url."/index");
        

        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.topik', $kata_kunci);
            $this->db->or_like('a.ket', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->limit($akhir, $awal);
        $this->db->order_by('a.id', 'desc');
        $this->db->select('a.*');
        $a['data'] = $this->db->get($this->tabel." AS a")->result_array();

        $a['p'] = "v_topik";
        
        $a['url'] = $this->url;
        $a['title'] = $this->title;

        $this->load->view('adm/template', $a);
    }

    public function edit($id_berita=0) {
        $id_berita = intval($id_berita);

        if ($id_berita < 1) {
            $a['d'] = array(
                "id" => "",
                "required" => "required",
                "mode" => "tambah",
                "topik" => "",
                "ket" => "",
                "publik" => "",
            );
        } else {
            $this->db->where('id', $id_berita);
            $a['d'] = $this->db->get($this->tabel)->row_array();
            $a['d']['mode'] = 'edit';
            $a['d']['required'] = '';

        }

        $a['p'] = "f_topik";
        
        $a['url'] = $this->url;
        $a['title'] = $this->title;

        $this->load->view('adm/template', $a);
    }

    public function simpan() {
        $p = $this->input->post();

        $p_data = array(
            "topik" => $p['topik'],
            "ket" => $p['ket'],
            "publik" => $p['publik'],
        );

        if ($p['mode'] == "tambah") {
            $this->db->insert($this->tabel, $p_data);

            $this->session->set_flashdata('k', '<div class="alert alert-success">OK</div>');
            redirect('admin/'.$this->url);
        } else if ($p['mode'] == "edit") {
            $this->db->where('id', $p['id']);
            $this->db->update($this->tabel, $p_data);

            $this->session->set_flashdata('k', '<div class="alert alert-success">OK</div>');
            redirect('admin/'.$this->url);
        }
    }

    public function hapus($id) {
        $this->db->where('id', $id);
        $this->db->delete($this->tabel);
        
        redirect('admin/'.$this->url);
    }
}