<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Tools extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
    }


    public function index()
    {
        cek_login();
        $a['p'] = "v_tools";
        $this->load->view('adm/template', $a);
    }

    public function cek_folder()
    {
        cek_login();

        $array_wajib_ada = [
            config_item('base_url_file'),
            config_item('base_url_file') . "file_uploads",
            config_item('base_url_file') . "img_background",
            config_item('base_url_file') . "img_header_tunggal",
            config_item('base_url_file') . "img_header_slider",
            config_item('base_url_file') . "news",
            config_item('base_url_file') . "news/normal",
            config_item('base_url_file') . "news/thumb",
            config_item('base_url_file') . "galleri",
            config_item('base_url_file') . "agenda",
        ];

        $html = '<table class="table table-bordered table-sm"><tr><th>Nama Folder</th><th>Status</th></tr>';
        foreach ($array_wajib_ada as $wa) {
            $cek = '<span class="badge badge-danger">Tidak ada</span>';
            if (is_dir($wa)) {
                $cek = '<span class="badge badge-success">Ada</span>';
            }

            $html .= '
            <tr>
                <td>' . $wa . '</td>
                <td>' . $cek . '</td>
            </tr>';
        }

        $html .= '</table>';


        $a['p'] = "v_tools_cek_folder";
        $a['html'] = $html;
        $this->load->view('adm/template', $a);

        if ($this->input->get('aksi') == "ok") {
            foreach ($array_wajib_ada as $wa) {
                if (!is_dir($wa)) {
                    mkdir($wa);
                    $my_file = $wa . "/index.html";

                    $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
                    $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
                    fwrite($handle, $data);
                }
            }

            redirect('admin/tools/cek_folder');
        }
    }

    public function cek_setting()
    {
        cek_login();

        $get_tabel_setting = $this->db->get('setting')->result_array();

        $setting_versi_31 = [
            'MENU',
            'fb',
            'twitter',
            'instagram',
            'youtube',
            'alamat_jalan',
            'alamat_notelp',
            'alamat_email',
            'petalokasi',
            'slogan',
            'nama_skpd1',
            'nama_skpd2',
            'keywords',
            'template',
            'template_homepage',
            'side_menu',
            'gambar_header',
            'gambar_background',
            'is_slider_header',
            'gambar_header_slider',
            'sudah_menu',
            'versi',
            'site_footer',
            'nama_opd_singkat',
            'ppid_account',
            'running_text',
        ];

        $this->db->where('site_id', 1);
        $get_setting_sekarang = $this->db->get('setting')->result_array();

        $tampung_setting_ada = [];
        foreach ($get_setting_sekarang as $ss) {
            $idx = $ss['name'];
            $tampung_setting_ada[$idx] = $ss['val'];
        }

        $html = '<table class="table table-sm table-bordered table-hover"><tr><th>Setting</th><th>Status</th></tr>';

        foreach ($setting_versi_31 as $vv) {
            $status = array_key_exists($vv, $tampung_setting_ada) ? '<span class="badge badge-success">Ada</span>' : '<span class="badge badge-danger">Tidak ada</span> <a href="' . base_url('admin/tools/cek_setting?aksi=ok&setting=' . $vv) . '">Buat</a>';

            $html .= '<tr><td>' . $vv . '</td><td>' . $status . '</td></tr>';
        }

        $html .= '</table>';

        $a['p'] = "v_tools_cek_setting";
        $a['html'] = $html;
        $this->load->view('adm/template', $a);

        if ($this->input->get('aksi') == "ok") {
            $this->db->insert('setting', [
                'site_id' => 1,
                'name' => $this->input->get('setting'),
                'val' => '',
            ]);
            redirect('admin/tools/cek_setting');
        }
    }

    public function cek_field_terbaru()
    {
        cek_login();
        $this->load->dbforge();

        echo "<ol>";
        $cek_field_topik_publik = $this->db->field_exists('publik', 'topik');
        if (!$cek_field_topik_publik) {
            echo "<li>Field topik.publik tidak ada. <a href='" . base_url('admin/tools/cek_field_terbaru?aksi=buat&jenis=topik.publik') . "'>Buat</a></li>";

            if ($this->input->get('aksi') == "buat" && $this->input->get('jenis') == "topik.publik") {
                $fields = array(
                    'publik' => array('type' => 'TINYINT', 'after' => 'ket')
                );
                $this->dbforge->add_column('topik', $fields);
                redirect('admin/tools/cek_field_terbaru');
            }
        } else {
            echo '<li>Field topik.publik sudah ada</li>';
        }

        exit;
    }


    public function mancing()
    {
        $c = curl_init();
        curl_setopt($c, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c, CURLOPT_URL, 'http://info.rsudwates.id/tt');
        $contents = curl_exec($c);
        curl_close($c);

        if ($contents) echo $contents;
        else echo "gagal";
    }

    public function list_file_galleri()
    {
        cek_login();
        $list_galleri = $this->db->get('mod_gallery')->result_array();

        echo "<a href='" . base_url('tools/list_file_galleri_ok') . "'>Lanjutkan</a>
        <ul>";
        if (!empty($list_galleri)) {
            foreach ($list_galleri as $l) {
                $is_file = is_file('./lama/mod/gallery/storeData/normal/' . $l['name']) ? "OK" : "Not OK";

                if ($is_file == "OK") {
                    echo "<li>" . $l['name'] . " - " . $is_file . "</li>";
                } else {
                    echo "<li>File tidak ada</li>";
                }
            }
        }
        echo "</ul>";
    }

    public function list_file_galleri_ok()
    {
        cek_login();
        $list_galleri = $this->db->get('mod_gallery')->result_array();

        echo "<ul>";
        if (!empty($list_galleri)) {
            foreach ($list_galleri as $l) {
                $is_file = is_file('./lama/mod/gallery/storeData/normal/' . $l['name']) ? "OK" : "Not OK";

                if ($is_file == "OK") {
                    rename('./lama/mod/gallery/storeData/normal/' . $l['name'], './files/galleri/' . $l['name']);
                    echo "<li>" . $l['name'] . " - " . $is_file . "</li>";
                } else {
                    echo "<li>File tidak ada</li>";
                }
            }
        }
        echo "</ul>";
    }

    public function gawe_folder()
    {
        cek_login();
        // echo $this->config->item('base_url_file')."<br>";
        // echo var_dump(is_dir($this->config->item('base_url_file')));
        // exit;

        // file_uploads
        if (!is_dir($this->config->item('base_url_file') . "file_uploads")) {
            mkdir($this->config->item('base_url_file') . "file_uploads");
            $my_file = $this->config->item('base_url_file') . "file_uploads/index.html";

            $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
            $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
            fwrite($handle, $data);
            echo "Buat folder file_uploads : OK<br>";
        }
        // img_background
        if (!is_dir($this->config->item('base_url_file') . "img_background")) {
            mkdir($this->config->item('base_url_file') . "img_background");
            $my_file = $this->config->item('base_url_file') . "img_background/index.html";

            $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
            $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
            fwrite($handle, $data);
            echo "Buat folder img_background : OK<br>";
        }
        // img_header
        if (!is_dir($this->config->item('base_url_file') . "img_header")) {
            mkdir($this->config->item('base_url_file') . "img_header");
            $my_file = $this->config->item('base_url_file') . "img_header/index.html";

            $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
            $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
            fwrite($handle, $data);
            echo "Buat folder img_header : OK<br>";
        }

        $my_file = $this->config->item('base_url_file') . "index.html";
        $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
        $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
        fwrite($handle, $data);
        echo "Buat file index.html files : OK<br>";

        $my_file = $this->config->item('base_url_file') . "news/index.html";
        $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
        $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
        fwrite($handle, $data);
        echo "Buat file news/index.html files : OK<br>";

        $my_file = $this->config->item('base_url_file') . "news/normal/index.html";
        $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
        $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
        fwrite($handle, $data);
        echo "Buat file news/normal/index.html files : OK<br>";

        $my_file = $this->config->item('base_url_file') . "news/thumb/index.html";
        $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
        $data = '<!DOCTYPE html><html><head><title>403 Forbidden</title></head><body><p>Directory access is forbidden.</p></body></html>';
        fwrite($handle, $data);
        echo "Buat file news/thumb/index.html files : OK<br>";
    }

    public function modul()
    {
        cek_login();
        $this->db->where('type', 'block');
        $get_modul = $this->db->get('modul')->result_array();

        $this->db->where('name', 'side_menu');
        $get_kanan = $this->db->get('setting')->row_array();


        $set   = $get_kanan['val'];
        $set   = utf8_encode($set);
        $set   = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $set);
        $set   = json_decode($set, true);


        if (!empty($get_modul)) {
            foreach ($get_modul as $m) {
                $satu = [
                    "title" => $m['modul'],
                    "tipe" => "html",
                    "data" => $m['isi'],
                    "is_header" => true
                ];
                $set['kanan'][] = $satu;
            }
        }

        $new_val = json_encode($set);

        $this->db->where('site_id', 1);
        $this->db->where('name', 'sudah_modul');
        $cek_sudah = $this->db->get('setting')->num_rows();

        if ($cek_sudah < 1) {
            $strq = "UPDATE setting SET val = '" . addslashes($new_val) . "' WHERE site_id = 1 AND name = 'side_menu'";
            $this->db->query($strq);
            $this->db->query("INSERT INTO setting VALUES (null, 1, 'sudah_modul', 1);");
            exit("OK");
        } else {
            exit("SUDAH");
        }
    }

    public function menulama_json()
    {
        cek_login();
        $this->db->where('published', 1);
        $this->db->order_by('ordering', 'asc');
        $get_menu = $this->db->get('menu')->result_array();

        $tampung = array();
        $satu = [
            "text" => " ",
            "href" => "{{base_url}}",
            "icon" => "fa fa-home",
            "target" => "_self",
            "title" => "",
            "topik" => ""
        ];
        $tampung[] = $satu;

        if (!empty($get_menu)) {
            // echo '<ul>';
            foreach ($get_menu as $m1) {
                $this->db->where('published', 1);
                $this->db->where('parent', $m1['id']);
                $this->db->order_by('ordering', 'asc');
                $get_submenu = $this->db->get('submenu')->result_array();

                if (empty($get_submenu)) {
                    $satu = [
                        "text" => $m1['menu'],
                        "href" => $m1['url'],
                        "icon" => "fa fa-th-list",
                        "target" => "_self",
                        "title" => "",
                        "topik" => ""
                    ];
                    $tampung[] = $satu;
                    // echo '<li>'.$m1['menu'].' => '.$m1['url'].'</li>';
                } else {
                    $satu = [
                        "text" => $m1['menu'],
                        "href" => $m1['url'],
                        "icon" => "fa fa-th-list",
                        "target" => "_self",
                        "title" => "",
                        "topik" => "",
                        "children" => array(),
                    ];
                    foreach ($get_submenu as $m2) {
                        $this->db->where('published', 1);
                        $this->db->where('parent', $m2['id']);
                        $this->db->order_by('ordering', 'asc');
                        $get_subsubmenu = $this->db->get('submenu2')->result_array();

                        if (empty($get_subsubmenu)) {
                            $dua = [
                                "text" => $m2['menu'],
                                "href" => $m2['url'],
                                "icon" => "fa fa-arrow-right",
                                "target" => "_self",
                                "title" => "",
                                "topik" => "",
                                "children" => array()
                            ];
                            $satu['children'][] = $dua;
                        } else {
                            $dua = [
                                "text" => $m2['menu'],
                                "href" => $m2['url'],
                                "icon" => "fa fa-arrow-right",
                                "target" => "_self",
                                "title" => "",
                                "topik" => "",
                                "children" => array()
                            ];
                            foreach ($get_subsubmenu as $m3) {
                                $tiga = [
                                    "text" => $m3['menu'],
                                    "href" => $m3['url'],
                                    "icon" => "fa fa-arrow-right",
                                    "target" => "_self",
                                    "title" => "",
                                    "topik" => "",
                                    "children" => array()
                                ];
                                $dua['children'][] = $tiga;
                            }
                            $satu['children'][] = $dua;
                        }
                    }

                    $tampung[] = $satu;
                }
            }
        }

        $new_val = json_encode($tampung);

        // echo print_r($new_val);
        // exit;

        $this->db->where('site_id', 1);
        $this->db->where('name', 'sudah_menu');
        $cek_sudah = $this->db->get('setting')->num_rows();

        if ($cek_sudah < 1) {
            $strq = "UPDATE setting SET val = '" . addslashes($new_val) . "' WHERE site_id = 1 AND name = 'MENU'";
            $this->db->query($strq);
            $this->db->query("INSERT INTO setting VALUES (null, 1, 'sudah_menu', 1);");
            exit("OK");
        } else {
            exit("SUDAH");
        }
    }

    public function konversi_beritas_ke_artikel()
    {
        cek_login();
        $data = $this->db->get("beritas")->result_array();

        foreach ($data as $d) {
            $p = array(
                "judul" => $d['judul'],
                "konten" => $d['isi_berita'],
                "konten" => $d['isi_berita'],
                "tgl" => $d['created_at'],
                "publikasi" => 1,
                "topik" => (($d['tipe'] == "static_page") ? 1 : 2),
                "hits" => 0,
                "tags" => "",
                "create_at" => $d['created_at'],
                "update_at" => $d['updated_at'],
            );

            $this->db->insert("artikel", $p);
        }
    }

    public function konversi_halaman_ke_halaman_statis()
    {
        cek_login();
        $this->db->insert('topik', array("topik" => "Halaman Statis", "ket" => "Halaman Statis"));
        $id_halaman_statis = $this->db->insert_id();

        $hal = $this->db->get("halaman")->result_array();

        $no = 1;
        if (!empty($hal)) {
            foreach ($hal as $h) {
                $strq = "INSERT INTO artikel (judul, konten, user, tgl, publikasi, topik, hits, create_at, gambar) VALUES ('" . addslashes($h['judul']) . "', '" . addslashes($h['konten']) . "', 'adminwates', '" . date('Y-m-d H:i:s') . "', '1', '" . $id_halaman_statis . "', '1', '" . date('Y-m-d H:i:s') . "', '_');";
                echo "Queri " . $no . " berhasil<br>";
                $this->db->query($strq);
                $no++;
            }
        }

        echo "OK. " . ($no - 1) . " data";
    }


    public function konversi_file()
    {
        cek_login();

        $dir = $this->config->item('base_url_file');
        $list_file = preg_grep('/^([^.])/', scandir($dir));

        echo "<ol>";
        foreach ($list_file as $l) {
            // $this->db->insert("files", array(
            //  "nama" => $l,
            //  "url" => $l,
            //  "create_at" => date('Y-m-d H:i:s'),
            // ));
            echo "<li>" . $l . ": OK</li>";
        }
        echo "</ol>";
    }
}
