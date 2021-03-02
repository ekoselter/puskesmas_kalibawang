<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Install extends CI_Controller {
	function __construct() {
		parent::__construct();

	}
	
	public function db() {

		$strq1 = "CREATE TABLE `setting` (
					  `id` tinyint(4) NOT NULL,
					  `site_id` int(4) DEFAULT NULL,
					  `name` char(50) NOT NULL,
					  `val` mediumtext
					) ENGINE=InnoDB DEFAULT CHARSET=latin1;";

		$strq2 = "INSERT INTO `setting` (`id`, `site_id`, `name`, `val`) VALUES
					(1, 1, 'MENU', '[{\"text\":\"\",\"href\":\"{{base_url}}\",\"href2\":\"\",\"icon\":\"fa fa-home\",\"target\":\"_top\",\"title\":\"\"},{\"text\":\"Profil\",\"href\":\"#\",\"href2\":\"\",\"icon\":\"fa fa-building-o\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\",\"children\":[{\"text\":\"Dasar Hukum\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Visi misi\",\"href\":\"{{base_url}}detil/266/visi-misi-tujuan-strategi-dan-kebijakan\",\"href2\":\"{{base_url}}detil/266/visi-misi-tujuan-strategi-dan-kebijakan\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"28\"},{\"text\":\"Profil Pejabat\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\",\"children\":[{\"text\":\"Camat\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Sekretaris Kecamatan\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"}]},{\"text\":\"Personil\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Peta Wilayah\",\"href\":\"{{base_url}}/detil/274/peta-wilayah\",\"href2\":\"{{base_url}}/detil/274/peta-wilayah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"28\"},{\"text\":\"Monografi\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Struktur Organisasi\",\"href\":\"{{base_url}}/detil/267/organisasi\",\"href2\":\"{{base_url}}/detil/267/organisasi\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"28\"},{\"text\":\"Tugas Pokok dan Fungsi\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"LHKPN Pejabat\",\"href\":\"#\",\"href2\":\"{{base_url}}/detil/257/selamat-datang-di-website-kecamatan-lendah\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"}]},{\"text\":\"PPID Pembantu\",\"href\":\"\",\"href2\":\"\",\"icon\":\"fa fa-bullhorn\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[{\"text\":\"Informasi Publik\",\"href\":\"\",\"href2\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\"}]},{\"text\":\"PPID-Ku\",\"href\":\"#\",\"href2\":\"\",\"icon\":\"fa fa-bullhorn\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\",\"children\":[{\"text\":\"Permohonan Informasi Online\",\"href\":\"{{base_url}}web/permohonan_informasi\",\"href2\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Cek Progres Permohonan\",\"href\":\"{{base_url}}web/cek_permohonan_informasi\",\"href2\":\"{{base_url}}detil/1/dasar-hukum\",\"icon\":\"\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"sendiri\"},{\"text\":\"Statistik\",\"icon\":\"\",\"topik\":\"sendiri\",\"href2\":null,\"href\":\"{{base_url}}web/statistik_permohonan_informasi\",\"target\":\"_self\",\"title\":\"\"}]}]'),
					(2, 1, 'fb', 'https://facebook.com/'),
					(3, 1, 'twitter', 'https://twitter.com/'),
					(4, 1, 'instagram', 'https://instagram.com/'),
					(5, 1, 'youtube', 'https://www.youtube.com/'),
					(6, 1, 'alamat_jalan', 'Jl. Tamtama No. 3, Wates, Kulon Progo'),
					(7, 1, 'alamat_notelp', '0274-2820332'),
					(8, 1, 'alamat_email', '@kulonprogokab.go.id'),
					(9, 1, 'petalokasi', ''),
					(10, 1, 'slogan', 'Melayani Sepenuh Hati'),
					(11, 1, 'nama_skpd1', 'Nama Singkat'),
					(12, 1, 'nama_skpd2', 'Nama Panjang'),
					(13, 1, 'keywords', ''),
					(14, 1, 'template', 'newspaper'),
					(15, 1, 'template_homepage', '{\"mainbar\":[[{\"type\":\"news\",\"id_kategori\":\"1\"}],[{\"type\":\"news\",\"id_kategori\":\"2\"},{\"type\":\"news\",\"id_kategori\":\"9\"}],[{\"type\":\"news\",\"id_kategori\":\"7\"}]],\"sidebar\":[{\"type\":\"html\",\"val\":\"<h2>Hallow<\\/h2>\"},{\"type\":\"html\",\"val\":\"<h2>Sidebar sub<\\/h2>\"}]}'),
					(16, 1, 'side_menu', '{\"kanan\":[],\"kiri\":[{\"title\":\"Profil\",\"tipe\":\"list_url\",\"data\":[{\"label\":\"Majalah Jurnal\",\"url\":\"http:\\/\\/localhost\\/master_kp\\/files\\/file_uploads\\/3f7d23a82a5e7ea744d07e8f95fe355e.png\"},{\"label\":\"Profil\",\"url\":\"{{base_url}}detil\\/2\\/profil-ppid-kabupaten-kulon-progo\"},{\"label\":\"Belum ada link\",\"url\":\"{{base_url}}detil\\/24\\/belum-ada-link\"}]},{\"title\":\"aaa\",\"tipe\":\"html\",\"data\":\"<p><a href=\\\"http:\\/\\/facebook.com\\/\\\" target=\\\"_blank\\\">http:\\/\\/facebook.com\\/<\\/a><br><\\/p>\",\"is_header\":false}],\"tengah\":[{\"title\":\"News Slideshow\",\"tipe\":\"slideshow\",\"data\":{\"jml_maks\":5,\"topik\":[2],\"order_by\":\"last_created\"}},{\"title\":\"Pengumuman\",\"tipe\":\"post\",\"data\":{\"order_by\":\"last_created\",\"jml_maks\":5,\"topik\":[2]}},{\"title\":\"SS2\",\"tipe\":\"slideshow\",\"data\":{\"order_by\":\"popularitas\",\"jml_maks\":5,\"topik\":[2]}},{\"title\":\"HTML\",\"tipe\":\"html\",\"data\":\"\"}],\"newsticker\":[{\"data\":{\"jml_maks\":10,\"topik\":[2]}}]}'),
					(17, 1, 'gambar_header', '{\"file\":\"\",\"tampil_teks\":\"\"}');";

		$strq3 = "ALTER TABLE `setting` ADD PRIMARY KEY (`id`);";
		$strq4 = "ALTER TABLE `setting` MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;";

		// setting
		$this->db->query($strq1);
		$this->db->query($strq2);
		$this->db->query($strq3);
		$this->db->query($strq4);

		$strq5 = "ALTER TABLE `artikel`
					ADD COLUMN `create_at` DATETIME NOT NULL AFTER `sumber`,
					ADD COLUMN `update_at` DATETIME NOT NULL AFTER `create_at`";
		$strq5b = "ALTER TABLE `artikel`
					ADD COLUMN `userid` INT NOT NULL AFTER `update_at`;";

		// alter tabel artikel tambah create at
		$this->db->query($strq5);
		$this->db->query($strq5b);

		// tambah user kominfo, kominfo
		$cek_user = $this->db->query("SELECT UserId FROM useraura WHERE user = 'kominfo'")->num_rows();

		if ($cek_user < 1) {
			$strq6 = "INSERT INTO useraura (user, password, level, tipe, start, exp, alamat, last_ping, nama, telepon) VALUES ('kominfo',md5('kominfo'),'Administrator','aktif', NOW(), NOW(), 'Kulon Progo', '', 'Kominfo KP', '00');";

			$this->db->query($strq6);
		}

		// tabel files manager
		$strq7 = "CREATE TABLE `files` (
				  `id` int(11) NOT NULL,
				  `nama` char(100) NOT NULL,
				  `url` char(100) NOT NULL,
				  `create_at` datetime NOT NULL,
				  `update_at` datetime NOT NULL
				) ENGINE=InnoDB DEFAULT CHARSET=latin1;";
		$this->db->query($strq7);
		$strq7b = "ALTER TABLE `files` ADD PRIMARY KEY (`id`);";
		$this->db->query($strq7b);
		$strq7c = "ALTER TABLE `files` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;";
		$this->db->query($strq7c);


		// create folder "files/file_uploads"
		if (!is_dir('./files/file_uploads')) {
			@mkdir("./files/file_uploads", 0777);
		}
		redirect('web');
	}

	public function file()
	{
		$fileList = glob('./files/*');
		foreach($fileList as $filename){
			if (!is_dir($filename)) {
			   	echo $filename, '<br>'; 
			}
		}
	}
}
