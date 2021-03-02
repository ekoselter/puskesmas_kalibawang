<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ppid extends CI_Controller {
    function __construct() {
		parent:: __construct();
    }

	public function index() {
        cek_login();
        
		$mulai = $this->input->get("mulai") == "" ? 0 : $this->input->get("mulai");
		$limit = $this->input->get("limit") == "" ? 0 : $this->input->get("limit");
		$katakunci = $this->input->get("katakunci") == "" ? "" : $this->input->get("katakunci");

		$this->db->where('site_id', 1);
		$this->db->where('name', 'ppid_account');
		$get_ppid_akun = $this->db->get('setting')->row_array();

		$data = array(
			"opd" => $get_ppid_akun['val'],
			"mulai" => $mulai,
			"limit" => $limit,
			"katakunci" => $katakunci,
		);
		$uri = $this->config->item('ppid_url') . "api_ppid/daftar";

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $uri);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$result = json_decode(curl_exec($ch), true);
		curl_close($ch);


		$a['data'] = $result;
		$a['katakunci'] = $katakunci;
		$a['p'] = "v_ppid_permohonan_informasi";

		$this->load->view('adm/template', $a);
	}

	public function edit($id) {
        cek_login();
        
		$mulai = $this->input->get("mulai") == "" ? 0 : $this->input->get("mulai");
		$limit = $this->input->get("limit") == "" ? 0 : $this->input->get("limit");
		$katakunci = $this->input->get("katakunci") == "" ? "" : $this->input->get("katakunci");
		$id = $id;
		
		$this->db->where('site_id', 1);
		$this->db->where('name', 'ppid_account');
		$get_ppid_akun = $this->db->get('setting')->row_array();

		$data = array(
			"opd" => $get_ppid_akun['val'],
			"mulai" => $mulai,
			"limit" => $limit,
			"katakunci" => $katakunci,
			"id" => $id,
		);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $this->config->item('ppid_url') . "api_ppid/edit");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$result = json_decode(curl_exec($ch), true);
		curl_close($ch);
		$a['data'] = $result;
		$a['katakunci'] = $katakunci;
		$a['p'] = "f_ppid_permohonan_informasi";

		$this->load->view('adm/template', $a);
	}

	public function simpan() {
        cek_login();
        
		$p = $this->input->post();
		$data = $p;
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $this->config->item('ppid_url') . "api_ppid/simpan");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$result = json_decode(curl_exec($ch), true);
		curl_close($ch);
        
        j(['success'=>true, 'message'=>'ok', 'redirect'=>base_url('admin/ppid?mulai=' . $result['mulai'] . '&limit=' . $result['limit'])]);
	}

}