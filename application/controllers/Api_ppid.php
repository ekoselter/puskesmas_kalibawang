<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

class Api_ppid extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	public function jml_permohonan()
	{
		$p = $this->input->get();
		// parameter
		// @opd - opsional
		$wh = "";
		if (!empty($p['opd'])) {
			$wh .= "WHERE b.kode = '".$p['opd']."'";
		}
		$strq = "
		SELECT 
		a.* 
		FROM permohonan_informasis a
		INNER JOIN opds b ON a.dinas_dituju = b.id
		".$wh;

		$jml = $this->db->query($strq)->num_rows();
		$ret['success'] = true;
		$ret['data'] = $jml;
		j($ret);

		$p['nama'];
	}
	public function daftar() {
		$p = $this->input->post();
		
		// parameter 
		// @opd - opsional
		// @mulai - opsional
		// @limit - opsional
		if ($this->input->server('REQUEST_METHOD') != 'POST') {
			show_404();
		} else {
			$mulai = empty($p['mulai']) ? 0 : intval($p['mulai']);
			$limit = empty($p['limit']) ? 10 : intval($p['limit']);
			$wh = "";
			if (!empty($p['opd'])) {
				$wh .= "WHERE b.kode = '".$p['opd']."'";
			}
			$strq = "
			SELECT 
			a.* 
			FROM permohonan_informasis a
			INNER JOIN opds b ON a.dinas_dituju = b.id
			".$wh;
			$jumlah_baris = $this->db->query($strq)->num_rows();
			$data = $this->db->query($strq." ORDER BY id DESC LIMIT ".($mulai * $limit).", ".$limit."")->result_array();
			$ret['jumlah_baris'] = $jumlah_baris;
			$ret['jumlah_halaman'] = ceil($jumlah_baris/$limit);
			$ret['mulai'] = $mulai;
			$ret['limit'] = $limit;
			$ret['data'] = $data;
			j($ret); 
		}
	}
	function edit() {
		$p = $this->input->post();
		// parameter 
		// @id - wajib
		// @opd - opsional
		// @mulai - opsional
		// @limit - opsional
		if ($this->input->server('REQUEST_METHOD') != 'POST') {
			show_404();
		} else {
			$id = empty($p['id']) ? 10 : intval($p['id']);
			$mulai = empty($p['mulai']) ? 0 : intval($p['mulai']);
			$limit = empty($p['limit']) ? 10 : intval($p['limit']);
			// update status ke "Diproses"
			$this->db->where("permohonan_informasis.id", $id);
			$this->db->update("permohonan_informasis", array("status"=>"Diproses"));
			// get detil data
			$this->db->where("permohonan_informasis.id", $id);
			$this->db->join("opds", "permohonan_informasis.dinas_dituju = opds.id");
			$this->db->select("permohonan_informasis.*, opds.nama AS dinas_dituju");
			$data = $this->db->get("permohonan_informasis")->row_array();
			$ret['success'] = true;
			$ret['mulai'] = $mulai;
			$ret['limit'] = $limit;
			$ret['data'] = $data;
			j($ret); 
		}
	}
	public function simpan()
	{
		if ($this->input->server('REQUEST_METHOD') != 'POST') {
			show_404();
		} else {
			$p = $this->input->post();
			$p_data = array(
				"tanggapan"=>$p['tanggapan'],
				"waktu_tanggapan"=>date('Y-m-d H:i:s'),
				"status"=>"Sudah Ditanggapi",
			);	
			$this->db->where("permohonan_informasis.id", $p['id']);
			$this->db->update("permohonan_informasis", $p_data);
			$ret['success'] = true;
			$ret['id'] = $p['id'];
			$ret['mulai'] = $p['mulai'];
			$ret['limit'] = $p['limit'];
			j($ret); 
		}
	}
}
