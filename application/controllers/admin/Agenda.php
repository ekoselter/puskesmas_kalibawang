<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Agenda extends CI_Controller {
    function __construct() {
		parent:: __construct();
        cek_login();
    }

    public function index() {
        $kata_kunci = $this->input->get('katakunci');
        
        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.judul', $kata_kunci);
            $this->db->or_like('a.isi', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->select('id');
        $total_row = $this->db->get("tbl_kalender a")->num_rows();


        $a['total_row'] = $total_row;
        $per_page = 10;
        $awal = $this->uri->segment(4);
        $awal = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir = $per_page;
        $a['pagi'] = _page($total_row, $per_page, 4, base_url() . "admin/agenda/index");
        

        if ($kata_kunci != "") {
            $this->db->group_start();
            $this->db->like('a.judul', $kata_kunci);
            $this->db->or_like('a.isi', $kata_kunci);
            $this->db->group_end();
        } 
        $this->db->limit($akhir, $awal);
        $this->db->order_by('a.id', 'desc');
        $this->db->select('a.*');
        $a['data'] = $this->db->get("tbl_kalender a")->result_array();

        $a['p'] = "v_agenda";

        $this->load->view('adm/template', $a);
    }

    public function edit($id_berita=0) {
        $id_berita = intval($id_berita);

        if ($id_berita < 1) {
            $a['d'] = array(
                "id" => "",
                "required" => "",
                "mode" => "tambah",
                "judul" => "",
                "isi" => "",
                "filenya" => "",
                "waktu_mulai" => date('Y-m-d'),
                "waktu_akhir" => date('Y-m-d'),
            );
        } else {
            $this->db->where('id', $id_berita);
            $a['d'] = $this->db->get('tbl_kalender')->row_array();
            $a['d']['mode'] = 'edit';
            $a['d']['required'] = '';

        }

        $a['p'] = "f_agenda";

        $this->load->view('adm/template', $a);
    }

    public function simpan() {
        $p = $this->input->post();

        $config['upload_path'] = config_item('base_url_file').'agenda';
    
        $config['allowed_types'] = 'jpg|gif|png|jpeg';
        $config['max_size'] = 1000;
        $config['encrypt_name'] = TRUE;
        $config['file_ext_tolower'] = TRUE;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $p_data = array(
            "judul" => $p['judul'],
            "isi" => $p['isi'],
            "waktu_mulai" => $p['waktu_mulai'],
            "waktu_akhir" => $p['waktu_akhir'],
        );

        if ($p['mode'] == "tambah") {
            if ($this->upload->do_upload('foto__')) {
                $up_data = $this->upload->data();
                $filename = $up_data['file_name'];
                $p_data['filenya'] = $filename;

                $this->db->insert("tbl_kalender", $p_data);
                
                $ret = ['success'=>true, 'message'=>'Add OK. Upload: YES'];
            } else {
                $this->db->insert("tbl_kalender", $p_data);

                $ret = ['success'=>true, 'message'=>'Add OK. Upload: FAIL. '.$this->upload->display_errors()];
            }
        } else if ($p['mode'] == "edit") {
            if ($this->upload->do_upload('foto__')) {
                $up_data = $this->upload->data();
                $filename = $up_data['file_name'];
                $p_data['filenya'] = $filename;

                // hapus file sebelum 
                $this->db->where('id', $p['id']);
                $this->db->select('filenya');
                $get_file_sebelum = $this->db->get('tbl_kalender')->row_array();

                $this->db->where('id', $p['id']);
                $this->db->update("tbl_kalender", $p_data);

                @unlink('./files/agenda/'.$get_file_sebelum['filenya']);

                $ret = ['success'=>true, 'message'=>'Edit OK. Upload: YES'];
            } else {
                $this->db->where('id', $p['id']);
                $this->db->update("tbl_kalender", $p_data);

                
                $ret = ['success'=>true, 'message'=>'Edit OK. Upload: FAIL: '.$this->upload->display_errors()];
            }
        }

        j($ret);
        exit;
    }

    public function hapus($id) {
        // hapus file sebelum 
        $this->db->where('id', $id);
        $this->db->select('filenya');
        $get_file_sebelum = $this->db->get('tbl_kalender')->row_array();

        @unlink(config_item('base_url_file').'agenda/'.$get_file_sebelum['filenya']);

        $this->db->where('id', $id);
        $this->db->delete("tbl_kalender");
        
        redirect('admin/agenda');
    }
}