<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Adm extends CI_Controller {
	function __construct() {
		parent::__construct();

        // generate setting
        $this->db->where('site_id', 1);
        $menu = $this->db->get("setting")->result_array();
		$this->a['setting'] = array();
		foreach ($menu as $m) {
			$idx = $m['name'];
			$this->a['setting'][$idx] = $m['val'];
		}
	}

	public function konvert_menu() {
		$this->db->order_by('kode', 'asc');		
		$get_db = $this->db->get('t_menu')->result_array();

		$tampung = [];
		foreach ($get_db as $mm) {
			$pjg_teks = strlen($mm['kode']);
			$kode2 = substr($mm['kode'], 0, 2);
			$kode3 = substr($mm['kode'], 2, 2);
			$kode4 = substr($mm['kode'], 4, 2);
			$kode5 = substr($mm['kode'], 6, 2);

			// echo $mm['kode'].": ".$kode2."-".$kode3."-".$kode4."-".$kode5."\n";
			if ($pjg_teks == 2) {
				$satu = [
					'text'=>$mm['nama'],
					'href'=>$mm['url'],
					'icon'=>$mm['ikon'],
					'target'=>'_self',
					'title'=>'',
					'topik'=>'',
					'children'=>[],
				];

				$tampung[$kode2] = $satu;
			} else if ($pjg_teks == 4) {
				$satu = [
					'text'=>$mm['nama'],
					'href'=>$mm['url'],
					'icon'=>$mm['ikon'],
					'target'=>'_self',
					'title'=>'',
					'topik'=>'',
					'children'=>[],
				];

				$tampung[$kode2]['children'][$kode3] = $satu;
			} else if ($pjg_teks == 6) {
				$satu = [
					'text'=>$mm['nama'],
					'href'=>$mm['url'],
					'icon'=>$mm['ikon'],
					'target'=>'_self',
					'title'=>'',
					'topik'=>'',
					'children'=>[],
				];

				$tampung[$kode2]['children'][$kode3]['children'][$kode4] = $satu;
			} else if ($pjg_teks == 8) {
				$satu = [
					'text'=>$mm['nama'],
					'href'=>$mm['url'],
					'icon'=>$mm['ikon'],
					'target'=>'_self',
					'title'=>'',
					'topik'=>'',
					'children'=>[],
				];

				$tampung[$kode2]['children'][$kode3]['children'][$kode4]['children'][$kode5] = $satu;
			} 
		}

		j($tampung);
		exit;		
	}

	public function index() {
		cek_login();
		$this->load->model('web_model');

		$a['statistik_pengunjung'] = $this->web_model->get_statistik_visitor();
		$a['statistik_postingan'] = $this->web_model->get_statistik_posting();


		$uri = $this->config->item('ppid_url') . "api_ppid/jml_permohonan?opd=".$this->a['setting']['ppid_account'];

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $uri);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$result = json_decode(curl_exec($ch), true);
		curl_close($ch);

		$a['jml_permohonan_informasi'] = 0;
		if (!empty($result['data'])) {
			$a['jml_permohonan_informasi'] = $result['data'];
		}
		$a['p'] = "v_main";
		$a['setting'] = $this->a['setting'];
		$this->load->view('adm/template', $a);
	}
	
	public function website($mode = "") {
		cek_login();

		if ($mode == "") {
			$this->db->where("site_id", 1);
			$this->db->where("name != ", "MENU");
			$set = $this->db->get("setting")->result_array();
			$r = array();
			foreach ($set as $s) {
				$idx = $s['name'];
				$r[$idx] = $s['val'];
			}
			$a['data'] = $r;
			$a['p'] = "f_setting";
			$this->load->view('adm/template', $a);
		} else if ($mode == "homepage_setting") {
			$this->db->where("site_id", 1);
			$this->db->where("name", "template_homepage");
			$setting = $this->db->get("setting")->row_array();
			$val = $setting['val'];
			$val = json_decode($val);
			$d['val'] = $val;
			$get_categories = $this->db->get("topik")->result_array();

			$d['categories'] = $get_categories;
			$this->load->view('adm/template_designer', $d);
		} else if ($mode == "simpan") {
			if (!$this->input->post()) {
				set_header_error();
			} else {
				$p = $this->input->post();
				foreach ($p as $q => $r) {
					$satu = array("val" => $r);

					$this->db->where("site_id", 1);
					$this->db->where("name", $q);
					$this->db->update("setting", $satu);
				}
				$data['success'] = true;
				$data['message'] = "Data berhasil disimpan";
				j($data);
				exit;
			}
		}
	}
	public function detil_page($id_categori) {
		$this->db->where("topik", $id_categori);
		$this->db->where("publikasi", 1);
		$this->db->select("id, judul");
		$d_halaman = $this->db->get("artikel")->result_array();
		$data = array("success" => true, "data" => array());
		if (!empty($d_halaman)) {
			foreach ($d_halaman as $h) {
				$href = "{{base_url}}detil/" . $h['id'] . "/" . url_title($h['judul'], "-", true);
				$judul = $h['judul'];
				$data['data'][] = '<option value="' . $href . '">' . $judul . '</option>';
			}
		}
		j($data);
	}

	//login fungsi, dll
	public function login() {
		$this->db->where('ip', $this->input->ip_address());
		$this->db->where('is_blokir_aktif', 1);
		$cek_login_berapa_kali = $this->db->get('login_gagal')->num_rows();

		$selisih = 3;

		if ($cek_login_berapa_kali < 4) {
			$this->load->view('adm/login');
		} else {
			$this->db->where('ip', $this->input->ip_address());
			$this->db->where('is_blokir_aktif', 1);
			$this->db->limit(1);
			$this->db->order_by('waktu', 'desc');
			$this->db->select('TIMESTAMPDIFF(MINUTE, waktu, NOW()) selisih');
			$cek_lebih_dari_30_menit = $this->db->get('login_gagal')->row_array();

			if (intval($cek_lebih_dari_30_menit['selisih']) <= $selisih) {
				$a['sisa_waktu'] = ($selisih - intval($cek_lebih_dari_30_menit['selisih']));
				$this->load->view('adm/login_blokir', $a);
			} else {
				$this->db->where('ip', $this->input->ip_address());
				$this->db->where('is_blokir_aktif', 1);
				$this->db->update('login_gagal', ['is_blokir_aktif'=>0]);

				$this->load->view('adm/login');
			}
		}
	}
	
	public function login_process() {
		if ($this->input->post()) {
			$u = $this->security->xss_clean($this->input->post('username'));
			$p = $this->security->xss_clean($this->input->post('password'));

			$p_enkrip = md5($p);

			$this->db->where('user', $u);
			$this->db->where('tipe', 'aktif');
			$cek_username = $this->db->get('useraura')->row_array();

			if (!empty($cek_username)) {
				$get_password = $cek_username['password'];
				$cek_password = ($get_password === $p_enkrip);

				if ($cek_password) {
					// update versi 
					$this->db->where('site_id', 1);
					$this->db->where('name', 'versi');				
					$cek_setting_versi = $this->db->get('setting')->num_rows();
					
					if ($cek_setting_versi > 0) {
						$this->db->where('site_id', 1);
						$this->db->where('name', 'versi');	
						$this->db->update('setting', ['val'=>'202006']);
					} else {
						$this->db->insert('setting', ['site_id'=>1,"name"=>'versi',"val"=>'202006']);					
					}

					$data = array(
						'userid' => $cek_username['UserId'],
						'username' => $cek_username['user'],
						'valid' => true,
					);
					$this->session->set_userdata($data);
					redirect('adm/index');
				} else {
					$this->db->insert('login_gagal', [
						'ip'=>$this->input->ip_address(),
						'username'=>$u,
						'password'=>$p,
						'waktu'=>date('Y-m-d H:i:s'),
						'is_blokir_aktif'=>1,
					]);
					$this->session->set_flashdata("k", "<div class='alert alert-danger'>username / password salah...! </div>");
					redirect('adm/login');
				}
			} else {
				$this->db->insert('login_gagal', [
					'ip'=>$this->input->ip_address(),
					'username'=>$u,
					'password'=>$p,
					'waktu'=>date('Y-m-d H:i:s'),
					'is_blokir_aktif'=>1,
				]);

				$this->session->set_flashdata("k", "<div class='alert alert-danger'>username / password salah...!</div>");
				redirect('adm/login');
			}
		} else {
			redirect('adm/login');
		}
	}

	public function logout() {
		$this->session->sess_destroy();
		redirect('adm/login');
	}

	public function get_url_halaman() {
		$kode = empty($_POST['kode']) ? $_GET['kode'] : $_POST['kode'];
		$data = $this->db->query("SELECT id, judul FROM static_page WHERE judul LIKE '%$kode%'")->result();
		$klasifikasi = array();
		foreach ($data as $d) {
			$klasifikasi[] = 'web/read/' . $d->id . '/' . url_title($d->judul, "-", TRUE);
		}
		echo json_encode($klasifikasi);
	}
	public function konversi() {
		$dir = "./files/file_uploads/";
		$list_file = preg_grep('/^([^.])/', scandir($dir));
		foreach ($list_file as $l) {
			$this->db->insert("files", array(
				"nama" => $l,
				"url" => $l,
				"create_at" => date('Y-m-d H:i:s'),
			));
		}
	}
}
