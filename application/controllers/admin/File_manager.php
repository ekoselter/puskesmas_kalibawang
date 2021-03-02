<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class File_manager extends CI_Controller {
    function __construct() {
        parent::__construct();
        cek_login();
    }

    public function json() {
        cek_login();
        $get_setting_layout = $this->db->get('files')->result_array();
        j($get_setting_layout);
        exit;
    }

    public function index() {}

    public function paginate() {
        cek_login();
        $g                       = $this->input->get();
        $array_file_bisa_preview = array("jpg", "png", "gif");
        $page                    = $this->uri->segment(4);
        $page                    = empty($page) ? 0 : $this->uri->segment(4);
        $per_page                = 10;
        $get_total_rows          = $this->db->get('files')->num_rows();
        $this->load->library('pagination');
        $config['base_url']        = base_url('index.php/admin/file_manager/paginate');
        $config['total_rows']      = $get_total_rows;
        $config['per_page']        = $per_page;
        // $config['attributes']      = array('class' => 'fm_pagination_page');
        $config['num_tag_open']    = '<li class="page-item">';
        $config['num_tag_close']   = '</li>';
        $config['prev_link']       = '&lt;';
        $config['prev_tag_open']   = '<li class="page-item">';
        $config['prev_tag_close']  = '</li>';
        $config['next_link']       = '&gt;';
        $config['next_tag_open']   = '<li class="page-item">';
        $config['next_tag_close']  = '</li>';
        $config['cur_tag_open']    = '<li class="page-item active disabled"><a href="#" class="page-link">';
        $config['cur_tag_close']   = '</a></li>';
        $config['first_tag_open']  = '<li class="page-item">';
        $config['first_tag_close'] = '</li>';
        $config['last_tag_open']   = '<li class="page-item">';
        $config['last_tag_close']  = '</li>';
        $config['attributes'] = array('class' => 'page-link fm-page-link');

        $this->pagination->initialize($config);
        $this->db->order_by('id', 'DESC');
        $get_files = $this->db->get('files', $per_page, $page)->result_array();

        $link      = '<ul class="pagination">' . $this->pagination->create_links() . '</ul>';
        $table     = '<div class="table-responsive"><table class="table table-bordered table-sm">
                    <thead>
                        <tr>
                            <th width="60%">Nama File</th>
                            <th width="10%">Tipe File</th>
                            <th width="30%">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>';
        if (!empty($get_files)) {
            foreach ($get_files as $f) {
                $pc_nama_file = explode(".", $f['url']);
                $ext          = end($pc_nama_file);
                if (in_array($ext, $array_file_bisa_preview)) {
                    $nama = '<img src="' . config_item('base_url_file_url').'file_uploads/' . $f['url'] . '" style="width: 100px"><br>' . $f['nama'];
                } else {
                    $nama = substr($f['nama'], 0, 20);
                }
                $table .= ' <tr>
                                <td style="font-size: 12px">' . $nama . '</td>
                                <td>' . $ext . '</td>
                                <td>
                                    <a href="#" onclick="return hapus_fm(' . $f['id'] . ');" class="text-danger" class="tbl_hapus">Hapus</a>
                                    <a href="#" onclick="return copy_alamat(\'' . $this->config->item('base_url_file_url').'file_uploads/' . $f['url'] . '\');" class="text-info">Copy</a>
                                </td>
                            </tr>';
            }
        } else {
            $table .= '</tbody></table></div>';
        }
        $back = array(
            "link"          => $link,
            "tabel"         => $table,
            "page_sekarang" => $page,
        );
        j($back);
        exit;
    }

    public function save_file() {
        cek_login();

        $config['upload_path']      = $this->config->item('base_url_file').'file_uploads/';
        $config['allowed_types']    = 'jpg|gif|png|doc|docx|xls|xlsx|zip|pdf';
        $config['max_height']       = '4000';
        $config['max_width']        = '4000';
        $config['max_size']         = '3000';
        $config['encrypt_name']     = TRUE;
        $config['file_ext_tolower'] = TRUE;
        $p                          = $this->input->post();

        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        $this->upload->do_upload('file_upload');
        $up_data = $this->upload->data();
        if ($this->upload->do_upload('file_upload')) {
            $up_data       = $this->upload->data();
            $filenama      = $up_data['file_name'];
            $file_readable = empty($p['nama_file']) ? $filenama : $p['nama_file'];
            $p_data        = array("nama" => $file_readable, "url" => $filenama, "create_at" => date('Y-m-d H:i:s'));
            $this->db->insert("files", $p_data);
            $back = array(
                "success" => true,
                "message" => "Berhasil Diuplaod",
            );
        } else {

            $back = array(
                "success" => false,
                "message" => $this->upload->display_errors(),
            );
        }
        j($back);
        exit;
    }

    public function hapus($id) {
        cek_login();

        $this->db->where("id", $id);
        $get_namafile = $this->db->get("files")->row_array();
        @unlink($this->config->item('base_url_file')."file_uploads/" . $get_namafile['url']);
        $this->db->where("id", $id);
        $this->db->delete("files");
        $back = array(
            "success" => true,
            "message" => "Berhasil Dihapus",
        );
        j($back);
        exit;
    }
}