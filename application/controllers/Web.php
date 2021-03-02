<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Web extends CI_Controller
{
    function __construct()
    {
        parent::__construct();

        $this->load->model('web_model', 'wm');
        // $this->wm->counter();

        // menu
        $menu = $this->db->query("SELECT * FROM setting WHERE site_id = 1")->result_array();

        $this->a['setting'] = array();
        foreach ($menu as $m) {
            $idx                      = $m['name'];
            $this->a['setting'][$idx] = $m['val'];
        }
        $json_menu       = json_decode($this->a['setting']['MENU'], true);
        $this->a['menu'] = $json_menu;

        $this->a['side_menu'] = json_decode($this->a['setting']['side_menu'], true);

        // newsticker
        if ($this->a['side_menu']['newsticker'][0]['data']['topik']) {
            $this->db->where_in("a.topik", $this->a['side_menu']['newsticker'][0]['data']['topik']);
        }

        $this->db->where("a.publikasi", 1);
        $this->db->join("topik AS b", "a.topik = b.id");
        $this->db->order_by("a.id", "desc");
        $this->db->limit($this->a['side_menu']['newsticker'][0]['data']['jml_maks']);
        $this->db->select("a.judul, a.id, a.topik, b.topik nmtopik");
        $this->a['newsticker']    = $this->db->get("artikel AS a")->result_array();
        $this->a['gambar_header'] = json_decode($this->a['setting']['gambar_header'], true);
    }

    public function index()
    {
        $this->a['side_menu'] = json_decode($this->a['setting']['side_menu'], true);
        // generate query

        $this->a['main'] = array();

        if (!empty($this->a['side_menu'])) {
            foreach ($this->a['side_menu'] as $a => $b) {
                $satu = array();

                // $this->a['main'][$a] = $satu;
                $no = 0;
                foreach ($b as $c => $d) {
                    if (!empty($d['tipe'])) {
                        if ($d['tipe'] == "post" || $d['tipe'] == "slideshow" || $d['tipe'] == "berita_terbaru") {
                            $this->db->where_in("a.topik", $d['data']['topik']);
                            $this->db->where("a.publikasi", 1);
                            if ($d['tipe'] == "slideshow") {
                                $this->db->where("a.gambar != ", "");
                            }
                            $this->db->join("topik AS b", "a.topik = b.id");
                            $this->db->order_by("a.id", "desc");
                            $this->db->limit($d['data']['jml_maks']);
                            $this->db->select("a.*, b.topik nmtopik");

                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $this->db->get("artikel AS a")->result_array();

                            // echo $this->db->last_query()."<br>";
                            // echo json_encode($this->a['main']['data_'.$no]['data']);
                        } else {
                            if (!empty($d['is_header'])) {
                                $satu['data_' . $no]['is_header'] = $d['is_header'];
                            }
                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $d['data'];
                        }
                        $no++;
                    }
                }

                $this->a['main'][$a] = $satu;
            }
        }

        // j($this->a['main']);
        // exit;
        $this->a['title'] = $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'];

        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' =>  $this->a['title'],
            ),
            array(
                'name'    => 'description',
                'content' => "Selamat datang di website " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "website opd, website instansi",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta'] = $meta;


        $this->load->view($this->config->item('template') . '/index', $this->a);
    }

    public function detil($id)
    {

        $this->db->where("id", $id);
        $q_data = $this->db->get("artikel")->row_array();

        if ($q_data) {
            $this->db->set('hits', 'hits+1', FALSE);
            $this->db->where('id', $id);
            $this->db->update('artikel');

            $deskripsi = substr(strip_tags($q_data['konten']), 0, 1000);
            $deskripsi = str_replace(array("\n", "\t", "\r", "'", "\"", " "), array("", "", "", "", "", ""), $deskripsi);
            $meta_img  = is_file(config_item('base_url_file') . "news/normal/" . $q_data['gambar']) ? config_item('base_url_file_url') . "news/normal/" . $q_data['gambar'] : base_url('aset/logokp.jpg');

            $this->a['title'] = $this->a['setting']['nama_opd_singkat'] . " - " . $q_data['judul'];

            $meta      = array(
                array(
                    'name'    => 'url',
                    'content' => base_url('detil/' . $id . '/' . url_title($q_data['judul'], "-", true)),
                ),
                array(
                    'name'    => 'title',
                    'content' => htmlentities($this->a['title']),
                ),
                array(
                    'name'    => 'description',
                    'content' => amankan_teks($deskripsi),
                ),
                array(
                    'name'    => 'image',
                    'content' => $meta_img,
                ),
                array(
                    'name'    => 'keywords',
                    'content' => $q_data['tags'],
                ),
                array(
                    'name'    => 'robots',
                    'content' => 'no-cache',
                ),
                array(
                    'name'    => 'Content-type',
                    'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
                ),
            );

            $this->a['meta'] = $meta;

            $this->a['main']['detil_berita']['title'] = $q_data['judul'];
            $this->a['main']['detil_berita']['detil'] = $q_data;
            $this->a['side_menu']                     = json_decode($this->a['setting']['side_menu'], true);


            $this->load->view($this->config->item('template') . '/blog-detil', $this->a);
        } else {
            show_404();
        }
    }

    public function category($id = 0, $teks_kat = "")
    {
        $id = intval($id);
        $teks_kat = ($teks_kat == "") ? "semua" : $teks_kat;

        if ($id > 0) {
            $this->db->where("id", $id);
        }
        $d_topik    = $this->db->get("topik")->row_array();

        $this->a['main']['category']['title'] = "Kategori: " . $d_topik['topik'];

        $this->a['title'] = "Kategori: " . $d_topik['topik'];

        if ($id > 0) {
            $this->db->where('a.topik', $id);
        }
        $this->db->where('a.publikasi', 1);
        $this->db->where('b.publik', 1);
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->select('a.id');
        $total_row = $this->db->get('artikel a')->num_rows();

        $per_page   = 10;
        $awal       = $this->uri->segment(5);
        $awal       = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir      = $per_page;
        $pagi       = _page($total_row, $per_page, 5, base_url() . "web/category/" . $id . "/" . $teks_kat);

        if ($id > 0) {
            $this->db->where('a.topik', $id);
        }
        $this->db->where('a.publikasi', 1);
        $this->db->where('b.publik', 1);
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->select('a.*, b.topik');
        $this->db->limit($akhir, $awal);
        $this->db->order_by('create_at', 'desc');
        $q_data = $this->db->get('artikel a')->result_array();


        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' => "Kategori Berita",
            ),
            array(
                'name'    => 'description',
                'content' => "Kategori Berita",
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "website opd, website instansi",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta']                      = $meta;
        $this->a['main']['category']['detil'] = $q_data;
        $this->a['main']['category']['pagi']  = $pagi;

        $this->db->select('topik.*');
        $this->db->select("(SELECT COUNT(IF(publikasi=1,1,0)) FROM artikel WHERE topik = topik.id) jml");
        $this->a['side']['kategori']['data'] = $this->db->get('topik')->result_array();


        $this->load->view($this->config->item('template') . '/blog-category', $this->a);
    }

    public function cari()
    {
        $q = $this->input->get('q');
        $q = $this->security->xss_clean($q);

        $tahun = $this->input->get('tahun');
        $tahun = $this->security->xss_clean($tahun);
        $bulan = $this->input->get('bulan');
        $bulan = $this->security->xss_clean($bulan);

        if (!empty($tahun)) {
            $this->db->where('YEAR(artikel.tgl)', $tahun);
        }
        if (!empty($bulan)) {
            $this->db->where('MONTH(artikel.tgl)', $bulan);
        }
        $this->db->where('artikel.publikasi', 1);
        $this->db->where('topik.publik', 1);
        $this->db->group_start();
        $this->db->like('artikel.judul', $q);
        $this->db->or_like('artikel.konten', $q);
        $this->db->group_end();
        $this->db->join('topik', 'artikel.topik = topik.id', 'left');
        $total_row = $this->db->get('artikel')->num_rows();

        $per_page   = 10;
        $awal       = $this->uri->segment(3);
        $awal       = (empty($awal) || $awal == 1) ? 0 : $awal;
        $akhir      = $per_page;

        $this->load->library('pagination');
        $pagi       = _page($total_row, $per_page, 3, base_url('web/cari'));

        if (!empty($tahun)) {
            $this->db->where('YEAR(artikel.tgl)', $tahun);
        }
        if (!empty($bulan)) {
            $this->db->where('MONTH(artikel.tgl)', $bulan);
        }
        $this->db->where('artikel.publikasi', 1);
        $this->db->where('topik.publik', 1);
        $this->db->group_start();
        $this->db->like('artikel.judul', $q);
        $this->db->or_like('artikel.konten', $q);
        $this->db->group_end();
        $this->db->select('artikel.*, topik.topik');
        $this->db->join('topik', 'artikel.topik = topik.id', 'left');
        $this->db->order_by('artikel.id', 'desc');
        $this->db->limit($akhir, $awal);
        $q_data = $this->db->get('artikel')->result_array();

        $this->a['main']['category']['title'] = $total_row . " hasil pencarian dengan kata <b>\"" . htmlentities($q) . "\"</b>";
        $this->a['title'] = "Pencarian : ";

        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' => "Kategori Berita",
            ),
            array(
                'name'    => 'description',
                'content' => "Kategori Berita",
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "website opd, website instansi",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta']                      = $meta;
        $this->a['main']['category']['detil'] = $q_data;
        $this->a['main']['category']['pagi']  = $pagi;

        $this->load->view($this->config->item('template') . '/blog-category', $this->a);
    }

    public function galleri()
    {
        $this->a['side_menu'] = json_decode($this->a['setting']['side_menu'], true);
        $this->a['title'] = "Galleri Foto ";
        // generate query

        $this->a['main'] = array();

        if (!empty($this->a['side_menu'])) {
            foreach ($this->a['side_menu'] as $a => $b) {
                $satu = array();

                // $this->a['main'][$a] = $satu;
                $no = 0;
                foreach ($b as $c => $d) {
                    if (!empty($d['tipe'])) {
                        if ($d['tipe'] == "post" || $d['tipe'] == "slideshow" || $d['tipe'] == "berita_terbaru") {
                            $this->db->where_in("a.topik", $d['data']['topik']);
                            $this->db->where("a.publikasi", 1);
                            if ($d['tipe'] == "slideshow") {
                                $this->db->where("a.gambar != ", "");
                            }
                            $this->db->join("topik AS b", "a.topik = b.id");
                            $this->db->order_by("a.id", "desc");
                            $this->db->limit($d['data']['jml_maks']);
                            $this->db->select("a.*, b.topik nmtopik");

                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $this->db->get("artikel AS a")->result_array();

                            // echo $this->db->last_query()."<br>";
                            // echo json_encode($this->a['main']['data_'.$no]['data']);
                        } else {
                            if (!empty($d['is_header'])) {
                                $satu['data_' . $no]['is_header'] = $d['is_header'];
                            }
                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $d['data'];
                        }
                        $no++;
                    }
                }

                $this->a['main'][$a] = $satu;
            }
        }

        // j($this->a['main']);
        // exit;

        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' => "Galleri Foto " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'description',
                'content' => "Galleri Foto " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "galleri, website, galleri foto",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta'] = $meta;

        $this->db->select('mod_gallery_kat.*');
        $this->db->select('(SELECT name FROM mod_gallery WHERE kid = mod_gallery_kat.id LIMIT 1) cover');
        $this->db->order_by('mod_gallery_kat.id', 'desc');
        $q_data = $this->db->get("mod_gallery_kat")->result_array();

        $this->a['main']['galleri']['title'] = "Galleri Foto";
        $this->a['main']['galleri']['detil'] = $q_data;

        $this->load->view($this->config->item('template') . '/galleri', $this->a);
    }

    public function galleri_detil($id_kategori, $title)
    {
        $this->a['side_menu'] = json_decode($this->a['setting']['side_menu'], true);
        $this->a['title'] = "Galleri Foto " . $title;
        // generate query

        $this->a['main'] = array();

        if (!empty($this->a['side_menu'])) {
            foreach ($this->a['side_menu'] as $a => $b) {
                $satu = array();

                // $this->a['main'][$a] = $satu;
                $no = 0;
                foreach ($b as $c => $d) {
                    if (!empty($d['tipe'])) {
                        if ($d['tipe'] == "post" || $d['tipe'] == "slideshow" || $d['tipe'] == "berita_terbaru") {
                            $this->db->where_in("a.topik", $d['data']['topik']);
                            $this->db->where("a.publikasi", 1);
                            if ($d['tipe'] == "slideshow") {
                                $this->db->where("a.gambar != ", "");
                            }
                            $this->db->join("topik AS b", "a.topik = b.id");
                            $this->db->order_by("a.id", "desc");
                            $this->db->limit($d['data']['jml_maks']);
                            $this->db->select("a.*, b.topik nmtopik");

                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $this->db->get("artikel AS a")->result_array();

                            // echo $this->db->last_query()."<br>";
                            // echo json_encode($this->a['main']['data_'.$no]['data']);
                        } else {
                            if (!empty($d['is_header'])) {
                                $satu['data_' . $no]['is_header'] = $d['is_header'];
                            }
                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $d['data'];
                        }
                        $no++;
                    }
                }

                $this->a['main'][$a] = $satu;
            }
        }

        $this->db->where('id', $id_kategori);
        $detil_kat = $this->db->get('mod_gallery_kat')->row_array();


        $this->db->where('kid', $id_kategori);
        $this->db->select('mod_gallery.*');
        $q_data = $this->db->get("mod_gallery")->result_array();

        $this->a['main']['galleri']['title'] = $detil_kat['name'] . " (" . count($q_data) . " foto)";
        $this->a['main']['galleri']['detil'] = $q_data;

        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' => "Galleri Foto " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'description',
                'content' => "Galleri Foto " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "galleri, website, galleri foto",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta'] = $meta;

        $this->load->view($this->config->item('template') . '/galleri_detil', $this->a);
    }



    public function agenda()
    {
        $this->a['side_menu'] = json_decode($this->a['setting']['side_menu'], true);
        $this->a['title'] = "Agenda ";
        // generate query

        $this->a['main'] = array();

        if (!empty($this->a['side_menu'])) {
            foreach ($this->a['side_menu'] as $a => $b) {
                $satu = array();

                // $this->a['main'][$a] = $satu;
                $no = 0;
                foreach ($b as $c => $d) {
                    if (!empty($d['tipe'])) {
                        if ($d['tipe'] == "post" || $d['tipe'] == "slideshow" || $d['tipe'] == "berita_terbaru") {
                            $this->db->where_in("a.topik", $d['data']['topik']);
                            $this->db->where("a.publikasi", 1);
                            if ($d['tipe'] == "slideshow") {
                                $this->db->where("a.gambar != ", "");
                            }
                            $this->db->join("topik AS b", "a.topik = b.id");
                            $this->db->order_by("a.id", "desc");
                            $this->db->limit($d['data']['jml_maks']);
                            $this->db->select("a.*, b.topik nmtopik");

                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $this->db->get("artikel AS a")->result_array();

                            // echo $this->db->last_query()."<br>";
                            // echo json_encode($this->a['main']['data_'.$no]['data']);
                        } else {
                            if (!empty($d['is_header'])) {
                                $satu['data_' . $no]['is_header'] = $d['is_header'];
                            }
                            $satu['data_' . $no]['title'] = $d['title'];
                            $satu['data_' . $no]['data']  = $d['data'];
                        }
                        $no++;
                    }
                }

                $this->a['main'][$a] = $satu;
            }
        }

        // j($this->a['main']);
        // exit;

        $meta = array(
            array(
                'name'    => 'url',
                'content' => base_url(),
            ),
            array(
                'name'    => 'title',
                'content' => "Agenda Kegiatan " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'description',
                'content' => "Agenda Kegiatan " . $this->a['setting']['nama_skpd1'] . " " . $this->a['setting']['nama_skpd2'],
            ),
            array(
                'name'    => 'image',
                'content' => base_url('aset/logokp.jpg'),
            ),
            array(
                'name'    => 'keywords',
                'content' => "galleri, website, galleri foto",
            ),
            array(
                'name'    => 'robots',
                'content' => 'no-cache',
            ),
            array(
                'name'    => 'Content-type',
                'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
            ),

        );
        $this->a['meta'] = $meta;

        $this->db->select('tbl_kalender.*');
        $this->db->order_by('tbl_kalender.id', 'desc');
        $q_data = $this->db->get("tbl_kalender")->result_array();

        $this->a['main']['galleri']['title'] = "Agenda Kegiatan";
        $this->a['main']['galleri']['detil'] = $q_data;

        $this->load->view($this->config->item('template') . '/agenda', $this->a);
    }

    public function agenda_detil($id, $title)
    {
        $this->db->where("id", $id);
        $q_data = $this->db->get("tbl_kalender")->row_array();

        if ($q_data) {

            $deskripsi = substr(strip_tags($q_data['isi']), 0, 1000);
            $deskripsi = str_replace(array("\n", "\t", "\r", "'", "\"", " "), array("", "", "", "", "", ""), $deskripsi);
            $meta_img  = is_file(config_item('base_url_file') . "agenda/" . $q_data['filenya']) ? config_item('base_url_file_url') . "agenda/" . $q_data['filenya'] : base_url('aset/logokp.jpg');

            $this->a['title'] = $this->a['setting']['nama_opd_singkat'] . " - " . $q_data['judul'];

            $meta      = array(
                array(
                    'name'    => 'url',
                    'content' => base_url('agenda-detil/' . $id . '/' . url_title($q_data['judul'], "-", true)),
                ),
                array(
                    'name'    => 'title',
                    'content' => htmlentities($this->a['title']),
                ),
                array(
                    'name'    => 'description',
                    'content' => amankan_teks($deskripsi),
                ),
                array(
                    'name'    => 'image',
                    'content' => $meta_img,
                ),
                array(
                    'name'    => 'keywords',
                    'content' => 'agenda detil',
                ),
                array(
                    'name'    => 'robots',
                    'content' => 'no-cache',
                ),
                array(
                    'name'    => 'Content-type',
                    'content' => 'text/html; charset=utf-8', 'type' => 'equiv',
                ),
            );

            $this->a['meta'] = $meta;

            $this->a['main']['detil_berita']['title'] = $q_data['judul'];
            $this->a['main']['detil_berita']['detil'] = $q_data;
            $this->a['side_menu']                     = json_decode($this->a['setting']['side_menu'], true);


            $this->load->view($this->config->item('template') . '/agenda-detil', $this->a);
        } else {
            show_404();
        }
    }

    public function rss()
    {
        $xml = '<?xml version="1.0" encoding="UTF-8"?>';
        $xml .= '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">';
        $xml .= '<channel>';
        $xml .= '<title>Dinas Kominfo Kabupaten Kulon Progo</title>';
        $xml .= '<link>http://kominfo.kulonprogokab.go.id/</link>';
        $xml .= '<description>Website Resmi Dinas Kominfo Kabupaten Kulon Progo, Alamat : Jalan Tamtama Nomor 3, Wates, Kulon Progo</description>';
        // $xml .= '<managingEditor>kominfo@kulonprogokab.go.id</managingEditor>';
        $xml .= '<image>';
        $xml .= '<title>Dinas Kominfo Kabupaten Kulon Progo</title>';
        $xml .= '<link>http://kominfo.kulonprogokab.go.id/</link>';
        $xml .= '<url>http://www.kulonprogokab.go.id/v21/images/browser-48x48.png</url>';
        // $xml .= '<atom:link href="http://kominfo.kulonprogokab.go.id/rss" rel="self" type="application/rss+xml" />';
        $xml .= '</image>';
        $hasil = $this->db->query("SELECT * FROM artikel WHERE publikasi=1 ORDER BY id DESC LIMIT 10")->result_array();
        foreach ($hasil as $h) {
            $deskripsi = substr(strip_tags($h['konten']), 0, 1000);
            $deskripsi = str_replace(array("\n", "\t", "\r", "'", "\"", " ", "“", "&rdquo", " "), array("", "", "", "", "", "", "", "", " "), $deskripsi);
            $xml .= '<item>';
            $xml .= '<guid>' . base_url('web/view_berita/' . $h['id'] . '/' . url_title($h['judul'])) . '</guid>';
            $xml .= '<title>' . $h['judul'] . '</title>';
            $xml .= '<link>' . base_url('web/view_berita/' . $h['id'] . '/' . url_title($h['judul'])) . '</link>';
            $xml .= '<description>' . $deskripsi . '</description>';
            $xml .= '</item>';
        }
        $xml .= '</channel>';
        $xml .= '</rss> ';
        header('Content-Type: application/xml');
        echo $xml;
    }
}
