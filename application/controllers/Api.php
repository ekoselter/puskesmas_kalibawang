<?php 
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Api extends CI_Controller {
    function __construct() {
        parent::__construct();
    }

    public function index() {
        j(['success'=>true, 'message'=>'api website opd kulon progo']);
        exit;
    }

    public function get_statistik_kunjungan() {
        $this->load->model('web_model');
        $statistik = $this->web_model->get_statistik_visitor();

        j($statistik);
        exit;
    }

    public function get_all_kategori_detil() {
        $this->db->select('b.id, b.topik, COUNT(a.id) jml');
        $this->db->join('topik AS b', 'a.topik = b.id');
        $this->db->where('a.publikasi', 1);
        $this->db->where('b.publik', 1);
        $this->db->group_by('a.topik');
        $data = $this->db->get('artikel AS a')->result_array();

        j(array("success" => true, "data" => $data));
        exit;
    }

    public function arsip_bulanan() {
        
        $this->db->where('a.publikasi', 1);
        $this->db->group_by('YEAR(a.tgl)');
        $this->db->order_by('YEAR(a.tgl)', 'desc');
        $this->db->select('YEAR(a.tgl) tahun, COUNT(id) jml');
        $get_tahun = $this->db->get('artikel AS a')->result_array();
        
        $_bulan = array(
            "1"=>"Januari",
            "2"=>"Februari",
            "3"=>"Maret",
            "4"=>"April",
            "5"=>"Mei",
            "6"=>"Juni",
            "7"=>"Juli",
            "8"=>"Agustus",
            "9"=>"September",
            "10"=>"Oktober",
            "11"=>"November",
            "12"=>"Desember",
        );

        $arsip = array();
        if (!empty($get_tahun)) {
            foreach ($get_tahun as $x) {
                if (intval($x['tahun']) !== 0) {
                            
                    $this->db->where('a.publikasi', 1);
                    $this->db->where('YEAR(a.tgl)', $x['tahun']);
                    $this->db->group_by('MONTH(a.tgl)');
                    $this->db->select('MONTH(a.tgl) bulan, COUNT(id) jml');
                    $get_bulan = $this->db->get('artikel AS a')->result_array();
    
                    $satu = array();
                    if (!empty($get_bulan)) {
                        foreach ($get_bulan as $b) {
                            if (intval($b['bulan']) !== 0) {
                                $one['bulan'] = $_bulan[$b['bulan']];
                                $one['jumlah'] = $b['jml'];
                                $one['url'] = base_url('cari?q=&tahun='.$x['tahun'].'&bulan='.$b['bulan']);
                                $satu[] = $one;
                            }
                        }
                    }
    
                    $idx = $x['tahun'];
                    $arsip[$idx]['jumlah'] = $x['jml'];
                    $arsip[$idx]['url'] = base_url('cari?q=&tahun='.$x['tahun']);
                    $arsip[$idx]['perbulan'] = $satu;
                }
            }
        }

        j(array("success"=>true, "data" => $arsip));
        exit;
    }

    public function get_post_list() {
        
        $order_by = $this->input->get('order_by');
        $jml_maks = $this->input->get('jml_maks');
        $topik = $this->input->get('topik');

        $pc_topik = explode("--", $topik);

        $this->db->where_in('topik', $pc_topik);
        $this->db->where('publikasi', 1);
        $this->db->select('id, judul, konten, gambar');
        $this->db->limit($jml_maks);
        if ($order_by == "last_created") {
            $this->db->order_by('tgl', 'desc');
        }        
        $get_berita = $this->db->get('artikel')->result_array();
        
        $tampung_berita = [];

        if (!empty($get_berita)) {
            foreach ($get_berita as $b) {
                if (is_file($this->config->item('base_url_file') . "news/normal/" . $b['gambar'])) {
                    $img = $this->config->item('base_url_file_url') . "news/normal/" . $b['gambar'];
                } else {
                    preg_match('/<img.+src=[\'"](?P<src>.+?)[\'"].*>/i', $b['konten'], $image);
                    
                    if (!empty($image)) {
                        $img = $image['src'];
                    } else {
                        $img = base_url('aset/no_pict.png');
                    }
                }

                $satu = [
                    "id"=>$b['id'],
                    "judul"=>htmlentities($b['judul']),
                    "konten"=>amankan_teks($b['konten']),
                    "gambar"=>$img,
                ];

                $tampung_berita[] = $satu;
            }
        }

        j(array("success"=>true, "data" => $tampung_berita));
        exit;
    }

    public function get_post_detil($id) {
        $this->db->where('a.id', $id);
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->select('a.*, b.topik nm_topik');
        $tampung_berita = $this->db->get('artikel a')->row_array();

        $gambar = false;
        if (is_file(config_item('base_url_file').'news/normal/'.$tampung_berita['gambar'])) {
            $gambar = config_item('base_url_file_url').'news/normal/'.$tampung_berita['gambar'];
        }

        $tampung_berita['gambar'] = $gambar;
        
        unset($tampung_berita['email']);
        unset($tampung_berita['seftitle']);
        unset($tampung_berita['attach']);

        j(array("success"=>true, "data" => $tampung_berita));
        exit;        
    }

    public function get_agenda() {
        $get_order_by = $this->input->get('orderby');

        $this->db->order_by('waktu_mulai', 'desc');
        if (!empty($get_order_by)) {
            if ($get_order_by == "desc") {
                $this->db->order_by('waktu_mulai', 'desc');
            } else if ($get_order_by == "asc") {
                $this->db->order_by('waktu_mulai', 'asc');
            }
        }
        $get_agenda = $this->db->get('tbl_kalender')->result_array();

        $d_agenda = [];
        if (!empty($get_agenda)) {
            foreach ($get_agenda as $agd) {
                $satu = $agd;
                if (is_file(config_item('base_url_file')."agenda/".$agd['filenya'])) {
                    $satu['file_sampul'] = base_url().str_replace("./", "", config_item('base_url_file'))."agenda/".$agd['filenya'];
                } else {
                    $satu['file_sampul'] = false;
                }
                unset($satu['filenya']);
                unset($satu['background']);
                unset($satu['color']);
                $d_agenda[] = $satu;
            }
        }

        j(array("success"=>true, "data" => $d_agenda));
        exit;
    }
}
