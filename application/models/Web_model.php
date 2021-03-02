<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Web_model extends CI_Model {
    public function counter() {
        $client_ip = $this->input->ip_address();
        $uipproxy = getenv("REMOTE_ADDR");
        $client_host = gethostbyaddr($uipproxy);
        
        // cek ip sudah berkunjung 
        $this->db->where('ip', $client_ip);
        $this->db->where('tgl', date('Y-m-d'));
        $sdh_berkunjung = $this->db->get('counter')->num_rows();

        if ($sdh_berkunjung > 0) {
            $this->db->set('hits', 'hits+1', FALSE);
            $this->db->where('ip', $client_ip);
            $this->db->where('tgl', date('Y-m-d'));
            $this->db->update('counter');
        } else {
            $this->db->insert('counter', [
                'ip'=>$client_ip,
                'host'=>$client_host,
                'tgl'=>date('Y-m-d'),
                'hits'=>1
            ]);
        }

        // online now
        $session = session_id();
        $time = time();
        $time_check = $time-600; //SET TIME 10 Minute

        // cek sesssion 
        $this->db->where('session', $session);
        $count_session = $this->db->get('counter_online_now')->num_rows();

        if ($count_session < 1) {
            $this->db->insert('counter_online_now', ['session'=>$session, 'time'=>$time]);
        } else {
            $this->db->where('session', $session);
            $this->db->update('counter_online_now', ['time'=>$time]);
        }

        $this->db->where('time < ', $time_check);
        $this->db->delete('counter_online_now');

        return true;
    }

    public function get_statistik_visitor() {
        $this->db->select('time');
        $get_online_now = $this->db->get('counter_online_now')->num_rows();
        
        $this->db->where('tgl = DATE(NOW())');
        $get_visitor_hari_ini = $this->db->get('counter')->num_rows();
        
        $this->db->where('tgl = DATE(NOW())');
        $this->db->select('SUM(hits) jml');
        $get_hits_hari_ini = $this->db->get('counter')->row_array();
        
        $this->db->where('MONTH(tgl) = MONTH(NOW())');
        $get_visitor_bulan_ini = $this->db->get('counter')->num_rows();
        
        $this->db->where('MONTH(tgl) = MONTH(NOW())');
        $this->db->select('SUM(hits) jml');
        $get_hits_bulan_ini = $this->db->get('counter')->row_array();

        return [
            'online_now' => $get_online_now,
            'hari_ini_visitor'=>$get_visitor_hari_ini,
            'hari_ini_hits'=>intval($get_hits_hari_ini['jml']),
            'bulan_ini_visitor'=>$get_visitor_bulan_ini,
            'bulan_ini_hits'=>intval($get_hits_bulan_ini['jml']),
        ];
    }

    public function get_statistik_posting() {
        $this->db->where('a.publikasi', 1);
        $this->db->where('b.publik', 1);
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->select('a.id');
        $get_jml_postingan_semua = $this->db->get('artikel a')->num_rows();

        $this->db->where('a.publikasi', 1);
        $this->db->where('b.publik', 1);
        $this->db->where('MONTH(a.create_at)', date('m'));
        $this->db->join('topik b', 'a.topik = b.id');
        $this->db->select('a.id');
        $get_jml_postingan_bulan_ini = $this->db->get('artikel a')->num_rows();
    
        return [
            'jumlah_postingan_semua'=>$get_jml_postingan_semua,
            'jumlah_postingan_bulan_ini'=>$get_jml_postingan_bulan_ini,
        ];
    }

}