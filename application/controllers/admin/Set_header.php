<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Set_header extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    public function json()
    {
        cek_login();

        $this->db->where('name', 'side_menu');
        $this->db->where('site_id', 1);
        $get_setting_layout = $this->db->get('setting')->row_array();
        $setting_layout = json_decode($get_setting_layout['val'], true);

        j($setting_layout);
        exit;
    }

    public function index()
    {
        cek_login();

        $this->db->where('name', 'is_slider_header');
        $this->db->where('site_id', 1);
        $get_setting_layout = $this->db->get('setting')->row_array();
        $a['is_slider_header'] = $get_setting_layout['val'];

        $this->db->where('name', 'running_text');
        $this->db->where('site_id', 1);
        $get_running_text = $this->db->get('setting')->row_array();
        $a['running_text'] = $get_running_text['val'];


        $a['p'] = "v_set_header";
        $this->load->view('adm/template', $a);
    }

    public function load_gambarheader()
    {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header");
        $ada = $this->db->get("setting")->row_array();
        $ada = json_decode($ada['val'], true);
        $data['success'] = true;
        if (!empty($ada)) {
            if (is_file($this->config->item('base_url_file') . 'img_header_tunggal/' . $ada['file'])) {
                $data['message'] = array(
                    'gb_header' => '<img src="' . config_item('base_url_file_url') . 'img_header_tunggal/' . $ada['file'] . '" style="width: 100%">',
                    'teks_header' => $ada['tampil_teks']
                );
            } else {
                $data['message'] = array(
                    'gb_header' => '<div class="alert alert-danger">Gambar belum ada</div>',
                    'teks_header' => $ada['tampil_teks']
                );
            }
        } else {
            $data['message'] = array(
                'gb_header' => '<div class="alert alert-danger">Gambar belum ada</div>',
                'teks_header' => $ada['tampil_teks']
            );
        }
        j($data);
        exit;
    }

    public function simpan_header()
    {
        cek_login();
        $config['upload_path']          = config_item('base_url_file') . 'img_header_tunggal';
        $config['allowed_types']        = 'gif|jpg|png|jpeg';
        $config['max_size']             = 1000;
        $config['encrypt_name']         = true;
        $this->load->library('upload', $config);
        $p = $this->input->post();
        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header");
        $ada = $this->db->get("setting")->row_array();
        $val_asli = json_decode($ada['val'], true);

        if (!$this->upload->do_upload('gambarheader')) {
            $error = $this->upload->display_errors();
            // $val_asli['file'] = $val_asli['file'];
            $val_asli['tampil_teks'] = $p['tampil_teks'];
            $new_val = json_encode($val_asli);

            $this->db->where("site_id", 1);
            $this->db->where("name", "gambar_header");
            $this->db->update("setting", array("val" => $new_val));
            $data['success'] = false;
            $data['message'] = $error;
        } else {
            $upload_data = $this->upload->data();
            $file_name = $upload_data['file_name'];
            if ($ada) {
                @unlink(config_item('base_url_file') . "header_tunggal/" . $val_asli['file']);
                $val_asli['file'] = $file_name;
                $val_asli['tampil_teks'] = $p['tampil_teks'];
                $new_val = json_encode($val_asli);

                $this->db->where("site_id", 1);
                $this->db->where("name", "gambar_header");
                $this->db->update("setting", array("val" => $new_val));
            } else {
                $this->db->insert("setting", array("site_id" => 1, "name" => "gambar_header", "val" => json_encode(array("file" => $filename, "tampil_teks" => $p['tampil_teks']))));
            }
            $data['success'] = true;
            $data['message'] = "Gambar berhasil diupdate";
        }
        j($data);
        exit;
    }



    // jquery

    public function load_gambar_slider($value = '')
    {
        cek_login();
        $this->db->where('name', 'gambar_header_slider');
        $this->db->where('site_id', 1);
        $get_setting_layout = $this->db->get('setting')->row_array();
        $setting_layout = json_decode($get_setting_layout['val'], true);

        // format 
        // array = array(
        //  "url_gambar"=>"",
        //  "url_asli_gambar"=>"",
        //  "teks"=>""
        // )

        $back = array(
            "success" => true,
            "data" => "",
        );

        $tabel = '<table class="table table-bordered table-sm">
                    <thead>
                        <tr>
                            <th width="15%">Aksi</th>
                            <th width="85%">Gambar</th>
                        </tr>
                    </thead>
                    <tbody>';

        if (!empty($setting_layout)) {
            $i = 0;
            foreach ($setting_layout as $a) {
                $tabel .= '<tr>
                            <td>
                                <a href="#" class="btn btn-xs btn-info" onclick="return edit_label_slider(' . $i . ', \'' . $a['teks'] . '\');">Edit label</a>
                                <a href="#" class="btn btn-xs btn-info" onclick="return hapus_gambar_slider(' . $i . ');">Hapus</a>
                            </td>
                            <td><img src="' . config_item('base_url_file_url') . 'img_header_slider/' . $a['url_asli_gambar'] . '" style="width: 300px"><br>' . $a['teks'] . '</td>
                            </tr>';
                $i++;
            }
        } else {
            $tabel .= '<tr><td colspan="2">Beluma ada gambar slider</td></tr>';
        }

        $tabel .= '</tbody></table>';

        $back['data'] = $tabel;

        j($back);
        exit;
    }

    public function simpan_caption()
    {
        cek_login();
        $p = $this->input->post();


        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header_slider");
        $ada = $this->db->get("setting")->row_array();
        $ada2 = json_decode($ada['val'], true);

        $idx = $p['id'];
        $teks = $p['teks'];

        $ada2[$idx]['teks'] = $teks;

        $p_slider = array(
            "site_id" => 1,
            "name" => "gambar_header_slider",
            "val" => json_encode($ada2),
        );

        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header_slider");
        $this->db->update("setting", $p_slider);

        $data['success'] = true;
        $data['message'] = "Berhasil diubah";


        j($data);
        exit;
    }

    public function hapus_slider($id)
    {
        cek_login();
        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header_slider");
        $ada = $this->db->get("setting")->row_array();
        $ada2 = json_decode($ada['val'], true);

        $url_file_hapus = $this->config->item('base_url_file') . 'img_header_slider/' . $ada2[$id]['url_asli_gambar'];

        @unlink($url_file_hapus);

        array_splice($ada2, $id, 1);

        $p_slider = array(
            "site_id" => 1,
            "name" => "gambar_header_slider",
            "val" => json_encode($ada2),
        );

        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header_slider");
        $this->db->update("setting", $p_slider);

        $data['success'] = true;
        $data['message'] = "Berhasil diubah";


        j($data);
        exit;
    }

    public function simpan_header_slider()
    {
        cek_login();

        $config['upload_path']          = $this->config->item('base_url_file') . 'img_header_slider';
        $config['allowed_types']        = 'gif|jpg|jpeg|png';
        $config['max_size']             = 1000;
        $config['encrypt_name']         = true;


        $this->load->library('upload', $config);
        $p = $this->input->post();


        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header_slider");
        $ada = $this->db->get("setting")->row_array();

        // format 
        // array('background-image'=>'', 'background-color'=>'')

        if (!$this->upload->do_upload('gambar_background')) {
            $error = $this->upload->display_errors('', '');

            /* $val_background = array(
                "url_gambar"=>'',
                "url_asli_gambar"=>'',
                "teks"=>$p['teks'],
            );

            if (empty($ada)) {
                $p_background = array(
                    "site_id"=>1,
                    "name"=>"gambar_header_slider",
                    "val"=>json_encode($val_background),
                );
                $mode = "add";
                // $this->db->insert('setting', $p_background);
            } else {
                $data_awal = json_decode($ada['val'], true);
                $data_awal[] = $val_background;

                $p_background = array(
                    "site_id"=>1,
                    "name"=>"gambar_header_slider",
                    "val"=>json_encode($data_awal),
                );

                $this->db->where("site_id", 1);
                $this->db->where("name", "gambar_header_slider");
                $this->db->update("setting", $p_background);
                $mode = "edit 1";
            }
 */
            $data['success'] = false;
            $data['message'] = $error;
            // $data['mode'] = $mode;  
        } else {

            $upload_data = $this->upload->data();
            $file_name_background = $upload_data['file_name'];

            $val_background = array(
                "url_gambar" => base_url() . str_replace("./", "", $this->config->item('base_url_file')) . 'img_header_slider/' . $file_name_background,
                "url_asli_gambar" => $file_name_background,
                "teks" => $p['teks'],
            );

            if (empty($ada)) {
                $p_background = array(
                    "site_id" => 1,
                    "name" => "gambar_header_slider",
                    "val" => json_encode($val_background),
                );
                $this->db->insert('setting', $p_background);
                $mode = "add";
            } else {
                $data_awal = json_decode($ada['val'], true);
                $data_awal[] = $val_background;

                $p_background = array(
                    "site_id" => 1,
                    "name" => "gambar_header_slider",
                    "val" => json_encode($data_awal),
                );

                $this->db->where("site_id", 1);
                $this->db->where("name", "gambar_header_slider");
                $this->db->update("setting", $p_background);
                $mode = "edit";
            }

            $data['success'] = true;
            $data['message'] = "Gambar background diupdate ";
            $data['mode'] = $mode;
        }

        j($data);
        exit;
    }

    public function ubah_is_slider_header($val)
    {
        cek_login();
        $p_background = array(
            "val" => $val,
        );

        $this->db->where("site_id", 1);
        $this->db->where("name", "is_slider_header");
        $this->db->update("setting", $p_background);

        $data['success'] = true;
        $data['message'] = "Berhasil diupdate ";

        j($data);
        exit;
    }

    public function hapus_gambar_header_tunggal()
    {
        cek_login();

        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header");
        $ada = $this->db->get("setting")->row_array();

        $setting_gambar_header_tunggal = json_decode($ada['val'], true);
        @unlink(config_item('base_url_file') . "header_tunggal" . $setting_gambar_header_tunggal['file']);

        $setting_gambar_header_tunggal['file'] = "";

        $this->db->where("site_id", 1);
        $this->db->where("name", "gambar_header");
        $this->db->update('setting', ['val' => json_encode($setting_gambar_header_tunggal)]);


        $data['success'] = true;
        $data['message'] = "Berhasil diupdate ";

        j($data);
        exit;
    }

    public function simpan_running_text()
    {
        cek_login();

        $p = $this->input->post();

        $this->db->where('site_id', 1);
        $this->db->where('name', 'running_text');
        $this->db->update('setting', ['val' => $p['running_text']]);

        $data['success'] = true;
        $data['message'] = "Berhasil diupdate ";

        j($data);
        exit;
    }
}
