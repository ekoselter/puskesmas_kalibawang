<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Galleri extends CI_Controller {
    function __construct() {
		parent:: __construct();
    }

    public function index()
    {	
        cek_login();
    	$this->db->select('mod_gallery_kat.*');
    	$this->db->select('(SELECT COUNT(id) FROM mod_gallery WHERE kid = mod_gallery_kat.id) AS jml_foto');
        $this->db->order_by('id', 'desc');
    	$a['kategori'] = $this->db->get('mod_gallery_kat')->result_array();

        $a['p'] = "v_galleri";
        $this->load->view('adm/template', $a);
    }

    public function edit($id=0)
    {
        cek_login();
    	if ($id < 1) {
    		$a['det'] = array(
    			'id'=>'', 
    			'mode'=>'add',
    			'name'=>'',
    			'desc'=>'',
    		);
    	} else {
    		$this->db->where('id', $id);
    		$a['det'] = $this->db->get('mod_gallery_kat')->row_array();
    		$a['det']['mode'] = "edit";
    	}

        $a['p'] = "f_galleri";
        $this->load->view('adm/template', $a);
    }

    public function save()
    {
        cek_login();
    	$p = $this->input->post();

    	$p_album = array(
    		"name"=>$p['name'],
    		"desc"=>$p['desc'],
    	);

    	if ($p['mode'] == "add") {
    		$this->db->insert('mod_gallery_kat', $p_album);
    	} else if ($p['mode'] == "edit") {
    		$this->db->where('id', $p['id']);
    		$this->db->update('mod_gallery_kat', $p_album);
    	}

    	redirect('admin/galleri');
	}
	
	public function detil($id_galleri) {
        cek_login();
		$this->db->where('kid', $id_galleri);
		$get_detil_galleri = $this->db->get('mod_gallery')->result_array();

		$this->db->where('id', $id_galleri);
		$get_data_galleri = $this->db->get('mod_gallery_kat')->row_array();
			

        $a['p'] = "f_galleri_detil";
        $a['data_galleri'] = $get_data_galleri;
        $a['data_galleri_detil'] = $get_detil_galleri;
        $this->load->view('adm/template', $a);		
	}

	public function save_detil() {
        cek_login();
		$p = $this->input->post();

		$id_galleri = intval($p['id_galleri']);

		$config['upload_path']          = $this->config->item('base_url_file').'galleri';
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['max_size']             = 2048;
		$config['encrypt_name'] 		= TRUE;
		$config['file_ext_tolower'] 	= TRUE;

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('name')) {
			$keterangan = $this->upload->display_errors();

			$this->session->set_flashdata('k', '<div class="alert alert-success">'.$keterangan.'</div>');
		} else {
			$upload_data = $this->upload->data();

			$p_upload = [
				"name"=>$upload_data['file_name'],
				"width"=>$upload_data['image_width'],
				"height"=>$upload_data['image_height'],
				"modified"=>time(),
				"size"=>$upload_data['file_size'],
				"kid"=>$id_galleri,
				"users"=>$this->session->userdata('userid'),
				"desc"=>$p['desc'],
				"view"=>1
			];

			$this->db->insert('mod_gallery', $p_upload);

			$this->session->set_flashdata('k', '<div class="alert alert-success">Berhasil uplaod</div>');
		}

		redirect('admin/galleri/detil/'.$id_galleri);
	}

	public function hapus_detil($id_galleri_detil) {
        cek_login();
		
		$this->db->where('id', $id_galleri_detil);
		$get_detil_galleri = $this->db->get('mod_gallery')->row_array();
		
		$id_kategori = $get_detil_galleri['kid'];

		$this->db->where('id', $id_galleri_detil);
		$this->db->delete('mod_gallery');		

		@unlink($this->config->item('base_url_file').'galleri/'.$get_detil_galleri['name']);

		redirect('admin/galleri/detil/'.$id_kategori);
	}

    public function hapus($id_kategori) 
    {
        cek_login();

        $this->db->where('kid', $id_kategori);
        $this->db->select('id, name');
        $get_foto = $this->db->get('mod_gallery')->result_array();
        
        foreach ($get_foto as $gf) {
            @unlink($this->config->item('base_url_file').'galleri/'.$gf['name']);
            $this->db->where('id', $gf['id']);
            $this->db->delete('mod_gallery');
        }

        $this->db->where('id', $id_kategori);
        $this->db->delete('mod_gallery_kat');
        redirect('admin/galleri');
    }
}