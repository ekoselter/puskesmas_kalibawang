-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Mar 2021 pada 04.48
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `actions`
--

CREATE TABLE `actions` (
  `id` bigint(20) NOT NULL,
  `modul` varchar(20) NOT NULL DEFAULT '',
  `posisi` int(1) NOT NULL DEFAULT 0,
  `order` int(3) NOT NULL DEFAULT 0,
  `modul_id` int(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `actions`
--

INSERT INTO `actions` (`id`, `modul`, `posisi`, `order`, `modul_id`) VALUES
(1, 'lyrics', 0, 0, 4),
(2, 'lyrics', 0, 1, 17),
(3, 'lyrics', 0, 2, 5),
(4, 'lyrics', 1, 5, 16),
(5, 'lyrics', 1, 1, 8),
(6, 'lyrics', 1, 2, 21),
(7, 'lyrics', 1, 3, 25),
(8, 'lyrics', 1, 4, 19),
(10, 'download', 0, 0, 4),
(11, 'download', 0, 1, 17),
(12, 'download', 0, 2, 5),
(13, 'download', 0, 3, 21),
(14, 'download', 1, 0, 18),
(16, 'download', 1, 2, 19),
(18, 'download', 1, 4, 8),
(19, 'download', 1, 5, 25),
(20, 'lyrics', 1, 6, 31),
(31, 'download', 1, 1, 36),
(33, 'download', 1, 0, 37),
(34, 'lyrics', 1, 7, 37);

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT 0,
  `ordering` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `menu`, `url`, `mod`, `ordering`) VALUES
(1, 'Beranda Admin', 'admin.php', 0, 0),
(2, 'Edit Admin', 'admin_info.php', 0, 18),
(3, 'Menu', 'admin_menu.php', 0, 12),
(4, 'Halaman', 'admin_pages.php', 0, 11),
(5, 'Jajak Pendapat', 'polling', 1, 9),
(8, 'Berita', 'news', 1, 4),
(9, 'Buku Tamu', 'guestbook', 1, 2),
(11, 'Modul', 'admin_modul.php', 0, 13),
(13, 'Upload File', 'admin_files.php', 0, 15),
(14, 'Download', 'download', 1, 10),
(15, 'Link Web', 'links', 1, 7),
(16, 'Logout', '?aksi=logout', 0, 20),
(17, 'Shoutbox', 'shoutbox', 1, 5),
(25, 'Kalender Kegiatan', 'calendar', 1, 6),
(23, 'Galeri Foto', 'gallery', 1, 8),
(21, 'Aksi', 'admin_actions.php', 0, 14),
(42, 'User', 'admin_users.php', 0, 17),
(48, 'Tema', 'themes', 1, 16),
(49, 'Aduan', 'aduan', 1, 1),
(50, 'Permohonan Informasi', 'form', 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `aduanx`
--

CREATE TABLE `aduanx` (
  `id` int(10) NOT NULL,
  `sekarang` varchar(12) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `homepage` varchar(60) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `jawab` text NOT NULL,
  `isi_dispo` text NOT NULL,
  `rev` text NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tgl` datetime NOT NULL DEFAULT current_timestamp(),
  `publikasi` int(1) NOT NULL DEFAULT 0,
  `topik` tinyint(11) NOT NULL DEFAULT 0,
  `gambar` text DEFAULT NULL,
  `hits` int(250) NOT NULL DEFAULT 0,
  `tags` varchar(255) DEFAULT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `sumber` varchar(255) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `artikel`
--

INSERT INTO `artikel` (`id`, `judul`, `konten`, `user`, `email`, `tgl`, `publikasi`, `topik`, `gambar`, `hits`, `tags`, `attach`, `sumber`, `create_at`, `update_at`, `userid`) VALUES
(8, 'Garuda Indonesia Tawarkan Kerjasama Ekspor Produk Unggulan Kulon Progo', '<p>Bupati Kulon Progo Drs. H. Sutedjo&nbsp; terima audiensi dari PT Garuda Indonesia (persero)&nbsp; kantor cabang Yogyakarta. Audiensi berlangsung Jumat (5/2/2021) di Ruang Kerja Bupati, Kompleks Pemda Kabupaten Kulon Progo. Maksud dan tujuan audiensi adalah silaturahmi serta perkenalan dari GM Garuda Dian Ediyono beserta jajaranya.</p>\r\n<p>&nbsp;Dian Ediyono selaku GM Garuda Indonesia Kantor Cabang Yogyakarta menyampaikan bahwa pihaknya menawarkan kerjasama terkait jasa angkutan ekspor produk-produk unggulan Kulon Progo. Pihaknya berharap Pemkab dapat menfasilitasi komunikasi Garuda dengan pelaku-pelaku usaha baik skala besar maupun UKM agar bisa terjalin kerjasama yang menguntungkan.</p>\r\n<p>&ldquo;Mengingat banyak produk unggulan Kulon Progo yang diminati luar negeri, setidaknya kami bisa turut serta membantu memajukan industri kecil di Kulon Progo&rdquo;, terang Dian.</p>\r\n<p>Dengan hadirnya Bandara YIA di Kulon Progo, pihaknya siap memaksimalkan jasa angkutan barang guna memenuhi kebutuhan ekspor di Kulon Progo. Tidak hanya angkutan barang, Garuda pun siap untuk turut serta mempromosikan produk unggulan-unggulan serta pariwisata di Kulon Progo.</p>\r\n<p>Bupati Kulon Progo Drs. H. Sutedjo menyambut baik hal tersebut dan mengatakan banyak produk-produk Kulon Progo yang diminati pasar lokal, nasional, maupun luar negeri. Namun demikian fasilitas-fasilitas pendukungnya belum cukup memadai.</p>\r\n<p>&ldquo;Dengan hadirnya Garuda di YIA, kami harapkan bisa membantu mewadahi kebutuhan ekspor teman-teman pengrajin di Kulon Progo&rdquo;, ujar Bupati.</p>\r\n<p>Bupati juga berharap tidak hanya sekedar produknya saja yang dikenal, namun Kulon Progo secara luas pun bisa lebih dikenal tidak sekedar dilalui orang saja, tapi juga disinggahi oleh masyarakat luas. Banyak potensi wisata yang bisa diangkat dan dipromosikan guna kemajuan Kulon Progo.</p>\r\n<p>Dengan ini Bupati juga meminta semua OPD terkait untuk dapat menindaklanjuti hal tersebut. Hal ini sekaligus menjadi salah satu solusi mengangkat dampak ekonomi akibat pandemi.</p>\r\n<p>Iffah Mufidati, SH, MM Kepala Dinas Perdagangan dan Perindustrian mengatakan hal ini bisa menjadi solusi dan alternatif bagi pengusaha eksportir di Kulon Progo. Dinas Perdagangan akan menfasilitasi tawaran tersebut kepada para eksportir.</p>\r\n<p>&ldquo;Dengan pandemi ini, ada peningkatan permintaan pengiriman barang dari luar negeri, hal ini harus bisa dimanfaatkan oleh pengusaha lokal&rdquo;, ujar Iffah.</p>\r\n<p>Data eksportir di Kulon Progo sendiri terdapat beberapa usaha pabrikan seperti pabrik wig, arang briket dan traktor tangan. Disisi UKM terdapat sentra gula semut, gula kelapa, serat alam, olahan kayu, kopi dan beberapa lainnya. Selain itu juga masih banyak potensi-potensi yang bisa digali lagi.</p>\r\n<p>&ldquo;Adapun kendala yang masih dihadapi ekspor adalah pemenuhan kuota permintaan dan ketersediaan barang yang belum bisa dicukupi pengusaha&rdquo;, imbuh Iffah.</p>\r\n<p>Dibidang pariwisata sendiri Kepala Dinas Pariwisata Joko Mursito, S.Sn, MA menyampaikan Saat ini pemkab terus berupaya meningkatkan pariwisata di Kulon Progo apalagi dalam kondisi pandemi ini merupakan waktu yang tepat untuk bersiap dan &nbsp;mendorong pelaku wisata untuk bebenah diri, agar nanti siap menghadapi era baru.</p>\r\n<p>Disampaikan tidak hanya produk berupa barang, namun Kulon Progo juga memiliki produk unggulan wisata alam dan budaya yang bisa diminati pasar wisatawan mancanegara. Dan siap menerima masukan untuk lebih memajukan pariwisata Kulon progo</p>\r\n<p>&ldquo;Banyak spot-spot wisata yang perlu dikemas ulang agar tidak jenuh, serta semakin banyak menarik minat orang tentunya&rdquo;, ungkap Joko Mursito.</p>\r\n<p>Disampaikan pula Pemkab juga telah menjalin kerjasama dengan bandara YIA, untuk menyediakan tempat promosi produk-produk Kulon Progo. MC Kulonprogo/tn</p>', 'kominfo', NULL, '2021-02-17 00:00:00', 1, 37, '484444bc3a64eaf514b2e7974d1bcd8b.jpeg', 1, 'Puskesmas Kalibawang', NULL, 'kulonprogokab.go.id', '2021-02-17 14:13:05', '2021-02-17 14:13:05', 18),
(2, 'Visi dan Misi Puskesmas Kalibawang', '<p>Visi : <br />\"Menjadi Puskesmas yang bermutu untuk mewujudkan masyarakat Kalibawang sehat dan mandiri.\"</p>\r\n<p>Misi : <br />1. Menyelenggarakan pelayanan kesehatan dasar sesuai standar oleh tenaga profesional. <br />2. Menggerakkan keluarga melalui GERMAS dan PHBS.</p>', 'kominfo', NULL, '2021-02-16 00:00:00', 1, 25, NULL, 2, 'visi misi Puskesmas Kalibawang', NULL, 'Puskesmas Kalibawang', '2021-02-16 15:04:58', '2021-02-16 15:04:58', 18),
(3, 'Struktur organisasi puskesmas kalibawang', '<p>Kepala puskesmas : dr. Theresia Rudatun<br />Ka Sub. Bag. TU : Fidiastuti, S.KM., MM.</p>\r\n<p>Penanggungjawab UKM Esensial : Fivi Yanti, S.KM.<br />Penanggungjawab UKM Pengembangan : Theresia Retno Asri<br />Penanggungjawab UKP : dr. Pranita Anggarini Mulyaningsih<br />Penanggungjawab Jaringan Pelayanan Puskesmas dan Jejaring : Apriana Hestiningsih, A.Md.Keb.</p>', 'kominfo', NULL, '2021-02-16 00:00:00', 1, 25, NULL, 1, 'Struktur organisasi puskesmas kalibawang', NULL, 'Puskesmas Kalibawang', '2021-02-16 15:06:03', '2021-02-16 15:06:03', 18),
(4, 'Sejarah Puskesmas Kalibawang', '<p>INI CONTOH SAJA :</p>\r\n<h3 class=\"post-title entry-title\">Sejarah Puskesmas Di Indonesia dan PKMD</h3>\r\n<div class=\"post-header\">\r\n<div class=\"post-header-line-1\">&nbsp;</div>\r\n</div>\r\n<div id=\"post-body-7624102305170905352\" class=\"post-body entry-content\"><br />\r\n<div>Pusat Kesehatan Masyarakat, atau yang disingkat dan lebih dikenal di Indonesia dengan nama Puskesmas, adalah unit pelaksana teknis (UPT) dinas kesehatan kabupaten/kota yang bertanggungjawab menyelenggarakan pembangunan kesehatan di suatu wilayah kerja UPT. Sebagai unit fungsional pelayanan kesehatan terdepan dalam unit pelaksana teknis dinas kesehatan kabupaten/ kota, tugasnya adalah menyelenggarakan sebagian tugas teknis Dinas Kesehatan Pembangunan Kesehatan. Maksudnya adalah sebagai penyelenggara upaya kesehatan seperti melaksanakan upaya penyuluhan, pencegahan dan penanganan kasus-kasus penyakit di wilayah kerjanya, secara terpadu dan terkoordinasi. Sementara pertanggung jawaban secara keseluruhan ada di Dinkes dan sebagian ada di Puskesmas.</div>\r\n</div>', 'kominfo', NULL, '2021-02-16 00:00:00', 1, 25, NULL, 1, 'Sejarah', NULL, 'Puskesmas Kalibawang', '2021-02-16 15:10:18', '2021-02-16 15:10:18', 18),
(5, 'Pengertian Covid-19', '<p>Coronavirus adalah kumpulan virus yang bisa menginfeksi sistem pernapasan. Pada banyak kasus, virus ini hanya menyebabkan infeksi pernapasan ringan,&nbsp;<a href=\"https://www.alodokter.com/tampak-mirip-ketahui-beda-gejala-virus-corona-dengan-flu-biasa\">seperti flu</a>. Namun, virus ini juga bisa menyebabkan infeksi pernapasan berat, seperti infeksi paru-paru (pneumonia).</p>\r\n<p>Virus ini menular melalui percikan dahak (droplet) dari saluran pernapasan, misalnya ketika berada di&nbsp;<a href=\"https://www.alodokter.com/risiko-penularan-virus-corona\" target=\"_blank\" rel=\"noopener\">ruang tertutup</a>&nbsp;yang ramai dengan sirkulasi udara yang kurang baik atau kontak langsung dengan droplet.</p>\r\n<p>Selain virus SARS-CoV-2 atau virus Corona,<strong>&nbsp;</strong>virus yang juga termasuk dalam kelompok ini adalah&nbsp;virus penyebab&nbsp;<em>Severe Acute Respiratory Syndrome</em>&nbsp;(<a href=\"https://www.alodokter.com/sars\">SARS</a>) dan virus penyebab&nbsp;<em>Middle-East Respiratory Syndrome</em>&nbsp;(<a href=\"https://www.alodokter.com/mers\">MERS</a>).&nbsp;Meski disebabkan oleh virus dari kelompok yang sama, yaitu coronavirus, COVID-19 memiliki beberapa&nbsp;<a href=\"https://www.alodokter.com/ketahui-perbedaan-covid-19-dengan-sars-dan-mers\">perbedaan dengan SARS dan MERS</a>,&nbsp;antara lain&nbsp;dalam hal kecepatan penyebaran dan keparahan gejala.</p>\r\n<p>sumber : aladokter.com</p>', 'kominfo', NULL, '2021-02-16 00:00:00', 1, 38, NULL, 6, 'Puskesmas Kalibawang', NULL, 'Puskesmas Kalibawang', '2021-02-16 15:28:08', '2021-02-16 15:28:08', 18),
(6, 'Pengumuman Jadwal', '<p>Pendaftaran pasien :<br />Senin-Kamis : 7.30 - 12.00<br />Jumat : 7.30 - 10.00<br />Sabtu : 7.30 - 11.00</p>\r\n<p>Jadwal pelayanan<br />Poli Umum, IGD, Poli Gigi: Setiap hari</p>\r\n<p>Imunisasi : Selasa</p>\r\n<p>Periksa Kehamilan : Senin &amp; Rabu</p>\r\n<p>KB : Selasa &amp; Kamis</p>', 'kominfo', NULL, '2021-02-16 00:00:00', 1, 39, '468313bd3caf51aa406c707decc70c53.jpg', 0, 'jadwal puskesmas', NULL, 'Puskesmas Kalibawang', '2021-02-16 15:32:14', '2021-02-22 08:46:42', 18),
(15, 'Jadwal dan Pelayanan Puskesmas', '<p>Pendaftaran pasien :<br />Senin-Kamis : 7.30 - 12.00<br />Jumat : 7.30 - 10.00<br />Sabtu : 7.30 - 11.00</p>\r\n<p>Jadwal pelayanan<br />Poli Umum, IGD, Poli Gigi: Setiap hari</p>\r\n<p>Imunisasi : Selasa</p>\r\n<p>Periksa Kehamilan : Senin &amp; Rabu</p>\r\n<p>KB : Selasa &amp; Kamis</p>', 'kominfo', NULL, '2021-02-22 00:00:00', 1, 25, NULL, 1, 'Puskesmas Kalibawang', NULL, 'Puskesmas Kalibawang', '2021-02-22 08:47:53', '2021-02-22 08:47:53', 18),
(9, 'Penyampaian SPT Tahunan di Kabupaten Kulon Progo 81,35 persen Dilakukan Secara Online', '<p>Bertempat di Ruang Kerja Bupati, Kompleks Pemkab Kulonprogo, Bupati Kulon Progo Drs. H. Sutedjo dan Wakil Bupati Fajar Gegana secara serentak melaporkan SPT Tahunan tahun 2020 melalui e-Filing didampingi Kepala Kantor Pelayanan Pajak (KPP) Pratama Wates Herlin Sulismiyarti, Kamis (11/2/2021).</p>\r\n<p>Pelaporan SPT Tahunan merupakan salah satu kewajiban perpajakan yang harus dilaksanakan oleh Wajib Pajak (WP) Orang Pribadi dan Badan setiap tahunnya. Batas waktu penyampaian SPT Tahunan adalah tiga bulan setelah berakhirnya tahun pajak (31 Maret) untuk WP Orang pribadi dan empat bulan setelah berakhirnya tahun pajak (30 April) untuk WP Badan.</p>\r\n<p>Pada kesempatan ini, Bupati Kulon Progo mengingatkan masyarakat Kulon Progo agar melaporkan SPT Tahunan lebih awal tanpa menunggu batas waktu dan memberikan contoh nyata pelaksanaan kewajiban perpajakan tersebut.</p>\r\n<p>&nbsp;&ldquo;Tadi sudah saya laporkan kewajiban saya selaku Wajib Pajak, ternyata cukup praktis dan sekarang masyarakat dimudahkan dengan cara ini, bisa lapor dari mana saja dan kapan saja&rdquo;, ujar Sutedjo.</p>\r\n<p>Sutedjo juga mengajak masyarakat untuk melaporkan SPT Tahunan secara online untuk mencegah penyebaran Covid-19 di wilayah Kulon Progo. Penyampaian SPT secara online akan memberikan lebih banyak keuntungan bagi masyarakat karena dapat dilakukan dengan cepat, mudah, dan fleksibel (dapat dilakukan dimana saja dan kapan saja). Dengan lapor secara online, WP tidak perlu datang ke kantor pajak sehingga dapat mengurangi jumlah masyarakat yang datang ke kantor pajak dan menghindari adanya interaksi langsung antar masyarakat.</p>\r\n<p>Pandemi Covid-19 menghambat berbagai aktivitas masyarakat, termasuk pemenuhan kewajiban perpajakan masyarakat Kulon Progo. Pada tahun 2020 tingkat kepatuhan penyampaian SPT Tahunan di Kulon Progo adalah sebesar 85,31 persen dan dari keseluruhan WP yang menyampaikan SPT Tahunan tersebut persentase penyampaian secara online sebesar 81,35 persen. Oleh karena itu, Kepala KPP Pratama wates, Herlin Sulismiyarti, menghimbau Wajib Pajak Kulon Progo untuk memanfaatkan layanan pelaporan SPT Tahunan secara online, baik melalui e-Filing maupun e-Form yang dapat diakses pada laman pajak.go.id.</p>\r\n<p>Pada kesempatan ini pula, Herlin mengucapkan terima kasih kepada Wajib Pajak Kulon Progo atas partisipasinya dalam pembayaran pajak selama tahun 2020. Walaupun perekonomian masyarakat tekena imbas Covid-19, penerimaan pajak KPP Pratama Wates tahun 2020 mencapai Rp 266,2 Milyar (87,20 persen dari target penerimaan pajak). Selanjutnya, target penerimaan pajak KPP Pratama Wates pada tahun 2021 adalah sebesar Rp 319, 5 Milyar.</p>\r\n<p>Saat ini, KPP Pratama Wates telah membuka kembali layanan tatap muka dengan protokol kesehatan yang ketat. Wajib Pajak yang ingin berkonsultasi maupun memenuhi kewajiban perpajakan dapat melakukannya secara langsung maupun secara daring/online. Kesadaran dan kepedulian seluruh warga negara untuk memenuhi kewajiban perpajakan sangat dibutuhkan untuk menuju kebangkitan dan kemajuan perekonomian Indonesia.</p>', 'kominfo', NULL, '2021-02-17 00:00:00', 1, 37, '988486b412079479a4790dc512899ea2.jpeg', 1, 'Puskesmas Kalibawang', NULL, 'kulonprogokab.go.id', '2021-02-17 14:26:30', '2021-02-17 14:26:30', 18),
(10, 'Membangun Ketahanan Warga dari Padukuhan/RT/RW Melalui PPKM Mikro', '<p>Wates, Bupati Kulon Progo Drs. H. Sutedjo didampingi jajaran Forkominda sampaikan instruksi dan arahan sebagai tindak lanjut pelaksanaan PPKM berbasis mikro kepada kapanewon, kalurahan dan padukuhan se-Kulon Progo secara daring di Media Center, Selasa (9/2/2021).</p>\r\n<p>Sudarmanto, S.IP, M.Si Kepala Dinas Pemberdayaan Masyarakat Dan Desa Pengendalian Penduduk Dan Keluarga Berencana (PMD DALDUK KB) Kabupaten Kulon Progo menyampaikan acara ini sebagai tindaklanjut dari terbitnya Instruksi Gubernur DIY Nomor 5/INSTR/ 2021 Tentang Pemberlakuan PPKM Berbasis Mikro.</p>\r\n<p>Sesuai dengan instruksi tersebut perlu segera ditindaklanjuti pelaksanaannya di tingkat kalurahan. Hal itu antara lain terkait pembentukan&nbsp; kelembagaan PPKM, mekanisme kerja kelembagaan, pengaturan zonasi pengendalian serta refokusing dana Kalurahan/DD.</p>\r\n<p>&ldquo;Dengan ini kita harapkan seluruh kalurahan siap secara administratif dan penganggaran keuangan dalam rangka mendukung pelaksanaan ppkm mikro ini&rdquo;, ujar Sudarmanto.</p>\r\n<p>Nantinya dibentuk Posko Satuan Tugas/Relawan Kalurahan Aman Covid-19 yang ditetapkan dengan Keputusan Lurah. Dengan fungsi utamanya pencegahan, penanganan, pembinaan, dan pendukung pelaksanaan penanganan Covid-19 di tingkat Kalurahan.</p>\r\n<p>Sesuai dengan instruksi, PPKM mikro dilakukan dengan mempertimbangkan kriteria zonasi pengendalian hingga tingkat RT/padukuhan. Disebutkan, pada zona hijau dimana tidak ada kasus aktif di tingkat RT, maka dilakukan tes pada suspek secara aktif.</p>\r\n<p>Lalu pada zona kuning disebutkan bila terdapat 1 rumah hingga 5 rumah dengan kasus positif Covid-19 selama 7 hari terakhir diharuskan melalukan pelacakan kontak erat.</p>\r\n<p>Kemudian, pada zona oranye disebutkan bila terdapat 6 rumah hingga 10 rumah dengan kasus konfirmasi positif dalam 7 hari terakhir. Penanganan yang dilakukan adalah dengan pelacakan kontak erat dan menutup rumah ibadah, tempat bermain anak, serta tempat umum lainnya kecuali sektor esensial.</p>\r\n<p>Terakhir, kawasan zona merah ditetapkan bila terdapat lebih dari 10 rumah dengan kasus positif. Pada zona tersebut baru diterapkan PPKM tingkat RT yang mencakup pelacakan kontak erat, isolasi mandiri, menutup tempat umum kecuali sektor esensial, melarang kerumunan lebih dari 3 orang, membatasi akses maksimal pukul 20.00, serta meniadakan kegiatan sosial masyarakat.</p>\r\n<p>Ditambahkan Sudarmanto, untuk pemenuhan kebutuhan pembiayaan pelaksanaan PPKM mikro ditingkat kalurahan, dibebankan pada Dana Desa (DD) dengan didukung sumber pendapatan desa lainnya melalui APBDes. Hal tersebut sesuai dengan Instruksi Mendes PDTT&nbsp; Nomor 1 Tahun 2021 Tentang Penggunaan DD untuk PPKM. Dan didukung oleh Surat Edaran Dirjen Perimbangan Keuangan Kemenkeu Nomor SE 2/PK/2021 Tentang Penyesuaian Penggunanaan TKDDD 2021.</p>\r\n<p>&ldquo;Kalurahan untuk segera merefokusing penggunaan Dana Kalurahan Tahun 2021 untuk kegiatan PPKM Skala Mikro sesuai dengan kewenangan Kalurahan&rdquo;, jelasnya.</p>\r\n<p>Kewenangan tersebut antara lain penganggaran Bantuan Langsung Tunai (BLT) Kalurahan dan mengalokasikan paling sedikit sebesar 8% dari Dana Kalurahan yang diterima untuk kegiatan penanganan covid-19 antara lain untuk aksi Kalurahan aman covid-19 dan Posko Satuan Tugas/Relawan Kalurahan Aman Covid-19.</p>\r\n<p>Serta melakukan perubahan Anggaran Pendapatan Belanja Kalurahan (APB Kalurahan) untuk pelaksanaan kegiatan PPKM Skala Mikro di Kalurahan melalui musyawarah khusus Kalurahan</p>\r\n<p>Sementara Juru Bicara Gugus Tugas Covid-19 Kabupaten Kulon Progo drg. Th. Baning Rahayujati, M.Kes, menerangkan bahwa dari 937 dusun yang ada, 537 dusun diantaranya memiliki kasus covid aktif/masa isolasi. Adapun data terkonfirmasi tersebut menggunakan hasil PCR sesuai arahan Kermenkes. Kedepan akan dilaksanakan analisis data secara mendalam sampai tingkat RT.</p>\r\n<p>Menanggapi hal tersebut Bupati Kulon Progo Drs. H. Sutedjo menyampaikan seluruh pihak terkait untuk segera menindaklanjuti pemberlakuan PPKM Berbasis mikro tersebut. Hal ini sebagai upaya pemerintah dalam rangka penanganan pandemi covid-19.</p>\r\n<p>&ldquo;Bahwa kebijakan ini memerlukan kesungguhan kita seluruhnya, untuk benar-benar mendayagunakan sumber daya yang ada, dan yang lebih khususnya keterlibatan warga hingga tingkat RT&rdquo;, tegas Bupati Sutedjo.</p>\r\n<p>Bupati berharap informasi ini harus segera sampai ketingkat bawah dan ditindaklanjuti kebijakan ini dalam kurun satu dua hari ini. Seluruh Panewu untuk memastikan dan memantau kalurahan diwilayahnya untuk melaksanakan kebijakan tersebut. Lalu Lurah juga diminta mengkondisikan kebijakan ini terlaksana sampai tingkat padukuhan/RT.</p>\r\n<p>&ldquo;Kebijakan ini butuh partisipasi seluruh masyarakat Kulon Progo dalam rangka memantau dan membatasi mobilitas sebagai upaya pencegahan penularan covid-19&rdquo;, tutup Bupati Sutedjo. MCKulonprogo/tn</p>', 'kominfo', NULL, '2021-02-17 00:00:00', 1, 37, 'b3c0110f70c8ae10e9fa6e875c87a999.jpeg', 0, 'Puskesmas Kalibawang', NULL, 'kulonprogokab.go.id', '2021-02-17 14:27:08', '2021-02-17 14:27:08', 18),
(11, 'Ini Cara Cek Informasi Fakta atau Hoax', '<div dir=\"auto\">Hai, Healthies..</div>\r\n<div dir=\"auto\">Di tengah pandemi yang terjadi saat ini, kerapkali kita mendapati pesan berantai yang beredar di media sosial, baik dari Facebook, grup Whatsapp, maupun website, yang pesan tersebut belum tentu dapat dipertanggungjawabkan atau terbukti kebenarannya (hoax).</div>\r\n<div dir=\"auto\">Adanya ponsel pintar atau smartphone yang kita miliki tentu saja menuntut kita untuk bijak dalam bersosial media.</div>\r\n<div dir=\"auto\">Kominfo bekerjasama dengan Kementerian Kesehatan membuat sebuah bot dimana Healthies dapat mengecek kebenaran informasi yang didapatkan.</div>\r\n<div dir=\"auto\">Yuk, perangi hoax dan lebih bijak lagi dalam menggunakan media sosial.<span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\"><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t57/1/16/1f609.png\" alt=\"????\" width=\"16\" height=\"16\" /></span></div>', 'kominfo', NULL, '2021-02-17 00:00:00', 1, 40, '556a2830c30b809dd7cf8153821aef6e.jpg', 0, 'Puskesmas Kalibawang', NULL, 'Puskesmas Kalibawang', '2021-02-17 15:35:02', '2021-02-17 15:35:02', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bukutamu`
--

CREATE TABLE `bukutamu` (
  `id` int(10) NOT NULL,
  `sekarang` varchar(12) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `homepage` varchar(60) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `jawab` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bukutamu_config`
--

CREATE TABLE `bukutamu_config` (
  `config` text NOT NULL,
  `id` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `counter`
--

CREATE TABLE `counter` (
  `id` int(16) NOT NULL,
  `ip` char(20) NOT NULL,
  `host` char(65) NOT NULL,
  `tgl` date NOT NULL,
  `hits` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `counter_online_now`
--

CREATE TABLE `counter_online_now` (
  `session` char(100) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `nama` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form`
--

CREATE TABLE `form` (
  `id` int(11) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `noktp` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `info` text NOT NULL,
  `alasanminta` text NOT NULL,
  `namapgn` varchar(50) NOT NULL,
  `noktppgn` varchar(50) NOT NULL,
  `alamatpgn` text NOT NULL,
  `notelppgn` varchar(30) DEFAULT NULL,
  `emailpgn` varchar(50) DEFAULT NULL,
  `alasanguna` text NOT NULL,
  `caraperoleh` varchar(20) NOT NULL,
  `formatbahan` varchar(20) NOT NULL,
  `carakirim` varchar(20) NOT NULL,
  `status` binary(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `halaman`
--

CREATE TABLE `halaman` (
  `id` int(11) NOT NULL,
  `judul` varchar(80) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `seftitle` varchar(225) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `halaman`
--

INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(1, 'Selamat Datang di Website Kami', '<p style=\"text-align: center;\"><strong><span style=\"color: #008000; font-size: small;\">MARI SUKSESKAN GERAKAN 3R di LINGKUNGAN KITA</span></strong></p>\r\n<p style=\"text-align: center;\"><span style=\"color: #008000; font-size: small;\"><span style=\"line-height: 14.5599994659424px;\"><strong>(<em>ReDuce, ReUse dan ReCycle</em>)</strong></span></span></p>\r\n<p style=\"text-align: center;\">&nbsp;<img src=\"files/news/normal/IMG-20150320-WA0003.jpg\" alt=\"\" width=\"475\" /></p>\r\n<p><span style=\"font-size: x-small;\"><span style=\"color: #008000;\">Semoga dengan keberadaan website ini bisa menjadi media interaksi antara pemerintah Kabupaten Kulon Progo dengan masyarakat. Saran masukan untuk perbaikan web site ini sangat kami harapkan.&nbsp;</span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"color: #008000;\"><strong>--------------------(( Semoga Bermanfaat ))-------------------</strong></span></p>\r\n<p>&nbsp;</p>', ''),
(9, 'Visi Misi', '<p><span style=\"font-size: medium;\"> </span></p>\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><strong><span style=\"color: #339966;\"><span style=\"font-family: arial; font-size: medium;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Visi:</span></span></span></span></span></span></span></strong></span></span></strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><strong><span style=\"font-family: arial;\">Terwujudnya masyarakat kabupaten Kulon Progo yang sejahtera, aman, tenteram, berkarakter, dan berbudaya berdasarkan iman dan taqwa.</span></strong><strong>&nbsp;</strong></span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><strong><span style=\"color: #339966;\"><span style=\"font-family: arial; font-size: medium;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Misi:</span></span></span></span></span></span></span></strong></span></span></strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Mewujudkan pembangunan berbasis kawasan dengan mengoptimalkan sumber daya alam dan didukung oleh teknologi serta infrastruktur yang berkualitas.</span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #339966; font-size: medium; font-weight: 700;\"><span style=\"font-family: arial; font-size: medium;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Tujuan:</span></span></span></span></span></span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Terwujudnya peningkatan kualitas lingkungan hidup.</span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #339966; font-size: medium; font-weight: 700;\"><span style=\"font-family: arial; font-size: medium;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Sasaran:</span></span></span></span></span></span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Meningkatnya konservasi, perlindungan, dan pengendalian sumber daya alam secara berkelanjutan.</span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; color: #339966; font-size: small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Strategi:</span></span></span></span></span></span></strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: arial; font-size: medium;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">1. Meningkatkan\r\nmanajemen\r\npengelolaan lingkungan.</span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">2. Meningkatkan\r\npengawasan, penaatan\r\ndan pengendalian\r\npencemaran\r\nlingkungan</span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; color: #339966; font-size: small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">Arah Kebijakan:</span></span></span></span></span></span></strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: arial; font-size: small;\">1. Peningkatan manajem</span><span style=\"font-family: arial; font-size: small;\">en dan\r\nperan serta masyarakat dalam\r\npengelolaan lingkungan.</span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">2. Peningkatan pengawasan,\r\npenaatan dan pengendalian\r\npengendalian pencemaran\r\nlingkungan</span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium; font-family: helvetica;\"><span style=\"font-size: x-small;\">Secara umum, beberapa hal yang akan dilaksanakan dalam mencapai visi dan misi\r\nadalah sebagai berikut:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">1. Mendorong peningkatan kapasitas Sumber Daya Manusia (SDM) yang ada di\r\nDinas Lingkungan</span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> Hidup&nbsp;</span></span></span><span style=\"font-family: helvetica; font-size: medium;\">dalam penguasaan di bidangnya</span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">2. Merevisi regulasi tata kerja OPD disesuaikan dengan beban tugas </span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">3. Meningkatkan sarana dan prasarana dinas untuk meningkatkan pelayanan\r\nkepada masyarakat </span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">4. Meningkatkan sinergitas, sinkronisasi dan kerjasama antara para pemangku\r\nkepentingan </span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: arial; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">(stake holde</span><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: x-small;\">r)&nbsp;</span></span></span></span><span style=\"font-family: helvetica; font-size: medium;\"><span style=\"font-size: x-small;\">dan OPD, baik di tingkat kabupaten, Daerah Istimewa\r\nYogyakarta maupun Kementerian.&nbsp;</span></span></span></span></span></p>', ''),
(15, 'Struktur Organisasi', '<p style=\"text-align: center;\"><span style=\"font-size: medium;\">STRUKTUR ORGANISASI DINAS LINGKUNGAN HIDUP</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"> KABUPATEN KULON PROGO</span></p>\r\n<p style=\"text-align: center;\"><!--[if gte mso 9]><xml> <o:OfficeDocumentSettings> <o:AllowPNG /> </o:OfficeDocumentSettings> </xml><![endif]--></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><img src=\"files/news/normal/struktur_DLH.jpg\" alt=\"\" />&nbsp;</span></p>\r\n<p style=\"text-align: center;\"><!--[if gte mso 9]><xml> <w:WordDocument> <w:View>Normal</w:View> <w:Zoom>0</w:Zoom> <w:TrackMoves /> <w:TrackFormatting /> <w:PunctuationKerning /> <w:ValidateAgainstSchemas /> <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid> <w:IgnoreMixedContent>false</w:IgnoreMixedContent> <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText> <w:DoNotPromoteQF /> <w:LidThemeOther>IN</w:LidThemeOther> <w:LidThemeAsian>X-NONE</w:LidThemeAsian> <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript> <w:Compatibility> <w:BreakWrappedTables /> <w:SnapToGridInCell /> <w:WrapTextWithPunct /> <w:UseAsianBreakRules /> <w:DontGrowAutofit /> <w:SplitPgBreakAndParaMark /> <w:EnableOpenTypeKerning /> <w:DontFlipMirrorIndents /> <w:OverrideTableStyleHps /> </w:Compatibility> <m:mathPr> <m:mathFont m:val=\"Cambria Math\" /> <m:brkBin m:val=\"before\" /> <m:brkBinSub m:val=\"&#45;-\" /> <m:smallFrac m:val=\"off\" /> <m:dispDef /> <m:lMargin m:val=\"0\" /> <m:rMargin m:val=\"0\" /> <m:defJc m:val=\"centerGroup\" /> <m:wrapIndent m:val=\"1440\" /> <m:intLim m:val=\"subSup\" /> <m:naryLim m:val=\"undOvr\" /> </m:mathPr></w:WordDocument> </xml><![endif]--><!--[if gte mso 9]><xml> <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\r\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"267\"> <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\" /> <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\" /> <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\" /> <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\" /> <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\" /> <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\" /> <w:LsdException Locked=\"false\" Priority=\"1\" Name=\"Default Paragraph Font\" /> <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\" /> <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\" /> <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\" /> <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\" /> <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\" /> <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\" /> <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\" /> <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\" /> <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\" /> <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\" /> <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\" /> <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\" /> <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\" /> <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\" /> <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\" /> <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\" /> <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\" /> <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\" /> </w:LatentStyles> </xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:\"Calibri\",\"sans-serif\";}\r\n</style>\r\n<![endif]--> &nbsp;&nbsp;&nbsp;\r\n<table border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"font-size: small;\">a.</span></td>\r\n<td><span style=\"font-size: small;\">Kepala Dinas &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:&nbsp;</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Arif Prastowo, S.Sos, M.Si&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">b.</span></td>\r\n<td><span style=\"font-size: small;\">Sekretaris Dinas</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Taufiq Amrullah, ST, MM</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">c.</span></td>\r\n<td><span style=\"font-size: small;\">Kepala Bidang Tata Lingkungan</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;RR Heni Hernawati, SP, M.Si</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">d.</span></td>\r\n<td><span style=\"font-size: small;\">Kepala Bidang Pengawasan &amp; Pengendalian</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Tristijanti, SIP, M.Si</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">e.</span></td>\r\n<td><span style=\"font-size: small;\">Kasubbag. Umum &amp; Kepegawaian</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Herri Setyowati, SH</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">f.</span></td>\r\n<td><span style=\"font-size: small;\">Kasubbag. Perencanaan &amp; Keuangan</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Harliantoro, S.Si</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">g.</span></td>\r\n<td><span style=\"font-size: small;\">Kasie. Pelestarian Lingkungan &amp; Peningkatan Kapasitas</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Rita Kusmiyati, SSi</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">h.</span></td>\r\n<td><span style=\"font-size: small;\">Kasie. Perencanaan &amp; Pengkajian Lingkungan</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Endratma Susila Rahmadi, S.Si</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">i.</span></td>\r\n<td><span style=\"font-size: small;\">Kasie. Pengawasan &amp; Penaatan</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:&nbsp;</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Rin Dwari Widi Astuti, ST</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: right;\"><span style=\"font-size: small;\">j.</span></td>\r\n<td><span style=\"font-size: small;\">Kasie. Pengendalian Pencemaran &amp; Kerusakan Lingkungan</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;:</span></td>\r\n<td><span style=\"font-size: small;\">&nbsp;Kahar, AMKL</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>', ''),
(37, 'PROFIL PEGAWAI DLH KULON PROGO TAHUN 2019', '<p><img src=\"files/news/normal/output-onlinejpgtools_(4).jpg\" alt=\"\" /></p>', '');
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(16, 'Informasi Berkala', '<p style=\"text-align: justify;\"><span style=\"font-family: webdings; font-size: medium;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: medium;\">Laman ini memuat dokumen-dokumen perencanaan yang disusun Dinas Lingkungan Hidup Kulon Progo dan laporan-laporan berkala, antara lain :</span><br /></span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: webdings; font-size: medium;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"> </span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-size: small;\"><span style=\"font-size: xx-small;\"><span style=\"font-size: small;\"><span style=\"font-family: webdings;\"><span style=\"font-family: arial;\"><span style=\"font-family: arial;\"><span style=\"font-family: helvetica; font-size: small;\"> \r\n<table id=\"_mc_tmp\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"text-align: center;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">No</span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Nama Dokumen</span></span></span></td>\r\n<td>\r\n<p><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp; &nbsp; </span></span></span></p>\r\n<p><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp; &nbsp; &nbsp; Hardcopy&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></span></p>\r\n</td>\r\n<td>\r\n<p><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Download&nbsp;</span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: left;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">1</span></span></span></span></td>\r\n<td style=\"text-align: left;\"><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><strong><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Rencana Strategis Dinas Lingkungan Hidup Kabupaten Kulon Progo Periode 2017 - 2022</span></span></span></strong></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">&nbsp;Ada</span></span></span></span></span></td>\r\n<td style=\"text-align: left;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">&nbsp; <a href=\"files/Renstra%20DLH%202017-2022%20Final.pdf\"><span style=\"font-size: x-small;\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></a></span></span></span></span></span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">2</span></span></span></td>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Indikator Kinerja Utama (IKU) 2019</span></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Ada</span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><a href=\"files/IKU%20DLH%202019.pdf\"><span style=\"color: #0000ff;\">Download</span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">3</span></span></span></td>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Laporan Keuangan Semester I Tahun 2019</span></span></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Ada</span></span></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><a href=\"files/LAP%20KEU%20DLH%202019%20Sem%201_compressed.pdf\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Download</span></span></a></span></span></span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">4</span></span></span></td>\r\n<td><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Laporan Keuangan 2018 (Audited)</span></span></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Ada</span></span></span></span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><a href=\"files/LAP%20KEU%20DLH%202018%20on%20face_compressed.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Download</span></span></span></a></span></span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"color: #0000ff; font-size: x-small;\"><span style=\"font-size: x-small;\">5</span></span></td>\r\n<td><span style=\"color: #0000ff; font-size: x-small;\"><span style=\"font-size: x-small;\">Profil Kinerja 2018</span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"color: #0000ff; font-size: x-small;\"><span style=\"font-size: x-small;\">Ada</span></span></td>\r\n<td style=\"text-align: center;\"><span style=\"color: #0000ff; font-size: x-small;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Profil%20Kinerja%20DLH%202018.pdf\"><span style=\"font-size: x-small;\">Download</span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: xx-small;\">6</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: small;\">Rencana Kerja TA 2020</span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/ranc%20akhir%20renja%202020%20DLH.pdf\"><span style=\"font-size: small;\">Download</span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: xx-small;\">7</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\">Rencana Kerja 2019 (Perubahan)</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\">Ada</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/files/renja%202019%20perubahan%20DLH.pdf\">Download</a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: xx-small;\">8</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Rencana Kerja Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2018</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/Renja%202018%20DLH%20Kulon%20Progo.compressed.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: xx-small;\">9</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><strong><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"font-size: small;\">Rencana Kerja TA. 2019</span></strong></span></strong></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/Renja%202019%20ranc%20akhir%20lengkap.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: xx-small;\">10</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\">Perjanjian Kinerja Eselon 2 TA 2019</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\">Ada</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><a href=\"files/PERJANJIAN%20KINERJA%20(PK)%20TAHUN%202019%20Esl%202.pdf\">Download</a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\">11</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\">Perjanjian Kinerja Eselon 3 TA 2019</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\">Ada</span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><a href=\"files/PK%20Esl%203%202019.pdf\">Download</a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">12</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Perjanjian Kinerja Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2018</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/PERJANJIAN%20KINERJA%20(PK)%20TAHUN%202018%20Esl%202-converted.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">13</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Perjanjian Kinerja (Perubahan) Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2017</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/PERJANJIAN%20KINERJA%20PERUBAHAN%20TAHUN%202017%20Esl%202-converted.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: left;\">\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">14</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Rencana Kinerja Tahunan Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2018</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: small;\">15</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Program dan Kegiatan DLH Kabupaten Kulon Progo Tahun 2018</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><a href=\"files/PROGRAM%20dan%20KEGIATAN%20DINAS%20LINGKUNGAN%20HIDUP%20KABUPATEN%20KULON%20PROGO%202018-converted.pdf\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: small;\">16</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Rencana Kinerja Tahunan Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2017</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/RKT%202017.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: small;\">17</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Rencana Aksi Kinerja Tahunan Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2018</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">18</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Rencana Aksi Kinerja Tahunan Dinas Lingkungan Hidup Kabupaten Kulon Progo TA. 2017</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/RKT%202017.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">19</span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Laporan Kinerja Instansi Pemerintah (LKjIP) Dinas Lingkungan Hidup TA.2017</span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/Revisi%20LKjIP%202017%20DLH-Irda%20DIY.pdf\">Download</a></span></span></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">20</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><strong><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Laporan Keuangan Tahun Anggaran 2017 (audited)</span></span></strong></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/LAP%20KEU%20DLH%20SEM%202%20AUDITED.pdf\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">21</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Indikator Kinerja Utama Dinas Lingkungan Hidup TA. 2018</span></span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></span></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;22</span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Indikator Kinerja Utama DinasLingkungan Hidup TA. 2017</span></span></span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/IKU%202017.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">23</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah (DIKPLHD) 2017 Kulon Progo(Buku I)&nbsp;</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><a href=\"files/BUKU%20I%20DIKPLHD%20KULON%20PROGO%202017.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">24</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">DIKPLHD 2017 Kulon Progo (Buku II halaman 1-60)</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/BUKU%20II%20DIKPLHD%20KULON%20PROGO%202017-pages-1-60.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;25</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">DIKPLHD 2017 Kulon Progo (Buku II halaman 61-120)</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/BUKU%20II%20DIKPLHD%20KULON%20PROGO%202017-pages-61-120.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;26</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">DIKPLHD 2017 Kulon Progo (Buku II halaman 121-197)</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/BUKU%20II%20DIKPLHD%20KULON%20PROGO%202017-pages-121-197.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;27</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah Kab.Kulon Progo Tahun 2016 (Buku I)</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/BUKU%20I%20DIKPLHD%20Kab.%20Kulon%20Progo%202016.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;28</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah Kab. Kulon Progo 2016 (Buku II)</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;Ada</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;<a href=\"files/BUKU%20II%20DIKPLHD%20Kab.%20Kulon%20Progo%202016.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></span></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;29</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Laporan Keuangan TA 2016 (Audited)</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><a href=\"files/LapKeu%202016%20Lengkap.pdf\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;30</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Profil Kinerja Kantor Lingkungan Hidup TA. 2016</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><a href=\"files/Profil%202016.pdf\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;31</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Laporan Sistem Pengendalian Intern Pemerintah KLH TA.2016</span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><a href=\"files/Laporan%20SPIP%20KLH%202016.pdf\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></span></span></a></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-family: helvetica; font-size: x-small;\">32</span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Standar Operasional Prosedur (SOP) Pengumpulan Data Kinerja DLH</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><a href=\"files/SOP%20Pengumpulan%20Data%20Kinerja%20DLH.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></span></a></span></h4>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h4><span style=\"font-size: xx-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">&nbsp;33</span></span></span></span></h4>\r\n</td>\r\n<td>\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Standar Operasional Prosedur (SOP) Evaluasi Kinerja DLH</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Ada</span></span></span></span></h4>\r\n</td>\r\n<td style=\"text-align: center;\">\r\n<h4><a href=\"files/SOP%20evaluasi%20kinerja%20DLH.pdf\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">Download</span></span></span></span></a></h4>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</span></span></span></span></span></span></span></span></p>\r\n<ul id=\"sidebarmenu4\" style=\"padding: 0px; margin: 0px; color: #4284b0; list-style-type: none; z-index: 999;\">\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999;\"><br /></li>\r\n</ul>', ''),
(17, 'Informasi Serta merta', '<p style=\"text-align: justify;\"><strong><span style=\"font-family: helvetica; font-size: small;\">Peringatan hari- hari yang berkaitan dengan lingkungan hidup:</span></strong></p>\r\n<p style=\"text-align: justify;\">\r\n<table id=\"_mc_tmp\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><strong><span style=\"font-family: helvetica; font-size: small;\">Tanggal-Bulan<span style=\"white-space: pre;\"> </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></strong></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\"><strong>&nbsp;Jenis Peringatan </strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;10 Januari</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Sejuta Pohon</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;02 Februari</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Lahan Basah</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;21 Februari</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Peduli Sampah</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;20 Maret</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Kehutanan Sedunia</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;22 Maret</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Air</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;22 April</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Bumi</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;22 Mei</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Keanekaragaman Hayati</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;23 Mei&nbsp;</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Penyu Sedunia</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;05 Juni&nbsp;</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Lingkungan Hidup Sedunia</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;16 September</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;hari Ozon Internasional</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;05 Oktober</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Habitat</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;05 November</span></td>\r\n<td><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Hari Cinta Puspa dan Satwa Nasional</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<hr style=\"text-align: justify;\" />\r\n<p style=\"text-align: justify;\"><strong><span style=\"font-family: helvetica; font-size: small;\">&nbsp;DAFTAR LABORATORIUM PENGUJI KUALITAS LINGKUNGAN DI DIY</span></strong></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">1. BBTKL-PPM Yogyakarta di Wiyoro Lor, untuk uji limbah cair, udara, kebisingan dan getaran</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">2. Balai Laboratorium Kesehatan (BLK) Yogyakarta di Jl. Ngadinegaran, Yogyakarta; untuk ujiAir bersih</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">3. Balai Hiperkes dan Keselamatan Kerja di Jl. Ireda, Yogyakarta; untuk uji Kualitas udara</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">4. Laboratorium Kimia Analitik BATAN di Jl. Babarsari; untuk logam</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">5. Laboratorium Pengujian dan Penelitian Terpadu (LPPT) UGM; untuk limbah cair</span></p>', ''),
(18, 'SPPL ', '<p style=\"text-align: justify;\"><span style=\"font-family: arial;\"><span style=\"font-family: helvetica; font-size: small;\">Surat Pernyataan Kesanggupan Pengelolaan dan Pemantauan Lingkungan Hidup (SPPL) merupakan pernyataan kesanggupan dari penanggung jawab usaha dan/ atau kegiatan untuk melakukan pengelolaan dan pemantauan lingkungan hidup atas dampak lingkungan hidup dari usaha dan/ atau kegiatan yang tidak wajib Amdal maupun UKL-UPL. </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial;\"><span style=\"font-family: helvetica; font-size: small;\">Yang harus dipahami adalah bahwa SPPL ini bukan merupakan izin dari suatu usaha dan/ atau kegiatan, tetapi dapat digunakan sebagai prasyarat dari suatu perizinan. Sebagai contoh, SPPL dijadikan syarat dalam pengajuan Izin Gangguan, Izin Mendirikan Bangunan dan izin lainnya.&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial;\"><span style=\"font-family: helvetica; font-size: small;\">Formulir SPPL secara lengkap dapat dilihat diunduh pada link berikut ini:</span></span></p>\r\n<p><span style=\"font-family: helvetica; color: #3366ff; font-size: x-small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Form-%20SPPL%20kosong%20DLHKP%20th%202019%20dan%20Surat%20Pernyataan%20.docx\">DOWNLOAD FORMULIR SPPL</a></span></span></span></strong></span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><strong><span style=\"font-size: small;\">PETUNJUK SINGKAT PENGISIAN</span></strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Halaman 1:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Pada halaman pertama tersebut dapat diisikan jenis dampak yang ditimbulkan lebih dari satu macam. demikian juga dengan rencana pengelolaan dan pemantauannya dapat diisi lebih dari form yang ada.&nbsp;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Halaman 2:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Berisi tandatangan pemrakarsa yang bermaterai 6000. Bagian ini tidak selalu berada di halaman ke dua tetapi disesuaikan dengan banyaknya isian yang ada di halaman pertama tadi.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small; font-weight: bold;\">Lampiran:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><strong></strong>Apabila mencukupi dapat digambarkan dalam satu halaman ini, tetapi apabila tidak mencukupi maka dapat dipisahkan antara denah lokasi; dan lay out lokasi usaha/ kegiatan.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><strong>CATATAN</strong>: Informasi lebih lanjut dapat menghubungi Kantor Dinas Lingkungan Hidup Kulon Progo atau melalui Stand Layanan Perizinan DLH di Mal Pelayanan Publik (MPP) Kulon Progo</span></p>', ''),
(19, 'AMDAL', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Analisis Mengenai Dampak Lingkungan (AMDAL) merupakan kajian mengenai dampak penting suatu Usaha dan/ atau Kegiatan yang direncanakan pada lingkungan hidup yang diperlukan bagi proses pengambilan keputusan tentang penyelenggaraan Usaha dan/ atau Kegiatan. Hal ini berarti setiap usaha kegiatan yang berdampak penting wajib memiliki Amdal. Amdal disusun oleh pemrakarsa pada saat masih berada pada tahapan perencanaan. Berbeda dengan peraturan sebelumnya, saat ini Amdal terdiri dari 3 (tiga ) jenis dokumen, yaitu: 1) Kerangka Acuan (KA); Amdal dan RKL-RPL.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Penentuan jenis usaha dan/ atau kegiatan yang wajib memiliki Amdal dapat dilihat dalam Peraturan Menteri Lingkungan Hidup No. 5 Tahun 2012. Salah satu contoh dalam penentuan kriteria wajib Amdal dapat dilihat dalam Lampiran I Permen tersebut, misalnya dalam bidang multisektor: Pembangunan bangunan gedung dengan luas lahan lebih dari atau sama dengan 5 ha atau luas bangunan lebih dari atau sama dengan 10.000 m<sup>2 </sup>maka wajib memiliki Amdal.&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Sebagai informasi tambahan bahwa saat ini apabila terdapat usaha dan/ atau kegiatan yang wajib Amdal di Kulon Progo, proses penilaiannya dilaksanakan oleh Komisi Penilai Amdal DIY yang bersekretariat di Badan Lingkungan Hidup Daerah Istimewa Yogyakarta. Salah satu contoh kegiatan yang wajib Amdal yaitu kegiatan Pengembangan Kampus UNY yang berada di Wates</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">&nbsp;</span></span></p>', ''),
(24, 'Daftar Peraturan Terkait LH', '<p><strong><span style=\"text-decoration: underline;\">Undang- Undang</span></strong></p>\r\n<p>1. UU No. 32 Tahun 2009 tentang Perlindungan dan Pengelolaan Lingkungan Hidup</p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Peraturan Pemerintah</span></strong></p>\r\n<p>1. PP No. 27 Tahun 2012 tentang Izin Lingkungan</p>\r\n<p>2. PP No. 101 Tahun 2014 tentang Pengelolaan Limbah B3 <a href=\"files/PP%20Nomor%20101%20Tahun%202014.pdf\">(Download)</a></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Peraturan Menteri LH</span></strong></p>\r\n<p>1. Permen LH No. 16 Tahun 2012 tentang Pedoman Penyusunan Dokumen Lingkungan Hidup</p>\r\n<p>2. Permen LH No. 5 Tahun 2012 tentang Jenis Rencana Usaha dan/ atau Kegiatan yang Wajib Memiliki Amdal</p>\r\n<p>3. Permen LH No. 14 tahun 2013 tentang Simbol dan Label LB3&nbsp;</p>\r\n<p>4. Permen LH No. 30 tahun 2009 tentang Tata Laksana Perizinan LB3 <a href=\"files/PermenLH%20No.30%20tahun%202009%20Tata%20laksana%20perizinan%20LB3.pdf\">(Download)</a></p>\r\n<p>5. Permen LH No. 05 tahun 2013 tentang Pedoman Pelaksanaan Program Adiwiyata <a href=\"http://klh.kulonprogokab.go.id/files/PermenLH%2005%20tahun%202013%20Pedoman%20Adiwiyata.pdf\" target=\"_blank\">(Download)</a></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Kepka Bapedal</span></strong></p>\r\n<p>1. Kepka Bapedal No. 1 tahun 1995 tentang Tata Cara dan Persyaratan teknis Penyimpanan dan Pengumpulan LB3 <a href=\"files/Kepka%20Bapedal%20No.01%20Tahun%201995%20tatacara%20%20pengumpulan%20limbah%20B3.pdf\">(Download)</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Peraturan Daerah Kulon Progo</span></strong></p>\r\n<p>1. Perda KP No. 1 Tahun 2013 tentang Penyelenggaraan Pengelolaan Sampah Rumah Tangga dan Sampah Sejenis Sampah Rumah Tangga (<a href=\"files/Perda%20KP%20No.%201%20Tahun%202013%20tentang%20Penyelenggaraan%20Pengelolaan%20Sampah%20Rumah%20Tangga%20dan%20Sampah%20Sejenis%20Sampah%20Rumah%20Tangga\">Download</a>)</p>\r\n<p>&nbsp;</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Peraturan Bupati Kulon Progo</span></strong></p>\r\n<p>1. Perbup KP No. 22 Tahun 2014 tentang Pedoman Penerbitan Izin Lingkungan (<a href=\"files/Perbup%20KP%20No.%2022%20Tahun%202014%20tentang%20Pedoman%20Penerbitan%20Izin%20Lingkungan.pdf\">Download</a>)</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '');
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(21, 'Data Aduan Pencemaran atau Kerusakan Lingkungan Hidup', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', ''),
(22, 'Data Jumlah Izin Lingkungan / Dokumen Lingkungan Tahun 2014 - 2015', '<p>&nbsp;</p>\r\n<p>\r\n<table id=\"_mc_tmp\" style=\"height: 20px;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><strong><span style=\"font-size: small;\">Tahun 2015 &nbsp; </span>&nbsp; &nbsp; &nbsp;&nbsp;</strong></td>\r\n<td>&nbsp;</td>\r\n<td><br /></td>\r\n<td><br /></td>\r\n<td><br /></td>\r\n<td><br /></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><em>Jenis/Bulan</em></td>\r\n<td><em>1 &nbsp; &nbsp;</em></td>\r\n<td><em>2 &nbsp; &nbsp;</em></td>\r\n<td><em>3 &nbsp; &nbsp;</em></td>\r\n<td><em>4 &nbsp; &nbsp;</em></td>\r\n<td><em>5 &nbsp; &nbsp;</em></td>\r\n<td><em>6 &nbsp; &nbsp;</em></td>\r\n<td><em>7 &nbsp; &nbsp;</em></td>\r\n<td><em>8 &nbsp; &nbsp;</em></td>\r\n<td><em>9 &nbsp; &nbsp;</em></td>\r\n<td><em>10 &nbsp;&nbsp;</em></td>\r\n<td><em>11 &nbsp;&nbsp;</em></td>\r\n<td><em>12 &nbsp; &nbsp; &nbsp;&nbsp;</em></td>\r\n<td><em><strong>Jumlah</strong></em></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"text-decoration: underline;\"><strong><a href=\"index.php?pilih=hal&amp;id=18\">SPPL</a></strong></span></td>\r\n<td><strong><span style=\"text-decoration: underline;\">27</span></strong></td>\r\n<td><span style=\"text-decoration: underline;\"><strong>23</strong><strong></strong></span></td>\r\n<td><strong><span style=\"text-decoration: underline;\">23<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">24<strong></strong></span></strong></td>\r\n<td><span style=\"text-decoration: underline;\"><strong>12</strong><strong><strong></strong></strong></span></td>\r\n<td><strong><span style=\"text-decoration: underline;\">16<strong><strong></strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">9<strong><strong></strong></strong></span></strong></td>\r\n<td><span style=\"text-decoration: underline;\"><strong>17</strong><strong><strong></strong></strong></span></td>\r\n<td><span style=\"text-decoration: underline;\">-<strong><strong></strong></strong></span></td>\r\n<td><span style=\"text-decoration: underline;\">-<strong><strong></strong></strong></span></td>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">-</span></strong></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">-</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">151</span></strong></td>\r\n</tr>\r\n<tr>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">UKL-UPL/DPLH</span></strong></strong></td>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">3</span></strong></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\"><strong>2</strong><strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">10<strong></strong></span></strong></td>\r\n<td><span style=\"text-decoration: underline;\"><strong>6</strong><strong></strong></span></td>\r\n<td><strong><span style=\"text-decoration: underline;\"><strong>11</strong><strong></strong></span></strong></td>\r\n<td>\r\n<p><strong><span style=\"text-decoration: underline;\">2</span></strong></p>\r\n</td>\r\n<td><strong><span style=\"text-decoration: underline;\">0<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">-<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">-<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">-<strong></strong></span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">-</span></strong></td>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">34</span></strong></strong></td>\r\n</tr>\r\n<tr>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">Amdal</span></strong></strong></td>\r\n<td><strong><strong><span style=\"text-decoration: underline;\">0</span></strong></strong></td>\r\n<td style=\"text-align: left;\"><strong><strong><span style=\"text-decoration: underline;\">1</span></strong></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td><strong><span style=\"text-decoration: underline;\">0</span></strong></td>\r\n<td>-</td>\r\n<td>-</td>\r\n<td>-</td>\r\n<td>-</td>\r\n<td><strong>1</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"text-decoration: underline;\"><strong>Jenis Usaha/ Kegiatan yang telah memiliki Izin Lingkungan (2015)</strong></span></p>\r\n<p>1. Puskesmas Sentolo</p>\r\n<p>2. Puskesmas Wates</p>\r\n<p>3. Pembangunan dan Operasional SPAM IKK Samigaluh</p>\r\n<p>4. Puskesmas Kalibawang</p>\r\n<p>5. Klinik Pratama PKU Muh.Yogyakarta Unit Wates</p>\r\n<p>6. Rencana Pembangunan Fly Over Sentolo</p>\r\n<p>7. Puskesmas Kokap I</p>\r\n<p>8. Puskesmas Lendah II</p>\r\n<p>9. Puskesmas Pengasih II</p>\r\n<p>10. RSUD wates</p>\r\n<p>11. CV. Sarana Karya</p>\r\n<p>12. CV. Muncul Karya</p>\r\n<p>13. Puskesmas Galur I</p>\r\n<p>14. Puskesmas Samigaluh I</p>\r\n<p>15. RSU PKU Muh. Nanggulan</p>\r\n<p>16. Puskesmas Nanggulan</p>\r\n<p>17. Puskesmas Kokap II</p>\r\n<p>18. Puskesmas Girimulyo I</p>\r\n<p>19. Puskesmas Panjatan I</p>\r\n<p>20. Klinik Ibu dan Anak Bethesda Maranatha</p>\r\n<p>21. PT. Hasta Reksa Manunggal</p>\r\n<p>22. PT. Jaya Makmur Prayoga Sentausa</p>\r\n<p>23. Puskesmas Girimulyo II</p>\r\n<p>24. Puskesmas Sentolo I</p>\r\n<p>25. Puskesmas Temon I</p>\r\n<p>26. Puskesmas Samigaluh I</p>\r\n<p>27. Opersional Menara Telekomunikasi PT. Telkomsel (Kalibawang)</p>\r\n<p>28. Opersional Menara Telekomunikasi PT. Telkomsel (Pengasih)</p>\r\n<p>29. Klinik Pratama Kartika 0731 Kulon Progo</p>\r\n<p>30. Laboratorium Klinik Cito</p>\r\n<p>31. Puskesmas Temon II</p>\r\n<p>32. BPRB Citra Paramedika</p>\r\n<p>33. Pembangunan Gedung SatpolPP</p>\r\n<p>34. Pengembangan Dermaga Klepu</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;Data Izin Penyimpanan Sementara Limbah B3 2015</strong></p>\r\n<p>1. RSU PKU Muhammadiyah Nanggulan</p>\r\n<p>2. RSU Kharisma Paramedika</p>', ''),
(25, 'Upaya Pengelolaan Lingkungan dan Upaya Pemantauan Lingkungan Hidup ( UKL-UPL )', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">UKL- UPL merupakan pengelolaan dan pemantauan terhadap usaha dan/ atau kegiatan yang tidak berdampak penting terhadap lingkungan hidup, yang diperlukan bagi proses pengambilan keputusan tentang penyelenggaraan usaha dan/ atau kegiatan. Dokumen ini menjadi salah satu persyaratan dalam mengajukan Izin Lingkungan. Sesuai dengan Pedoman Penyusunan Dokumen Lingkungan (Lampiran IV, Permen LH No. 16 tahun 2012), formulir UKL- UPL memuat tentang:</span></span></p>\r\n<ol style=\"text-align: justify;\">\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">identitas pemrakarsa</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">rencana usaha dan/ atau kegiatan</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">dampak lingkungan yang akan terjadi, dan program pengelolaan serta pemantauan lingkungan</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">jumlah dan jenis izin Perlindungan dan Pengelolaan Lingkungan Hidup yang dibutuhkan</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">pernyataan komitmen pemrakarsa untuk melaksanakan ketentuan yang tercantum dalam UKL- UPL</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">daftar pustaka</span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">lampiran- lampiran</span></span></li>\r\n</ol>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">&nbsp;Formulir UKL-UPL dapat didownload pada link berikut ini:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span><a style=\"font-family: helvetica; font-size: small;\" href=\"files/Form%20Pedoman%20Penyusunan%20UKl-UPL.docx\"><strong>(Download Form UKL-UPL)</strong></a></p>\r\n<div style=\"text-align: justify;\"></div>\r\n<div style=\"text-align: justify;\"><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">PEDOMAN PENGISIAN FORMULIR UKL-UPL</span></span></strong></div>\r\n<div style=\"text-align: justify;\">\r\n<div style=\"text-align: justify;\"><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">A. Identitas Pemrakarsa</span></span></strong></div>\r\n<div style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\">1.Nama Pemrakarsa *)</span></span></div>\r\n<div style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">2.Alamat Kantor, kode pos, No. Telp dan Fax. email.</span></span></div>\r\n<div style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">*) Harus ditulis dengan jelas identitas pemrakarsa, termasuk institusi dan orang yang bertangggung jawab atas rencana kegiatan yang diajukannya.</span></span></div>\r\n<div style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Jika tidak ada nama badan usaha/instansi pemerintah, hanya ditulis nama pemrakarsa (untuk perseorangan)</span></span></div>\r\n</div>\r\n<div style=\"text-align: justify;\">\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">B. Rencana Usaha dan/atau Kegiatan</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">1.<strong>Nama Rencana Usaha dan/atau Kegiatan</strong></span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><strong>2.<strong>Lo</strong></strong><strong>kasi</strong> rencana usaha dan/atau kegiatan dan dilampirkan peta yang sesuai dengan kaidah kartografi &nbsp; dan/atau ilustrasi lokasi dengan skala yang memadai.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><strong>3.<strong>Sk</strong></strong><strong>ala/Besaran rencana usaha dan/atau Kegiatan</strong></span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Keterangan:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Tuliskan ukuran luasan dan atau panjang dan/atau volume dan/atau kapasitas atau besaran lain yang dapat digunakan untuk memberikan gambaran tentang skala kegiatan. Sebagai contoh antara lain:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">1. Bidang Industri: jenis dan kapasitas produksi, jumlah bahan baku dan penolong, jumlah penggunaan &nbsp; &nbsp; energi dan jumlah penggunaan air</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">2. Bidang Pertambangan: luas lahan, cadangan dan kualitas bahan tambang, panjang dan luas lintasan &nbsp; &nbsp; uji seismik dan jumlah bahan peledak</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">3. Bidang Perhubungan: luas, panjang dan volume fasilitas perhubungan yang akan dibangun, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kedalaman tambatan dan bobot kapal sandar dan ukuran-ukuran lain yang sesuai dengan bidang &nbsp; &nbsp; &nbsp; &nbsp; perhubungan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">4. Pertanian: luas rencana usaha dan/atau kegiatan, kapasitas unit pengolahan, jumlah bahan baku &nbsp; &nbsp; &nbsp; &nbsp; dan penolong, jumlah penggunaan energi dan jumlah penggunaan air</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">5. Bidang Pariwisata: luas lahan yang digunakan, luas fasiltas pariwisata yang akan dibangun, jumlah &nbsp; &nbsp; &nbsp;kamar, jumlah mesin laundry, jumlah hole, kapasitas tempat duduk tempat hiburan dan jumlah &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kursi restoran</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">6. Bidang-bidang lainnya&hellip;</span></span></div>\r\n<div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">4. Garis besar komponen rencana usaha dan/atau kegiatan</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Pada bagian ini pemrakarsa menjelaskan:</span></span></div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">a. Kesesuaian lokasi rencana kegiatan dengan tata ruang</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Bagian ini menjelaskan mengenai Kesesuaian lokasi rencana usaha dan/atau kegiatan dengan rencana tata ruang sesuai ketentuan peraturan perundangan. Informasi kesesuaian lokasi rencana usaha dan/atau kegiatan dengan rencana tata ruang seperti tersebut di atas dapat disajikan dalam bentuk peta tumpang susun (overlay) antara peta batas tapak proyek rencana usaha dan/atau kegiatan dengan peta RTRW yang berlaku dan sudah ditetapkan (peta rancangan RTRW tidak dapat dipergunakan).</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Berdasarkan hasil analisis spasial tersebut, pemrakarsa selanjutnya menguraikan secara singkat dan menyimpulkan kesesuaian tapak proyek dengan tata ruang apakah seluruh tapak proyek sesuai dengan tata ruang, atau ada sebagian yang tidak sesuai, atau seluruhnya tidak sesuai. Dalam hal masih ada hambatan atau keragu-raguan terkait informasi kesesuaian dengan RTRW, maka pemrakarsa dapat meminta bukti formal/fatwa dari instansi yang bertanggung jawab di bidang penataan ruang seperti BKPTRN atau BKPRD. Bukti-bukti yang mendukung kesesuaian dengan tata ruang wajib dilampirkan.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Jika lokasi rencana usaha/atau kegiatan tersebut tidak sesuai dengan rencana tata ruang, maka formulir UKL-UPL tersebut tidak dapat diproses lebih lanjut sesuai dengan ketentuan pasal 14 ayat (3) PP No. 27 Tahun 2012.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Disamping itu, untuk jenis rencana usaha dan/atau kegiatan tertentu, pemrakarsa harus melakukan analisis spasial kesesuaian lokasi rencana usaha dan/atau kegiatan dengan peta indikatif penundaan izin baru (PIPIB) yang tercantum dalam Inpres Nomor 10 Tahun 2011, atau peraturan revisinya maupun terbitnya ketentuan baru yang mengatur mengenai hal ini.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Berdasarkan hasil analisis spatial tersebut, pemrakarsa dapat menyimpulkan apakah lokasi rencana usaha dan/atau kegiatan tersebut berada dalam atau di luar kawasan hutan alam primer dan lahan gambut yang tercantum dalam PIPIB. Jika lokasi rencana usaha/atau kegiatan tersebut berada dalam PIPIB, kecuali untuk kegiatan-kegiatan tertentu yang dikecualikan seperti yang tercantum dalam Inpres Nomor 10 Tahun 2011, maka formulir UKL-UPL tersebut tidak dapat diproses lebih lanjut. Kesesuaian terhadap lokasi rencana usaha dan atau kegiatan berdasarkan peta indikatif penundaan izin baru (PIPIB) yang tercantum dalam Inpres Nomor 10 Tahun 2011, berlaku selama 2 (dua) tahun terhitung sejak Instruksi Presiden ini dikeluarkan.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><strong>b</strong>.<strong> Penjelasan mengenai persetujuan prinsip atas rencana kegiatan</strong></span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Bagian ini menguraikan perihal adanya persetujuan prinsip yang menyatakan bahwa jenis usaha kegiatan tersebut secara prinsip dapat dilakukan dari pihak yang berwenang. Bukti formal atas persetujuan prinsip tersebut wajib dilampirkan.</span></span></div>\r\n</div>\r\n<div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><strong>c.</strong> <strong>Uraian mengenai komponen rencana kegiatan yang dapat menimbulkan dampak lingkungan</strong></span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Dalam bagian ini, pemrakarsa menuliskan komponen-komponen rencana usaha dan/atau kegiatan yang diyakini dapat menimbulkan dampak terhadap lingkungan. Uraian tersebut dapat menggunakan tahap pelaksanaan proyek, yaitu tahap pra-konstruksi, kontruksi, operasi dan penutupan/pasca operasi. Tahapan proyek tersebut disesuaikan dengan jenis rencana usaha dan/ atau kegiatan</span></span></div>\r\n</div>\r\n<div>\r\n<div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">C. Dampak Lingkungan yang Ditimbulkan dan Upaya Pengelolaan Lingkungan Hidup serta Upaya Pemantauan Lingkungan Hidup</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Bagian ini pada dasarnya berisi satu tabel/matriks, yang merangkum mengenai:</span></span></div>\r\n</div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">1. Dampak lingkungan yang ditimbulkan rencana usaha dan/atau kegiatan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Kolom Dampak Lingkungan terdiri atas empat sub kolom yang berisi informasi:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>a. sumber dampak, yang diisi dengan informasi mengenai jenis sub kegiatan penghasil dampak <span style=\"white-space: pre;\"> </span>untuk setiap tahapan kegiatan (pra-kontruksi, konstruksi, operasi dan pasca operasi);</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>b. jenis dampak, yang diisi dengan informasi tentang seluruh dampak lingkungan yang mungkin <span style=\"white-space: pre;\"> </span>timbul dari kegiatan pada setiap tahapan kegiatan; dan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>c. besaran dampak, yang diisi dengan informasi mengenai: untuk parameter yang bersifat <span style=\"white-space: pre;\"> </span>kuantitatif, besaran dampak harus dinyatakan secara kuantitatif.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">2. Bentuk upaya pengelolaan lingkungan hidup</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Kolom Upaya Pengelolaan Lingkungan Hidup terdiri atas tiga sub kolom yang berisi informasi:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>a. bentuk Upaya Pengelolaan Lingkungan Hidup, yang diisi dengan informasi mengenai <span style=\"white-space: pre;\"> </span>bentuk/jenis pengelolaan lingkungan hidup yang direncanakan untuk mengelola setiap dampak <span style=\"white-space: pre;\"> </span>lingkungan yang ditimbulkan;</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>b. lokasi Pengelolaan Lingkungan Hidup, yang diisi dengan informasi mengenai lokasi dimana <span style=\"white-space: pre;\"> </span>pengelolaan lingkungan dimaksud dilakukan (dapat dilengkapi dengan narasi yang menerangkan <span style=\"white-space: pre;\"> </span>bahwa lokasi tersebut disajikan lebih jelas dalam peta pengelolaan lingkungan pada lampiran <span style=\"white-space: pre;\"> </span>UKL-UPL); dan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>c. periode pengelolaan lingkungan hidup, yang diisi dengan informasi mengenai waktu/periode <span style=\"white-space: pre;\"> </span>dilakukannya bentuk upaya pengelolaan lingkungan hidup yang direncanakan.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">3. Bentuk upaya pemantauan lingkungan hidup</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Kolom Upaya Pemantauan Lingkungan Hidup terdiri atas tiga sub kolom yang berisi informasi:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>a. bentuk Upaya Pemantauan Lingkungan Hidup, yang diisi dengan informasi mengenai cara, <span style=\"white-space: pre;\"> </span>metode, dan/atau teknik untuk melakukan pemantauan atas kualitas lingkungan hidup yang <span style=\"white-space: pre;\"> </span>menjadi indikator kerberhasilan pengelolaan lingkungan hidup (dapat termasuk di dalamnya: <span style=\"white-space: pre;\"> </span>metode pengumpulan dan analisis data kualitas lingkungan hidup, dan lain sebagainya);</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>b. lokasi Pemantauan Lingkungan Hidup, yang diisi dengan informasi mengenai lokasi dimana <span style=\"white-space: pre;\"> </span>pemantauan lingkungan dimaksud dilakukan (dapat dilengkapi dengan narasi yang menerangkan <span style=\"white-space: pre;\"> </span>bahwa lokasi tersebut disajikan lebih jelas dalam peta pemantauan lingkungan pada lampiran <span style=\"white-space: pre;\"> </span>UKL-UPL); dan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>c. periode pemantauan lingkungan hidup, yang diisi dengan informasi mengenai waktu/periode <span style=\"white-space: pre;\"> </span>dilakukannya bentuk upaya pemantauan lingkungan hidup yang direncanakan.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">4. Institusi pengelola dan pemantauan lingkungan hidup</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Kolom Institusi Pengelola dan Pemantauan Lingkungan Hidup, yang diisi dengan informasi mengenai berbagai institusi yang terkait dengan pengelolaan lingkungan hidup dan pemantauan lingkungan hidup yang akan:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>a. melakukan/melaksanakan pengelolaan lingkungan hidup dan pemantauan lingkungan hidup;</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>b. melakukan pengawasan atas pelaksanaan pengelolaan lingkungan hidup dan pemantauan <span style=\"white-space: pre;\"> </span>lingkungan hidup; dan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"white-space: pre;\"> </span>c. menerima pelaporan secara berkala atas hasil pelaksanaan komitmen pengelolaan lingkungan <span style=\"white-space: pre;\"> </span>hidup dan pemantauan lingkungan hidup sesuai dengan lingkup tugas instansi yang <span style=\"white-space: pre;\"> </span>bersangkutan, dan peraturan perundang-undangan yang berlaku.</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Dalam bagian ini, Pemrakarsa dapat melengkapi dengan peta, sketsa, atau gambar dengan skala yang memadai terkait dengan program pengelolaan dan pemantauan lingkungan. Peta yang disertakan harus memenuhi kaidah-kaidah kartografi.</span></span></div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">D. Jumlah dan Jenis Izin IZIN PPLH yang Dibutuhkan</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Dalam hal rencana usaha dan/atau kegiatan yang diajukan memerlukan izin PPLH, maka dalam bagian ini, pemrakarsa menuliskan daftar jumlah dan jenis izin perlindungan dan pengelolaan lingkungan hidup yang dibutuhkan berdasarkan upaya pengelolaan lingkungan hidup.</span></span></div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">E. Surat Pernyataan</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Bagian ini berisi pernyataan/komitmen pemrakarsa untuk melaksanakan UKL-UPL yang ditandatangani di atas kertas bermaterai.</span></span></div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">F. Daftar Pustaka</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Pada bagian ini utarakan sumber data dan informasi yang digunakan dalam penyusunan UKL-UPL baik yang berupa buku, majalah, makalah, tulisan, maupun laporan hasil-hasil penelitian. Bahan-bahan pustaka tersebut agar ditulis dengan berpedoman pada tata cara penulisan pustaka.</span></span></div>\r\n<div><strong><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">G. Lampiran</span></span></strong></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Formulir UKL-UPL juga dapat dilampirkan data dan informasi lain yang dianggap perlu atau relevan, antara lain:</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">1. bukti formal yang menyatakan bahwa jenis usaha kegiatan tersebut secara prinsip dapat dilakukan;</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">2. bukti formal bahwa rencana lokasi Usaha dan/atau Kegiatan telah sesuai dengan rencana tata ruang yang berlaku (kesesuaian tata ruang ditunjukkan dengan adanya surat dari Badan Koordinasi Perencanaan Tata Ruang Nasional (BKPTRN), atau instansi lain yang bertanggung jawab di bidang penataan ruang);</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">3. informasi detail lain mengenai rencana kegiatan (jika dianggap perlu);</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">4. peta yang sesuai dengan kaidah kartografi dan/atau ilustrasi lokasi dengan skala yang memadai yang menggambarkan lokasi pengelolaan lingkungan hidup dan lokasi pemantauan lingkungan hidup; dan</span></span></div>\r\n<div><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">5. data dan informasi lain yang dianggap perlu.</span></span></div>\r\n<br /></div>\r\n</div>', ''),
(26, 'Izin Lingkungan', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Izin Lingkungan adalah izin yang diberikan kepada setiap orang yang melakukan Usaha dan/ atau Kegiatan yang wajib Amdal atau UKl- UPL dalam rangka perlindungan dan pengelolaan lingkungan hidup. Izin ini menjadi prasyarat memperoleh izin usaha dan/ atau kegiatan. </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Untuk memperoleh Izin Lingkungan pemrakarsa terlebih dahulu menyusun Amdal atau UKL-UPL. Permohonan Izin Lingkungan diajukan secara tertulis kepada Bupati, bersamaan dengan pengajuan penilaian Amdal atau pemeriksaan UKL- UPL. Pengajuan Izin Lingkungan dilengkapi dengan dokumen pendirian usaha dan profil usaha.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Atas permohonan izin yang disampaikan kepada Bupati Kulon Progo Cq. Kepala Dinas Lingkungan Hidup Kabupaten Kulon Progo maka dilakukan pengumuman. Pengumuman tersebut akan diunggah melalui web site Dinas Lingkungan Hidup Kabupaten Kulon Progo.</span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">&nbsp;</span></span></p>', ''),
(27, 'Formulir Izin Lingkungan', '<p><span style=\"font-size: small;\"><br /></span></p>\r\n<ul style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\">\r\n<li style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px; color: #666666; font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\">Bagi Instansi Negeri Menggunakan Sistem Non OSS</span></span></span></span></span></li>\r\n</ul>\r\n<ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\">\r\n<li><a style=\"font-family: helvetica;\" href=\"files/SOP%20UKL%20UPL%20Non%20OSS.doc\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Standar Operasional Prosedur (SOP)</span></span></span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px; color: #666666; font-family: helvetica; font-size: small;\"><span style=\"padding: 0px; margin: 0px; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px; color: #0000ff;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Surat%20permohonan%20PENAPISAN%20jenis%20dokumen.docx\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Form Penapisan Jenis Dokumen</span></span></span></span></span></span></a></span></span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"files/Surat%20PERMOHONAN%20izin%20lingkungan.doc\"><span style=\"color: #0000ff;\">Surat Permohonan Izin Lingkungan&nbsp;(UKL-UPL)</span></a></span></span></span></span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"files/Surat%20PERMOHONAN%20izin%20lingkungan%20AMDAL.doc\"><span style=\"color: #0000ff;\">Surat Permohonan Izin Lingkungan (AMDAL)</span></a></span></span></span></span></span></li>\r\n<li style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px; color: #0000ff; font-family: helvetica; font-size: x-small;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><a href=\"files/Form%20Pedoman%20Penyusunan%20UKl-UPL.docx\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Formulir UKL-UPL</span></span></span></span></span></span></a></span></span></li>\r\n<li><a style=\"font-family: helvetica;\" href=\"files/Form%20Laporan%20UKL-UPL%20DLH%20Kulon%20Progo.docx\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Form Laporan UKL-UPL</span></span></span></span></span></span></a></li>\r\n</ol><ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\"> </ol><ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\"> </ol> \r\n<ul style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\">\r\n<li style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px; color: #666666; font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\">Bagi Instansi Swasta Menggunakan Sistem OSS</span></span></span></span></span></li>\r\n</ul>\r\n<ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span></ol><ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span></ol><ol style=\"padding: 0px 15px; margin: 10px 30px; color: #4284b0; font-family: &quot;Open Sans&quot;; font-size: 13px;\">\r\n<li><a style=\"font-family: helvetica;\" href=\"files/SOP%20UKL%20UPL%20OSS.doc\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Standar Operasional Prosedur (SOP)</span></span></span></a></li>\r\n<span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span> </span> </span>\r\n<li><a style=\"font-family: helvetica;\" href=\"https://dlh.kulonprogokab.go.id/files/Surat%20permohonan%20PENAPISAN%20jenis%20dokumen.docx\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">F<span style=\"padding: 0px; margin: 0px; color: #0000ff;\">orm Pe</span><span style=\"padding: 0px; margin: 0px; color: #0000ff;\">napisan Jenis Dokumen</span></span></span></span></a></li>\r\n<span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span> </span> </span>\r\n<li><a style=\"font-family: helvetica;\" href=\"files/Form%20Pedoman%20Penyusunan%20UKl-UPL.docx\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Formulir UKL-UPL</span></span></span></a></li>\r\n<span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><span style=\"padding: 0px; margin: 0px; color: #666666; text-decoration-line: underline;\"><span style=\"padding: 0px; margin: 0px;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-size: small;\"> </span></span></span></span></span></span> </span> </span>\r\n<li><a style=\"font-family: helvetica;\" href=\"files/Form%20Laporan%20UKL-UPL%20DLH%20Kulon%20Progo.docx\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\">Form Laporan UKL-UPL</span></span></span></a></li>\r\n</ol>', ''),
(28, 'Pengelolaan sampah- bank sampah', '<p style=\"text-align: left;\">&nbsp;</p>\r\n<p><span style=\"font-size: x-small;\"><strong>Berikut ini daftar bank sampah di Kulon Progo pada tahun 2014:&nbsp;</strong></span></p>\r\n<p>\r\n<table id=\"_mc_tmp\" style=\"border-color: #ffffff; border-width: 2px; background-color: #c4e4f1;\" border=\"2\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p><strong>No.&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n</td>\r\n<td>\r\n<p><strong>Nama Kelompok &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>\r\n</td>\r\n<td>\r\n<p><strong>Alamat &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;I</td>\r\n<td>&nbsp;</td>\r\n<td><strong>&nbsp;Pengasih &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;&nbsp;</td>\r\n<td>&nbsp;Bank Sampah Melati &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>\r\n<td>&nbsp;Kembang, Margosari, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Skansa</td>\r\n<td>&nbsp;SMKN 1 Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Barokah</td>\r\n<td>&nbsp;Sidomulyo, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Mugi Makmur</td>\r\n<td>&nbsp;Garang, Tawangsari, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Gemah Ripah</td>\r\n<td>&nbsp;Nabin, Sidomulyo, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Widodaren</td>\r\n<td>&nbsp;Parakan, Sidomulyo, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Kompak</td>\r\n<td>&nbsp;Kutogiri, Sidomulyo, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Obika</td>\r\n<td>&nbsp;Karangasem, Sidomulyo, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Hijau daun</td>\r\n<td>&nbsp;Klegen, Sendangsari, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Bakung Asri</td>\r\n<td>&nbsp;Cemetuk, Kedungsari, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Ngudi Resik&nbsp;</td>\r\n<td>&nbsp;Kopok Kulon, Tawangsari, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Karya Muda</td>\r\n<td>&nbsp;Kepek, Pengasih</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;II</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;<strong>Wates</strong></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;Bank Sampah Sadidu 29</td>\r\n<td>&nbsp;Wonosidi Lor Rw 29, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Maju Sehati</td>\r\n<td>&nbsp;Wonosidi Lor Rw 30 dan 31, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Berkah</td>\r\n<td>&nbsp;Kuncen, Bendungan, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Mawar Mekar</td>\r\n<td>&nbsp;Durungan, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Flamboyan</td>\r\n<td>&nbsp;Sebokarang, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Migunani</td>\r\n<td>&nbsp;Kedungdowo, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Sehat</td>\r\n<td>&nbsp;Sideman, Giripeni, Wates</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Teratai Putih</td>\r\n<td>&nbsp;Graulan, Giripeni, Wates</td>\r\n</tr>\r\n<tr>\r\n<td><strong>&nbsp;III</strong></td>\r\n<td><strong></strong></td>\r\n<td><strong>&nbsp;Sentolo</strong></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Bunda Mandiri</td>\r\n<td>&nbsp;Banyunganti Kidul, Kaliagung, Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Tambah Rejeki</td>\r\n<td>&nbsp;Gedangan Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Dadi Migunani</td>\r\n<td>&nbsp;Gedangan Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Harapan Makmur</td>\r\n<td>&nbsp;Banyunganti Lor, Kaliagung, Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Berokah</td>\r\n<td>&nbsp;Wora-wari, Sukoreno, Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;BS Rahayu</td>\r\n<td>&nbsp;Banggan, Sukoreno, Sentolo</td>\r\n</tr>\r\n<tr>\r\n<td><strong>&nbsp;</strong></td>\r\n<td><strong></strong></td>\r\n<td><strong>&nbsp;Kokap</strong></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;Bank Sampah Uwuh Mulyo</td>\r\n<td>&nbsp;Segajih, Hargotirto, Kokap</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>\r\n<p>l</p>\r\n<p>Selengkapnya dapat dilihat pada data berikut ini : <a href=\"files/Data%20Bank%20Sampah%20di%20Kabupaten%20Kulonprogo%20Tahun%202014.pdf\" target=\"_blank\">Data Bank Sampah 2014</a></p>\r\n<p>Sedangkan data bank sampah maupun &nbsp;kelompok pengelola sampah mandiri (KPSM) yang terdaftar pada tahun 2016 &nbsp; &nbsp; &nbsp;</p>\r\n<p>&nbsp;<a href=\"http://dlh.kulonprogokab.go.id/files/Data%20KPSM%20dan%20Bank%20Sampah%202016.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></p>\r\n<p>&nbsp;</p>', ''),
(29, 'Informasi Setiap Saat', '<p style=\"text-align: center;\"><strong>DAFTAR INFORMASI PUBLIK</strong></p>\r\n<p>&nbsp;</p>\r\n<p><a><span style=\"font-size: xx-small;\">&nbsp;</span></a></p>\r\n<table id=\"_mc_tmp\" style=\"height: 337px;\" border=\"0\" width=\"700\">\r\n<tbody>\r\n<tr>\r\n<td rowspan=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INFORMASI<span style=\"background-color: #ffffff;\"><br /><br /></span></td>\r\n<td rowspan=\"2\">\r\n<p><span style=\"background-color: #ffffff;\">&nbsp;PENANGGUNG</span></p>\r\n<p><span style=\"background-color: #ffffff;\">&nbsp;&nbsp;&nbsp;&nbsp; JAWAB</span></p>\r\n</td>\r\n<td colspan=\"3\">&nbsp;&nbsp; KETERANGAN</td>\r\n</tr>\r\n<tr>\r\n<td>CETAK</td>\r\n<td>\r\n<p><span style=\"background-color: #ffffff;\">SOFT</span></p>\r\n<p><span style=\"background-color: #ffffff;\">COPY</span></p>\r\n</td>\r\n<td>ONLINE</td>\r\n</tr>\r\n<tr>\r\n<td>1 . RENSTRA Kantor Lingkungan Hidup Kulon Progo 2011-2016</td>\r\n<td>&nbsp;Sekretariat Dinas Lingkungan Hidup (DLH)</td>\r\n<td>&nbsp;&nbsp; Ada&nbsp;&nbsp; <br /></td>\r\n<td>&nbsp;&nbsp; Ada&nbsp;&nbsp;</td>\r\n<td>\r\n<p><a href=\"index.php?pilih=hal&amp;id=16\">&nbsp;Online</a>&nbsp; &nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>2 . RENCANA KERJA (Renja) Dinas Lingkungan Hidup KULON PROGO Tahun 2018<br /></td>\r\n<td>Sekretariat DLH</td>\r\n<td>&nbsp;&nbsp; Ada</td>\r\n<td>&nbsp;&nbsp; Ada&nbsp; <br /></td>\r\n<td>&nbsp; <a href=\"index.php?pilih=hal&amp;id=16\">Online</a></td>\r\n<td>&nbsp; <br /></td>\r\n</tr>\r\n<tr>\r\n<td>3 . LAPORAN KEUANGAN Kantor Lingkungan Hidup TA 2016 (audited)<br /></td>\r\n<td>Sekretariat DLH</td>\r\n<td>&nbsp;&nbsp; Ada</td>\r\n<td>&nbsp; Ada&nbsp;&nbsp; <br /></td>\r\n<td>&nbsp; <a href=\"index.php?pilih=hal&amp;id=16\">Online</a></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>4 . Dokumen Informasi Kinerja Pengelolaan &nbsp;Lingkungan Hidup Daerah 2016 Kabupaten Kulon Progo</p>\r\n<p>&nbsp; &nbsp; &nbsp;</p>\r\n</td>\r\n<td>\r\n<p>&nbsp;Bidang Tata Lingkungan</p>\r\n</td>\r\n<td>&nbsp;&nbsp; Ada</td>\r\n<td>&nbsp;&nbsp; Ada <br /></td>\r\n<td>&nbsp; <a href=\"index.php?pilih=hal&amp;id=16\">Online</a></td>\r\n<td>&nbsp; <br /></td>\r\n</tr>\r\n<tr>\r\n<td>5.&nbsp; LAPORAN KINERJA (LKjIP) KLH KULON PROGO Tahun 2016</td>\r\n<td>Sekretariat DLH</td>\r\n<td>&nbsp;&nbsp; Ada</td>\r\n<td>&nbsp;&nbsp; Ada</td>\r\n<td>&nbsp; <a href=\"index.php?pilih=hal&amp;id=16\">Online</a></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style=\"font-size: medium;\"><strong><a href=\"files/Daftar%20Informasi%20Publik.xlsx\"> </a></strong></span></p>', '');
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(31, 'DOKUMEN INFORMASI KINERJA PENGELOLAAN LINGKUNGAN HIDUP DAERAH 2016', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\">&nbsp;&nbsp;<img title=\"Dokumen Informasi Kinerja Pengelolaan LH Daerah TA 2016\" src=\"files/img12.jpg\" alt=\"Dokumen Informasi Kinerja Pengelolaan LH Daerah TA 2016\" width=\"724\" height=\"510\" /></span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah (disingkat DIKPLHD)&nbsp;</span></span><span style=\"font-size: small;\">menyajikan&nbsp;</span><span style=\"font-size: small;\">&nbsp;data&nbsp;</span><span style=\"font-size: small;\">informasi</span><span style=\"font-size: small;\">&nbsp; tentang kualitas Lingkungan</span><span style=\"font-size: small;\">&nbsp;</span><span style=\"font-size: small;\">Hidup di wilayah Kab. Kulon Progo.&nbsp;</span><span style=\"font-size: small;\">Dokumen ini pada&nbsp;</span><span style=\"font-size: small;\">tahun -</span><span style=\"font-size: small;\">&nbsp; tahun sebelumnya</span><span style=\"font-size: small;\">&nbsp;disebut \"Laporan Status</span><span style=\"font-size: small;\">&nbsp;</span><span style=\"font-size: small;\">&nbsp;Lingkungan Hidup Daerah\" atau&nbsp;</span><span style=\"font-size: small;\">disingkat LSLHD.&nbsp;</span><span style=\"font-size: small;\">&nbsp; Anda dapat &nbsp;mengunduh file pdf-nya</span><span style=\"font-size: small;\">&nbsp; yang</span><span style=\"font-size: small;\">&nbsp;disajikan dalam 2 (dua) buku, yaitu :</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BUKU I &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"files/BUKU%20I%20DIKPLHD%20Kab.%20Kulon%20Progo%202016.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span><span style=\"font-size: small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BUKU II</span></span></span><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\">&nbsp;&nbsp;</span></span></span><span style=\"font-size: x-small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"files/BUKU%20II%20DIKPLHD%20Kab.%20Kulon%20Progo%202016.pdf\"><img src=\"files/news/normal/button-1187460_960_720.png\" alt=\"\" /></a></span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: x-small;\"><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: x-small;\">Di samping itu Anda juga dapat mengunduh Buku SLHD tahun 2014, sebagai berikut :</span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><img style=\"border: 1px solid black;\" src=\"files/Buku%20SLHD%202014.JPG\" alt=\"\" width=\"500\" height=\"354\" /></span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: x-small;\">BUKU I: Laporan Status Lingkungan Hidup Daerah Kabupaten Kulon Progo Tahun 2014</span></span></strong></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Kata%20Pengantar%202014.pdf\" target=\"_blank\">Kata Pengantar</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20DAFTAR%20ISI%20LAPORAN.pdf\" target=\"_blank\">Daftar Isi</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/Bab%20I%20Pendahuluan.pdf\">Bab I. Pendahuluan</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Bab%20II%20Kondisi%20Lingkungan%20Hidup%20dan%20Kecenderungannya.pdf\" target=\"_blank\">Bab II. Kondisi Lingkungan Hidup dan Kecenderungannya</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Bab%20III%20Tekanan%20Terhadap%20Lingkungan.pdf\" target=\"_blank\">Bab III. Tekanan Terhadap Lingkungan</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Bab%20IV%20Upaya%20Pengelolaan%20Lingkungan.pdf\" target=\"_blank\">Bab IV. Upaya Pengelolaan Lingkungan</a></span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong><span style=\"font-size: x-small;\"><span style=\"font-family: helvetica; font-size: x-small;\">Buku II. Data SLHD Kabupaten Kulon Progo Tahun 2014</span></span></strong></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Kata%20Pengantar%20Data%202014.pdf\" target=\"_blank\">Kata Pengantar Data 2014</a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- Daftar Isi Buku Data</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"white-space: pre;\"> </span>- <a href=\"files/SLHD%202014%20Data%20SLHD%202014.pdf\" target=\"_blank\">Data SLHD</a></span></p>', ''),
(32, 'Informasi Berkala 2', '<p>Berikut ini dokumen- dokumen perencanaan dan laporan yang disusun oleh KLH Kulon Progo:</p>\r\n<p>1. Rencana Strategis (Renstra) KLH Periode 2011- 2016 (*<a href=\"files/Perubahan%20Renstra%20KLH%20Kulon%20Progo%202011-2016.pdf\" target=\"_blank\">Download</a>)</p>\r\n<p>2. Renja Tahun 2015 (*Download)</p>\r\n<p>3. Laporan Kinerja KLH 2014 (*Download)</p>\r\n<p>4. Status Lingkungan Hidup Tahun 2014 (*<a href=\"index.php?pilih=hal&amp;id=31\">Download</a>)</p>\r\n<p>5. Laporan Keuangan KLH 2014 (*Download)</p>\r\n<p>6. Penetapan Kinerja 2016 (Tapkin) <a href=\"files/TapKin%202016.pdf\">Download</a></p>\r\n<p>&nbsp;</p>', ''),
(38, 'Profil Bank Sampah ', '<p style=\"text-align: center;\"><strong><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\">BANK SAMPAH DHUAWAR\r\nSEJAHTERA</span></span></span></strong></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><br /></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Bank sampah Dhuawar Sejahtera&nbsp; berdiri pada tanggal 20 Agustus 2016. Bank\r\nSampah yang beralamatkan di Pedukuhan Kroco RT 21 RW 12 Sendangsari, Pengasih,\r\nKulon Progo ini dibentuk berdasarkan SK Kepala Desa Sendangsari No. 21.A Tahun\r\n2016 Tanggal 25 Agustus 2016. Adapun susunan kepengurusan secara lengkap\r\nsebagai berikut:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: medium;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"text-decoration: underline;\"><strong><span style=\"color: #0000ff;\">Dewan Pembina : </span></strong></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: medium;\"><span style=\"font-family: helvetica; font-size: small;\">1. R. Sumbogo, A.Md</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">2. Slamet Supriyono, S.Si</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">3. Ngatijo</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"color: #0000ff;\"><span style=\"text-decoration: underline;\">Penanggung Jawab :&nbsp;</span></span> </strong>&nbsp; &nbsp; &nbsp;<span style=\"white-space:pre\"> </span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">1. Sugiyanto</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">2. Kuntoro Edi</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">3. Puji Rahayu</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"color: #0000ff;\">Direktur : </span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Febriyanti&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><strong><span style=\"text-decoration: underline;\">Sekretaris :</span></strong></span>&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Yuli Dwi Astiti</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"color: #0000ff;\">Bendahara :</span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Wagini</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"text-decoration: underline;\"><span style=\"color: #0000ff;\">Seksi-Seksi :</span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">1. Eka Indarwati</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">2. Ngatijah</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">3. Sumiyati</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">4. Dwi\r\nIsmaryati</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">5. Sukowati</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><br /></span></span></p>\r\n<p style=\"text-align: center;\"><img src=\"files/news/normal/duawar.jpg\" alt=\"\" /></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; font-size: xx-small;\"><span style=\"font-family: helvetica; font-size: x-small; font-style: italic;\">Jajaran Pengurus&nbsp;</span><span style=\"font-family: helvetica; font-size: x-small; font-style: italic;\">Bank Sampah Dhuawar Sejahtera Bersama Tim DLH Kulon Progo</span></span></p>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<p style=\"text-align: left;\"><span style=\"font-family: helvetica; font-size: small; text-align: justify;\">Pemerintah Kabupaten Kulon Progo melalui Dinas Lingkungan\r\nHidup menetapkan Bank Sampah Dhuawar Sejahtera sebagai Bank Sampah Induk (BSI).\r\nSK Kepala Dinas diserahkan pada hari Senin Tanggal 09 Juli 2018. Sebagai Bank Sampah\r\nInduk (BSI), Bank Sampah Dhuawar Sejahtera mengadakan kerjasama pendampingan\r\nmanajemen kepada bank sampah unit di wilayah Desa Sendangsari Pengasih,\r\nmeliputi:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">1. Bank Sampah Klegen Berseri (Dsn. Klegen RT 17 RW\r\n09)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">2. Bank Sampah Mawar Asri 1 (Dsn. Gegunung RT 31 RW\r\n17)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">3. Bank Sampah Mawar Asri 2 (Dsn. Gegunung RT 33 RW\r\n18)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">4. Bank Sampah Harapan Sejahtera (Dsn. Paingan RT\r\n09 RW 05)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">5. Bank Sampah Handayani (Dsn. Blubuk RT 47 RW 24)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">6. Bank Sampah Resik Migunani (Dsn. Secang RT 29 RW\r\n16)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">7. Bank Sampah Gemilang (Dsn. Girinyono RT 41 RW\r\n21)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">8. Bank Sampah Mekar Asri (Dsn. Klegen RT 12 RW 07)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">9. Bank Sampah Ngudi Rejeki II (Dsn. Mrunggi Rt 26\r\nRw 14)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">10. Bank Sampah Ngudi Lestari (Dsn. Pereng RT 37 RW\r\n19)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">11. Bank Sampah Serang Bersinar (Dsn. Serang)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; font-size: small;\"><img src=\"files/news/normal/bank_sampah_DS.jpg\" alt=\"\" /></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; font-size: xx-small;\"><em><span style=\"font-family: helvetica; font-size: xx-small;\">Penyerahan SK Bank Sampah Induk oleh Kepala Dinas Lingkungan Hidup&nbsp;</span></em><span style=\"font-family: helvetica; font-size: x-small; font-style: italic;\">Arif Prastowo,Sos.,MSi,kepada direktur Bank Sampah Dhuawar Sejahtera</span></span></p>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<p style=\"text-align: left;\"><span style=\"font-family: helvetica; font-size: small; text-align: justify;\">Dalam mengembangkan usahanya Bank Sampah Dhuawar\r\nSejahtera mengadakan kerjasama dengan UD Margo Rosok yang beralamatkan di\r\nSrumbung RT 07 Segoroyoso Pleret Bantul dalam bentuk penjualan sampah anorganik.\r\nSelain jual beli sampah, kelompok Bank Sampah Dhuawar Sejahtera mampu\r\nmenghasilkan produk-produk daur ulang sampah dalam bentuk kerajinan. Produk kerajinan\r\nyang berhasil dikembangkan yakni tas jinjing, tas cangklong, dompet, tempat\r\npensil, celengan, dan kap lampu. Sampai dengan&nbsp;\r\ntahun 2018, Bank Sampah Dhuawar Sejahtera mempunyai nasabah dari\r\nkalangan perseorangan sebanyak 58 orang dan 1 kelompok PAUD dari kalangan\r\nkolektif dengan omset &plusmn; 205,57 kg/bulan atau setara Rp 346.900,- / bulan.</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; font-size: small;\"><img src=\"files/news/normal/Webp.net-resizeimage_(2)_.jpg\" alt=\"\" /></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; font-size: xx-small;\"><em><span style=\"font-family: helvetica; font-size: xx-small;\">Kerjasama dengan mitra usaha dalam bentuk penjualan sampah anorganik</span></em><span style=\"font-family: helvetica; font-size: x-small; font-style: italic;\">&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>', ''),
(33, 'PROFIL KANTOR LINGKUNGAN HIDUP KULON PROGO 2014', '<p>PROFIL KANTOR LINGKUNGAN HIDUP KULON PROGO 2014</p>\r\n<p>1. <a href=\"http://klh.kulonprogokab.go.id/files/Sampul%20%20profil.pdf\">SAMPUL PROFIL</a></p>\r\n<p>2. <a href=\"http://klh.kulonprogokab.go.id/files/KATA%20PENGANTAR.pdf\">KATA PENGANTAR</a></p>\r\n<p>3. <a href=\"http://klh.kulonprogokab.go.id/files/GAMBARAN%20UMUM%20SKPD.pdf\">GAMBARAN UMUM SKPD</a></p>', ''),
(34, 'Pertanyaan dan Jawaban Terkait Izin Lingkungan di Kabupaten Kulon Progo', '<p style=\"text-align: justify;\"><span style=\"line-height: 107%;\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"color: #0000ff;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Siapa\r\nyang harus memiliki Izin Lingkungan di Kabupaten Kulon Progo?</span></span></span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 107%;\" lang=\"IN\">Yang\r\nharus memiliki Izin Lingkungan adalah setiap usaha dan/atau kegiatan yang wajib\r\nAmdal atau UKL-UPL.&nbsp;</span><span style=\"text-align: justify;\"><span lang=\"IN\">Izin Lingkungan dikecualikan dalam penerbitan Izin Usaha dalam hal: 1)&nbsp;</span></span><span style=\"text-align: justify; text-indent: -23.35pt;\"><span lang=\"IN\">Lokasi usaha dan/atau kegiatan berada dalam Kawasan ekonomi khusus,\r\nKawasan industry atau berdagangan bebas dan pelabuhan bebas, 2)&nbsp;</span></span><span style=\"text-align: justify; text-indent: -23.35pt;\"><span lang=\"IN\">Usaha dan/atau kegiatan yang merupakan usaha mikro dan kecil, 3)&nbsp;</span></span><span style=\"line-height: 107%;\" lang=\"IN\">Usaha\r\ndan/atau kegiatan tidak wajib Amdal atau UKL-UPL.</span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"color: #0000ff;\">Usaha\r\nKegiatan apa saja yang wajib memiliki Izin Lingkungan&nbsp;</span></strong></span></span><span style=\"color: #0000ff; font-family: helvetica; font-size: small; font-weight: 700;\">di Kabupaten Kulon Progo</span><strong><span style=\"color: #0000ff;\">&nbsp;?</span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Usaha\r\ndan/atau kegiatan yang wajib memilki Izin Lingkungan adalah jenis rencana usaha\r\ndan/atau kegiatan sebagaimana tercantum dalam <strong>Permenlh No. 05 Tahun 2012 untuk yang wajib Amdal</strong> atau jenis rencana\r\nusaha dan/atau kegiatan sebagaimana tercantum dalam <strong>Perbub No.17 Tahun 2005 untuk yang wajib UKL-UPL.</strong></span></span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraph\" style=\"margin-left: 0in; text-align: justify;\"><span lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"color: #0000ff;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Apakah sudah bisa menjalankan usaha kegiatan setelah\r\nmendapatkan Izin Lingkungan ?</span></span></span></strong></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Pelaku usaha\r\ndan/atau kegiatan belum dapat menjalankan usaha/kegiatan &nbsp;meskipun sudah memiliki Izin Lingkungan, <strong>usaha/kegiatan dapat beroperasi setelah\r\nmendapatkan Izin Usaha</strong> baik yang melalui OSS maupun Non OSS <strong>(Izin Lingkungan sebagai salah satu\r\npersyaratan dalam proses penerbitan Izin Usaha).</strong></span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"color: #0000ff;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><strong>Berapa lama masa\r\nberlaku Izin Lingkungan&nbsp;</strong></span></span><span style=\"font-family: helvetica; font-size: small; font-weight: 700;\">di Kabupaten Kulon Progo&nbsp;</span><strong>?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Izin Lingkungan\r\nberlaku selama berlakunya Izin Usaha dan/atau Kegiatan,<strong>sepanjang tidak ada perubahan atas usaha dan/atau kegiatan yang\r\ndimaksud.</strong></span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><strong><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Kapan harus\r\nmelakukan perubahan Izin Lingkungan ?</span></span></strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span lang=\"IN\">Pelaku usaha wajib\r\nmengajukan permohonan perubahan Izin Lingkungan, apabila usaha dan/atau\r\nkegiatan yang telah memperoleh Izin Lingkungan <strong>direncanakan untuk dilakukan perubahan</strong>, yang meliputi :&nbsp;1)&nbsp;</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">Perubahan kepemilikan usaha\r\ndan/atau kegiatan, 2) P</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">erubahan pengelolaan dan\r\npemantauan lingkungan hidup, 3)&nbsp;</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">Perubahan yang berpengaruh\r\nterhadap lingkungan hidup, 4) T</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">erdapat perubahan dampak dan/atau\r\nresiko lingkungan hidupberdasarkan hasil kajian analisis resiko lingkungan\r\nhidup atau audit lingkungan hidup hidup yang diwajibkan, 5)&nbsp;</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">Tidak dilaksanakannya usaha\r\ndan/atau kegiatan dalam jangka waktu 3 (tiga) tahun sejak diterbitkannya Izin\r\nLingkungan, 6)&nbsp;</span><span style=\"text-indent: -14.2pt;\" lang=\"IN\">Perubahan usaha dan/atau kegiatan\r\nlainnya yang tidak berpengaruh terhadap lingkungan (al.: pemisahan atau\r\npenggabungan usaha/kegiatan, perubahan nama penanggung jawab usaha/kegiatan,\r\nperubahan nama usaha/kegiatan tanpa mengubah jenis usaha/kegiatan, perubahan\r\nwilayah administrasi pemerintahan.</span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><strong><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Apakah\r\nsama Izin Lingkungan dengan Izin Berusaha ?</span></span></strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span lang=\"IN\">Izin Lingkungan tidak sama dengan Izin Berusaha.&nbsp;</span></strong><strong><span lang=\"IN\">Izin Berusaha adalah</span></strong><span lang=\"IN\"> pendaftaran\r\nyang diberikan kepada pelaku usaha untuk memulai dan manjalankan usaha dan/atau\r\nkegiatan yang diberikan dalam bentuk persetujuan atau pemenuhan persyaratan\r\ndan/atau komitmen.&nbsp;</span><strong><span style=\"font-size:11.0pt;&#10;line-height:107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\">Izin\r\nLingkungan adalah</span></strong><span style=\"font-size: 11pt; line-height: 107%; font-family: Calibri, sans-serif;\" lang=\"IN\"> Izin\r\nyang diberikan kepada pelaku usaha yang melakuan usaha dan/atau kegiatan yang\r\nwajib Amdal atau UKL-UPL dalam rangka perlindungan dan pengelolaan lingkungan <strong>hidup sebagai prasyarat memperoleh izin\r\nusaha dan/atau kegiatan.</strong></span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"color: #0000ff;\"><strong><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\">Bagaimana\r\ncaranya untuk memperoleh Izin Lingkungan&nbsp;</span></span><span style=\"font-family: helvetica; font-size: small;\">di Kabupaten Kulon Progo&nbsp;</span><span style=\"font-family: helvetica; font-size: small;\">?</span></span></span></strong></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span lang=\"IN\"><strong><span lang=\"IN\">Tata Cara bagi pelaku usaha untuk memperoleh Izin Lingkungan untuk usaha dan/atau kegiatan yang masuk dalam kriteria OSS:&nbsp;</span></strong></span><strong><span lang=\"IN\">1)&nbsp;</span></strong><span style=\"text-indent: -14.15pt;\">melakukan pendaftaran\r\nuntuk kegiatan berusaha melalui laman OSS sehingga diperoleh NIB (Nomor Induk\r\nBerusaha),&nbsp;</span><span style=\"text-indent: -14.15pt;\">2)&nbsp;</span><span style=\"text-indent: -14.15pt;\">mengajukan\r\nIzin Lingkungan dengan komitmen melalui laman OSS untuk memperoleh Izin Usaha\r\ndengan komitmen, 3)&nbsp;</span><span style=\"text-indent: -14.2pt; font-size: 11pt; line-height: 107%; font-family: Calibri, sans-serif;\" lang=\"IN\">melakukan\r\npemenuhan komitmenIzin Lingkungan dengan melengkapi Amdal /UKL-UPL/SPPL ke\r\ninstansi lingkungan hidup pusat/provinsi/Kabupaten/Kota sesuai dengan\r\nkewenangannya (dalam tahap ini pelaku usaha harus sudah memilki data dan\r\ninformasi lengkap terkait : arahan hasil penapisan, deskripsi rencana usaha/kegiatan,\r\nrona lingkungan hidup&nbsp;</span><span style=\"text-indent: -14.15pt;\">awal, hasil konsultasi public bagi yang wajib Amdal, 4)&nbsp;</span><span style=\"text-indent: -14.15pt;\">notifikasi\r\nmelalui laman OSS bahwa komitmen Izin Lingkungan telah terpenuhi bersamaan\r\ndengan telah diterbitkannya rekomendasi UKL-UPL, SKKL, atau persetujuan SPPL</span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong>Tata Cara bagi pelaku usaha untuk\r\nmemperoleh Izin Lingkungan untuk usaha dan/atau kegiatan yangtidak\r\ntermasuk&nbsp; dalam kriteria OSS\r\n(konvensional) : 1) P</strong><span style=\"text-indent: -14.15pt;\" lang=\"IN\">ermohonan Arahan atau Penapisan\r\njenis dokumen, 2) P</span><span style=\"text-indent: -14.15pt;\" lang=\"IN\">engajuan permohonan Izin\r\nLingkungan secara tertulis kepada Bupati untuk yang skala Amdal dan kepada\r\nKepala DLH untuk yang skala UKL-UPL dengan dilampiri : Dokumen Lingkungan\r\n(Amdal/UKL-UPL), Profil Usaha/kegiatan, akta notaris /KTP), 3)&nbsp;</span><span style=\"text-indent: -14.15pt;\" lang=\"IN\">Pengumuman permohonan Izin\r\nLingkungan, 4)&nbsp;</span><span style=\"text-indent: -14.15pt;\" lang=\"IN\">Pemeriksaan atau penilaian dokumen\r\nlingkungan (Amdal atau UKL-UPL), 6)&nbsp;</span><span style=\"text-indent: -14.15pt;\" lang=\"IN\">Penerbitan Izin Lingkungan, 7) P</span><span style=\"text-indent: -14.15pt;\" lang=\"IN\">engumuman penerbitan Izin\r\nLingkungan.</span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"color: #0000ff;\"><strong><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\">Berapa\r\nlama proses untuk memperoleh Izin Lingkungan&nbsp;</span></span><span style=\"font-family: helvetica; font-size: small;\">di Kabupaten Kulon Progo&nbsp;</span><span style=\"font-family: helvetica; font-size: small;\">?</span></span></span></strong></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span lang=\"IN\">Untuk usaha/kegiatan yang wajib Amdal dan masuk dalam kriteria OSS: 1)&nbsp;</span></strong><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu pengumuman rencana\r\nusaha, konsultasi public, pengisian dan pemeriksanaan KA Andal&nbsp;<strong>(30 hari kerja),&nbsp;</strong></span><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu penyusunan Andal,\r\nRKL-RPL <strong>(180 hari). 2)&nbsp;</strong></span><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu penilaian, perbaikan &nbsp;Andal/RKL-RPL , penyampaian rekomendasi, dan\r\npenerbitan SKKL <strong>(60 hari kerja). 3)&nbsp;</strong></span><strong><span style=\"font-size:11.0pt;&#10;line-height:107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\">Lama\r\nwaktu proses IL bagi pemerintah&nbsp; paling\r\nlama adalah 90 hari kerja.</span></strong></span></span></span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -0.25in; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span lang=\"IN\">&nbsp; &nbsp; &nbsp; Untuk usaha/kegiatan yang wajib UKL-UPL dan masuk dalam kriteria OSS : 1)&nbsp;</span></strong><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu pengisian dan\r\npengajuan UKL-UPL ( 10 hari kerja), 2)&nbsp;</span><strong><span lang=\"IN\">Jangka waktu pemeriksaan UKL-UPL (5 hari kerja), 3) J</span></strong><span style=\"font-family: Calibri, sans-serif; font-size: 11pt;\">angka waktu perbaikan UKL-UPL (5 hari kerja).</span></span></span></span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -0.25in; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span lang=\"IN\">&nbsp; &nbsp; &nbsp;&nbsp;<strong>Untuk usaha/kegiatan yang\r\nwajib Amdal&nbsp; non OSS (cara konvensional)</strong></span></strong><span lang=\"IN\"> :&nbsp;1)&nbsp;</span><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu penilaian dokumen KA\r\nAndal oleh KPA (30 hari kerja), 2)&nbsp;</span><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu penilaian dokumen\r\nAndal/RKL-RPL oleh KPA (75 hari kerja), 3)&nbsp;</span><span style=\"text-indent: -0.25in;\" lang=\"IN\">Jangka waktu penetapan SKKL dan\r\npenerbitan IL (10 hari kerja), 4)&nbsp;</span><strong><span style=\"font-size:11.0pt;&#10;line-height:107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\">Total\r\nwaktu bagi pemerintah dalam proses IL paling lama adalah 115 hari kerja</span></strong></span></span></span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -0.25in; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><strong><span style=\"font-size:11.0pt;line-height:107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;&#10;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:&#10;minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;&#10;mso-bidi-theme-font:minor-bidi;mso-ansi-language:IN;mso-fareast-language:EN-US;&#10;mso-bidi-language:AR-SA\" lang=\"IN\">&nbsp; &nbsp; &nbsp; &nbsp;Untuk usaha/kegiatan </span></strong><span style=\"font-size:11.0pt;line-height:107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;&#10;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:&#10;minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;&#10;mso-bidi-theme-font:minor-bidi;mso-ansi-language:IN;mso-fareast-language:EN-US;&#10;mso-bidi-language:AR-SA\" lang=\"IN\">yang <strong>wajib\r\nUKL-UPL non OSS (cara konvensional)&nbsp; bagi\r\npemerintah adalah 14 hari kerja</strong></span></span></span></span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -0.25in; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -0.25in; text-align: justify;\"><span style=\"font-size:11.0pt;line-height:&#10;107%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;&#10;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:&#10;minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;&#10;mso-ansi-language:IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\" lang=\"IN\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp; &nbsp;<strong><span style=\"color: #0000ff;\"> &nbsp; &nbsp;Apa\r\nyang harus dilakukan setelah memperoleh Izin Lingkungan ?</span></strong></span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span lang=\"IN\">Yang harus\r\ndilakukan setelah memperoleh Izin Lingkungan adalah: 1)&nbsp;</span><span style=\"text-indent: -16.3pt;\">melaksanakan\r\npersyaratan dan ketentuan-ketentuan yang tercantum dalam Izin Lingkungan, 2)&nbsp;</span><span style=\"text-indent: -16.3pt;\">menyampaikan\r\nlaporan pelaksanaan Izin Lingkungan secara berkala 6 (enam) bulan sekali ke Dinas Lingkungan Hidup (DLH) Kulon progo, 3)&nbsp;</span><span style=\"text-indent: -16.3pt;\">melakukan\r\npemeriksaan kualitas lingkungan (udara, air, tanah) sesuai dengan ketentuan\r\nyang berlaku, 4)&nbsp;</span><span style=\"text-indent: -0.25in;\">wajib\r\nmengajukan permohonan perubahan Izin Lingkungan, apabila usaha dan/atau\r\nkegiatan yang telah memperoleh Izin Lingkungan direncanakan untuk dilakukan\r\nperubahan.&nbsp;</span></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">(Sumber: Bidang Pengawasan dan Pengendalian Dinas Lingkungan Hidup Kabupaten Kulon Progo)</span></p>', ''),
(46, 'HASIL KAJIAN TIMBULAN SAMPAH KULON PROGO', '<p><span style=\"font-family: helvetica; font-size: small;\">A. KAJIAN TIMBULAN SAMPAH HARIAN PERMUKIMAN KAB. KULON PROGO</span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">1. Cover Laporan <span style=\"color: #0000ff;\"><a href=\"files/cover-akhir-isi_permukiman.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">2. Bab I_Permukiman <span style=\"color: #0000ff;\"><a href=\"http://dlh.kulonprogokab.go.id/files/Bab%201_%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">3. Bab II_Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%202_%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">4. Bab III_Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%203_%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">5. Bab IV_Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%204_%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><br /></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">B. KAJIAN TIMBULAN SAMPAH HARIAN NON PERMUKIMAN KAB. KULON PROGO</span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">1. Cover Laporan <span style=\"color: #0000ff;\"><a href=\"files/cover-akhir-isi_non_permukiman.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">2. Bab I_Non Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%201_Non%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">3. Bab II_Non Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%202_Non%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">4. Bab III_Non Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%203_Non%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">5. Bab IV_Non Permukiman <span style=\"color: #0000ff;\"><a href=\"files/Bab%204_Non%20Permukiman%20-%20Akhir.pdf\">(Download)</a></span></span></p>', ''),
(39, 'Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah Tahun 2017', '<p><span style=\"text-align: left; font-size: small;\"><strong><span style=\"font-size: x-small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah (DIKPLHD)</span></strong></span></p>\r\n<p><span style=\"font-size: x-small;\"><span style=\"text-align: left; font-size: small;\">DIKPLHD&nbsp;</span><span style=\"font-size: small;\">menyajikan&nbsp;</span><span style=\"font-size: small;\">&nbsp;data&nbsp;</span><span style=\"font-size: small;\">informasi</span><span style=\"font-size: small;\">&nbsp; tentang kualitas Lingkungan</span><span style=\"font-size: small;\">&nbsp;</span><span style=\"font-size: small;\">Hidup di wilayah Kabupaten Kulon Progo.</span><span style=\"font-size: small;\">&nbsp; Dokumen ini pada&nbsp;</span><span style=\"font-size: small;\">tahun -</span><span style=\"font-size: small;\">&nbsp; tahun sebelumnya</span><span style=\"font-size: small;\">&nbsp;disebut \"Laporan Status</span><span style=\"font-size: small;\">&nbsp;</span><span style=\"font-size: small;\">&nbsp;Lingkungan Hidup Daerah\" atau&nbsp;</span><span style=\"font-size: small;\">disingkat LSLHD.&nbsp;</span><span style=\"font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah</span><span style=\"font-size: small;\">&nbsp;Tahun 2017&nbsp;</span><span style=\"font-size: small;\">disajikan dalam 2 (dua) buku. Buku I dan Buku II dapat didownload melalui link berikut:</span></span></p>\r\n<p><span style=\"font-size: small;\"><span style=\"text-decoration: underline;\"><span style=\"color: #0000ff;\"><a href=\"files/BUKU%20I%20DIKPLHD%20KULON%20PROGO%202017.pdf\"><span style=\"font-size: x-small;\">Download Buku I</span></a></span></span></span></p>\r\n<p><span style=\"font-family: helvetica; color: #0000ff; font-size: x-small;\"><span style=\"text-decoration: underline;\"><a href=\"files/1-20.pdf\"><span style=\"font-size: x-small;\">Download Buku II part 1</span></a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"text-decoration: underline;\"><a href=\"files/21-80.pdf\"><span style=\"font-size: x-small;\">Download Buku II part 2</span></a></span></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"text-decoration: underline;\"><a href=\"files/81-120.pdf\"><span style=\"font-size: x-small;\">Download Buku II part 3</span></a></span></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"text-decoration: underline;\"><a href=\"files/121-180.pdf\"><span style=\"font-size: x-small;\">Download Buku II part 4</span></a></span></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"text-decoration: underline;\"><a href=\"http://dlh.kulonprogokab.go.id/files/181-205.pdf\"><span style=\"font-size: x-small;\">Download Buku II part 5</span></a></span></span></span></p>', ''),
(40, 'Izin Operasional Pengelolaan Limbah B3', '<p>&nbsp;</p>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Bagi Instansi Negeri Menggunakan Sistem Non OSS</span></li>\r\n</ul>\r\n<ol>\r\n<li><span style=\"font-family: helvetica; color: #3366ff; font-size: small;\"><span style=\"text-decoration: underline;\"><a href=\"files/Bagan%20AlurNon%20OSS.xlsx\">Bagan Alur</a></span></span></li>\r\n<li><span style=\"font-family: helvetica; color: #3366ff; font-size: small;\"><span style=\"text-decoration: underline;\"><a href=\"files/Form%20Pengajuan%20Permohonan.docx\">Form Pengajuan Permohonan</a></span></span></li>\r\n<li><span style=\"font-family: helvetica; color: #3366ff; font-size: small;\"><span style=\"text-decoration: underline;\"><a href=\"files/Form%20Persyaratan%20Administrasi.docx\">Form Persyaratan Administrasi</a></span></span></li>\r\n<li><span style=\"font-family: helvetica; color: #3366ff; font-size: small;\"><span style=\"text-decoration: underline;\"><a href=\"files/Form%20Persyaratan%20Teknis.docx\">Form Persyaratan Teknis</a></span></span></li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Bagi Instansi Swasta Menggunakan Sistem OSS</span></li>\r\n</ul>\r\n<ol><span style=\"text-decoration: underline;\"><span style=\"color: #3366ff;\">\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><a href=\"files/Bagan%20Alur%20OSS.xlsx\">Bagan Alur</a></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><a href=\"files/1.%20Pernyataan%20Pemenuhan%20Komitmen.docx\">Form Pernyataan Pemenuhan Komitmen</a></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><a href=\"files/2.%20Persyaratan%20Teknis.docx\">Form Persyaratan Teknis</a></span></li>\r\n</span></span></ol>\r\n<p>&nbsp;</p>\r\n<p><span style=\"color: #3366ff;\">&nbsp;</span></p>', '');
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(41, 'Seputar Sekolah Adiwiyata Kab. Kulon Progo TH.2019', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">Download Dokumen Berkaitan Dengan Pengelolaan Sekolah Adiwiyata Kabupaten Kulon Progo Tahun 2019 </span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\">(silahkan klik link berikut ini):</span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"files/Materi%20Workshop%20Adiwiyata%20DLH%2022%20April%202019.pdf\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Materi Workshop Adiwiyata Tahun 2019</span></span></span></a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"files/FORM%20EDS%20ADIWIYATA.xls\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Form EDS Adiwiyata</span></span></span></a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: x-small;\"><a href=\"files/Srategi%20Kreatif%20Rencana%20Aksi%20Sekolah%20Adiwiyata.pdf\"><span style=\"font-size: small;\"><span style=\"color: #0000ff;\">Strategi Kreatif Rencana Aksi Sekolah Adiwiyata&nbsp;</span></span></a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"files/Materi%20PDF-MENUJU%20SEKOLAH%20ADIWIYATA.pdf\"><span style=\"color: #0000ff;\">Materi PDF-Menuju Sekolah Adiwiyata</span></a></span></p>', ''),
(42, 'Peraturan Bupati No. 62 tahun 2016', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">PERATURAN BUPATI KULON PROGO\r\nNOMOR 62 TAHUN 2016\r\nTENTANG\r\nKEDUDUKAN, SUSUNAN ORGANISASI, FUNGSI DAN TUGAS\r\nSERTA TATA KERJA PADA DINAS LINGKUNGAN HIDUP</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">selengkapnya dapat diunduh disini:</span></p>\r\n<p style=\"text-align: justify;\"><a href=\"http://dlh.kulonprogokab.go.id/files/PB-62-2016%20LH.pdf\"><span style=\"font-family: helvetica; font-size: small;\">Perbup No. 62 Tahun 2016</span></a></p>', ''),
(43, 'PROFIL SINGKAT PEJABAT DLH KULON PROGO', '<p><img src=\"/files/news/normal/imageedit_1_3593306776.jpg\" alt=\"\" /></p>', ''),
(44, 'Izin Pembuangan Air Limbah', '<p><span style=\"font-family: helvetica; font-size: small;\">A. Izin Pembuangan Air Limbah (Tanpa Melalui Sistem OSS)</span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">1. Bagan Alur <span style=\"color: #0000ff;\"><a href=\"files/SOP%20Izin%20Pembuangan%20Air%20Limbah%20Tanpa%20Melalui%20Sistem%20OSS.docx\">(download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">2. Surat Permohonan Izin Pembuangan Air Limbah <span style=\"color: #0000ff;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Surat%20Permohonan%20Izin%20Pembuangan%20Air%20Limbah.docx\">(download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">3. Formulir Permohonan Izin Pembuangan Air Limbah <span style=\"color: #0000ff;\"><a href=\"files/Formulir%20Permohonan%20Izin%20Pembuangan%20Air%20Limbah.docx\">(download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><br /></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">B. Izin Pembuangan Air Limbah&nbsp; Melalui Sistem OSS)</span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">1. Bagan Alur <span style=\"color: #0000ff;\"><a href=\"files/SOP%20Izin%20Pembuangan%20Air%20Limbah%20Melalui%20Sistem%20OSS.docx\">(download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">2. Format Surat Pernyataan Pemenuhan Komitmen <span style=\"color: #0000ff;\"><a href=\"files/FORMAT%20SURAT%20PERNYATAAN%20PEMENUHAN%20KOMITMEN.docx\">(download)</a></span></span></p>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">3. Persyaratan Teknis Pembuangan Air Limbah <span style=\"color: #0000ff;\"><a href=\"files/PERSYARATAN%20TEKNIS%20PEMBUANGAN%20AIR%20LIMBAH.docx\">(download)</a></span></span></p>', ''),
(47, 'SOP Penanganan Aduan Lingkungan Hidup', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Standar Operasional Prosedur (SOP) Penanganan Aduan Lingkungan Hidup disusun sebagai pedoman bagi Tim pelaksana kegiatan penanganan aduan lingkungan hidup sesuai dengan peraturan perundang-undangan. Penerapan SOP ini bertujuan agar pengelolaan aduan masyarakat terkait dengan permasalahan lingkungan hidup dapat berjalan dengan lancar, jelas tahapan penyelesaiannya, dan permasalahan dapat terselesaikan dengan baik.&nbsp;</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Secara lengkap SOP Penanganan Aduan Lingkungan Hidup yang digunakan oleh Dinas Lingkungan Hidup Kabupaten Kulon Progo serta Formulir Aduan dapat diunduh melalui link berikut:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"files/2.%20S.O.P.%20Penanganan%20Aduan%20Lingkungan%20Hidup%20Maret%202019%20FINAL.pdf\"><span style=\"font-family: helvetica; font-size: small;\">DOWNLOAD SOP PENANGANAN ADUAN LINGKUNGAN HIDUP</span></a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=48\">DOWNLOAD FORMULIR ADUAN</a></span></p>', ''),
(48, 'Formulir Aduan Lingkungan', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Formulir Pengaduan Akibat Dugaan Pencemaran dan/atau Perusakan Lingkungan Hidup dapat diunduh melalui link berikut ini:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"files/Form-%20Aduan.doc\"><span style=\"font-family: helvetica; font-size: small;\">DOWNLOAD FORMULIR ADUAN</span></a></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Untuk Standar Operasional Prosedur (SOP) Penanganan Aduan Lingkungan Hidup dapat dilihat pada link halaman berikut:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=47\">SOP Penanganan Aduan Lingkungan Hidup&nbsp;</a></span></p>', ''),
(49, 'Karya Tulis Mahasiswa dan Siswa Prakerin ', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Fenomena Perizinan Lingkungan di Kabupaten Kulon Progo (Muhammad Akbar Eka Pradana-IST AKPRIND Yogyakarta-2019) <span style=\"color: #0000ff;\"><a href=\"files/FENOMENA%20PERIZINAN%20LINGKUNGAN%20DI%20KABUPATEN%20KULON%20PROGO-dikonversi.pdf\">download</a></span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Laporan Praktek Kerja Industri SMK Negeri 1 Panjatan Tahun 2019 (Alvin Ibnu Ismawan dan Syaiful Amin) <a href=\"files/Lap.%20Prakerin%20SMK%20N%201%20Panjatan%20Tahun%202019.pdf\">download</a></span></li>\r\n</ol>\r\n<p>&nbsp;</p>', '');
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(50, 'Pertanyaan dan Jawaban Terkait Penilaian Adipura', '<p style=\"text-align: justify;\"><!--[if gte mso 9]><xml><o:DocumentProperties><o:Revision>1</o:Revision><o:Pages>1</o:Pages><o:Lines>1</o:Lines><o:Paragraphs>1</o:Paragraphs></o:DocumentProperties></xml><![endif]--><!--[if gte mso 9]><xml><o:OfficeDocumentSettings></o:OfficeDocumentSettings></xml><![endif]--><!--[if gte mso 9]><xml><w:WordDocument><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery><w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery><w:DocumentKind>DocumentNotSpecified</w:DocumentKind><w:DrawingGridVerticalSpacing>7.8 ç£…</w:DrawingGridVerticalSpacing><w:PunctuationKerning></w:PunctuationKerning><w:View>Normal</w:View><w:Compatibility><w:DontGrowAutofit /><w:BalanceSingleByteDoubleByteWidth /><w:DoNotExpandShiftReturn /></w:Compatibility><w:Zoom>0</w:Zoom></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml><w:LatentStyles DefLockedState=\"false\"  DefUnhideWhenUsed=\"true\"  DefSemiHidden=\"true\"  DefQFormat=\"false\"  DefPriority=\"99\"  LatentStyleCount=\"260\" > <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 7\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 8\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 9\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 7\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 8\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 9\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 7\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 8\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 9\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Indent\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"header\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footer\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index heading\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"caption\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of figures\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope address\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope return\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote reference\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation reference\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"line number\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"page number\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote reference\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of authorities\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"macro\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toa heading\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Title\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Closing\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Signature\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Default Paragraph Font\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Message Header\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Subtitle\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Salutation\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Date\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Note Heading\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Block Text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Hyperlink\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"FollowedHyperlink\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Strong\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Emphasis\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Document Map\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Plain Text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"E-mail Signature\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal (Web)\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Acronym\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Address\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Cite\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Code\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Definition\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Keyboard\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Preformatted\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Sample\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Typewriter\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Variable\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Table\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation subject\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No List\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / a / i\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / 1.1 / 1.1.1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Article / Section\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 7\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 8\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 7\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 8\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Contemporary\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Elegant\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Professional\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Balloon Text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Theme\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Placeholder Text\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No Spacing\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Paragraph\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Quote\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Intense Quote\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 1\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 2\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 3\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 4\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 5\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 6\" ></w:LsdException> <w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 6\" ></w:LsdException> </w:LatentStyles></xml><![endif]--></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Apa yang dimaksud dengan Adipura ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\">Adipura adalah program kerja Kementerian Lingkungan Hidup dan Kehutanan yang berlingkup</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> nasional untuk mewujudkan wilayah yang berwawasan lingkungan menuju pembangunan yang</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> berkelanjutan. Pedoman Pelaksanaan Program Adipura adalah Peraturan Menteri Lingkungan Hidup</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> dan Kehutanan No 53 Tahun 2016.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Lokasi penilaian Adipura meliputi mana saja ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\">Lokasi penilaian Adipura meliputi ;</span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">permukiman menengah dan sederhana; b. jalan arteri dan kolektor; c. pasar; d. pertokoan; e. perkantoran; f. sekolah; g. rumah sakit dan/atau puskesmas; h. terminal bus dan/atau terminal angkutan kota, atau pelabuhan sungai dan/atau pelabuhan laut yang menghubungkan antar pulau dalam satu kabupaten/kota; i. hutan kota; j. taman kota; k. saluran terbuka; l. tempat pemrosesan akhir; &nbsp;m. bank sampah atau model pengolahan sampah lainnya; dan n. fasilitas pengolahan sampah skala kota.</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">Dalam hal terdapat prasarana dan sarana perkotaan selain sebagaimana dimaksud di</span><span style=\"line-height: 150%;\">&nbsp;</span><span style=\"line-height: 150%;\">atas &nbsp;maka pemantauan juga dilaksanakan di a. permukiman pasang surut; b. stasiun kereta api; c. pelabuhan penumpang yang dikelola oleh badan usaha milik negara; d. bandar udara; e. perairan terbuka berupa sungai, danau/situ, waduk/bendungan; dan f. pantai wisata, &nbsp;</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; margin-left: 54,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">&nbsp;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Bagaimana mekanisme penilaian Adipura ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\">Mekanisme penilaian Adipura 2019 adalah sebagai berikut &nbsp;: </span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">-Kabupaten menyusun dokumen Jakstrada kemudian dikirimkan ke Kementerian LHK. Kabupaten Kulon Progo telah menyusun peraturan Bupati nomor 68 tahun 2018 tentang Kebijakan daerah dalam peengelolaan sampah rumah tangga dan sampah sejenis sampah rumah tangga.</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">-Desk study atau peer review : (melakukan assessment dan verifikasi terhadap basis data JAKSTRADA). Setiap tahun daerah melakukan up-dating neraca pengelolaan sampahnya sebanyak 2 kali. </span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">-Klasifikasi kota, kriterianya meliputi :</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">1.</span><span style=\"line-height: 150%;\">Komitmen Pimpinan mencapai target &ldquo;Jakstranas&rdquo; yang diindikasikan dengan penetapan &ldquo;Jakstrada&rdquo;</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">2.</span><span style=\"line-height: 150%;\">Ketaatan pada amanat Pasal 44 UU 18/2008, yaitu TPAS-nya sudah bukan sistem pembuangan terbuka (open dumping)</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\">3.</span><span style=\"line-height: 114%;\">Tingkat kinerja pengelolaan sampah</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\">-</span><span style=\"line-height: 114%;\">Pemantauan dan validasi &nbsp;meliputi : </span><span style=\"line-height: 114%;\">1) </span><span style=\"line-height: 114%;\">Kinerja Pengelolaan Sampah : &nbsp;Pengurangan, Penanganan berdasarkan skema</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\"> neraca sampah</span><span style=\"line-height: 114%;\">&nbsp;2) </span><span style=\"line-height: 114%;\">Kondisi Kebersihan pada lokasi-lokasi yang ditetapkan</span><span style=\"line-height: 114%;\">&nbsp;3) </span><span style=\"line-height: 114%;\">Kondisi Keteduhan pada lokasi-lokasi yang</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\"> ditetapkan</span><span style=\"line-height: 114%;\">. </span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\">-</span><span style=\"line-height: 114%;\">Skoring</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; mso-para-margin-right: 0,0000gd; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 114%;\">-</span><span style=\"line-height: 114%;\">Penentuan peraih anugerah</span></span></p>\r\n<p class=\"15\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; margin-left: 78,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"line-height: 150%;\">&nbsp;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Apa yang perlu disiapkan ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; line-height: 114%;\"><span style=\"font-family: helvetica; font-size: small;\">Yang perlu dipersiapkan yaitu a. Neraca pengelolaan sampah (data pengelolaan sampah yang </span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; line-height: 114%;\"><span style=\"font-family: helvetica; font-size: small;\">meliputi pengurangan dan penanganan)&nbsp;b. Pengkondisian TPA&nbsp;c.Pengkondisian titik pantau</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\">&nbsp;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Kapan waktu penilaian Adipura ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\">Untuk penilaian dari &nbsp;Kementerian Lingkungan Hidup dan Kehutanan belum ditentukan</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> waktunya akan tetapi dimulai sekitar Bulan September. Untuk penilaian tingkat DIY akan</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> dilaksanakan pada hari Senin, tanggal 23 September 2019. Posisi saat ini baru tahapan peer review</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"> (pencermatan terhadap dokumen Jakstrada dan neraca pengelolaan sampah tahun 2018).</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 150%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0070c0;\"><span style=\"color: #0000ff;\"><strong>Penghargaan Adipura berupa apa saja ?</strong></span></span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #000000;\">Penghargaan Adipura berupa Tropi Adipura, Tropi Adipura Kencana, Penghargaan Kinerja</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-right: -8,0000pt; margin-bottom: 6,0000pt; text-align: justify; text-justify: inter-ideograph; line-height: 114%;\" align=\"justify\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #000000;\"> Pengurangan, Plakat (lokasi tematik) dan/atau Sertifikat (progress) tergantung klasifikasi kotanya.</span></span></p>\r\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; width: 460,4500pt; mso-table-layout-alt: fixed; border: none; mso-border-left-alt: 0,5000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; mso-border-insideh: 0,5000pt solid windowtext; mso-border-insidev: 0,5000pt solid windowtext; mso-padding-alt: 0,0000pt 5,4000pt 0,0000pt 5,4000pt;\" border=\"1\" cellspacing=\"0\">\r\n<tbody>\r\n<tr style=\"height: 22,3500pt;\">\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; mso-border-left-alt: 0,5000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d; border: 1,0000pt solid windowtext;\" rowspan=\"2\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">KLASIFIKASI</span></p>\r\n</td>\r\n<td style=\"width: 236,6000pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" colspan=\"4\" width=\"315\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">KRITERIA</span></p>\r\n</td>\r\n<td style=\"width: 146,1000pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" width=\"194\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">ANUGERAH</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Jakstrada</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">TPA</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Pengelolaan sampah</span></p>\r\n</td>\r\n<td style=\"width: 146,8500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext; background: #a8d08d;\" colspan=\"2\" width=\"195\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 460,4500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"6\" width=\"613\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\"><em><span style=\"font-style: italic;\">Zona Adipura</span></em><em></em></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\"><em><span style=\"font-style: italic;\">&nbsp;</span></em></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">I</span></p>\r\n</td>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&radic;</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Sanitary Landfill</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&ge; 70 %</span></p>\r\n</td>\r\n<td style=\"width: 146,8500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"2\" rowspan=\"2\" width=\"195\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">Tropi Adipura atau Tropi Adipura Kencana</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">II</span></p>\r\n</td>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&radic;</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Control Landfill</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&ge; 70 %</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 460,4500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"6\" width=\"613\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\"><em><span style=\"font-style: italic;\">Zona Non Adipura</span></em><em></em></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\"><em><span style=\"font-style: italic;\">&nbsp;</span></em></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">III</span></p>\r\n</td>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&radic;</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Open Dumping</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&ge; 50 %</span></p>\r\n</td>\r\n<td style=\"width: 146,8500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: 1,0000pt solid windowtext; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"2\" width=\"195\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">Penghargaan Kinerja Pengurangan</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">IV</span></p>\r\n</td>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&radic;</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Open Dumping</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&lt; 50 %</span></p>\r\n</td>\r\n<td style=\"width: 146,8500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"2\" width=\"195\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">Plakat (lokasi tematik) dan atau Sertifikat (progres)</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 77,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: 1,0000pt solid windowtext; mso-border-left-alt: 0,5000pt solid windowtext; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">V</span></p>\r\n</td>\r\n<td style=\"width: 65,7500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"87\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&radic;</span></p>\r\n</td>\r\n<td style=\"width: 92,1500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"122\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">Open Dumping</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 77,9500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" width=\"103\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; text-align: center;\" align=\"center\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 146,8500pt; padding: 0,0000pt 5,4000pt 0,0000pt 5,4000pt; border-left: none; mso-border-left-alt: none; border-right: 1,0000pt solid windowtext; mso-border-right-alt: 0,5000pt solid windowtext; border-top: none; mso-border-top-alt: 0,5000pt solid windowtext; border-bottom: 1,0000pt solid windowtext; mso-border-bottom-alt: 0,5000pt solid windowtext;\" colspan=\"2\" width=\"195\" valign=\"top\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0,0000pt; line-height: 150%;\"><span style=\"font-family: helvetica; font-size: small;\">(Sumber: Bidang Tata Lingkungan Dinas Lingkungan Hidup Kabupaten Kulon Progo)&nbsp;<br /></span></p>\r\n<p>&nbsp;</p>', NULL);
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(51, 'Data Kualitas Lingkungan Kulon Progo', '<p>\r\n<table id=\"_mc_tmp\" style=\"height: 5px;\" border=\"0\" width=\"20\">\r\n<tbody>\r\n<tr>\r\n<td>No</td>\r\n<td>Data Kualitas Ling</td>\r\n<td>Download</td>\r\n<td>Sumber</td>\r\n</tr>\r\n<tr>\r\n<td>I</td>\r\n<td>Air laut 2014&nbsp; &nbsp;</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202014.docx\">DOWNLOAD</a></td>\r\n<td>DLHK DIY</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>Air laut 2015</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202015.xlsx\">DOWNLOAD</a></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>Air laut 2016</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202016.xlsx\">DOWNLOAD</a></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>Air laut 2017</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202017.xlsx\">DOWNLOAD</a></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>Air laut 2018</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202018.xlsx\">DOWNLOAD</a></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>Air laut 2019</td>\r\n<td><a href=\"http://dlh.kulonprogokab.go.id/files/data%20laut%202019.xlsx\">DOWNLOAD</a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>', NULL),
(52, 'PERTANYAAN DAN JAWABAN SEPUTAR PENGELOLAAN SAMPAH', '<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\"><strong>1.<span style=\"margin: 0px; line-height: normal; font-family: &quot;Times New Roman&quot;; font-size: 7pt; font-style: normal; font-variant: normal; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></strong></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><strong>Kenapa sampah harus dikelola ? tinggal dibuang\r\nsaja kan bisa</strong>.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Jawaban :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Bila sampah tidak dikelola dan hanya langsung dibuang\r\nke lingkungan maka akan mengurangi nilai kebersihan dan keindahan, mengurangi\r\nkenyamanan, menjadi media penularan penyakit (lalat, tikus, nyamuk, kecoa), menurunkan\r\nkualitas lingkungan (pencemaran udara, pencemaran tanah dan sumber air), dampak\r\npolutan B3 (limbah industry, pertambangan, cat, buangan gas kendaraan bermotor,\r\nbaterai bekas, kaleng).</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Hal tersebut secara akumulasi menyebabkan gangguan\r\nkesehatan antara lain kanker, gangguan fungsi hati, gangguan ginjal dan\r\ngangguan syaraf.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\">&nbsp;</p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><strong><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">2.<span style=\"margin: 0px; line-height: normal; font-family: &quot;Times New Roman&quot;; font-size: 7pt; font-style: normal; font-variant: normal; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Bagaimana cara mengelola sampah yang baik ?</span></strong></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Jawaban :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Mengelola sampah dapat dilakukan dengan cara\r\npengurangan dan penanganan. Pengurangan sampah dilakukan melalui prinsip 3R (<em>Reduce,\r\nReuse, dan Recycle</em>) yaitu<span style=\"margin: 0px;\">&nbsp; </span>pengurangan sampah, penggunaan kembali sampah dan pendaur ulangan\r\nsampah. </span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pembatasan timbulan sampah /pengurangan sampah. Misalnya\r\ndengan membawa tas belanja sendiri dari rumah, menghidangkan makan minum dengan\r\npiring dan gelas.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pendaur ulangan sampah, misalnya sampah plastik didaur\r\nualng menjadi produk kerajinan</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">c.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pemanfaatan kembali sampah yaitu memanfaatkan sampah\r\nyang masih bisa digunakan kembali, misalnya kaleng bekas cat digunakan sebagai\r\npot tanaman.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Penanganan sampah dilakukan dengan cara :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pemilahan</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pengumpulan</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">c.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pengangkutan </span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">d.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pengolahan </span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">e.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pemrosesan akhir</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Sampah organik seperti dedaunan atau sisa makanan dapat\r\ndimanfaatkan sebagai bahan pembuat kompos atau briket bioarang </span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Sampah anorganik seperti sampah kertas, plastik,\r\nbotol, dilakukan pemilahan menjadi <span style=\"margin: 0px;\">&nbsp;</span>:</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">sampah yang laku jual untuk dikumpulkan ke bank sampah</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">sampah yang bisa diolah, dimanfaatkan untuk kerajinan\r\ndaur ulang </span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">c.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">sampah tidak laku jual dan tidak bisa diolah sehingga\r\nhanya jadi residu dan dibawa<span style=\"margin: 0px;\">&nbsp; </span>ke TPA</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Tips mengelola sampah yang benar :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">mengubah pola pikir bahwa sampah<span style=\"margin: 0px;\">&nbsp; </span>bukan lagi &ldquo;sampah&rdquo; yang tidak bermanfaat,\r\nmengelola sampah=investasi terutama kesehatan, mengelola sampah itu sederhana\r\ndan mudah.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Penerapan prinsip 3R yaitu Reduce (mengurangi timbulan\r\nsampah), Reuse (menggunakan kembali sampah yang dihasilkan) dan Recycle\r\n(mendaur ulang sampah yang dihasilkan).</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 24px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><strong><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">3.<span style=\"margin: 0px; line-height: normal; font-family: &quot;Times New Roman&quot;; font-size: 7pt; font-style: normal; font-variant: normal; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Bagaimana arah dan kebijakan Kulon Progo dalam\r\npengelolaan sampah ?</span></strong></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Terkait dengan kebijakan persampahan secara umum\r\nmempedomani Undang-undang nomor 18 tahun 2008 tentang<span style=\"margin: 0px;\">&nbsp; </span>sampah.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Di tataran Kabupaten Kulon Progo :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Perda no 1 tahun 2013 tentang penyelenggaraan\r\npengelolaan sampah rumah tangga dan sampah sejenis sampah rumah tangga</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Perbup no 68 tahun 2018 tentang kebijakan dan strategi\r\ndaerah dalam pengelolaan sampah rumah tangga dan sampah sejenis sampah rumah\r\ntanggga</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Di Peraturan Bupati nomor 68 tahun 2018 telah\r\nditetapkan target-target pengurangan dan penanganan sampah sehingga pada tahun\r\n2025 pengurangan sampah mencapai 30% dan penanganan sampah mencapai 70%.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Upaya-upaya yang dilakukan untuk pengurangan sampah\r\nyang menjadi fokus DLH adalah pengelolaan sampah secara mandiri melalui bank\r\nsampah. Di Kabupaten Kulon Progo tercatat 128 bank sampah. Namun dari jumlah\r\ntersebut hanya 73 bank sampah yang aktif melakukan kegiatan.</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">&nbsp;</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 48px; text-align: justify; line-height: 150%;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pencanangan <strong>Gerakan Pilah Sampah dari Rumah Tangga. </strong>Kegiatan<strong> r</strong>iil di masyarakat :</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">a.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Pemilahan antara sampah organic dan anorganik</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">b.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Sampah organik agar diselesaikan di tingkat rumah\r\ntangga (pengomposan)</span></p>\r\n<p></p>\r\n<p style=\"margin: 0px 0px 0px 72px; text-align: justify; line-height: 150%; text-indent: -18pt;\"><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\"><span style=\"margin: 0px;\">c.<span style=\"font: 7pt &quot;Times New Roman&quot;; margin: 0px; font-size-adjust: none; font-stretch: normal;\">&nbsp;&nbsp;&nbsp; </span></span></span><span lang=\"EN-ID\" style=\"margin: 0px; line-height: 150%; font-family: &quot;Arial&quot;,sans-serif; font-size: 12pt;\">Sampah anorganik : dijual langsung ke pelapak, buat\r\nbank sampah, produk kreasi daur ulang sampah</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: arial; font-size: x-small;\">(Sumber: Bidang Tata Lingkungan Dinas Lingkungan Hidup Kulon Progo)</span></p>', NULL),
(53, 'Sekretariat Dinas', '<p>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Sub Bagian Umum dan Kepegawaian</span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\">Sub Bagian Perencanaan dan Keuangan</span></li>\r\n</ul>\r\n</p>', NULL),
(54, 'Daftar Pemohon Informasi', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Formulir Daftar Pemohon dan Permintaan Informasi Publik, selengkapnya dapat diunduh sebagai berikut:</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Form%20ppid.xls\">DOWNLOAD</a></span></p>', NULL),
(55, 'Alur Permohonan Informasi', '<p><img src=\"/files/news/normal/alur_permohonan_informasi.jpg\" alt=\"\" /></p>', NULL),
(56, 'Tata Cara Pengajuan Keberatan Informasi Publik', '<h2 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 10px; text-align: justify;\"><span style=\"font-weight: 700;\"><span style=\"font-family: helvetica; font-size: small;\">Tata Cara Pengajuan Keberatan Informasi</span></span></h2>\r\n<div class=\"bodytext\" style=\"box-sizing: border-box; line-height: 22.4px; color: #333333; text-align: justify;\">\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\r\n<li style=\"box-sizing: border-box; line-height: 22.4px;\"><span style=\"font-family: helvetica; font-size: small;\">Pemohon informasi publik mengajukan keberatan secara tertulis kepada atasan PPID Pembantu Dinas Lingkungan Hidup Kulon Progo dalam jangka waktu paling lambat 30 (tiga puluh) hari kerja setelah diketemukan alasan;</span></li>\r\n<li style=\"box-sizing: border-box; line-height: 22.4px;\"><span style=\"font-family: helvetica; font-size: small;\">Atasan PPID Pembantu Dinas Lingkungan Hidup Kulon Progo&nbsp;harus memberikan tanggapan atas pengajuan keberatan tersebut paling lambat 30 (tiga puluh) hari kerja sejak diterimanya keberatan secara tertulis. Apabila Atasan PPID Pembantu menguatkan putusan yang ditetapkan bawahannya maka alasan tertulis disertakan bersama tanggapan tersebut;</span></li>\r\n<li style=\"box-sizing: border-box; line-height: 22.4px;\"><span style=\"font-family: helvetica; font-size: small;\">Jika pengaju keberatan puas atas putusan Atasan PPID Pembantu, maka sengketa keberatan selesai;</span></li>\r\n<li style=\"box-sizing: border-box; line-height: 22.4px; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Jika pengaju keberatan informasi publik tidak puas atas tanggapan Atasan PPID Pembantu, maka penyelesaian sengketa informasi publik dapat diajukan kepada Komisi Informasi Daerah Daerah Istimewa Yogyakarta</span></li>\r\n</ul>\r\n</div>', NULL),
(57, 'Prosedur Penyelesaian Sengketa Informasi Publik', '<p><img src=\"/files/news/normal/sengketaaa.jpg\" alt=\"\" /></p>', NULL),
(58, 'Form Pernyataan Keberatan Atas Permohonan Informasi', '<h2 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 10px; text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Form Pernyataan Keberatan Atas Permohonan Informasi dapat didownload sebagai berikut:</span></h2>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp; &nbsp;<a href=\"files/Form%20Pernyataan%20Keberatan%20Atas%20Permohonan%20Informasi.docx\">DOWNLOAD</a></span></p>', NULL),
(70, 'SK Pengelola Website DLH Kulon Progo', '<p><img src=\"/files/news/normal/werw.jpg\" alt=\"\" /></p>', NULL),
(71, 'Regulasi Umum dan Kepegawaian', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\"><br /></span></span></span></span></span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\">\r\n<p class=\"Default\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan\r\nBupati Kulon Progo Nomor 23 Tahun 2018 Tentang <span style=\"mso-bidi-font-weight: bold;\">Izin Bagi Pegawai Negeri Sipil Yang Mencalonkan Diri Menjadi Kepala Desa\r\nAtau Mendaftarkan Diri Sebagai Perangkat Desa <a href=\"files/BD%20PB-23-2018%20(Ijin%20bagi%20PNS).pdf\">(DOWNLOAD)</a></span></span></span></span></span></span></span></span></p>\r\n</li>\r\n<li style=\"text-align: justify;\">\r\n<p class=\"Default\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Pengaturan\r\nCuti Bagi PNS Dalam PP Nomor 11 Tahun 2017 Tentang Manajemen PNS<strong>&nbsp;</strong>(<a href=\"files/Pengaturan%20Cuti%20Bagi%20PNS%20Dalam%20PP%20Nomor%2011%20Tahun%202017%20Tentang%20Manajemen%20PNS-dikompresi.pdf\">DOWNLOAD</a>)</span></span></span></span></span></span></span></p>\r\n</li>\r\n<li style=\"text-align: justify;\">\r\n<p class=\"Default\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">PERATURAN BUPATI KULON PROGO&nbsp;NOMOR 34 TAHUN 2015&nbsp;TENTANG&nbsp;KLASIFIKASI BARANG PERSEDIAAN<span style=\"color: #0000ee;\"> (</span><a href=\"files/BD%20PB-30-2017%20KLASIFIKASI%20BARANG%20PERSEDIAAN.pdf\">DOWNLOAD</a>)</span></span></span></span></span></p>\r\n</li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan Bupati\r\nKulon Progo Nomor 60 Tahun 2010 Tentang Pedoman Tata Naskah Dinas Pemerintah\r\nDaerah <a href=\"files/PB-60-2010%20Tata%20Naskah%20Dinas.pdf\">(DOWNLOAD)</a></span></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan Bupati Kulon Progo Nomor 60 Tahun 2010 Tentang Pedoman Tata Naskah Dinas Pemerintah Daerah (<a href=\"files/PB-60-2010%20Tata%20Naskah%20Dinas-Lampiran.pdf\">DOWNLOAD LAMPIRAN</a>)</span></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan Bupati Kulon Progo Nomor 87 Tahun 2013 Tentang\r\nPedoman Tata Naskah Dinas Elektronik Pada Pemerintah Daerah <a href=\"files/PB%20No.87-2013%20Tata%20Naskah%20Dinas%20Elektronik.pdf\">(DOWNLOAD)</a></span></span></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan Daerah Kabupaten\r\nKulon Progo Nomor 3 Tahun 2018 Tentang Pengelolaan Barang Milik Daerah\r\n(<a href=\"files/LD%20PD-3-2018-Pengelolaan%20BMD.pdf\">DOWNLOAD</a>)</span></span></span></span></span></li>\r\n<li><span style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan\r\nBupati Kulon Progo Nomor 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan\r\nJasa Tahun Anggaran 2019 <a href=\"files/Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></p>\r\n</span></span></span></span></li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nI Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa Tahun\r\nAnggaran 2019 <a href=\"files/Lamp%20I%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nII Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa Tahun\r\nAnggaran 2019 <a href=\"files/Lamp%20II%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nIII Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa Tahun\r\nAnggaran 2019 <a href=\"files/Lamp%20III%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nIII B Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa\r\nTahun Anggaran 2019 <a href=\"files/Lamp%20III%20B%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nIII C Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa\r\nTahun Anggaran 2019 <a href=\"files/Lamp%20III%20C%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nIII D Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa\r\nTahun Anggaran 2019 <a href=\"files/Lamp%20III%20D%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran\r\nIII E Perbup No. 30 Tahun 2018 Tentang Standardisasi Harga Barang Dan Jasa\r\nTahun Anggaran 2019 <a href=\"files/Lamp%20III%20E%20Perbup%20Kulonprogo%20No.30%20Tahun%202018%20ttg%20Standardisasi%20Harga%20Barang%20dan%20Jasa%20Tahun%20Anggaran%202019.pdf\">(DOWNLOAD)</a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"Default\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan Bupati Kulon Progo Nomor 22 Tahun 2019 Tentang\r\nKualifikasi Jabatan Pimpinan Tinggi Dan Jabatan Administrasi Pada Pemerintah\r\nDaerah </span><a style=\"font-family: helvetica; font-size: small;\" href=\"http://jdih.kulonprogokab.go.id/getfile.php?id=1810&amp;file=BD%20PB-22-2019.pdf \">(DOWNLOAD)</a></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\"><span style=\"font-family: helvetica; font-size: x-small;\"><span style=\"font-family: helvetica; font-size: small;\">Lampiran Peraturan Bupati Kulon Progo Nomor 22 Tahun 2019\r\nTentang Kualifikasi Jabatan Pimpinan Tinggi Dan Jabatan Administrasi Pada\r\nPemerintah Daerah <a href=\"http://jdih.kulonprogokab.go.id/getfile.php?id=1811&amp;file=LAMPIRAN%20PB-22-2019.pdf \">(DOWNLOAD)</a></span></span></p>\r\n</li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n</ul>', NULL),
(72, 'Fungsi, Tugas Dan Uraian Tugas', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Fungsi, Tugas, dan Uraian Tugas pada Dinas Lingkungan Hidup Kulon Progo secara terperinci dapat diakses melalui tautan berikut :</span></p>\r\n<p style=\"text-align: justify;\"><a href=\"http://dlh.kulonprogokab.go.id/files/PB-62-2016%20LH.pdf\"><span style=\"font-family: helvetica; font-size: small;\">DOWNLOAD</span></a></p>', NULL),
(73, 'Arsip Kliping DLH Kulon Progo', '<p style=\"text-align: center;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"color: #ff0000; font-size: medium;\"><strong>Silahkan Scroll Ke Bawah Untuk Menampilkan Arsip Kliping </strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"color: #ff0000; font-size: medium;\"><strong>DLH Kulon Progo</strong></span></span></p>\r\n<p><img src=\"files/Kliping%20TPA%20Banyuroto.jpg\" alt=\"\" width=\"700\" height=\"1117\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"files/WhatsApp%20Image%202019-10-14%20at%2015.10.36.jpeg\" alt=\"\" width=\"700\" height=\"525\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"files/apliksi%20sibaku%20kliping.jpeg\" alt=\"\" width=\"700\" height=\"298\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"files/idul%20adha.jpeg\" alt=\"\" width=\"700\" height=\"875\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"files/pr%20sampah.jpg\" alt=\"\" width=\"700\" height=\"2356\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"files/kr%20ismia.jpg\" alt=\"\" width=\"700\" height=\"525\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL),
(59, 'Informasi Setiap Saat', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><br /></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Jadwal Petugas Stand DLH di Mal Pelayanan Publik Kulon Progo Bulan September 2019&nbsp;<span style=\"color: #0000ff;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Jadwal%20Petugas%20DLH%20di%20MPP%20Kulon%20Progo%20Bulan%20September.xlsx\">(DOWNLOAD)</a></span></span></span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Jadwal Petugas Stand DLH di Mal Pelayanan Publik Kulon Progo Bulan Oktober&nbsp; 2019&nbsp;<span style=\"color: #0000ff;\"><a href=\"files/Jadwal%20Petugas%20DLH%20di%20MPP%20Kulon%20Progo%20Bulan%20Oktober.xlsx\">(DOWNLOAD)</a></span></span></span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>', NULL),
(60, 'Sekretariat Dinas', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Klik tautan berikut:</span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"index.php?pilih=hal&amp;id=61\">Sub Bagian Umum dan Kepegawaian</a></span></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=62\">Sub Bagian Perencanaan dan Keuangan</a></span></span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>', NULL),
(61, 'Sub Bagian Umum Dan Kepegawaian', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><br /></span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=37\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Profil Pegawai dan Karyawan Dinas Lingkungan Hidup Tahun 2019</span></span></span></a></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=69\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Data Pegawai Berdasar Tingkat Pendidikan dan Golongan Kepangkatan</span></span></a></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=70\"><span style=\"font-family: helvetica; font-size: small;\">SK Pengelola Website DLH Kulon Progo</span></a></span></li>\r\n<li style=\"text-align: justify;\"><a href=\"index.php?pilih=hal&amp;id=71\"><span style=\"font-family: helvetica; font-size: small;\">Kumpulan Regulasi Umum dan Kepegawaian&nbsp;</span></a></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></span></p>', NULL);
INSERT INTO `halaman` (`id`, `judul`, `konten`, `seftitle`) VALUES
(62, 'Sub Bagian Perencanaan dan Keuangan', '<ul id=\"sidebarmenu4\" style=\"padding: 0px; margin: 0px; color: #4284b0; list-style-type: none; z-index: 999;\">\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"Perjanjian Kinerja 2019\" href=\"http://dlh.kulonprogokab.go.id/files/PERJANJIAN%20KINERJA%20(PK)%20TAHUN%202019%20Esl%202.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">1. Perjanjian Kinerja 2019</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"LAPORAN KEUANGAN 2018 (belum diaudit)\" href=\"http://dlh.kulonprogokab.go.id/files/LAP%20KEU%20DLH%202018-compressed.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">2. LAPORAN KEUANGAN 2018 (belum diaudit)</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"Neraca, LRA, LO dan LPE 2018 DLH\" href=\"http://dlh.kulonprogokab.go.id/files/Neraca,%20LRA%20akrual,%20LO,%20LPE%202018%20DLH%20(terbaru%2014%20Feb%202018).pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">3. Neraca, LRA, LO dan LPE 2018 DLH</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"RUP 2019\" href=\"http://dlh.kulonprogokab.go.id/files/Sirup%20setelah%20Perubahan%202019.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">4. RUP 2019</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"RENSTRA DLH 2017-2022\" href=\"http://dlh.kulonprogokab.go.id/files/Renstra%20DLH%202017-2022%20Final.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">5. RENSTRA DLH 2017-2022</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"LKjIP 2018\" href=\"http://dlh.kulonprogokab.go.id/files/LKjIP%202018%20DLH.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">6. LKjIP 2018</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"Profil Kinerja 2018\" href=\"http://dlh.kulonprogokab.go.id/files/Profil%20Kinerja%20DLH%202018.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">7. Profil Kinerja 2018</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"Indikator Kinerja Utama\" href=\"http://dlh.kulonprogokab.go.id/files/IKU%20DLH%202018-converted.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">8. Indikator Kinerja Utama</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"RENJA 2020\" href=\"http://dlh.kulonprogokab.go.id/files/Renja%202020%20(ranc%20akhir).pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">9. RENJA 2020</span></span></span></span></a></li>\r\n<li style=\"padding: 0px; margin: 0px; position: relative; z-index: 999; text-align: justify;\"><a style=\"padding: 3px; margin: 0px; color: #4284b0; background-color: inherit; text-decoration-line: none; display: block; overflow: auto; z-index: 999;\" title=\"RENJA 2019 PERUBAHAN\" href=\"http://dlh.kulonprogokab.go.id/files/renja%202019%20perubahan.pdf\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; color: #000000; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">10. RENJA 2019 PERUBAHAN</span></span></span></span></a></li>\r\n</ul>\r\n<table class=\"MsoNormalTable\" style=\"width: 386.85pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"516\">\r\n<tbody>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 10.75pt; text-align: justify;\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">11.<a href=\"http://dlh.kulonprogokab.go.id/files/Renja%202018%20DLH%20Kulon%20Progo.compressed.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Rencana Kerja 2018 DLH</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">12.<a href=\"http://dlh.kulonprogokab.go.id/files/LKjIP%202017%20DLH%20KP%20lengkap%20kompressed.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">LKjIP 2017 DLH Kulon Progo</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">13.<a href=\"pages-16-rencana-kerja-klh-2017.html\"><span style=\"color: #4284b0; text-decoration-line: none;\">Rencana Kerja KLH 2017</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">14.<a href=\"http://klh.kulonprogokab.go.id/files/PDF%20Perubahan%20Renja%202017%20DLH.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Perubahan RENJA 2017 Dinas Lingkungan Hidup</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">15.<a href=\"http://dlh.kulonprogokab.go.id/files/PK%20DLH%202017.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Perubahan Penetapan Kinerja 2017</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">16.<a href=\"http://dlh.kulonprogokab.go.id/files/RKT%202017.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Rencana Kinerja Tahunan TA.2017 DLH</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">17.<a href=\"http://dlh.kulonprogokab.go.id/files/RAK%202017.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Rencana Aksi Kinerja (RAK) 2017</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">18.<a href=\"http://dlh.kulonprogokab.go.id/files/Rencana%20Aksi%20Kinerja%20KLH%202016.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Rencana Aksi Kinerja 2016</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">19.<a href=\"http://dlh.kulonprogokab.go.id/files/LKjIP%202016%20KLH%20Kulon%20Progo.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Lap Kinerja Kantor Lingkungan Hidup TA 2016</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">20.<a href=\"http://dlh.kulonprogokab.go.id/files/LapKeu%202016%20Lengkap.pdf\"><span style=\"color: #4284b0; text-decoration-line: none;\">Laporan Keuangan 2016 (audited)</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:&#10;  10.75pt\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">21.<a href=\"pages-16-laporan-tahunan-ta-2016.html\"><span style=\"color: #4284b0; text-decoration-line: none;\">Laporan Tahunan TA 2016</span></a></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid #CCCCCC 1.0pt;border-left:solid #CCCCCC 1.0pt;&#10;  border-bottom:none;border-right:none;mso-border-top-alt:solid #CCCCCC .5pt;&#10;  mso-border-left-alt:solid #CCCCCC .5pt;padding:1.05pt 1.05pt 1.05pt 1.05pt\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 10.75pt; text-align: justify;\"><span style=\"color: #4d4d4d;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">22.&nbsp;<span style=\"color: #4284b0; text-decoration-line: none;\"><a href=\"http://dlh.kulonprogokab.go.id/files/Laporan%20SPIP%20KLH%202016.pdf\">LAPORAN SISTEM PENGENDALIAN INTERN (SPIP) 2016</a></span></span></span></span></span></span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style=\"font-family: helvetica; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/files/PPID%20(SK%202019)%20DLH.pdf \">23.&nbsp;SK\r\nKepala Dinas Tentang Penetapan Pejabat Pengelola Informasi dan Dokumentasi\r\n(PPID) Pembantu DLH Kulon Progo</a></span></p>\r\n<p><a href=\"https://dlh.kulonprogokab.go.id/files/SK%20Bupati%20Tim%20PPID.pdf \"><span style=\"font-family: helvetica; font-size: small;\">24.&nbsp;</span><span style=\"font-family: helvetica; font-size: medium; text-align: justify;\">SK Bupati Tentang Pembentukan Tim Pengelola Informasi dan\r\nDokumentasi Pemkab Kulon Progo</span></a></p>', NULL),
(63, 'Bidang Tata Lingkungan', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Klik tautan berikut ini:</span></span></p>\r\n<ul>\r\n<li><a href=\"index.php?pilih=hal&amp;id=64\"><span style=\"font-family: helvetica; font-size: small;\">Seksi Pelestarian Lingkungan dan Peningkatan Kapasitas</span></a></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"color: #0000ff;\"><a href=\"index.php?pilih=hal&amp;id=65\"><span style=\"font-family: helvetica; font-size: small;\">Seksi Perencanaan dan Pengkajian Lingkungan</span></a></span></span></li>\r\n</ul>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>', NULL),
(64, 'Seksi Pelestarian Lingkungan dan Peningkatan Kapasitas', '<p></p>\r\n<ul>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=38\"><span style=\"font-family: helvetica; font-size: small;\">Profil Bank Sampah Induk Dhuawar Sejahtera</span></a></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=41\"><span style=\"font-family: helvetica; font-size: small;\">Informasi Seputar Sekolah Adiwiyata Kab. Kulon Progo TH.2019</span></a></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20SEKOLAH%20ADIWIYATA%20KULON%20PROGO.xlsx\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\">DATA SEKOLAH ADIWIYATA\r\nKULON PROGO.xlsx</span></a></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20SAKA%20KALPATARU.xlsx\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\">DATA SAKA\r\nKALPATARU.xlsx</span></a></span></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20PENGHARGAAN%20KULON%20PROGO.xlsx\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\">DATA PENGHARGAAN KULON\r\nPROGO.xlsx</span></a></span></span></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20PENGADAAN%20KONSERVASI.xlsx\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\">DATA PENGADAAN\r\nKONSERVASI.xlsx</span></a></span></span></span></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20LENGKAP%20BANK%20SAMPAH%20KULON%20PROGO.xlsx\" target=\"_blank\"><span style=\"font-family: helvetica; font-size: small;\">DATA LENGKAP BANK\r\nSAMPAH KULON PROGO.xlsx</span></a></span></span></span></span></span></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%; color: #4d4d4d;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><span style=\"line-height: 115%;\"><a href=\"https://dlh.kulonprogokab.go.id/files/DATA%20KELOMPOK%20PEDULI%20LINGKUNGAN.xlsx\" target=\"_blank\"><span style=\"line-height: 115%; color: #4284b0; text-decoration-line: none;\"><span style=\"font-family: helvetica; font-size: small;\">DATA KELOMPOK PEDULI\r\nLINGKUNGAN.xlsx</span></span></a></span></span></span></span></span></span></span></p>\r\n</li>\r\n</ul>\r\n<p>&nbsp;</p>', NULL),
(65, 'Seksi Perencanaan dan Pengkajian Lingkungan', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;Klik tautan-tautan berikut ini:</span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/pages-31-tahun-2014.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">DOKUMEN INFORMASI KINERJA\r\nPENGELOLAAN LINGKUNGAN HIDUP DAERAH 2016</span></span></a></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=39\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Dokumen Informasi Kinerja Pengelolaan Lingkungan Hidup Daerah Tahun 2017</span></span></a></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=46\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">HASIL KAJIAN TIMBULAN SAMPAH KULON PROGO</span></span></a></span></span></span></li>\r\n</ul>\r\n<ul style=\"text-align: justify;\">\r\n<li style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=76\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Regulasi Tata Lingkungan</span></span></a></span></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"line-height: 115%;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Tupoksi Seksi Perencanaan Pengkajian dan Konservasi Lingkungan DLH Kulon Progo <a href=\"files/Tugas%20Pokok%20dan%20Fungsi%20Seksi%20Perencanaan%20dan%20Pengkajian%20dan%20Konservasi%20Lingkungan%20Hidup%202019.pdf\">(DOWNLOAD)</a></span></span></span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></span></p>', NULL),
(66, 'Bidang Pengawasan dan Pengendalian', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Klik tautan berikut ini:</span></p>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=67\">Seksi Pengawasan dan Penaatan</a></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=68\">Seksi Pengendalian Pencemaran dan Kerusakan Lingkungan</a></span></li>\r\n</ul>\r\n<p>&nbsp;</p>', NULL),
(67, 'Seksi Pengawasan dan Penaatan', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Klik Tautan berikut ini:</span></p>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=79\">Kegiatan Penanganan Kasus</a></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=80\">Kegiatan Pengawasan Kebijakan</a></span></li>\r\n</ul>\r\n<p>&nbsp;</p>', NULL),
(68, 'Seksi Pengendalian Pencemaran dan Kerusakan Lingkungan', '<p></p>\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; color: #0000ff; font-size: small;\"><a href=\"files/Profil%20Laboratorium%20Lingkungan%20DLH%20Kulon%20Progo.pdf\"><span style=\"font-family: helvetica; font-size: small;\">Profil Laboratorium Lingkungan</span></a></span></li>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"https://dlh.kulonprogokab.go.id/files/Kajian%20UPTD%20LABORATORIUM%20LINGKUNGAN%20KP.doc\">Kajian UPTD Laboratorium Lingkungan Kab. Kulon Progo</a></span></li>\r\n</ul>\r\n<p>&nbsp;</p>', NULL),
(69, 'Data Pegawai Berdasar Tingkat Pendidikan dan Golongan Tahun 2018', '<p><img src=\"/files/news/normal/9547486.gif\" alt=\"\" /></p>', NULL),
(74, 'Daftar Artikel DLH Terpopuler', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Klik tautan-tautan berikut ini:</span></span></span></span></span></span></p>\r\n<h4 style=\"margin: 0in 0in 0.0001pt; background: white; text-align: justify;\">\r\n<ul>\r\n<li><span class=\"judul\"><span style=\"font-weight: normal;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"article-558-tantangan-pembangunan-mega-proyek-di-kabupaten-kulon-progo-terhadap-lingkungan-hidup.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Tantangan Pembangunan Mega Proyek Di Kabupaten Kulon Progo\r\nTerhadap Lingkungan Hidup</span></span></span></span></span></a></span></span></span></li>\r\n<li><span style=\"font-weight: normal; font-family: helvetica; font-size: small;\"><a href=\"article-566-menata-arsip-menata-pengendalian-internal-pemerintah-benarkah-part-1.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Menata Arsip &ndash; Menata Pengendalian Internal Pemerintah,\r\nBenarkah? (part 1)</span></span></span></span></span></a></span></li>\r\n<li><span class=\"judul\"><span style=\"font-weight: normal;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"article-567-menata-arsip-menata-pengendalian-internal-pemerintah-benarkah-part-2.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Menata Arsip &ndash; Menata Pengendalian Internal Pemerintah,\r\nBenarkah? (part 2)</span></span></span></span></span></a></span></span></span></li>\r\n<li><span style=\"font-size: 11pt; line-height: 107%; font-family: Calibri, sans-serif; font-weight: normal;\" lang=\"EN-AU\"><a href=\"article-569-telaah-terhadap-penyusunan-kajian-lingkungan-hidup-strategis-di-kabupaten-kulon-progo.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Telaah Terhadap Penyusunan&nbsp; Kajian Lingkungan Hidup Strategis Di\r\nKabupaten Kulon Progo</span></span></span></span></span></a></span></li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-weight: normal; font-family: helvetica; font-size: small;\"><span style=\"color: #27638c;\"><a href=\"article-571-mengenal-lebih-dekat-tentang-burung-kacer-sebagai-fauna-identitas-kabupaten-kulon-progo.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Mengenal\r\nLebih Dekat Tentang Burung Kacer Sebagai Fauna Identitas Kabupaten Kulon Progo</span></span></span></span></a></span></span></p>\r\n</li>\r\n<li>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><a href=\"article-572-perubahan-paradigma-pengelolaan-sampah-di-kabupaten-kulon-progo.html\"><span style=\"font-family: helvetica; font-size: small;\"></span></a></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-weight: normal; font-family: helvetica; font-size: small;\"><a href=\"article-572-perubahan-paradigma-pengelolaan-sampah-di-kabupaten-kulon-progo.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Perubahan Paradigma Pengelolaan Sampah Di Kabupaten Kulon Progo</span></span></span></a></span></p>\r\n</li>\r\n<li><span style=\"font-weight: normal; font-family: helvetica; font-size: small;\"><a href=\"article-573-stor-wajah-alias-face-scan-implementasi-budaya-satriya-yang-efektif.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Stor Wajah alias Face Scan,\r\nImplementasi Budaya Satriya yang Efektif</span></span></span></a></span></li>\r\n<li>\r\n<p class=\"MsoNormal\"><span style=\"font-weight: normal;\"><a href=\"article-576-pelanggan-itu-tidak-mau-diduakan-sebuah-konsep-transformasi-birokrasi.html\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Pelanggan itu Tidak Mau Diduakan,\r\nSebuah Konsep Transformasi Birokrasi</span></span></span></a></span></p>\r\n</li>\r\n<li><span style=\"color: #27638c; font-weight: normal;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"article-582-kartu-pemeliharaan-yang-terlupakan-benarkah-cermin-buruk-pengelolaan-barang-milik-daerah.html\"><span style=\"font-family: helvetica; font-size: small;\">Kartu\r\nPemeliharaan yang Terlupakan, Benarkah Cermin Buruk Pengelolaan Barang Milik\r\nDaerah?</span></a></span></span></li>\r\n<li><a style=\"font-weight: normal;\" href=\"https://dlh.kulonprogokab.go.id/article-584-lindungi-tanahku-untuk-anak-cucuku-sebuah-pesan-moral.html\"><span style=\"font-family: helvetica; font-size: small;\">Lindungi Tanahku Untuk Anak Cucuku, Sebuah Pesan Moral</span></a></li>\r\n</ul>\r\n</h4>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong></strong></p>\r\n<h4 style=\"margin: 0in; margin-bottom: .0001pt; background: white;\">\r\n<ul>\r\n</ul>\r\n</h4>', NULL),
(75, 'Arsip Surat Edaran', '<p>&nbsp;</p>\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Surat Edaran Peringatan Hari Keanekaragaman Hayati Tahun 2019 (<a href=\"files/Surat%20Edaran%20Peringatan%20Hari%20Keanekaragaman%20Hayati%202019.jpg\">DOWNLOAD</a>)</span></li>\r\n</ul>\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Surat Edaran Pelaksanaan Jam Krida Olahraga (<a href=\"files/Surat%20Edaran%20Pelaksanaan%20Jam%20Krida%20Olahraga.jpg\">DOWNLOAD</a>)</span></li>\r\n</ul>\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Surat\r\nEdaran Pengelolaan Sampah dan Minimalisasi Penggunaan Kantong Plastik Pada\r\nPerayaan Hari Raya Idul Adha 1440 H/2019 (<a href=\"files/surat%20edaran%20pengelolaan%20sampah%20hari%20raya%20idul%20adha(1).pdf\">DOWNLOAD</a>)</span></li>\r\n</ul>\r\n<ul>\r\n<li><span style=\"font-family: helvetica; font-size: small; text-align: justify;\">Surat Edaran Hari Peduli Sampah Nasional 2019 (<a href=\"files/Surat%20Edaran%20HPSN%202019_0002.pdf\">DOWNLOAD</a>)</span></li>\r\n<li><span style=\"font-family: helvetica; font-size: small; text-align: justify;\">Surat Edaran Penyusunan Perubahan Renstra Perangkat Daerah <a href=\"https://dlh.kulonprogokab.go.id/files/merge_from_ofoct%20(2).jpg\">(DOWNLOAD)</a></span></li>\r\n</ul>\r\n<ul>\r\n</ul>\r\n<p>&nbsp;</p>', NULL),
(76, 'Regulasi Tata Lingkungan', '<p style=\"text-align: justify;\">\r\n<p class=\"Default\">\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\">Peraturan\r\nBupati Kulon Progo Nomor 68 Tahun 2018 Tentang Kebijakan Dan Strategi Daerah Dalam Pengelolaan Sampah Rumah Tangga Dan\r\nSampah Sejenis Sampah Rumah Tangga (<a href=\"https://dlh.kulonprogokab.go.id/files/BD%20PB-68-2018%20Jakstrada%20Sampah.pdf\">DOWNLOAD</a>)</span></li>\r\n</ul>\r\n</p>\r\n</p>', NULL),
(77, 'Aplikasi Jual Sampah Online', '<p><img src=\"files/fix%20rapel.gif\" alt=\"\" width=\"190\" height=\"250\" /></p>', NULL),
(78, 'Maklumat Pelayanan Informasi Publik DLH Kulon Progo', '<p><img src=\"files/maklumat%20informasi%20publik.jpg\" alt=\"\" width=\"700\" height=\"1200\" /></p>', NULL),
(79, 'Kegiatan Penanganan Kasus', '<p><span style=\"font-family: helvetica; font-size: small;\"><span style=\"font-family: helvetica; font-size: small;\">Klik tautan berikut ini:</span></span></p>\r\n<ul>\r\n<li style=\"text-align: justify;\"><span style=\"font-family: helvetica; font-size: small;\"><a href=\"index.php?pilih=hal&amp;id=81\"><span style=\"font-family: helvetica; font-size: small;\">Alur Penanganan Aduan/Kasus</span></a></span></li>\r\n<li style=\"text-align: justify;\"><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=82\"><span style=\"font-family: helvetica; font-size: small;\">Data Penanganan Aduan Lingkungan Hidup di DLH Kulon Progo</span></a></li>\r\n</ul>\r\n<p><span style=\"font-family: helvetica; font-size: small;\">&nbsp;</span></p>', NULL),
(80, 'Kegiatan Pengawasan Kebijakan', '<p>.</p>', NULL),
(81, 'Alur Penanganan Aduan/Kasus', '<p>&nbsp;<img src=\"files/AADADAA.gif\" alt=\"\" width=\"700\" height=\"2600\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL),
(82, 'Data Penanganan Aduan Lingkungan Hidup di DLH Kulon Progo', '<p><img src=\"files/DATDA.gif\" alt=\"\" width=\"700\" height=\"2600\" /></p>', NULL),
(83, 'Daftar Nilai Lomba Kebersihan Antar Instansi di Kabupaten Kulon Progo Tahun 2019', '<p><img src=\"files/hasil%20lomba.jpg\" alt=\"\" width=\"700\" height=\"525\" /></p>', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `intrusions`
--

CREATE TABLE `intrusions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `impact` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `intrusions`
--

INSERT INTO `intrusions` (`id`, `name`, `value`, `page`, `ip`, `impact`, `created`) VALUES
(1, 'judul', 'ibrahimovic-hamil-delapan-bulan-3-6-2', '/auracms2.3/article-9-ibrahimovic-hamil-delapan-bulan-3-6-2.html', 'local/unknown', 7, '2010-08-28 04:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jmlonline`
--

CREATE TABLE `jmlonline` (
  `id` int(11) NOT NULL,
  `counter` int(11) DEFAULT NULL,
  `online` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `judul` varchar(90) NOT NULL DEFAULT '',
  `konten` text NOT NULL,
  `user` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `tgl` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `artikel` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_gagal`
--

CREATE TABLE `login_gagal` (
  `ip` char(30) NOT NULL,
  `username` char(30) NOT NULL,
  `password` char(30) NOT NULL,
  `waktu` datetime NOT NULL,
  `is_blokir_aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login_gagal`
--

INSERT INTO `login_gagal` (`ip`, `username`, `password`, `waktu`, `is_blokir_aktif`) VALUES
('::1', 'kominfo', 'kominfo', '2021-02-22 08:11:30', 1),
('::1', 'kominfo', 'kominfo', '2021-02-22 08:11:49', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(2) NOT NULL,
  `menu` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(127) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT 0,
  `ordering` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `menu`, `url`, `published`, `ordering`) VALUES
(1, 'PROFIL DINAS', '#', 1, 2),
(2, 'INTERAKSI', '#', 1, 1),
(3, 'PPID PEMBANTU', '#', 1, 6),
(12, 'YOUTUBE', '#', 0, 12),
(6, 'LAYANAN PERIZINAN', '#', 1, 9),
(7, 'LINK', '#', 1, 15),
(8, 'Data Lingkungan Hidup', '#', 0, 8),
(9, 'Download ', '#', 0, 4),
(14, 'Arsip', '#', 0, 13),
(15, 'Daftar Informasi Publik', '#', 1, 7),
(16, 'KARYA TULIS PRAKERIN', '#', 1, 11),
(17, 'FAQ / TANYA JAWAB', '#', 1, 10),
(23, 'DATA', '#', 1, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_users`
--

CREATE TABLE `menu_users` (
  `id` int(6) NOT NULL,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu_users`
--

INSERT INTO `menu_users` (`id`, `menu`, `url`, `ordering`) VALUES
(1, 'Logout', 'index.php?aksi=logout', 4),
(2, 'Change Password', 'index.php?pilih=user&amp;aksi=change', 3),
(3, 'Send Article', 'admin.php?pilih=news&amp;mod=yes', 1),
(4, 'Send Lyrics', 'admin.php?pilih=lyrics&amp;mod=yes', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id` tinyint(11) NOT NULL,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT 0,
  `published` int(1) NOT NULL DEFAULT 0,
  `ordering` int(5) NOT NULL DEFAULT 0,
  `type` enum('block','module') NOT NULL DEFAULT 'module'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id`, `modul`, `isi`, `setup`, `posisi`, `published`, `ordering`, `type`) VALUES
(1, 'UPDATE NEWS', 'mod/artikel_terakhir/terakhir.php', '', 1, 1, 33, 'module'),
(2, 'Statistik Situs', 'mod/statistik/stat.php', '', 1, 1, 30, 'module'),
(3, 'SMART QUIZ', 'mod/polling/polling.php', '', 1, 1, 35, 'module'),
(4, 'KALENDER', 'mod/calendar/calendar.php', '', 1, 1, 2, 'module'),
(5, 'PESAN SINGKAT', 'mod/shoutbox/shoutboxview.php', '', 1, 1, 11, 'module'),
(6, 'Random Links', 'mod/random_link/randomlink.php', '', 1, 0, 2, 'module'),
(8, 'LOGIN', 'mod/login/login.php', '', 0, 1, 5, 'module'),
(10, 'ip logs', 'mod/phpids/ids.php', '', 0, 0, 3, 'module'),
(16, 'Advertisement', '<div style=\"text-align:center;\"><!-- Begin: KlikSaya.com -->\r\n<script src=\"http://scr.kliksaya.com/js-ad.php?zid=3704\" type=\"text/javascript\">\r\n</script>\r\n<!-- End: KlikSaya.com --></div>', '', 1, 0, 10, 'block'),
(23, 'Link', 'Link ke web lain', '', 0, 0, 4, 'block'),
(29, 'INSTAGRAM', '<a href=\"https://www.instagram.com/dinaslhkp/?hl=id\"><img src=\"https://4.bp.blogspot.com/-VU_lm7YFPtE/XNEF0tpFE2I/AAAAAAAAAJU/MYF5INqw--AxWjnXYdLZpolEOlEtfN8ugCLcBGAs/s1600/ig%2Bdeelha.jpg\"></a>', '', 1, 0, 6, 'block'),
(32, 'PERIZINAN ONLINE', '<a href=\"https://www.oss.go.id/oss/\"><img src=\"https://pbs.twimg.com/media/EEFK6ezUYAIgMWW?format=jpg&name=240x240\"></a>', '', 1, 1, 36, 'block'),
(46, 'DOWNLOAD FORMULIR', '<a href=\"https://dlh.kulonprogokab.go.id/pages-18-sppl.html\"><img src=\"https://pbs.twimg.com/media/EHDdT-CUwAEVPt9?format=jpg&name=240x240\"></a><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&id=40\"><img src=\"https://pbs.twimg.com/media/EHDdaa2VUAEey6D?format=jpg&name=240x240\"></a><a href=\"https://dlh.kulonprogokab.go.id/pages-27-download-formulir-izin-izin-lingkungan.html\"><img src=\"https://pbs.twimg.com/media/EHDdfqYU4Ac3U7_?format=jpg&name=240x240\"></a><a href=\"http://dlh.kulonprogokab.go.id/index.php?pilih=hal&id=44\"><img src=\"https://pbs.twimg.com/media/EHDdpwnUcAA2ZoW?format=jpg&name=240x240\"></a><a href=\"https://dlh.kulonprogokab.go.id/index.php?pilih=hal&id=48\"><img src=\"https://pbs.twimg.com/media/EHDduTDU0AAnGiH?format=jpg&name=240x240\"></a>', '', 0, 1, 1, 'block'),
(43, 'YOUTUBE', '<a href=\"https://www.youtube.com/channel/UCVy1TFo4XB5UIJVkF3fehIg?view_as=subscriber\"><img src=\"https://2.bp.blogspot.com/-oFq_B_TYz0Q/XNKF4VGF-lI/AAAAAAAAAKQ/88ukkELYdEEi7YsSK-BQJh5r8tEGWGFGACLcBGAs/s1600/YUTUBE%2BNEW2.jpg\"></a>', '', 1, 0, 4, 'block'),
(48, 'ADVERTISEMENT', '<a href=\"https://www.rapel.id/\"><img src=\"https://dlh.kulonprogokab.go.id/files/fix%20rapel.gif\"></a><a href=\"https://twitter.com/dinaslhkp/status/1181833069344350208/photo/1\"><img src=\"https://pbs.twimg.com/media/EGa26F0UEAEc5NJ?format=jpg&name=360x360\"></a>', '', 0, 1, 2, 'block'),
(49, 'TWITTER', '<a href=\"https://twitter.com/dinaslhkp\"><img src=\"https://1.bp.blogspot.com/-Fdn4QMh_iFg/XQBQ2VqUvkI/AAAAAAAAAO0/1X_bEv2A2Pg-aS0UshroMHXbo6xhOz1CQCLcBGAs/s1600/twitfix33.jpg\"></a>', '', 1, 0, 5, 'block'),
(53, 'SMART APLIKASI', '<a href=\"http://gitdev.kulonprogokab.go.id/sibaku/\"><img src=\"https://pbs.twimg.com/media/EG9yzpaUEAAKVl6?format=jpg&name=240x240\"></a><a href=\"http://gitdev.kulonprogokab.go.id/elingku/\"><img src=\"https://pbs.twimg.com/media/EHoGDDYVAAEtVQH?format=jpg&name=240x240\"></a><a href=\"https://play.google.com/store/apps/details?id=id.compro.depotbibitgratis\"><img src=\"https://pbs.twimg.com/media/EHoD5eYU8AASN3Q?format=jpg&name=240x240\"></a>', '', 1, 1, 1, 'block'),
(54, 'MEDIA SOSIAL', '<a href=\"https://www.instagram.com/dinaslhkp/?hl=id\"><img src=\"https://pbs.twimg.com/media/EEFEwvyVAAAWqGK?format=jpg&name=240x240\"></a><a href=\"https://www.facebook.com/dlh.kulonprogo.33?__tn__=%2Cd%2AF%2AF-R&eid=ARDj3gJLsBBXRULlrXN3QKdMrcbgE72Y80eLV4uNUr6tV6djgzBENAiPWHIVVBCbhg1wLnUPdXWHGEGj&tn-str=%2AF\"><img src=\"https://pbs.twimg.com/media/EEExcbRUYAAh5KT?format=jpg&name=240x240\"></a><a href=\"https://twitter.com/dinaslhkp\"><img src=\"https://pbs.twimg.com/media/EEFEAJaU0AE2n5e?format=jpg&name=240x240\"></a><a href=\"https://www.youtube.com/channel/UCVy1TFo4XB5UIJVkF3fehIg?view_as=subscriber\"><img src=\"https://pbs.twimg.com/media/EEExVx6UwAAMhS2?format=jpg&name=240x240\"></a>', '', 1, 1, 4, 'block'),
(52, 'DIRGAHAYU HUT RI', '<a href=\"https://1.bp.blogspot.com/-OFpilHClYJE/XUzd-Xsk4EI/AAAAAAAAAP0/W7hR5jV2IuYp85Qsx1nrBRCS9vRZd_h3QCLcBGAs/s1600/HUT%2BRI%2B74.gif\"><img src=\"https://1.bp.blogspot.com/-OFpilHClYJE/XUzd-Xsk4EI/AAAAAAAAAP0/W7hR5jV2IuYp85Qsx1nrBRCS9vRZd_h3QCLcBGAs/s1600/HUT%2BRI%2B74.gif\"></a>', '', 1, 0, 3, 'block'),
(55, 'ADUAN ONLINE', '<a href=\"https://www.lapor.go.id/\"><img src=\"https://pbs.twimg.com/media/EEAoJrUVUAAU2NU?format=jpg&name=240x240\"></a>', '', 1, 1, 5, 'block'),
(45, 'PETA LOKASI', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3952.3617139947887!2d110.16135791491537!3d-7.857160680276181!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7afb22aefe9a0b%3A0x3ae17ffb496b882c!2sDinas+Lingkungan+Hidup+Kabupaten+Kulon+Progo!5e0!3m2!1sid!2sid!4v1556771330839!5m2!1sid!2sid\" width=\"220\" height=\"280\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '', 1, 1, 32, 'block');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_cat_download`
--

CREATE TABLE `mod_cat_download` (
  `kategori` varchar(30) NOT NULL DEFAULT '',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `kid` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_cat_link`
--

CREATE TABLE `mod_cat_link` (
  `kategori` varchar(30) NOT NULL DEFAULT '',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `kid` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mod_cat_link`
--

INSERT INTO `mod_cat_link` (`kategori`, `keterangan`, `kid`) VALUES
('Pemerintah', 'Berisi website pemerintah', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_download`
--

CREATE TABLE `mod_download` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `hit` int(11) NOT NULL DEFAULT 0,
  `date` varchar(78) NOT NULL DEFAULT '',
  `size` varchar(20) NOT NULL DEFAULT '1',
  `kid` int(12) NOT NULL DEFAULT 0,
  `broken` int(12) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_download_ratings`
--

CREATE TABLE `mod_download_ratings` (
  `id` varchar(11) NOT NULL DEFAULT '',
  `total_votes` int(11) NOT NULL DEFAULT 0,
  `total_value` int(11) NOT NULL DEFAULT 0,
  `used_ips` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_gallery`
--

CREATE TABLE `mod_gallery` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `width` int(12) NOT NULL DEFAULT 0,
  `height` int(12) NOT NULL DEFAULT 0,
  `modified` int(16) NOT NULL DEFAULT 0,
  `size` int(16) NOT NULL DEFAULT 0,
  `kid` int(12) NOT NULL DEFAULT 0,
  `users` varchar(100) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `view` int(32) NOT NULL DEFAULT 0,
  `id` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_gallery_kat`
--

CREATE TABLE `mod_gallery_kat` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `total` int(12) NOT NULL DEFAULT 0,
  `id` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_link`
--

CREATE TABLE `mod_link` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `hit` int(11) NOT NULL DEFAULT 0,
  `date` varchar(78) NOT NULL DEFAULT '',
  `broken` int(12) NOT NULL DEFAULT 0,
  `public` int(1) NOT NULL DEFAULT 0,
  `kid` int(12) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mod_link`
--

INSERT INTO `mod_link` (`judul`, `keterangan`, `url`, `hit`, `date`, `broken`, `public`, `kid`, `id`) VALUES
('Pemerintah Kabupaten Kulon Progo', 'Website Pemkab Kulon Progo', 'http://kulonprogokab.go.id', 26, '1358840520', 0, 1, 1, 7),
('Badan Lingkungan Hidup Provinsi DIY', 'Website Badan Lingkungan Hidup Provinsi DIY', 'http://kehati.jogjaprov.go.id/', 0, '1548904157', 0, 1, 1, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_news_ratings`
--

CREATE TABLE `mod_news_ratings` (
  `id` varchar(11) NOT NULL DEFAULT '',
  `total_votes` int(11) NOT NULL DEFAULT 0,
  `total_value` int(11) NOT NULL DEFAULT 0,
  `used_ips` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `polling`
--

CREATE TABLE `polling` (
  `pid` int(11) NOT NULL,
  `pjudul` varchar(255) NOT NULL DEFAULT '',
  `ppilihan` varchar(255) NOT NULL DEFAULT '',
  `pjawaban` varchar(255) NOT NULL DEFAULT '',
  `created` varchar(90) NOT NULL DEFAULT '',
  `public` varchar(6) NOT NULL DEFAULT 'tidak'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `polling`
--

INSERT INTO `polling` (`pid`, `pjudul`, `ppilihan`, `pjawaban`, `created`, `public`) VALUES
(1, 'Bagaimana Menurut Anda AuraCMS 2.2 ini', 'Bagus#Jelek#Biasa#Gak Menarik#No Comment', '1555#218#220#153#74', '17-Jul-2007', 'tidak'),
(2, 'Apakah tampilan website kami semakin baik ?', 'Tetap / Biasa saja#Ya#Tidak / Semakin Buruk', '0#0#0', '06-May-2015', 'tidak'),
(3, 'Apakah anda membuang sampah pada tempatnya?', 'Selalu#Sering#Kadang-Kadang#Tidak Pernah', '18#7#4#19', '06-Feb-2019', 'tidak'),
(4, 'Setiap tanggal berapa Hari Lingkungan Hidup Sedunia diperingati?', '08 Januari#15 Februari#25 Maret#05 Juni#05 Juli', '0#0#0#6#0', '05-Mar-2019', 'tidak'),
(5, 'Bahan/benda yang menyebabkan pencemaran disebut....', 'Salinitas#Polusi#Mutan#Polutan#Indikator', '0#1#0#3#0', '01-Apr-2019', 'tidak'),
(6, 'Tanggal 21 Mei diperingati sebagai hari...', 'Hari Kehutanan Sedunia#Hari Air Sedunia#Hari Konservasi Alam Nasional#Hari Keanekaragaman Hayati#Hari Cinta Puspa Nasional', '0#0#0#1#1', '02-May-2019', 'tidak'),
(7, 'Tanggal 22 Mei diperingati sebagai hari...', 'Hari Kehutanan Sedunia#Hari Air Sedunia#Hari Konservasi Alam Nasional#Hari Keanekaragaman Hayati#Hari Cinta Puspa Nasional', '0#0#0#3#0', '07-May-2019', 'tidak'),
(8, 'Hari Lingkungan Hidup Sedunia diperingati setiap tanggal....', '25 Juni#20 Juni#15 Juni#10 Juni#05 Juni', '1#0#0#0#3', '04-Jun-2019', 'tidak'),
(10, 'Mengolah kembali (daur ulang) sampah menjadi barang atau produk baru yang bermanfaat disebut....', 'Reuse#Reduce#Recycle#Remind#Recount', '2#1#13#1#0', '04-Jul-2019', 'ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `polling_ip`
--

CREATE TABLE `polling_ip` (
  `id` bigint(20) NOT NULL,
  `kd_polling` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `timeout` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `polling_ip`
--

INSERT INTO `polling_ip` (`id`, `kd_polling`, `ip`, `timeout`) VALUES
(1, '51', '192.168.1.96, 202.51.233.167', 1187262141);

-- --------------------------------------------------------

--
-- Struktur dari tabel `posted_ip`
--

CREATE TABLE `posted_ip` (
  `id` bigint(21) NOT NULL,
  `file` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posted_ip`
--

INSERT INTO `posted_ip` (`id`, `file`, `ip`, `time`) VALUES
(173, 'polling_result.php', '103.135.180.2', 1572310576);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor`
--

CREATE TABLE `sensor` (
  `id` bigint(20) NOT NULL,
  `word` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sensor`
--

INSERT INTO `sensor` (`id`, `word`) VALUES
(1, 'Kontol'),
(2, 'Anjing'),
(3, 'Anjeng'),
(4, 'anjrit'),
(5, 'memek'),
(6, 'tempek'),
(7, 'Bangsat'),
(8, 'fuck'),
(9, 'eSDeCe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id` tinyint(4) NOT NULL,
  `site_id` int(4) DEFAULT NULL,
  `name` char(50) NOT NULL,
  `val` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id`, `site_id`, `name`, `val`) VALUES
(1, 1, 'MENU', '[{\"text\":\" Beranda\",\"href\":\"{{base_url}}\",\"icon\":\"fa fa-home\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[]},{\"text\":\"PROFIL\",\"href\":\"#\",\"icon\":\"fa fa-star\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[{\"text\":\"Visi Misi\",\"href\":\"{{base_url}}detil\\/2\\/visi-dan-misi-puskesmas-kalibawang\",\"icon\":\"fa fa-star\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[]},{\"text\":\"Struktur Organisasi\",\"href\":\"{{base_url}}detil\\/3\\/struktur-organisasi-puskesmas-kalibawang\",\"icon\":\"fa fa-star\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[]},{\"href\":\"{{base_url}}detil\\/4\\/sejarah-puskesmas-kalibawang\",\"target\":\"_self\",\"text\":\"Sejarah\",\"icon\":\"fa fa-star\"}]},{\"text\":\"Informasi Publik\",\"href\":\"#\",\"icon\":\"fa fa-check-circle\",\"target\":\"_self\",\"title\":\"\",\"topik\":\"\",\"children\":[{\"href\":\"\\/puskesmas_kalibawang\\/category\\/37\\/publikasi\",\"target\":\"_self\",\"text\":\"Berita\",\"icon\":\"fa fa-newspaper-o\"},{\"href\":\"\\/puskesmas_kalibawang\\/category\\/40\\/artikel\",\"target\":\"_self\",\"text\":\"Artikel\",\"icon\":\"fa fa-clone\"},{\"href\":\"\\/puskesmas_kalibawang\\/category\\/39\\/pengumuman\",\"target\":\"_self\",\"text\":\"Pengumuman\",\"icon\":\"fa fa-bullhorn\"}]},{\"href\":\"#\",\"target\":\"_self\",\"text\":\"Pelayanan\",\"icon\":\"fa fa-child\",\"children\":[{\"href\":\"{{base_url}}detil\\/15\\/jadwal-dan-pelayanan-puskesmas\",\"target\":\"_self\",\"text\":\"Jadwal dan Layanan\",\"icon\":\"fa fa-calendar-minus-o\"}]},{\"href\":\"#\",\"target\":\"_self\",\"text\":\"COVID-19\",\"icon\":\"fa fa-codepen\",\"children\":[{\"href\":\"{{base_url}}detil\\/5\\/pengertian-covid-19\",\"target\":\"_self\",\"text\":\"Apa Itu Covid-19\",\"icon\":\"fa fa-question-circle-o\"},{\"href\":\"https:\\/\\/covid19.go.id\\/peta-sebaran-covid19\",\"target\":\"_blank\",\"text\":\"Sebaran Covid-19\",\"icon\":\"fa fa-crosshairs\"}]}]'),
(2, 1, 'fb', 'https://www.facebook.com/profile.php?id=100008335337471'),
(3, 1, 'twitter', ''),
(4, 1, 'instagram', 'https://instagram.com/puskesmas_kalibawang?igshid=11p1z8mdzf5zp'),
(5, 1, 'youtube', ''),
(6, 1, 'alamat_jalan', ' Jl. Sentolo-Muntilan KM 21, Ngrajun, Banjarharjo, Kalibawang, Kulon Progo, DIY'),
(7, 1, 'alamat_notelp', '08112954334'),
(8, 1, 'alamat_email', 'puskesmas.kalibawang@gmail.com'),
(9, 1, 'petalokasi', 'https://maps.app.goo.gl/qZoQ24XqpLe38AJT7'),
(10, 1, 'slogan', 'Sahabat Menuju Sehat'),
(11, 1, 'nama_skpd1', 'Puskesmas Kalibawang'),
(12, 1, 'nama_skpd2', 'Kabupaten Kulon Progo'),
(13, 1, 'keywords', 'Puskesmas Kalibawang'),
(14, 1, 'template', 'newspaper'),
(15, 1, 'template_homepage', '{\"mainbar\":[[{\"type\":\"news\",\"id_kategori\":\"1\"}],[{\"type\":\"news\",\"id_kategori\":\"2\"},{\"type\":\"news\",\"id_kategori\":\"9\"}],[{\"type\":\"news\",\"id_kategori\":\"7\"}]],\"sidebar\":[{\"type\":\"html\",\"val\":\"<h2>Hallow</h2>\"},{\"type\":\"html\",\"val\":\"<h2>Sidebar sub</h2>\"}]}'),
(16, 1, 'side_menu', '{\"kanan\":[],\"kiri\":[{\"title\":\"KATEGORI POSTINGAN\",\"tipe\":\"kategori\",\"data\":\"\"},{\"title\":\"INFO TANGGAP CORONA\",\"tipe\":\"html\",\"data\":\"<a href=\\\"https:\\/\\/kulonprogokab.go.id\\/corona\\/\\\"><img src=\\\"https:\\/\\/pbs.twimg.com\\/media\\/EcYb4JSUcAAnBta?format=jpg&name=360x360\\\"><\\/a>\",\"is_header\":true},{\"title\":\"IKLAN LAYANAN MASYARAKAT\",\"tipe\":\"html\",\"data\":\"<a href=\\\"https:\\/\\/twitter.com\\/dinaslhkp\\/status\\/1283581314092855296\\/photo\\/1\\\"><img src=\\\"https:\\/\\/pbs.twimg.com\\/media\\/EdAyZSNUEAAohd0?format=jpg&name=small\\\"><\\/a>\",\"is_header\":true},{\"title\":\"INSTAGRAM @puskesmas_kalibawang\",\"tipe\":\"html\",\"data\":\"<div class=\\\"taggbox-container\\\" style=\\\" width:100%;height:400px;overflow: auto;\\\"><div class=\\\"taggbox-socialwall\\\" data-wall-id=\\\"49185\\\" view-url=\\\"https:\\/\\/widget.taggbox.com\\/49185\\\">  <\\/div><script src=\\\"https:\\/\\/widget.taggbox.com\\/embed.min.js\\\" type=\\\"text\\/javascript\\\"><\\/script><\\/div>\",\"is_header\":true},{\"title\":\"Aduan LAPOR\",\"tipe\":\"html\",\"data\":\"<a href=\\\"https:\\/\\/www.lapor.go.id\\/\\\" target=\\\"_blank\\\"><img src=\\\"https:\\/\\/nanggulan.kulonprogokab.go.id\\/files\\/file_uploads\\/bfec67bee83d175f468aced8d7cab74d.png\\\" style=\\\"width: 100%\\\"><\\/a>\",\"is_header\":true},{\"title\":\"STATISTIK \",\"tipe\":\"statistik\",\"data\":\"\"},{\"title\":\"Retensi Arsip \",\"tipe\":\"arsip_bulanan\",\"data\":\"\"},{\"title\":\"FACEBOOK\",\"tipe\":\"html\",\"data\":\"<a href=\\\"https:\\/\\/www.facebook.com\\/profile.php?id=100008335337471\\\"><img style=\\\"-webkit-user-select: none;margin: auto;cursor: handpoint;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;\\\" src=\\\"https:\\/\\/scontent.fjog4-1.fna.fbcdn.net\\/v\\/t1.0-9\\/145137848_3477403622382930_9101991936657296149_o.jpg?_nc_cat=105&amp;ccb=3&amp;_nc_sid=ad2b24&amp;_nc_eui2=AeGJOkzImjNk13AwUD0tZuWTIgOtv7q2_roiA62_urb-upgH_-GW0dzELcwxG5w9K545uSlpQE3DI1GP49MaPs4G&amp;_nc_ohc=QDzHQh6QbmgAX-z-m0Y&amp;_nc_ht=scontent.fjog4-1.fna&amp;oh=3878ce62586e51ba9d0a42f9137a2f50&amp;oe=6052B62F\\\" width=\\\"350\\\" height=\\\"250\\\">\",\"is_header\":true}],\"tengah\":[{\"title\":\"Berita Terbaru\",\"tipe\":\"berita_terbaru\",\"data\":{\"jml_maks\":10,\"topik\":[24,22,21,23]}},{\"title\":\"\",\"tipe\":\"slideshow\",\"data\":{\"order_by\":\"last_created\",\"jml_maks\":10,\"topik\":[37]}},{\"title\":\"PENGUMUMAN\",\"tipe\":\"post\",\"data\":{\"order_by\":\"last_created\",\"jml_maks\":5,\"topik\":[39]}},{\"title\":\"ARTIKEL\",\"tipe\":\"post\",\"data\":{\"order_by\":\"last_created\",\"jml_maks\":5,\"topik\":[40]}},{\"title\":\"PETA LOKASI\",\"tipe\":\"html\",\"data\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3953.9522782479257!2d110.25540341477746!3d-7.688270794457658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7af467d971b157%3A0x2541066d3ca35a08!2sPuskesmas%20Kalibawang!5e0!3m2!1sen!2sid!4v1613465964364!5m2!1sen!2sid\\\" width=\\\"600\\\" height=\\\"450\\\" frameborder=\\\"0\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" aria-hidden=\\\"false\\\" tabindex=\\\"0\\\"><\\/iframe>\",\"is_header\":true}],\"newsticker\":[{\"data\":{\"jml_maks\":10,\"topik\":[24,22,21,23]}}]}'),
(17, 1, 'gambar_header', '{\"file\":\"\",\"tampil_teks\":\"true\"}'),
(18, 1, 'gambar_background', '{\"background-image\":\"https:\\/\\/dlh.kulonprogokab.go.id\\/files\\/img_background\\/7237ec4e68956d1e3de3559e342a0d7d.jpg\",\"background-image-raw-path\":\"7237ec4e68956d1e3de3559e342a0d7d.jpg\",\"background-color\":\"#008040\"}'),
(19, 1, 'is_slider_header', 'Y'),
(20, 1, 'gambar_header_slider', '[{\"url_gambar\":\"http:\\/\\/localhost\\/puskesmas_kalibawang\\/files\\/img_header_slider\\/c3a517e66d26f0644fa1b1fc80b72aba.jpg\",\"url_asli_gambar\":\"c3a517e66d26f0644fa1b1fc80b72aba.jpg\",\"teks\":\"\"},{\"url_gambar\":\"http:\\/\\/localhost\\/puskesmas_kalibawang\\/files\\/img_header_slider\\/bce012e5550d375d719d7f4f2b3e19b0.jpg\",\"url_asli_gambar\":\"bce012e5550d375d719d7f4f2b3e19b0.jpg\",\"teks\":\"\"},{\"url_gambar\":\"http:\\/\\/localhost\\/puskesmas_kalibawang\\/files\\/img_header_slider\\/7d095476d7e6ce0dec65f4b8d22b2c34.jpg\",\"url_asli_gambar\":\"7d095476d7e6ce0dec65f4b8d22b2c34.jpg\",\"teks\":\"\"}]'),
(21, 1, 'sudah_modul', '1'),
(24, 1, 'sudah_menu', '1'),
(25, 1, 'versi', '202006'),
(26, 1, 'site_footer', '{\"content\":[{\"header\":\"Info Bank Sampah \",\"jenis\":\"html\",\"tampil_header\":true,\"content\":\"<a href=\\\"http:\\/\\/sibaku.kulonprogokab.go.id\\/\\\"><img src=\\\"https:\\/\\/pbs.twimg.com\\/media\\/EJzGa3UUwAAjLwY?format=png&name=360x360\\\"><\\/a>\"},{\"header\":\"Pengelolaan Lingkungan\",\"jenis\":\"html\",\"tampil_header\":true,\"content\":\"<a href=\\\"http:\\/\\/gitdev.kulonprogokab.go.id\\/elingku\\/\\\"><img src=\\\"https:\\/\\/pbs.twimg.com\\/media\\/EJzGvdIVAAA4Pyv?format=png&name=360x360\\\"><\\/a>\"},{\"header\":\"Perizinan Online\",\"jenis\":\"html\",\"tampil_header\":true,\"content\":\"<a href=\\\"https:\\/\\/www.oss.go.id\\/oss\\/\\\"><img src=\\\"https:\\/\\/pbs.twimg.com\\/media\\/EJzI_jqU0AEeIub?format=png&name=360x360\\\"><\\/a>\"}]}'),
(27, 1, 'nama_opd_singkat', ''),
(28, 1, 'ppid_account', ''),
(29, 1, 'running_text', 'Selamat datang di website Puskesmas Kalibawang, Kabupaten Kulon Progo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoutbox`
--

CREATE TABLE `shoutbox` (
  `id` int(11) NOT NULL,
  `waktu` varchar(88) NOT NULL DEFAULT '',
  `nama` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `isi` varchar(255) NOT NULL DEFAULT '',
  `ket` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shoutbox`
--

INSERT INTO `shoutbox` (`id`, `waktu`, `nama`, `email`, `isi`, `ket`) VALUES
(12, 'Sabtu, 13 April 2019  07:01:53', 'Admindlh', 'dlh@kulonprogokab.go.id', 'Selamat datang di website resmi Dinas Lingkungan Hidup Kabupaten Kulon Progo. Website ini menyajikan beragam informasi tentang lingkungan hidup dan perizinan. Semoga bermanfaat', '120.188.75.57|Mozilla5.0 Linux; Android 4.4.2; ASUS_T00Q BuildKVT49L AppleWebKit537.36 KHTML, like Gecko Chrome47.0.2526.83 Mobile Safari537.36'),
(13, 'Sabtu, 13 April 2019  07:16:32', 'Sekretariat DLH', 'dinalinghidupkp@yahoo.com', 'Dinas Lingkungan Hidup juga membuka layanan perizinan di MPP Kulon Progo. Buka setiap hari kerja pukul 08.00 WIB-15.30 WIB. Semoga bermanfaat', '120.188.75.57|Mozilla5.0 Linux; Android 4.4.2; ASUS_T00Q BuildKVT49L AppleWebKit537.36 KHTML, like Gecko Chrome47.0.2526.83 Mobile Safari537.36'),
(15, 'Selasa, 02 Juli 2019  13:21:53', 'Nella Kharisma', 'nella.management@gmail.com', 'DLH jaya terus di udara.. klo ultah, jangan lupa nanggap saya..wkakkakak', '202.162.43.21|Mozilla5.0 Windows NT 10.0; Win64; x64 AppleWebKit537.36 KHTML, like Gecko Chrome75.0.3770.100 Safari537.36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_browse`
--

CREATE TABLE `stat_browse` (
  `pjudul` varchar(255) NOT NULL DEFAULT '',
  `ppilihan` text NOT NULL,
  `pjawaban` text NOT NULL,
  `id` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stat_browse`
--

INSERT INTO `stat_browse` (`pjudul`, `ppilihan`, `pjawaban`, `id`) VALUES
('Browser yang sering digunakan dalam mengakses halaman ini', 'Netscape#Opera#MSIE 4.0#MSIE 5.0#MSIE 6.0#Lynx#WebTV#Konqueror#bot#Other', '1531634#54178#271#27234#177254#37#0#165#153399#104955', 1),
('Operating system', 'Windows#Mac#Linux#FreeBSD#SunOS#IRIX#BeOS#OS/2#AIX#Other', '846255#3360#21271#36#32#4#6#1#1#1179025', 2),
('Pengunjung berdasarkan hari', 'Minggu#Senin#Selasa#Rabu#Kamis#Jumat#Sabtu', '278179#301172#310503#282325#304242#294680#279078', 3),
('Pengunjung berdasarkan bulan', 'Januari#Februari#Maret#April#Mei#Juni#Juli#Agustus#September#Oktober#November#Desember', '163304#162315#145755#139695#111050#174922#185199#197459#222044#241002#131865#175536', 4),
('Pengunjung berdasarkan jam', '0:00 - 0:59#1:00 - 1:59#2:00 - 2:59#3:00 - 3:59#4:00 - 4:59#5:00 - 5:59#6:00 - 6:59#7:00 - 7:59#8:00 - 8:59#9:00 - 9:59#10:00 - 10:59#11:00 - 11:59#12:00 - 12:59#13:00 - 13:59#14:00 - 14:59#15:00 - 15:59#16:00 - 16:59#17:00 - 17:59#18:00 - 18:59#19:00 - 19:59#20:00 - 20:59#21:00 - 21:59#22:00 - 22:59#23:00 - 23:59', '78671#73084#75431#77386#71036#72347#73837#76701#82151#92981#98353#96823#97523#101617#99837#95804#90482#86074#80473#83589#87675#87150#88827#82387', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int(2) NOT NULL,
  `menu` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(127) NOT NULL DEFAULT '',
  `parent` int(2) NOT NULL DEFAULT 0,
  `published` int(1) NOT NULL DEFAULT 0,
  `ordering` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `menu`, `url`, `parent`, `published`, `ordering`) VALUES
(1, 'Struktur Organisasi', 'pages-15-organisasi.html', 1, 1, 3),
(3, 'Buku Tamu', 'guestbook.html', 2, 1, 7),
(4, 'Kontak Kami', 'contact.html', 2, 1, 6),
(5, 'Kumpulan Foto', 'gallery.html', 1, 1, 10),
(9, 'About Me', 'index.php?pilih=hal&amp;id=32', 11, 1, 2),
(82, 'SOP Penanganan Aduan', 'pages-47-aduan.html', 3, 1, 14),
(11, 'Visi Misi', 'pages-9-visi-misi.html', 1, 1, 1),
(12, 'Statistik Website', 'statistik.html', 2, 1, 11),
(36, 'Link', 'links.html', 2, 0, 12),
(49, 'FAQ Izin Lingkungan di Kabupaten Kulon Progo', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=34', 17, 1, 0),
(50, 'Formulir Permohonan Informasi', 'form.html', 3, 1, -1),
(78, 'Profil Kinerja 2016', 'http://dlh.kulonprogokab.go.id/files/Profil%202016.pdf', 1, 0, 4),
(77, 'Pelaporan UKL-UPL ONLINE', 'http://amdaldiy.net/pelaporan-amdal/', 6, 0, 4),
(57, 'SPPL', 'pages-18-sppl.html', 6, 0, 0),
(58, 'UKL- UPL', 'pages-25-ukl-upl.html', 6, 0, 1),
(59, 'AMDAL', 'pages-19-amdal.html', 6, 1, 2),
(60, 'Sistem Informasi Lingkungan Hidup DIY', 'http://sil.jogjaprov.go.id/', 7, 1, 1),
(61, 'Kementerian Lingkungan Hidup & Kehutanan', 'http://www.menlhk.go.id/', 7, 1, 3),
(111, 'Laporan Hasil Kajian Timbulan Sampah Kulon Progo', 'http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=46', 8, 1, 5),
(62, 'Sistem Informasi Lingkungan Hidup Kulon Progo', 'http://kabkulonprogo.silh.menlh.go.id', 7, 0, 4),
(63, 'Data Aduan Dugaan Pencemaran atau Kerusakan ', 'pages-21-data-aduan-dugaan-pencemaran-atau-kerusakan.html', 8, 0, 1),
(64, 'Data Izin Lingkungan/ Dokumen Lingkungan', 'pages-22-data-izin-lingkungan-dokumen-lingkungan.html', 8, 0, 2),
(69, 'Pusat Pengendalian Pemb. Ekoregion Jawa', 'http://p3ejawa.menlhk.go.id/', 7, 1, 2),
(66, 'Izin Lingkungan', 'pages-26-izin-lingkungan.html', 6, 1, 5),
(67, 'Hasil Tindak Lanjut Pengadu', 'http://dlh.kulonprogokab.go.id/pages-27-form-isian.html', 9, 0, 1),
(68, 'Daftar Peraturan LH', 'pages-24-daftar-peraturan-lh.html', 9, 1, 2),
(70, 'Pengelolaan Sampah', 'pages-1-jejaring-sampah.html', 8, 0, 3),
(71, 'Dok.Informasi Kinerja Pengelolaan Lingkungan Hidup', 'pages-31-slhd.html', 8, 1, 4),
(80, 'Informasi Setiap Saat', 'pages-29-informasi-setiap-saat.html', 3, 0, 18),
(108, 'Seputar Sekolah Adiwiyata Kab. Kulon Progo TH.2019', 'index.php?pilih=hal&amp;id=41', 8, 1, 6),
(76, 'kosong', '', 3, 0, 20),
(81, 'Peraduan', 'mod/shoutbox/shoutboxview.php', 10, 1, 0),
(84, 'Bidang Pengawasan dan Pengendalian', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=66', 23, 1, 18),
(85, 'Informasi Serta Merta', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=17', 15, 1, 16),
(86, 'Formulir Permohonan Izin dan Laporan UKL-UPL', 'pages-27-formulir-permohonan-dan-laporan-ukl-upl.html', 9, 0, 0),
(87, 'Download Formulir Izin-Izin Lingkungan', 'pages-27-download-formulir-izin-izin-lingkungan.html', 6, 0, 6),
(89, 'CHANNEL DLH KP (click here)', 'https://www.youtube.com/channel/UCVy1TFo4XB5UIJVkF3fehIg?view_as=subscriber', 12, 0, 0),
(90, 'SIMASNEG KULON PROGO', 'http://simasneg.kulonprogokab.go.id/simasneg/', 7, 1, 6),
(91, 'JDIH KULON PROGO', 'http://jdih.kulonprogokab.go.id/', 7, 1, 7),
(95, 'Sekretariat Dinas', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=60', 23, 1, 2),
(94, 'Profil Pegawai Tahun 2019', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=37', 1, 0, 10),
(97, 'JADWAL SHOLAT', '<!--start code Widget Jadwal Shalat wilayah (KAB. KULON PROGO/D.I. YOGYAKARTA) --><center><iframe src=\"https://bimasislam.kemen', 13, 1, 0),
(98, 'Bidang Tata Lingkungan', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=63', 23, 1, 5),
(127, 'Informasi Berkala', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=16', 23, 0, 19),
(99, 'RENSTRA DLH 2017-2022', 'http://dlh.kulonprogokab.go.id/files/Renstra%20DLH%202017-2022%20Final.pdf', 15, 0, 8),
(100, 'Profil Bank Sampah Kab. Kulon Progo', '', 8, 1, 0),
(103, 'RUP 2019', 'http://dlh.kulonprogokab.go.id/files/Sirup%20setelah%20Perubahan%202019.pdf', 15, 0, 7),
(104, 'Informasi Setiap Saat', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=59', 15, 1, 1),
(105, 'LKjIP 2018', 'http://dlh.kulonprogokab.go.id/files/LKjIP%202018%20DLH.pdf', 15, 0, 10),
(106, 'Izin Operasional Pengelolaan Limbah B3', 'pages-40-izin-operasional-pengelolaan-limbah-b3.html', 6, 0, 3),
(107, 'Profil Kinerja 2018', 'http://dlh.kulonprogokab.go.id/files/Profil%20Kinerja%20DLH%202018.pdf', 15, 0, 13),
(109, 'Kedudukan dan Susunan Organisasi', 'http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=42', 1, 1, 2),
(110, 'Profil Singkat Pejabat', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=43', 1, 1, 9),
(112, 'Karya Tulis dan Laporan Prakerin', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=49', 16, 1, 0),
(114, 'Profil Laboratorium Lingkungan', 'https://dlh.kulonprogokab.go.id/files/Profil%20Laboratorium%20Lingkungan%20DLH%20Kulon%20Progo.pdf', 1, 0, 7),
(115, 'RENJA 2020', 'http://dlh.kulonprogokab.go.id/files/Renja%202020%20(ranc%20akhir).pdf', 15, 0, 18),
(116, 'RENJA 2019 PERUBAHAN', 'http://dlh.kulonprogokab.go.id/files/renja%202019%20perubahan.pdf', 15, 0, 19),
(117, 'SIM-Rapat', 'http://localhost/simsppd/home.php', 2, 0, 13),
(118, 'FAQ Penilaian Adipura', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=50', 17, 1, 1),
(119, 'FAQ Pengelolaan Sampah', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=52', 17, 1, 2),
(120, 'Dinas Lingkungan Hidup dan Kehutanan DIY', 'http://dlhk.jogjaprov.go.id/', 7, 1, 0),
(122, 'Daftar Pemohon Informasi', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=54', 3, 1, 12),
(123, 'Alur Permohonan Informasi', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=55', 3, 1, 13),
(124, 'Tata Cara Pengajuan Keberatan Informasi', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=56', 3, 1, 15),
(125, 'Prosedur Penyelesaian Sengketa Informasi', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=57', 3, 1, 16),
(126, 'Form Pernyataan Keberatan Permohonan Informasi', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=58', 3, 1, 17),
(128, 'Informasi Berkala', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=16', 15, 1, 14),
(129, 'Fungsi, Tugas dan Uraian Tugas', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=72', 1, 1, 8),
(130, 'Arsip Kliping DLH', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=73', 23, 1, 21),
(131, 'Artikel DLH Terpopuler', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=74', 23, 1, 20),
(132, 'Arsip Surat Edaran', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=75', 23, 1, 22),
(133, 'Maklumat Pelayanan Informasi Publik', 'https://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=78', 3, 1, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu2`
--

CREATE TABLE `submenu2` (
  `id` int(2) NOT NULL,
  `menu` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(127) NOT NULL DEFAULT '',
  `parent` int(2) NOT NULL DEFAULT 0,
  `published` int(1) NOT NULL DEFAULT 0,
  `ordering` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submenu2`
--

INSERT INTO `submenu2` (`id`, `menu`, `url`, `parent`, `published`, `ordering`) VALUES
(3, 'PANDUAN BOS', 'pages-30-panduan-bos.html', 48, 1, 0),
(7, 'VERIFIKASI DATA GURU PERSIAPAN KURIKULUM 2013', 'pages-35-verifikasi-data-guru-persiapan-kurikulum-2013.html', 30, 0, 0),
(8, 'FORMULIR PENGAJUAN NISN', 'pages-36-formulir-pengajuan-nisn.html', 30, 0, 1),
(16, 'VERIFIKASI DATA GURU PERSIAPAN KURIKULUM 2013', 'pages-35-verifikasi-data-guru-persiapan-kurikulum-2013.html', 30, 0, 2),
(26, 'PANDUAN R-BOS SEKOLAH MENENGAH', 'pages-50-panduan-r-bos-sekolah-menengah.html', 45, 1, 1),
(28, 'panduan BOS DIKDAS 2013', 'pages-30-panduan-bos-dikdas-2013.html', 48, 1, 1),
(37, 'Rencana Strategis (Renstra) Kantor Lingkungan Hidu', 'http://klh.kulonprogokab.go.id/files/Perubahan%20Renstra%20KLH%20Kulon%20Progo%202011-2016.pdf', 52, 1, 0),
(34, 'Bank Sampah', 'pages-28-bank-sampah.html', 70, 0, 0),
(35, 'PSM', 'pages-9-psm.html', 70, 0, 1),
(36, 'Tahun 2016', 'pages-31-tahun-2014.html', 71, 1, 0),
(38, 'Laporan Kinerja KLH Kulon Progo 2014', 'pages-16-laporan-kinerja-instansi-pemerintah-lkjip-klh-2014.html', 52, 1, 1),
(39, 'Rencana Kerja (Renja) Kantor Lingkungan Hidup Kulo', 'pages-16-rencana-kerja-klh-kulon-progo-ta-2015.html', 52, 1, 2),
(40, 'Laporan Keuangan TA 2014 KLH Kulon Progo', 'pages-16-laporan-keuangan-ta-2014-klh-kulon-progo.html', 52, 0, 3),
(41, 'Lap Status Lingkungan Hidup Daerah (SLHD) Kabupate', 'pages-16-buku-i-laporan-slhd-kab-kulon-progo-th-2014.html', 52, 1, 4),
(43, 'Informasi Berkala', 'pages-16-informasi-berkala.html', 76, 1, 12),
(44, 'Informasi Serta Merta', 'pages-17-informasi-serta-merta.html', 76, 1, 13),
(59, 'LAPORAN SISTEM PENGENDALIAN INTERN (SPIP) 2016', 'http://dlh.kulonprogokab.go.id/files/Laporan%20SPIP%20KLH%202016.pdf', 80, 1, 14),
(56, 'Lap Kinerja Kantor Lingkungan Hidup TA 2016', 'http://dlh.kulonprogokab.go.id/files/LKjIP%202016%20KLH%20Kulon%20Progo.pdf', 80, 1, 10),
(47, 'Rencana Kerja KLH 2017', 'pages-16-rencana-kerja-klh-2017.html', 80, 1, 3),
(48, 'Perubahan RENJA KLH 2016', 'pages-16-perubahan-renja-klh-2016.html', 76, 1, 14),
(62, 'Renstra DLH 2017-2022', 'http://dlh.kulonprogokab.go.id/files/Renstra%20DLH%202017-2022%20Final.pdf', 80, 1, 0),
(51, 'Metadata KLH 2017-2022', 'http://klh.kulonprogokab.go.id/files/Metadata%2029%20Okt%202016.xlsx', 76, 1, 15),
(52, 'Metadata KLH 2017-2022 Ex BAU', 'http://klh.kulonprogokab.go.id/files/Metadata%20Eks.%20BAU%20DLH%202017-2022.xlsx', 76, 1, 16),
(55, 'Laporan Tahunan TA 2016 ', 'pages-16-laporan-tahunan-ta-2016.html', 80, 1, 12),
(54, 'Perubahan RENJA 2017 Dinas Lingkungan Hidup', 'http://klh.kulonprogokab.go.id/files/PDF%20Perubahan%20Renja%202017%20DLH.pdf', 80, 1, 5),
(61, 'Rencana Kerja 2018 DLH', 'http://dlh.kulonprogokab.go.id/files/Renja%202018%20DLH%20Kulon%20Progo.compressed.pdf', 80, 1, 1),
(57, 'Laporan Keuangan 2016 (audited)', 'http://dlh.kulonprogokab.go.id/files/LapKeu%202016%20Lengkap.pdf', 80, 1, 11),
(58, 'Rencana Aksi Kinerja 2016', 'http://dlh.kulonprogokab.go.id/files/Rencana%20Aksi%20Kinerja%20KLH%202016.pdf', 80, 1, 9),
(64, 'LKjIP 2017 DLH Kulon Progo', 'http://dlh.kulonprogokab.go.id/files/LKjIP%202017%20DLH%20KP%20lengkap%20kompressed.pdf', 80, 1, 2),
(65, 'Perubahan Penetapan Kinerja 2017', 'http://dlh.kulonprogokab.go.id/files/PK%20DLH%202017.pdf', 80, 1, 6),
(66, 'Rencana Kinerja Tahunan TA.2017 DLH', 'http://dlh.kulonprogokab.go.id/files/RKT%202017.pdf', 80, 1, 7),
(67, 'Rencana Aksi Kinerja (RAK) 2017', 'http://dlh.kulonprogokab.go.id/files/RAK%202017.pdf', 80, 1, 8),
(71, ' Tahun 2017', 'http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=39', 71, 1, 1),
(70, 'Bank Sampah Dhuawar Sejahtera', 'http://dlh.kulonprogokab.go.id/index.php?pilih=hal&amp;id=38', 100, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kalender`
--

CREATE TABLE `tbl_kalender` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `waktu_mulai` date NOT NULL,
  `waktu_akhir` date NOT NULL,
  `background` varchar(10) NOT NULL DEFAULT '#d1d1d1',
  `color` varchar(10) NOT NULL DEFAULT '',
  `id` int(12) NOT NULL,
  `filenya` char(200) NOT NULL,
  `is_arsip` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id_gambar` int(11) NOT NULL,
  `id_themes` int(11) NOT NULL,
  `nm_file` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id_gambar`, `id_themes`, `nm_file`) VALUES
(2, 2, 'tema-bawah-ijo.jpg'),
(3, 3, 'ijoijo2.jpg'),
(4, 4, '3.jpg'),
(32, 1, 'web-klh-gratis2.jpg'),
(36, 1, 'Web-Dinas-Lingkungan-Hidup-Kulon-Progo1.jpg'),
(37, 1, 'Web-Dinas-Lingkungan-Hidup-Kulon-Progo2.jpg'),
(39, 1, 'tema-dlh2.jpg'),
(41, 1, 'NO-DRUGS-JPG-SIP.jpg'),
(46, 1, 'qeqrqrqrt.jpg'),
(47, 1, 'adafafgasghsgh.gif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topik`
--

CREATE TABLE `topik` (
  `id` tinyint(11) NOT NULL,
  `topik` varchar(60) NOT NULL DEFAULT '',
  `ket` text NOT NULL,
  `publik` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `topik`
--

INSERT INTO `topik` (`id`, `topik`, `ket`, `publik`) VALUES
(37, 'Berita', 'Informasi Umum', 1),
(38, 'Covid-19', 'tentang covid-19', 1),
(39, 'Pengumuman', 'berisi pengumuman yang penting', 1),
(40, 'Artikel', 'berisikan artikel kegiatan', 1),
(25, 'Halaman Statis', 'Halaman Statis', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `useraura`
--

CREATE TABLE `useraura` (
  `UserId` int(15) NOT NULL,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `web` varchar(250) NOT NULL DEFAULT '',
  `alamat` text NOT NULL,
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `ym` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Editor','User') NOT NULL DEFAULT 'User',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `negara` varchar(50) NOT NULL DEFAULT '',
  `buddylist` varchar(250) NOT NULL DEFAULT '{"Admin":["admin","ridwan","arif","agus"]}',
  `is_online` int(5) NOT NULL DEFAULT 0,
  `last_ping` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `useraura`
--

INSERT INTO `useraura` (`UserId`, `user`, `password`, `email`, `web`, `alamat`, `avatar`, `ym`, `level`, `tipe`, `negara`, `buddylist`, `is_online`, `last_ping`, `nama`, `telepon`, `start`, `exp`) VALUES
(15, 'adminklh', '7135f59e95318fae2110a5d79f4d65f4', 'dlh@kulonprogokab.go.id', '', '', '', '', 'Administrator', 'aktif', '', '{\"Admin\":[\"admin\",\"ridwan\",\"arif\",\"agus\"]}', 0, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Humas DLH Kulon Progo', '794dcb71412b2ef645fd81ac4040445d', 'dlh@kulonprogokab.go.id', '', '', '', '', 'Administrator', 'aktif', '', '{\"Admin\":[\"admin\",\"ridwan\",\"arif\",\"agus\"]}', 0, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'kominfo', 'dc2f4ef676263fe9dde73a9ae6299258', '', '', '', '', '', 'Administrator', 'aktif', '', '{\"Admin\":[\"admin\",\"ridwan\",\"arif\",\"agus\"]}', 0, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usercounter`
--

CREATE TABLE `usercounter` (
  `id` tinyint(11) NOT NULL,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `hits` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronline`
--

CREATE TABLE `useronline` (
  `id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronlineday`
--

CREATE TABLE `useronlineday` (
  `id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronlinemonth`
--

CREATE TABLE `useronlinemonth` (
  `id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `useronlinemonth`
--

INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(18880, '54.36.148.210', 'ip-54-36-148-210.a.ahrefs.com', '54.36.148.210', '', 1572160053),
(18877, '54.36.149.44', 'ip-54-36-149-44.a.ahrefs.com', '54.36.149.44', '', 1570926178),
(13733, '13.66.139.0', '13.66.139.0', '13.66.139.0', '', 1572301886),
(21449, '180.245.223.130', '180.245.223.130', '180.245.223.130', '', 1572917413),
(21456, '182.1.203.91', '182.1.203.91', '182.1.203.91', '', 1572926501),
(18448, '54.36.150.17', 'ip-54-36-150-17.a.ahrefs.com', '54.36.150.17', '', 1571588666),
(19530, '40.77.167.30', 'msnbot-40-77-167-30.search.msn.com', '40.77.167.30', '', 1572499544),
(21096, '157.55.39.50', 'msnbot-157-55-39-50.search.msn.com', '157.55.39.50', '', 1572304193),
(19817, '176.9.16.209', 'static.209.16.9.176.clients.your-server.de', '176.9.16.209', '', 1572040781),
(20945, '139.255.0.146', 'ln-static-139-255-0-146.link.net.id', '139.255.0.146', '', 1572090245),
(20916, '40.77.167.168', 'msnbot-40-77-167-168.search.msn.com', '40.77.167.168', '', 1572029402),
(21393, '66.220.149.35', '66.220.149.35', '66.220.149.35', '', 1572739790),
(20021, '157.55.39.186', 'msnbot-157-55-39-186.search.msn.com', '157.55.39.186', '', 1571508396),
(17944, '54.36.150.53', 'ip-54-36-150-53.a.ahrefs.com', '54.36.150.53', '', 1573083043),
(17945, '54.36.150.138', 'ip-54-36-150-138.a.ahrefs.com', '54.36.150.138', '', 1572682591),
(20164, '207.46.13.56', 'msnbot-207-46-13-56.search.msn.com', '207.46.13.56', '', 1570759730),
(21395, '40.77.167.103', 'msnbot-40-77-167-103.search.msn.com', '40.77.167.103', '', 1572768050),
(20540, '207.46.13.236', 'msnbot-207-46-13-236.search.msn.com', '207.46.13.236', '', 1572539182),
(21042, '182.1.120.44', '182.1.120.44', '182.1.120.44', '', 1572245770),
(18640, '54.36.148.23', 'ip-54-36-148-23.a.ahrefs.com', '54.36.148.23', '', 1572642781),
(21370, '54.36.148.112', 'ip-54-36-148-112.a.ahrefs.com', '54.36.148.112', '', 1573094247),
(20140, '40.77.167.56', 'msnbot-40-77-167-56.search.msn.com', '40.77.167.56', '', 1570688788),
(16856, '54.36.150.112', 'ip-54-36-150-112.a.ahrefs.com', '54.36.150.112', '', 1573094021),
(9912, '109.74.154.72', '109.74.154.72', '109.74.154.72', '', 1573028830),
(21384, '157.55.39.226', 'msnbot-157-55-39-226.search.msn.com', '157.55.39.226', '', 1572726680),
(21209, '40.77.189.7', 'msnbot-40-77-189-7.search.msn.com', '40.77.189.7', '', 1572522293),
(14677, '46.229.168.161', '46.229.168.161', '46.229.168.161', '', 1573101402),
(17695, '54.36.148.129', 'ip-54-36-148-129.a.ahrefs.com', '54.36.148.129', '', 1572736205),
(17742, '54.36.148.182', 'ip-54-36-148-182.a.ahrefs.com', '54.36.148.182', '', 1573084877),
(20729, '66.220.149.20', '66.220.149.20', '66.220.149.20', '', 1572836051),
(20188, '54.36.149.10', 'ip-54-36-149-10.a.ahrefs.com', '54.36.149.10', '', 1573086645),
(19409, '66.102.6.254', 'google-proxy-66-102-6-254.google.com', '36.78.58.216', '', 1572920005),
(11476, '66.249.79.64', 'crawl-66-249-79-64.googlebot.com', '66.249.79.64', '', 1571778983),
(20906, '141.8.183.24', '141-8-183-24.spider.yandex.com', '141.8.183.24', '', 1572005910),
(18851, '54.36.148.193', 'ip-54-36-148-193.a.ahrefs.com', '54.36.148.193', '', 1573109143),
(19847, '110.76.149.18', '18.sub149.pika.net.id', '110.76.149.18', '', 1571277069),
(18668, '54.36.148.232', 'ip-54-36-148-232.a.ahrefs.com', '54.36.148.232', '', 1572709527),
(18371, '54.36.148.236', 'ip-54-36-148-236.a.ahrefs.com', '54.36.148.236', '', 1572693578),
(19009, '54.36.148.128', 'ip-54-36-148-128.a.ahrefs.com', '54.36.148.128', '', 1572711649),
(17917, '54.36.150.119', 'ip-54-36-150-119.a.ahrefs.com', '54.36.150.119', '', 1573094262),
(20820, '120.188.66.28', '120.188.66.28', '120.188.66.28', '', 1571851425),
(18730, '54.36.148.201', 'ip-54-36-148-201.a.ahrefs.com', '54.36.148.201', '', 1573106882),
(20359, '40.77.167.191', 'msnbot-40-77-167-191.search.msn.com', '40.77.167.191', '', 1572598727),
(19987, '54.36.148.234', 'ip-54-36-148-234.a.ahrefs.com', '54.36.148.234', '', 1573105325),
(20110, '125.163.233.16', '16.subnet125-163-233.speedy.telkom.net.id', '125.163.233.16', '', 1570614475),
(20489, '209.17.97.42', '209.17.97.42.rdns.cloudsystemnetworks.com', '209.17.97.42', '', 1571362964),
(21436, '40.77.167.197', 'msnbot-40-77-167-197.search.msn.com', '40.77.167.197', '', 1572885079),
(21448, '40.77.167.101', 'msnbot-40-77-167-101.search.msn.com', '40.77.167.101', '', 1572920786),
(20348, '114.4.213.12', '114-4-213-12.resources.indosat.com', '114.4.213.12', '', 1571044697),
(14149, '46.229.168.138', 'crawl10.bl.semrush.com', '46.229.168.138', '', 1573108355),
(21009, '66.220.149.58', '66.220.149.58', '66.220.149.58', '', 1572222961),
(21432, '148.251.139.174', 'static.174.139.251.148.clients.your-server.de', '148.251.139.174', '', 1572885804),
(18835, '54.36.148.40', 'ip-54-36-148-40.a.ahrefs.com', '54.36.148.40', '', 1572961161),
(17733, '54.36.150.147', 'ip-54-36-150-147.a.ahrefs.com', '54.36.150.147', '', 1573086786),
(18033, '54.36.150.103', 'ip-54-36-150-103.a.ahrefs.com', '54.36.150.103', '', 1572665116),
(20703, '115.178.250.238', '115.178.250.238', '115.178.250.238', '', 1571635225),
(20742, '3.8.183.161', 'ec2-3-8-183-161.eu-west-2.compute.amazonaws.com', '3.8.183.161', '', 1571722444),
(20222, '157.55.39.147', 'msnbot-157-55-39-147.search.msn.com', '157.55.39.147', '', 1570897487),
(19789, '54.36.150.37', 'ip-54-36-150-37.a.ahrefs.com', '54.36.150.37', '', 1573100319),
(18391, '54.36.150.15', 'ip-54-36-150-15.a.ahrefs.com', '54.36.150.15', '', 1572753671),
(18392, '54.36.148.190', 'ip-54-36-148-190.a.ahrefs.com', '54.36.148.190', '', 1573081601),
(19894, '54.36.149.18', 'ip-54-36-149-18.a.ahrefs.com', '54.36.149.18', '', 1571204360),
(19764, '40.77.167.167', 'msnbot-40-77-167-167.search.msn.com', '40.77.167.167', '', 1572606396),
(16153, '46.229.168.153', 'crawl25.bl.semrush.com', '46.229.168.153', '', 1573101926),
(17914, '54.36.150.156', 'ip-54-36-150-156.a.ahrefs.com', '54.36.150.156', '', 1573103027),
(19826, '54.36.149.22', 'ip-54-36-149-22.a.ahrefs.com', '54.36.149.22', '', 1573108269),
(21270, '178.154.171.64', '178-154-171-64.spider.yandex.com', '178.154.171.64', '', 1572512437),
(20949, '120.188.95.19', '120.188.95.19', '120.188.95.19', '', 1572102834),
(19803, '207.46.13.108', 'msnbot-207-46-13-108.search.msn.com', '207.46.13.108', '', 1571307463),
(19821, '54.36.148.225', 'ip-54-36-148-225.a.ahrefs.com', '54.36.148.225', '', 1571263435),
(19804, '54.36.148.73', 'ip-54-36-148-73.a.ahrefs.com', '54.36.148.73', '', 1573105067),
(20905, '157.55.39.7', 'msnbot-157-55-39-7.search.msn.com', '157.55.39.7', '', 1572152476),
(20120, '173.252.127.29', '173.252.127.29', '173.252.127.29', '', 1570630388),
(18230, '54.36.148.100', 'ip-54-36-148-100.a.ahrefs.com', '54.36.148.100', '', 1573094216),
(11475, '66.249.79.95', 'crawl-66-249-79-95.googlebot.com', '66.249.79.95', '', 1571778983),
(18881, '54.36.148.139', 'ip-54-36-148-139.a.ahrefs.com', '54.36.148.139', '', 1572355919),
(21252, '54.36.148.161', 'ip-54-36-148-161.a.ahrefs.com', '54.36.148.161', '', 1572639944),
(17825, '54.36.148.205', 'ip-54-36-148-205.a.ahrefs.com', '54.36.148.205', '', 1573103447),
(21335, '40.77.191.100', 'msnbot-40-77-191-100.search.msn.com', '40.77.191.100', '', 1572595745),
(17098, '54.36.150.88', 'ip-54-36-150-88.a.ahrefs.com', '54.36.150.88', '', 1572647343),
(20756, '36.72.212.15', '36.72.212.15', '36.72.212.15', '', 1571746449),
(20741, '207.46.13.101', 'msnbot-207-46-13-101.search.msn.com', '207.46.13.101', '', 1571720498),
(21381, '207.46.13.85', 'msnbot-207-46-13-85.search.msn.com', '207.46.13.85', '', 1572711480),
(20755, '123.255.204.98', 'ip-123-255-204-98.datautama.net.id', '123.255.204.98', '', 1571743348),
(20063, '157.55.39.232', 'msnbot-157-55-39-232.search.msn.com', '157.55.39.232', '', 1570829957),
(20730, '140.213.97.115', '140.213.97.115', '140.213.97.115', '', 1571694554),
(20859, '180.254.83.31', '180.254.83.31', '180.254.83.31', '', 1571915557),
(20858, '140.213.59.30', '140.213.59.30', '140.213.59.30', '', 1571908691),
(20923, '157.55.39.248', 'msnbot-157-55-39-248.search.msn.com', '157.55.39.248', '', 1572056882),
(21110, '36.80.249.187', '36.80.249.187', '36.80.249.187', '', 1572319361),
(18245, '54.36.150.50', 'ip-54-36-150-50.a.ahrefs.com', '54.36.150.50', '', 1573102202),
(20759, '203.78.118.81', '203.78.118.81', '203.78.118.81', '', 1571753737),
(21433, '114.122.103.139', '114.122.103.139', '114.122.103.139', '', 1572877004),
(20718, '66.220.149.29', '66.220.149.29', '66.220.149.29', '', 1571658872),
(17738, '54.36.149.97', 'ip-54-36-149-97.a.ahrefs.com', '54.36.149.97', '', 1571291635),
(18784, '209.17.96.82', '209.17.96.82.rdns.cloudsystemnetworks.com', '209.17.96.82', '', 1570848145),
(18078, '54.36.150.109', 'ip-54-36-150-109.a.ahrefs.com', '54.36.150.109', '', 1573105197),
(18003, '54.36.150.150', 'ip-54-36-150-150.a.ahrefs.com', '54.36.150.150', '', 1573094535),
(20922, '180.249.200.29', '180.249.200.29', '180.249.200.29', '', 1572050771),
(20918, '207.46.13.178', 'msnbot-207-46-13-178.search.msn.com', '207.46.13.178', '', 1572829911),
(20464, '114.5.222.35', '114-5-222-35.resources.indosat.com', '114.5.222.35', '', 1571201986),
(11213, '5.45.207.38', '5-45-207-38.spider.yandex.com', '5.45.207.38', '', 1571402225),
(20373, '66.249.69.50', 'crawl-66-249-69-50.googlebot.com', '66.249.69.50', '', 1571095383),
(18451, '54.36.149.16', 'ip-54-36-149-16.a.ahrefs.com', '54.36.149.16', '', 1573109784),
(17999, '54.36.149.86', 'ip-54-36-149-86.a.ahrefs.com', '54.36.149.86', '', 1572636138),
(20767, '40.77.188.127', 'msnbot-40-77-188-127.search.msn.com', '40.77.188.127', '', 1572476647),
(20161, '140.213.91.216', '140.213.91.216', '140.213.91.216', '', 1570755591),
(20162, '40.77.167.106', 'msnbot-40-77-167-106.search.msn.com', '40.77.167.106', '', 1572156771),
(17125, '54.36.149.83', 'ip-54-36-149-83.a.ahrefs.com', '54.36.149.83', '', 1573104842),
(20758, '114.125.81.61', '114.125.81.61', '114.125.81.61', '', 1571753385),
(21387, '54.36.148.3', 'ip-54-36-148-3.a.ahrefs.com', '54.36.148.3', '', 1572713741),
(20763, '180.248.126.236', '180.248.126.236', '180.248.126.236', '', 1571766994),
(17989, '54.36.148.74', 'ip-54-36-148-74.a.ahrefs.com', '54.36.148.74', '', 1572671979),
(19473, '66.249.69.127', 'crawl-66-249-69-127.googlebot.com', '66.249.69.127', '', 1571105581),
(21097, '73.253.107.86', 'c-73-253-107-86.hsd1.ma.comcast.net', '73.253.107.86', '', 1572304279),
(21428, '207.46.13.97', 'msnbot-207-46-13-97.search.msn.com', '207.46.13.97', '', 1572880579),
(17956, '54.36.150.24', 'ip-54-36-150-24.a.ahrefs.com', '54.36.150.24', '', 1573109165),
(19892, '54.36.149.74', 'ip-54-36-149-74.a.ahrefs.com', '54.36.149.74', '', 1571250736),
(17714, '54.36.148.53', 'ip-54-36-148-53.a.ahrefs.com', '54.36.148.53', '', 1573094069),
(20915, '3.9.23.80', 'ec2-3-9-23-80.eu-west-2.compute.amazonaws.com', '3.9.23.80', '', 1572027091),
(16866, '54.36.150.159', 'ip-54-36-150-159.a.ahrefs.com', '54.36.150.159', '', 1572656026),
(19012, '54.36.148.197', 'ip-54-36-148-197.a.ahrefs.com', '54.36.148.197', '', 1573082341),
(20130, '182.1.101.28', '182.1.101.28', '182.1.101.28', '', 1570664239),
(18607, '54.36.150.6', 'ip-54-36-150-6.a.ahrefs.com', '54.36.150.6', '', 1573101812),
(20281, '114.5.215.46', '114-5-215-46.resources.indosat.com', '114.5.215.46', '', 1570973216),
(20282, '117.20.48.105', '117-20-48-105.soho.jogja.citra.net.id', '117.20.48.105', '', 1571435859),
(17906, '54.36.148.230', 'ip-54-36-148-230.a.ahrefs.com', '54.36.148.230', '', 1572313157),
(20674, '207.46.13.218', 'msnbot-207-46-13-218.search.msn.com', '207.46.13.218', '', 1571557514),
(13959, '46.229.168.136', 'crawl8.bl.semrush.com', '46.229.168.136', '', 1573109399),
(19861, '54.36.148.133', 'ip-54-36-148-133.a.ahrefs.com', '54.36.148.133', '', 1571273624),
(20998, '36.73.60.17', '36.73.60.17', '36.73.60.17', '', 1572181590),
(19366, '54.36.149.93', 'ip-54-36-149-93.a.ahrefs.com', '54.36.149.93', '', 1573085693),
(19011, '54.36.148.17', 'ip-54-36-148-17.a.ahrefs.com', '54.36.148.17', '', 1572464100),
(20760, '111.68.25.51', 'ipv4-51-25-68.as55666.net', '111.68.25.51', '', 1571754105),
(18778, '138.246.253.5', 'planetlab5.net.in.tum.de', '138.246.253.5', '', 1572112409),
(20541, '40.77.167.214', 'msnbot-40-77-167-214.search.msn.com', '40.77.167.214', '', 1571305460),
(19699, '141.8.132.32', '141-8-132-32.spider.yandex.com', '141.8.132.32', '', 1572447812),
(19700, '207.46.13.117', 'msnbot-207-46-13-117.search.msn.com', '207.46.13.117', '', 1570997555),
(20772, '40.77.167.78', 'msnbot-40-77-167-78.search.msn.com', '40.77.167.78', '', 1571791458),
(21182, '114.5.146.44', '114-5-146-44.resources.indosat.com', '114.5.146.44', '', 1572428439),
(20712, '36.73.90.224', '36.73.90.224', '36.73.90.224', '', 1571640968),
(20478, '185.103.110.204', 'server-185-103-110-204.creanova.org', '185.103.110.204', '', 1571225597),
(20228, '54.36.149.91', 'ip-54-36-149-91.a.ahrefs.com', '54.36.149.91', '', 1572639135),
(20181, '36.90.238.4', '36.90.238.4', '36.90.238.4', '', 1570846731),
(20182, '114.5.208.242', '114-5-208-242.resources.indosat.com', '114.5.208.242', '', 1570794075),
(20177, '157.55.39.243', 'msnbot-157-55-39-243.search.msn.com', '157.55.39.243', '', 1570786008),
(19213, '54.36.149.37', 'ip-54-36-149-37.a.ahrefs.com', '54.36.149.37', '', 1571563962),
(18839, '54.36.149.29', 'ip-54-36-149-29.a.ahrefs.com', '54.36.149.29', '', 1572676979),
(18840, '54.36.148.103', 'ip-54-36-148-103.a.ahrefs.com', '54.36.148.103', '', 1572711896),
(20109, '114.5.218.246', '114-5-218-246.resources.indosat.com', '114.5.218.246', '', 1570613066),
(20842, '207.46.13.185', 'msnbot-207-46-13-185.search.msn.com', '207.46.13.185', '', 1571890625),
(20187, '103.238.200.20', '103.238.200.20', '103.238.200.20', '', 1570803433),
(20552, '36.72.219.253', '36.72.219.253', '36.72.219.253', '', 1571323255),
(20547, '207.46.13.104', 'msnbot-207-46-13-104.search.msn.com', '207.46.13.104', '', 1572408644),
(20135, '114.5.221.18', '114-5-221-18.resources.indosat.com', '114.5.221.18', '', 1570679510),
(18251, '54.36.148.242', 'ip-54-36-148-242.a.ahrefs.com', '54.36.148.242', '', 1572634482),
(20143, '114.5.216.21', '114-5-216-21.resources.indosat.com', '114.5.216.21', '', 1570699255),
(21129, '114.142.168.46', 'subs16-114-142-168-46.three.co.id', '114.142.168.46', '', 1572342632),
(20818, '103.40.122.54', 'ip-54.122.40.jogjaringan.net.id', '103.40.122.54', '', 1573094399),
(19741, '66.249.71.32', 'crawl-66-249-71-32.googlebot.com', '66.249.71.32', '', 1570926501),
(20799, '203.130.193.124', '203.130.193.124', '203.130.193.124', '', 1571815620),
(20782, '101.255.58.6', '101.255.58.6', '101.255.58.6', '', 1571798535),
(20163, '36.84.49.247', '36.84.49.247', '36.84.49.247', '', 1570759601),
(14064, '46.229.168.129', 'crawl1.bl.semrush.com', '46.229.168.129', '', 1573106850),
(17718, '54.36.148.116', 'ip-54-36-148-116.a.ahrefs.com', '54.36.148.116', '', 1572679487),
(20008, '54.36.148.132', 'ip-54-36-148-132.a.ahrefs.com', '54.36.148.132', '', 1572880904),
(17968, '54.36.150.33', 'ip-54-36-150-33.a.ahrefs.com', '54.36.150.33', '', 1572393921),
(17966, '54.36.150.89', 'ip-54-36-150-89.a.ahrefs.com', '54.36.150.89', '', 1572830844),
(17965, '54.36.150.185', 'ip-54-36-150-185.a.ahrefs.com', '54.36.150.185', '', 1573080932),
(19028, '54.36.148.50', 'ip-54-36-148-50.a.ahrefs.com', '54.36.148.50', '', 1572434748),
(21450, '114.4.214.180', '114-4-214-180.resources.indosat.com', '114.4.214.180', '', 1572920199),
(20283, '207.46.13.114', 'msnbot-207-46-13-114.search.msn.com', '207.46.13.114', '', 1571298844),
(17935, '54.36.150.85', 'ip-54-36-150-85.a.ahrefs.com', '54.36.150.85', '', 1573094491),
(19556, '40.77.167.62', 'msnbot-40-77-167-62.search.msn.com', '40.77.167.62', '', 1572742420),
(17931, '54.36.150.16', 'ip-54-36-150-16.a.ahrefs.com', '54.36.150.16', '', 1573085105),
(17932, '54.36.148.239', 'ip-54-36-148-239.a.ahrefs.com', '54.36.148.239', '', 1572701816),
(19932, '54.36.148.52', 'ip-54-36-148-52.a.ahrefs.com', '54.36.148.52', '', 1573089135),
(17108, '54.36.148.8', 'ip-54-36-148-8.a.ahrefs.com', '54.36.148.8', '', 1573096386),
(20548, '207.46.13.130', 'msnbot-207-46-13-130.search.msn.com', '207.46.13.130', '', 1571331671),
(17985, '54.36.148.48', 'ip-54-36-148-48.a.ahrefs.com', '54.36.148.48', '', 1572279269),
(17901, '54.36.150.27', 'ip-54-36-150-27.a.ahrefs.com', '54.36.150.27', '', 1573095321),
(14354, '46.229.168.154', 'crawl26.bl.semrush.com', '46.229.168.154', '', 1573108686),
(20412, '66.249.69.148', 'crawl-66-249-69-148.googlebot.com', '66.249.69.148', '', 1571439900),
(20710, '103.105.254.250', 'host250-pool254.bimatek.co.id', '103.105.254.250', '', 1571971547),
(14601, '46.229.168.144', 'crawl16.bl.semrush.com', '46.229.168.144', '', 1573108879),
(21396, '112.215.243.63', '112.215.243.63', '112.215.243.63', '', 1572750672),
(20490, '40.77.167.161', 'msnbot-40-77-167-161.search.msn.com', '40.77.167.161', '', 1571563644),
(20418, '36.73.4.80', '36.73.4.80', '36.73.4.80', '', 1571130168),
(18032, '54.36.150.44', 'ip-54-36-150-44.a.ahrefs.com', '54.36.150.44', '', 1573106451),
(17815, '54.36.150.133', 'ip-54-36-150-133.a.ahrefs.com', '54.36.150.133', '', 1572649751),
(21098, '66.220.149.18', '66.220.149.18', '66.220.149.18', '', 1572577941),
(17891, '54.36.150.71', 'ip-54-36-150-71.a.ahrefs.com', '54.36.150.71', '', 1573109340),
(17892, '54.36.150.106', 'ip-54-36-150-106.a.ahrefs.com', '54.36.150.106', '', 1573108207),
(18124, '54.36.148.31', 'ip-54-36-148-31.a.ahrefs.com', '54.36.148.31', '', 1572692813),
(19907, '54.36.149.28', 'ip-54-36-149-28.a.ahrefs.com', '54.36.149.28', '', 1573088505),
(20215, '40.77.167.220', 'msnbot-40-77-167-220.search.msn.com', '40.77.167.220', '', 1572739743),
(13925, '107.21.1.8', 'ec2-107-21-1-8.compute-1.amazonaws.com', '107.21.1.8', '', 1572509714),
(19021, '54.36.150.74', 'ip-54-36-150-74.a.ahrefs.com', '54.36.150.74', '', 1573094168),
(20944, '40.77.167.131', 'msnbot-40-77-167-131.search.msn.com', '40.77.167.131', '', 1572386626),
(21243, '40.77.189.118', 'msnbot-40-77-189-118.search.msn.com', '40.77.189.118', '', 1572497609),
(20092, '52.204.97.54', 'duckduckbot.duckduckgo.com', '52.204.97.54', '', 1570570202),
(21416, '138.197.12.105', 'jobqueue-listener.jobqueue.netcraft.com-ubdcb82d4fe7b11e9befda946838d6ab1u-digitalocean', '138.197.12.105', '', 1572816936),
(20613, '213.180.203.56', '213-180-203-56.spider.yandex.com', '213.180.203.56', '', 1572475701),
(19212, '54.36.148.69', 'ip-54-36-148-69.a.ahrefs.com', '54.36.148.69', '', 1572949987),
(18197, '54.36.150.145', 'ip-54-36-150-145.a.ahrefs.com', '54.36.150.145', '', 1572949616),
(21427, '40.77.188.133', 'msnbot-40-77-188-133.search.msn.com', '40.77.188.133', '', 1572841531),
(20907, '209.17.96.202', '209.17.96.202.rdns.cloudsystemnetworks.com', '209.17.96.202', '', 1572007137),
(20856, '150.107.140.146', '150.107.140.146', '150.107.140.146', '', 1571903619),
(17844, '54.36.150.110', 'ip-54-36-150-110.a.ahrefs.com', '54.36.150.110', '', 1573103197),
(20845, '66.220.149.12', '66.220.149.12', '66.220.149.12', '', 1573082117),
(20701, '36.72.215.241', '36.72.215.241', '36.72.215.241', '', 1571630506),
(20132, '207.46.13.119', 'msnbot-207-46-13-119.search.msn.com', '207.46.13.119', '', 1571299664),
(17796, '54.36.148.247', 'ip-54-36-148-247.a.ahrefs.com', '54.36.148.247', '', 1573085255),
(19723, '40.77.167.16', 'msnbot-40-77-167-16.search.msn.com', '40.77.167.16', '', 1571110514),
(20724, '140.213.57.56', '140.213.57.56', '140.213.57.56', '', 1571670387),
(13964, '46.229.168.134', 'crawl6.bl.semrush.com', '46.229.168.134', '', 1573108762),
(21223, '95.108.213.6', '95-108-213-6.spider.yandex.com', '95.108.213.6', '', 1572484801),
(13501, '64.233.173.22', 'google-proxy-64-233-173-22.google.com', '115.178.238.206', '1.1 Chrome-Compression-Proxy', 1572305423),
(13502, '64.233.173.20', 'google-proxy-64-233-173-20.google.com', '115.178.238.206', '1.1 Chrome-Compression-Proxy', 1572311259),
(21359, '157.55.39.136', 'msnbot-157-55-39-136.search.msn.com', '157.55.39.136', '', 1572681117),
(21242, '34.83.6.35', '35.6.83.34.bc.googleusercontent.com', '34.83.6.35', '', 1572496253),
(20007, '117.20.48.106', '117-20-48-106.soho.jogja.citra.net.id', '117.20.48.106', '', 1570843350),
(13973, '46.229.168.148', 'crawl20.bl.semrush.com', '46.229.168.148', '', 1573101736),
(20965, '207.46.13.126', 'msnbot-207-46-13-126.search.msn.com', '207.46.13.126', '', 1572169902),
(20696, '120.188.76.162', '120.188.76.162', '120.188.76.162', '', 1571649370),
(17711, '54.36.148.215', 'ip-54-36-148-215.a.ahrefs.com', '54.36.148.215', '', 1572668317),
(19223, '54.36.148.245', 'ip-54-36-148-245.a.ahrefs.com', '54.36.148.245', '', 1573087554),
(20901, '103.95.6.9', '103.95.6.9', '103.95.6.9', '', 1571995150),
(19901, '54.36.148.97', 'ip-54-36-148-97.a.ahrefs.com', '54.36.148.97', '', 1573095998),
(13486, '66.249.79.92', 'crawl-66-249-79-92.googlebot.com', '66.249.79.92', '', 1571484662),
(20636, '114.5.216.239', '114-5-216-239.resources.indosat.com', '114.5.216.239', '', 1571473745),
(19652, '157.55.39.84', 'msnbot-157-55-39-84.search.msn.com', '157.55.39.84', '', 1570617445),
(20372, '66.249.69.63', 'crawl-66-249-69-63.googlebot.com', '66.249.69.63', '', 1571106769),
(19820, '202.152.141.89', '202-152-141-89.citra.net.id', '202.152.141.89', '', 1571650026),
(20338, '40.77.167.105', 'msnbot-40-77-167-105.search.msn.com', '40.77.167.105', '', 1571038745),
(21401, '157.55.39.246', 'msnbot-157-55-39-246.search.msn.com', '157.55.39.246', '', 1572762535),
(17869, '54.36.148.250', 'ip-54-36-148-250.a.ahrefs.com', '54.36.148.250', '', 1572161996),
(20315, '207.46.13.45', 'msnbot-207-46-13-45.search.msn.com', '207.46.13.45', '', 1572551354),
(17725, '54.36.148.165', 'ip-54-36-148-165.a.ahrefs.com', '54.36.148.165', '', 1573044999),
(19006, '54.36.150.31', 'ip-54-36-150-31.a.ahrefs.com', '54.36.150.31', '', 1573106876),
(21017, '157.55.39.65', 'msnbot-157-55-39-65.search.msn.com', '157.55.39.65', '', 1572231942),
(21298, '40.77.190.173', 'msnbot-40-77-190-173.search.msn.com', '40.77.190.173', '', 1572538901),
(20817, '114.4.83.219', '114-4-83-219.resources.indosat.com', '114.4.83.219', '', 1571843807),
(14618, '46.229.168.143', 'crawl15.bl.semrush.com', '46.229.168.143', '', 1573107904),
(19990, '18.179.46.168', 'ec2-18-179-46-168.ap-northeast-1.compute.amazonaws.com', '18.179.46.168', '', 1572321548),
(17748, '54.36.150.14', 'ip-54-36-150-14.a.ahrefs.com', '54.36.150.14', '', 1573105418),
(21423, '182.1.125.185', '182.1.125.185', '182.1.125.185', '', 1572838709),
(16841, '54.36.150.7', 'ip-54-36-150-7.a.ahrefs.com', '54.36.150.7', '', 1572652017),
(21206, '120.188.72.64', '120.188.72.64', '120.188.72.64', '', 1572471870),
(17897, '54.36.150.48', 'ip-54-36-150-48.a.ahrefs.com', '54.36.150.48', '', 1573105615),
(18012, '54.36.150.20', 'ip-54-36-150-20.a.ahrefs.com', '54.36.150.20', '', 1573102989),
(17690, '54.36.148.94', 'ip-54-36-148-94.a.ahrefs.com', '54.36.148.94', '', 1572949792),
(21109, '108.29.49.213', 'pool-108-29-49-213.nycmny.fios.verizon.net', '108.29.49.213', '', 1572318301),
(19014, '54.36.148.238', 'ip-54-36-148-238.a.ahrefs.com', '54.36.148.238', '', 1572695397),
(18009, '54.36.148.163', 'ip-54-36-148-163.a.ahrefs.com', '54.36.148.163', '', 1572432621),
(20148, '64.233.172.212', 'google-proxy-64-233-172-212.google.com', '114.5.210.27', '', 1570708937),
(17787, '54.36.150.9', 'ip-54-36-150-9.a.ahrefs.com', '54.36.150.9', '', 1572706825),
(19135, '40.77.167.127', 'msnbot-40-77-167-127.search.msn.com', '40.77.167.127', '', 1571226005),
(10546, '141.8.142.113', '141-8-142-113.spider.yandex.com', '141.8.142.113', '', 1573096572),
(20946, '207.46.13.146', 'msnbot-207-46-13-146.search.msn.com', '207.46.13.146', '', 1572097687),
(19831, '54.36.148.119', 'ip-54-36-148-119.a.ahrefs.com', '54.36.148.119', '', 1573107072),
(17969, '54.36.148.188', 'ip-54-36-148-188.a.ahrefs.com', '54.36.148.188', '', 1573101801),
(20653, '54.36.149.56', 'ip-54-36-149-56.a.ahrefs.com', '54.36.149.56', '', 1572494939),
(18016, '54.36.150.98', 'ip-54-36-150-98.a.ahrefs.com', '54.36.150.98', '', 1572401242),
(19469, '66.249.69.124', 'crawl-66-249-69-124.googlebot.com', '66.249.69.124', '', 1571151979),
(19470, '66.249.69.126', 'crawl-66-249-69-126.googlebot.com', '66.249.69.126', '', 1571432886),
(21185, '35.171.244.74', 'ec2-35-171-244-74.compute-1.amazonaws.com', '35.171.244.74', '', 1572430517),
(20165, '54.36.148.124', 'ip-54-36-148-124.a.ahrefs.com', '54.36.148.124', '', 1572668470),
(20798, '182.1.96.208', '182.1.96.208', '182.1.96.208', '', 1571813616),
(18011, '54.36.150.180', 'ip-54-36-150-180.a.ahrefs.com', '54.36.150.180', '', 1572697704),
(20500, '207.46.13.24', 'msnbot-207-46-13-24.search.msn.com', '207.46.13.24', '', 1571256694),
(18612, '54.36.148.89', 'ip-54-36-148-89.a.ahrefs.com', '54.36.148.89', '', 1572125088),
(20723, '114.142.168.53', 'subs16-114-142-168-53.three.co.id', '114.142.168.53', '', 1571669617),
(21295, '36.72.214.217', '36.72.214.217', '36.72.214.217', '', 1572534421),
(21170, '69.180.32.71', 'c-69-180-32-71.hsd1.ga.comcast.net', '69.180.32.71', '', 1572412800),
(16975, '54.36.150.28', 'ip-54-36-150-28.a.ahrefs.com', '54.36.150.28', '', 1572308368),
(21244, '40.77.190.15', 'msnbot-40-77-190-15.search.msn.com', '40.77.190.15', '', 1572497893),
(18015, '54.36.150.149', 'ip-54-36-150-149.a.ahrefs.com', '54.36.150.149', '', 1573107340),
(21473, '40.77.167.1', 'msnbot-40-77-167-1.search.msn.com', '40.77.167.1', '', 1572973031),
(20734, '36.89.250.5', '36.89.250.5', '36.89.250.5', '', 1571705877),
(20678, '173.252.95.2', '173.252.95.2', '173.252.95.2', '', 1571567481),
(19365, '54.36.149.31', 'ip-54-36-149-31.a.ahrefs.com', '54.36.149.31', '', 1573100324),
(20121, '66.102.6.146', 'google-proxy-66-102-6-146.google.com', '36.72.213.75', '', 1571350848),
(17947, '54.36.150.11', 'ip-54-36-150-11.a.ahrefs.com', '54.36.150.11', '', 1573108899),
(17946, '54.36.148.43', 'ip-54-36-148-43.a.ahrefs.com', '54.36.148.43', '', 1572945332),
(20221, '178.62.196.82', '178.62.196.82', '178.62.196.82', '', 1570894104),
(20223, '209.17.96.18', '209.17.96.18.rdns.cloudsystemnetworks.com', '209.17.96.18', '', 1570899359),
(18717, '54.36.148.228', 'ip-54-36-148-228.a.ahrefs.com', '54.36.148.228', '', 1572151783),
(19744, '66.249.71.63', 'crawl-66-249-71-63.googlebot.com', '66.249.71.63', '', 1570928396),
(14776, '174.137.129.109', 'ny-lgw.wowcon.net', '174.137.129.109', '', 1572799932),
(18663, '54.36.148.227', 'ip-54-36-148-227.a.ahrefs.com', '54.36.148.227', '', 1572410842),
(18664, '54.36.149.92', 'ip-54-36-149-92.a.ahrefs.com', '54.36.149.92', '', 1572697329),
(19865, '209.17.97.58', '209.17.97.58.rdns.cloudsystemnetworks.com', '209.17.97.58', '', 1570588040),
(18309, '54.36.150.59', 'ip-54-36-150-59.a.ahrefs.com', '54.36.150.59', '', 1572680339),
(20313, '66.249.69.93', 'crawl-66-249-69-93.googlebot.com', '66.249.69.93', '', 1571339351),
(20306, '207.46.13.251', 'msnbot-207-46-13-251.search.msn.com', '207.46.13.251', '', 1572508581),
(18006, '54.36.150.167', 'ip-54-36-150-167.a.ahrefs.com', '54.36.150.167', '', 1573094289),
(20928, '180.245.199.58', '180.245.199.58', '180.245.199.58', '', 1572090527),
(20943, '207.46.13.61', 'msnbot-207-46-13-61.search.msn.com', '207.46.13.61', '', 1572079084),
(12061, '46.229.168.130', 'crawl2.bl.semrush.com', '46.229.168.130', '', 1573106362),
(19842, '54.36.148.32', 'ip-54-36-148-32.a.ahrefs.com', '54.36.148.32', '', 1571259524),
(19834, '54.36.149.2', 'ip-54-36-149-2.a.ahrefs.com', '54.36.149.2', '', 1573082088),
(21361, '54.36.148.178', 'ip-54-36-148-178.a.ahrefs.com', '54.36.148.178', '', 1573094164),
(20948, '140.213.28.72', '140.213.28.72', '140.213.28.72', '', 1572100773),
(21341, '114.4.83.157', '114-4-83-157.resources.indosat.com', '114.4.83.157', '', 1572618594),
(20556, '36.71.237.104', '36.71.237.104', '36.71.237.104', '', 1571338607),
(20374, '125.165.63.220', '125.165.63.220', '125.165.63.220', '', 1571096697),
(20973, '54.36.148.113', 'ip-54-36-148-113.a.ahrefs.com', '54.36.148.113', '', 1572484251),
(19858, '54.36.150.60', 'ip-54-36-150-60.a.ahrefs.com', '54.36.150.60', '', 1572763138),
(17960, '54.36.150.77', 'ip-54-36-150-77.a.ahrefs.com', '54.36.150.77', '', 1573106290),
(17961, '54.36.148.76', 'ip-54-36-148-76.a.ahrefs.com', '54.36.148.76', '', 1572650755),
(21198, '114.142.171.43', 'subs19-114-142-171-43.three.co.id', '114.142.171.43', '', 1572450426),
(17963, '54.36.150.123', 'ip-54-36-150-123.a.ahrefs.com', '54.36.150.123', '', 1572820072),
(21524, '54.36.148.85', 'ip-54-36-148-85.a.ahrefs.com', '54.36.148.85', '', 1573102510),
(20503, '54.36.148.36', 'ip-54-36-148-36.a.ahrefs.com', '54.36.148.36', '', 1571267419),
(18418, '54.36.150.155', 'ip-54-36-150-155.a.ahrefs.com', '54.36.150.155', '', 1573103836),
(18419, '54.36.149.96', 'ip-54-36-149-96.a.ahrefs.com', '54.36.149.96', '', 1571337810),
(18364, '54.36.150.160', 'ip-54-36-150-160.a.ahrefs.com', '54.36.150.160', '', 1572711579),
(20296, '66.249.69.221', 'crawl-66-249-69-221.googlebot.com', '66.249.69.221', '', 1571106792),
(18366, '54.36.150.175', 'ip-54-36-150-175.a.ahrefs.com', '54.36.150.175', '', 1573096754),
(14695, '46.229.168.151', 'crawl23.bl.semrush.com', '46.229.168.151', '', 1573109696),
(20863, '180.241.155.139', '180.241.155.139', '180.241.155.139', '', 1571912514),
(20857, '180.249.51.9', '180.249.51.9', '180.249.51.9', '', 1571904421),
(20862, '114.125.38.14', '114.125.38.14', '114.125.38.14', '', 1571911225),
(20232, '46.4.108.51', 'pot37.webmeup.com', '46.4.108.51', '', 1570926773),
(21142, '54.36.149.6', 'ip-54-36-149-6.a.ahrefs.com', '54.36.149.6', '', 1572656410),
(21419, '36.79.71.100', '36.79.71.100', '36.79.71.100', '', 1572827950),
(20814, '112.215.173.220', '112.215.173.220', '112.215.173.220', '', 1571830873),
(19730, '40.77.167.217', 'msnbot-40-77-167-217.search.msn.com', '40.77.167.217', '', 1572497883),
(21272, '112.215.242.100', '112.215.242.100', '112.215.242.100', '', 1572519882),
(20695, '203.130.246.69', '203.130.246.69', '203.130.246.69', '', 1571623128),
(18403, '54.36.148.200', 'ip-54-36-148-200.a.ahrefs.com', '54.36.148.200', '', 1573099798),
(20419, '114.4.212.58', '114-4-212-58.resources.indosat.com', '114.4.212.58', '', 1571144130),
(20202, '36.73.124.110', '36.73.124.110', '36.73.124.110', '', 1571193480),
(13796, '54.208.102.37', 'ec2-54-208-102-37.compute-1.amazonaws.com', '54.208.102.37', '', 1572509717),
(14719, '46.229.168.147', 'crawl19.bl.semrush.com', '46.229.168.147', '', 1573108300),
(17954, '54.36.148.2', 'ip-54-36-148-2.a.ahrefs.com', '54.36.148.2', '', 1572685548),
(20524, '36.72.212.4', '36.72.212.4', '36.72.212.4', '', 1571284656),
(20469, '54.36.148.109', 'ip-54-36-148-109.a.ahrefs.com', '54.36.148.109', '', 1572695122),
(20432, '125.209.235.182', 'crawl.125-209-235-182.web.naver.com', '125.209.235.182', '', 1571168442),
(20106, '182.1.84.11', '182.1.84.11', '182.1.84.11', '', 1570602737),
(20107, '207.46.13.189', 'msnbot-207-46-13-189.search.msn.com', '207.46.13.189', '', 1572163054),
(17784, '54.36.148.198', 'ip-54-36-148-198.a.ahrefs.com', '54.36.148.198', '', 1572804897),
(20883, '157.55.39.172', 'msnbot-157-55-39-172.search.msn.com', '157.55.39.172', '', 1571950775),
(17852, '54.36.150.67', 'ip-54-36-150-67.a.ahrefs.com', '54.36.150.67', '', 1573044298),
(20213, '114.5.146.0', '114.5.146.0', '114.5.146.0', '', 1570871142),
(20739, '36.73.88.186', '36.73.88.186', '36.73.88.186', '', 1571713688),
(20420, '157.55.39.117', 'msnbot-157-55-39-117.search.msn.com', '157.55.39.117', '', 1571147384),
(21405, '125.165.190.1', '125.165.190.1', '125.165.190.1', '', 1572782490),
(17920, '54.36.150.142', 'ip-54-36-150-142.a.ahrefs.com', '54.36.150.142', '', 1572287093),
(20815, '157.55.39.207', 'msnbot-157-55-39-207.search.msn.com', '157.55.39.207', '', 1571848928),
(20549, '66.220.149.3', '66.220.149.3', '66.220.149.3', '', 1572135273),
(20550, '36.68.54.176', '36.68.54.176', '36.68.54.176', '', 1571322663),
(20554, '36.88.53.242', '36.88.53.242', '36.88.53.242', '', 1571334403),
(20284, '120.188.64.126', '120.188.64.126', '120.188.64.126', '', 1570975968),
(21101, '54.36.149.42', 'ip-54-36-149-42.a.ahrefs.com', '54.36.149.42', '', 1573086832),
(19908, '54.36.148.7', 'ip-54-36-148-7.a.ahrefs.com', '54.36.148.7', '', 1571161413),
(20537, '207.46.13.62', 'msnbot-207-46-13-62.search.msn.com', '207.46.13.62', '', 1571297209),
(19814, '54.36.148.248', 'ip-54-36-148-248.a.ahrefs.com', '54.36.148.248', '', 1573083935),
(20919, '120.188.32.177', '120.188.32.177', '120.188.32.177', '', 1572043031),
(19809, '54.36.148.46', 'ip-54-36-148-46.a.ahrefs.com', '54.36.148.46', '', 1572756330),
(20525, '52.41.148.90', 'ec2-52-41-148-90.us-west-2.compute.amazonaws.com', '52.41.148.90', '', 1571284837),
(20522, '66.220.149.37', '66.220.149.37', '66.220.149.37', '', 1572926412),
(20533, '36.72.212.113', '36.72.212.113', '36.72.212.113', '', 1571294788),
(11568, '66.249.79.66', 'crawl-66-249-79-66.googlebot.com', '66.249.79.66', '', 1571624120),
(20735, '157.55.39.189', 'msnbot-157-55-39-189.search.msn.com', '157.55.39.189', '', 1571708316),
(21202, '170.246.97.60', '170-246-97-60.ftth.hs.aux.toledoinfo.net.br', '170.246.97.60', '', 1572461093),
(14678, '46.229.168.133', 'crawl5.bl.semrush.com', '46.229.168.133', '', 1573105654),
(18212, '54.36.149.88', 'ip-54-36-149-88.a.ahrefs.com', '54.36.149.88', '', 1573086430),
(18035, '54.36.150.87', 'ip-54-36-150-87.a.ahrefs.com', '54.36.150.87', '', 1572682515),
(17996, '54.36.150.107', 'ip-54-36-150-107.a.ahrefs.com', '54.36.150.107', '', 1573109469),
(18002, '54.36.148.170', 'ip-54-36-148-170.a.ahrefs.com', '54.36.148.170', '', 1572116560),
(16884, '54.36.150.38', 'ip-54-36-150-38.a.ahrefs.com', '54.36.150.38', '', 1573099944),
(19895, '54.36.148.142', 'ip-54-36-148-142.a.ahrefs.com', '54.36.148.142', '', 1572429131),
(20897, '3.8.210.78', 'ec2-3-8-210-78.eu-west-2.compute.amazonaws.com', '3.8.210.78', '', 1571982645),
(20656, '40.77.167.182', 'msnbot-40-77-167-182.search.msn.com', '40.77.167.182', '', 1571529199),
(13451, '66.249.79.94', 'crawl-66-249-79-94.googlebot.com', '66.249.79.94', '', 1571519497),
(20124, '40.77.167.224', 'msnbot-40-77-167-224.search.msn.com', '40.77.167.224', '', 1572522303),
(18010, '54.36.148.65', 'ip-54-36-148-65.a.ahrefs.com', '54.36.148.65', '', 1573017513),
(12078, '66.249.79.114', 'crawl-66-249-79-114.googlebot.com', '66.249.79.114', '', 1570924157),
(19844, '54.36.149.95', 'ip-54-36-149-95.a.ahrefs.com', '54.36.149.95', '', 1573100543),
(21364, '54.36.148.117', 'ip-54-36-148-117.a.ahrefs.com', '54.36.148.117', '', 1572700987),
(20337, '202.169.248.184', 'duwija.blueline.co.id', '202.169.248.184', '', 1571033037),
(20100, '40.77.167.84', 'msnbot-40-77-167-84.search.msn.com', '40.77.167.84', '', 1572460983),
(20950, '114.125.126.179', '114.125.126.179', '114.125.126.179', '', 1572104819),
(18247, '54.36.150.154', 'ip-54-36-150-154.a.ahrefs.com', '54.36.150.154', '', 1572674148),
(18246, '54.36.150.134', 'ip-54-36-150-134.a.ahrefs.com', '54.36.150.134', '', 1572761598),
(18001, '54.36.150.73', 'ip-54-36-150-73.a.ahrefs.com', '54.36.150.73', '', 1573107926),
(11701, '46.229.168.141', 'crawl13.bl.semrush.com', '46.229.168.141', '', 1573109472),
(19852, '54.36.148.162', 'ip-54-36-148-162.a.ahrefs.com', '54.36.148.162', '', 1572686543),
(19848, '54.36.149.50', 'ip-54-36-149-50.a.ahrefs.com', '54.36.149.50', '', 1573004955),
(17118, '54.36.150.104', 'ip-54-36-150-104.a.ahrefs.com', '54.36.150.104', '', 1573094262),
(17121, '54.36.150.163', 'ip-54-36-150-163.a.ahrefs.com', '54.36.150.163', '', 1572679928),
(20764, '207.46.13.128', 'msnbot-207-46-13-128.search.msn.com', '207.46.13.128', '', 1572761638),
(19989, '13.231.191.230', 'ec2-13-231-191-230.ap-northeast-1.compute.amazonaws.com', '13.231.191.230', '', 1572918063),
(20732, '66.220.149.5', '66.220.149.5', '66.220.149.5', '', 1571695151),
(19783, '54.36.150.26', 'ip-54-36-150-26.a.ahrefs.com', '54.36.150.26', '', 1572640932),
(20891, '157.55.39.164', 'msnbot-157-55-39-164.search.msn.com', '157.55.39.164', '', 1571972173),
(20850, '114.122.107.80', '114.122.107.80', '114.122.107.80', '', 1571895916),
(20825, '114.5.222.102', '114-5-222-102.resources.indosat.com', '114.5.222.102', '', 1571868671),
(21360, '36.83.223.34', '36.83.223.34', '36.83.223.34', '', 1572654692),
(20423, '182.1.72.124', '182.1.72.124', '182.1.72.124', '', 1571145942),
(20126, '65.55.210.27', 'msnbot-65-55-210-27.search.msn.com', '65.55.210.27', '', 1570643151),
(20119, '120.188.34.10', '120.188.34.10', '120.188.34.10', '', 1570630382),
(19346, '40.77.167.41', 'msnbot-40-77-167-41.search.msn.com', '40.77.167.41', '', 1570903021),
(21130, '40.77.167.119', 'msnbot-40-77-167-119.search.msn.com', '40.77.167.119', '', 1572507642),
(18249, '54.36.149.72', 'ip-54-36-149-72.a.ahrefs.com', '54.36.149.72', '', 1572811430),
(21092, '182.1.117.145', '182.1.117.145', '182.1.117.145', '', 1572279204),
(20354, '114.125.81.29', '114.125.81.29', '114.125.81.29', '', 1571145515),
(19032, '54.36.148.5', 'ip-54-36-148-5.a.ahrefs.com', '54.36.148.5', '', 1572345730),
(17739, '54.36.150.78', 'ip-54-36-150-78.a.ahrefs.com', '54.36.150.78', '', 1572636536),
(17923, '54.36.148.12', 'ip-54-36-148-12.a.ahrefs.com', '54.36.148.12', '', 1571214213),
(20212, '157.55.39.148', 'msnbot-157-55-39-148.search.msn.com', '157.55.39.148', '', 1570867677),
(20796, '180.249.94.205', '180.249.94.205', '180.249.94.205', '', 1571808937),
(20437, '66.249.69.254', 'crawl-66-249-69-254.googlebot.com', '66.249.69.254', '', 1571172782),
(20262, '120.188.79.218', '120.188.79.218', '120.188.79.218', '', 1570943528),
(20601, '66.220.149.34', '66.220.149.34', '66.220.149.34', '', 1571716981),
(21407, '157.55.39.113', 'msnbot-157-55-39-113.search.msn.com', '157.55.39.113', '', 1572787008),
(18043, '54.36.150.170', 'ip-54-36-150-170.a.ahrefs.com', '54.36.150.170', '', 1573105020),
(19363, '54.36.150.108', 'ip-54-36-150-108.a.ahrefs.com', '54.36.150.108', '', 1573098067),
(18042, '54.36.148.122', 'ip-54-36-148-122.a.ahrefs.com', '54.36.148.122', '', 1572426908),
(18039, '54.36.150.8', 'ip-54-36-150-8.a.ahrefs.com', '54.36.150.8', '', 1573097164),
(18038, '54.36.148.221', 'ip-54-36-148-221.a.ahrefs.com', '54.36.148.221', '', 1573104614),
(21138, '144.76.118.82', 'static.82.118.76.144.clients.your-server.de', '144.76.118.82', '', 1572354055),
(20424, '64.233.172.221', 'google-proxy-64-233-172-221.google.com', '182.1.19.2', '', 1571148194),
(20725, '114.142.171.61', 'subs19-114-142-171-61.three.co.id', '114.142.171.61', '', 1571672709),
(20692, '207.46.13.98', 'msnbot-207-46-13-98.search.msn.com', '207.46.13.98', '', 1572141676),
(20504, '66.249.69.160', 'crawl-66-249-69-160.googlebot.com', '66.249.69.160', '', 1571268560),
(20095, '45.55.42.227', 'jobqueue-listener.jobqueue.netcraft.com-u860c8a32ea1211e983840bfb828d6ab1u-digitalocean', '45.55.42.227', '', 1570583443),
(19956, '54.36.149.78', 'ip-54-36-149-78.a.ahrefs.com', '54.36.149.78', '', 1572225893),
(20481, '180.247.130.114', '180.247.130.114', '180.247.130.114', '', 1571230527),
(19551, '54.36.149.60', 'ip-54-36-149-60.a.ahrefs.com', '54.36.149.60', '', 1572870920),
(20431, '54.36.148.67', 'ip-54-36-148-67.a.ahrefs.com', '54.36.148.67', '', 1572263839),
(20430, '54.36.148.60', 'ip-54-36-148-60.a.ahrefs.com', '54.36.148.60', '', 1573104853),
(19949, '54.36.148.42', 'ip-54-36-148-42.a.ahrefs.com', '54.36.148.42', '', 1572678153),
(20941, '52.162.161.148', '52.162.161.148', '52.162.161.148', '', 1572533274),
(21254, '40.77.167.196', 'msnbot-40-77-167-196.search.msn.com', '40.77.167.196', '', 1572592790),
(20451, '207.46.13.176', 'msnbot-207-46-13-176.search.msn.com', '207.46.13.176', '', 1571942146),
(19860, '54.36.149.38', 'ip-54-36-149-38.a.ahrefs.com', '54.36.149.38', '', 1570939346),
(20971, '54.36.149.14', 'ip-54-36-149-14.a.ahrefs.com', '54.36.149.14', '', 1572710997),
(19862, '54.36.150.100', 'ip-54-36-150-100.a.ahrefs.com', '54.36.150.100', '', 1572697955),
(19807, '54.36.148.226', 'ip-54-36-148-226.a.ahrefs.com', '54.36.148.226', '', 1573028976),
(18874, '54.36.148.62', 'ip-54-36-148-62.a.ahrefs.com', '54.36.148.62', '', 1572684479),
(14150, '46.229.168.137', 'crawl9.bl.semrush.com', '46.229.168.137', '', 1573106335),
(21163, '207.46.13.20', 'msnbot-207-46-13-20.search.msn.com', '207.46.13.20', '', 1572409398),
(20682, '157.55.39.211', 'msnbot-157-55-39-211.search.msn.com', '157.55.39.211', '', 1571686156),
(20684, '66.220.149.8', '66.220.149.8', '66.220.149.8', '', 1572739790),
(20688, '182.1.92.238', '182.1.92.238', '182.1.92.238', '', 1571612044),
(20689, '66.220.149.39', '66.220.149.39', '66.220.149.39', '', 1572413960),
(20687, '40.77.167.130', 'msnbot-40-77-167-130.search.msn.com', '40.77.167.130', '', 1572971351),
(18727, '54.36.148.252', 'ip-54-36-148-252.a.ahrefs.com', '54.36.148.252', '', 1572130591),
(20693, '54.36.148.81', 'ip-54-36-148-81.a.ahrefs.com', '54.36.148.81', '', 1573082453),
(21412, '72.50.5.135', 'adsl-72-50-5-135.prtc.net', '72.50.5.135', '', 1572796501),
(21400, '114.5.212.198', '114-5-212-198.resources.indosat.com', '114.5.212.198', '', 1572761322),
(20220, '182.1.79.225', '182.1.79.225', '182.1.79.225', '', 1570893415),
(20882, '40.77.167.139', 'msnbot-40-77-167-139.search.msn.com', '40.77.167.139', '', 1571948600),
(18873, '54.36.150.97', 'ip-54-36-150-97.a.ahrefs.com', '54.36.150.97', '', 1572937549),
(20329, '118.96.166.47', '47.static.118-96-166.astinet.telkom.net.id', '118.96.166.47', '', 1571022456),
(18402, '54.36.150.187', 'ip-54-36-150-187.a.ahrefs.com', '54.36.150.187', '', 1573098175),
(18405, '54.36.149.89', 'ip-54-36-149-89.a.ahrefs.com', '54.36.149.89', '', 1573092871),
(19745, '40.77.167.215', 'msnbot-40-77-167-215.search.msn.com', '40.77.167.215', '', 1572997411),
(20085, '157.245.10.114', 'jobqueue-listener.jobqueue.netcraft.com-uf9b8d832e98611e9b7b7ac1f838d6ab1u-digitalocean', '157.245.10.114', '', 1570522022),
(18406, '54.36.148.33', 'ip-54-36-148-33.a.ahrefs.com', '54.36.148.33', '', 1573083138),
(17110, '54.36.148.137', 'ip-54-36-148-137.a.ahrefs.com', '54.36.148.137', '', 1573106620),
(17111, '54.36.149.13', 'ip-54-36-149-13.a.ahrefs.com', '54.36.149.13', '', 1572639711),
(20081, '64.233.172.189', 'google-proxy-64-233-172-189.google.com', '114.125.200.136', '', 1571066400),
(17994, '54.36.150.25', 'ip-54-36-150-25.a.ahrefs.com', '54.36.150.25', '', 1573094137),
(19027, '54.36.149.71', 'ip-54-36-149-71.a.ahrefs.com', '54.36.149.71', '', 1573108912),
(19033, '54.36.148.39', 'ip-54-36-148-39.a.ahrefs.com', '54.36.148.39', '', 1571296776),
(20568, '54.36.150.63', 'ip-54-36-150-63.a.ahrefs.com', '54.36.150.63', '', 1572955347),
(20160, '66.249.65.98', 'crawl-66-249-65-98.googlebot.com', '66.249.65.98', '', 1573063238),
(20558, '182.0.142.174', '182.0.142.174', '182.0.142.174', '', 1571347114),
(17955, '54.36.150.179', 'ip-54-36-150-179.a.ahrefs.com', '54.36.150.179', '', 1573085966),
(17958, '54.36.150.30', 'ip-54-36-150-30.a.ahrefs.com', '54.36.150.30', '', 1572701269),
(17976, '54.36.148.86', 'ip-54-36-148-86.a.ahrefs.com', '54.36.148.86', '', 1572690940),
(17977, '54.36.150.116', 'ip-54-36-150-116.a.ahrefs.com', '54.36.150.116', '', 1573108370),
(17978, '54.36.150.41', 'ip-54-36-150-41.a.ahrefs.com', '54.36.150.41', '', 1572972950),
(17981, '54.36.150.184', 'ip-54-36-150-184.a.ahrefs.com', '54.36.150.184', '', 1572659144),
(17983, '54.36.149.41', 'ip-54-36-149-41.a.ahrefs.com', '54.36.149.41', '', 1572747961),
(17990, '54.36.150.164', 'ip-54-36-150-164.a.ahrefs.com', '54.36.150.164', '', 1572697506),
(16204, '103.208.100.18', '103.208.100.18', '103.208.100.18', '', 1572509516),
(19313, '54.36.148.255', 'ip-54-36-148-255.a.ahrefs.com', '54.36.148.255', '', 1572503214),
(21515, '125.163.167.81', '81.subnet125-163-167.speedy.telkom.net.id', '125.163.167.81', '', 1573091155),
(20080, '64.233.173.8', 'google-proxy-64-233-173-8.google.com', '64.233.173.8', '', 1571460299),
(20043, '157.55.39.212', 'msnbot-157-55-39-212.search.msn.com', '157.55.39.212', '', 1572585771),
(19201, '54.36.148.54', 'ip-54-36-148-54.a.ahrefs.com', '54.36.148.54', '', 1573108897),
(20127, '182.1.120.8', '182.1.120.8', '182.1.120.8', '', 1570647942),
(20102, '3.8.94.54', 'ec2-3-8-94-54.eu-west-2.compute.amazonaws.com', '3.8.94.54', '', 1570595158),
(17747, '54.36.148.207', 'ip-54-36-148-207.a.ahrefs.com', '54.36.148.207', '', 1573092859),
(16968, '54.36.148.96', 'ip-54-36-148-96.a.ahrefs.com', '54.36.148.96', '', 1572646157),
(17090, '54.36.150.101', 'ip-54-36-150-101.a.ahrefs.com', '54.36.150.101', '', 1572691307),
(18198, '54.36.149.53', 'ip-54-36-149-53.a.ahrefs.com', '54.36.149.53', '', 1572809521),
(18199, '54.36.148.1', 'ip-54-36-148-1.a.ahrefs.com', '54.36.148.1', '', 1573107795),
(18200, '54.36.149.58', 'ip-54-36-149-58.a.ahrefs.com', '54.36.149.58', '', 1571272636),
(21426, '220.181.108.182', 'baiduspider-220-181-108-182.crawl.baidu.com', '220.181.108.182', '', 1572840804),
(18202, '54.36.148.156', 'ip-54-36-148-156.a.ahrefs.com', '54.36.148.156', '', 1572689238),
(18207, '54.36.148.91', 'ip-54-36-148-91.a.ahrefs.com', '54.36.148.91', '', 1572140001),
(20158, '66.249.65.126', 'crawl-66-249-65-126.googlebot.com', '66.249.65.126', '', 1572980607),
(20103, '140.213.57.108', '140.213.57.108', '140.213.57.108', '', 1570597583),
(21399, '112.215.237.229', '112.215.237.229', '112.215.237.229', '', 1572754363),
(18816, '54.36.149.35', 'ip-54-36-149-35.a.ahrefs.com', '54.36.149.35', '', 1572338160),
(21345, '115.178.207.45', '115.178.207.45', '115.178.207.45', '', 1572623663),
(14036, '46.229.168.149', 'crawl21.bl.semrush.com', '46.229.168.149', '', 1573107998),
(20628, '36.68.239.159', '36.68.239.159', '36.68.239.159', '', 1571457804),
(20627, '202.168.151.9', '202.168.151.9', '202.168.151.9', '', 1571454448),
(17673, '54.36.148.30', 'ip-54-36-148-30.a.ahrefs.com', '54.36.148.30', '', 1572686190),
(18210, '54.36.148.164', 'ip-54-36-148-164.a.ahrefs.com', '54.36.148.164', '', 1572639584),
(20172, '34.216.8.240', 'ec2-34-216-8-240.us-west-2.compute.amazonaws.com', '34.216.8.240', '', 1570770830),
(18213, '54.36.150.92', 'ip-54-36-150-92.a.ahrefs.com', '54.36.150.92', '', 1573100022),
(19358, '54.36.150.176', 'ip-54-36-150-176.a.ahrefs.com', '54.36.150.176', '', 1572661654),
(20111, '182.23.114.222', '182.23.114.222', '182.23.114.222', '', 1570613466),
(20094, '45.55.48.130', 'jobqueue-listener.jobqueue.netcraft.com-u1ab18a32ea2911e983840bfb828d6ab1u-digitalocean', '45.55.48.130', '', 1570582900),
(19961, '54.36.148.184', 'ip-54-36-148-184.a.ahrefs.com', '54.36.148.184', '', 1573100220),
(18377, '54.36.150.146', 'ip-54-36-150-146.a.ahrefs.com', '54.36.150.146', '', 1572927033),
(20093, '114.4.218.232', '114-4-218-232.resources.indosat.com', '114.4.218.232', '', 1570575236),
(18229, '54.36.148.4', 'ip-54-36-148-4.a.ahrefs.com', '54.36.148.4', '', 1573082759),
(21191, '36.78.51.56', '36.78.51.56', '36.78.51.56', '', 1572439694),
(20104, '180.242.177.115', '180.242.177.115', '180.242.177.115', '', 1570597902),
(20727, '157.55.39.86', 'msnbot-157-55-39-86.search.msn.com', '157.55.39.86', '', 1571674370),
(18226, '54.36.148.141', 'ip-54-36-148-141.a.ahrefs.com', '54.36.148.141', '', 1571343540),
(14682, '46.229.168.140', 'crawl12.bl.semrush.com', '46.229.168.140', '', 1573108201),
(14683, '46.229.168.145', 'crawl17.bl.semrush.com', '46.229.168.145', '', 1573107609),
(19896, '54.36.148.241', 'ip-54-36-148-241.a.ahrefs.com', '54.36.148.241', '', 1572650474),
(14225, '46.229.168.139', 'crawl11.bl.semrush.com', '46.229.168.139', '', 1573106819),
(19960, '54.36.148.61', 'ip-54-36-148-61.a.ahrefs.com', '54.36.148.61', '', 1572966158),
(18071, '54.36.150.82', 'ip-54-36-150-82.a.ahrefs.com', '54.36.150.82', '', 1572928068),
(17114, '54.36.150.166', 'ip-54-36-150-166.a.ahrefs.com', '54.36.150.166', '', 1572708296),
(20926, '173.252.127.23', '173.252.127.23', '173.252.127.23', '', 1572060547),
(20920, '182.1.196.149', '182.1.196.149', '182.1.196.149', '', 1572046840),
(18414, '54.36.148.22', 'ip-54-36-148-22.a.ahrefs.com', '54.36.148.22', '', 1572645164),
(20332, '66.249.66.87', 'crawl-66-249-66-87.googlebot.com', '66.249.66.87', '', 1571027016),
(18748, '54.36.150.36', 'ip-54-36-150-36.a.ahrefs.com', '54.36.150.36', '', 1573088135),
(20694, '182.253.190.98', '182.253.190.98', '182.253.190.98', '', 1571621860),
(20690, '173.252.87.44', '173.252.87.44', '173.252.87.44', '', 1571613726),
(20230, '54.36.148.64', 'ip-54-36-148-64.a.ahrefs.com', '54.36.148.64', '', 1573081324),
(20267, '66.249.69.134', 'crawl-66-249-69-134.googlebot.com', '66.249.69.134', '', 1571129573),
(21192, '114.5.217.139', '114.5.217.139', '114.5.217.139', '', 1572441736),
(19928, '54.36.150.125', 'ip-54-36-150-125.a.ahrefs.com', '54.36.150.125', '', 1573089149),
(19859, '54.36.149.69', 'ip-54-36-149-69.a.ahrefs.com', '54.36.149.69', '', 1572682985),
(21403, '157.55.39.67', 'msnbot-157-55-39-67.search.msn.com', '157.55.39.67', '', 1572782717),
(21072, '207.46.13.181', 'msnbot-207-46-13-181.search.msn.com', '207.46.13.181', '', 1572260967),
(21137, '114.5.219.197', '114-5-219-197.resources.indosat.com', '114.5.219.197', '', 1572354007),
(17997, '54.36.150.47', 'ip-54-36-150-47.a.ahrefs.com', '54.36.150.47', '', 1573109183),
(20652, '207.46.13.10', 'msnbot-207-46-13-10.search.msn.com', '207.46.13.10', '', 1571516346),
(17938, '54.36.148.11', 'ip-54-36-148-11.a.ahrefs.com', '54.36.148.11', '', 1572194674),
(21398, '140.213.91.17', '140.213.91.17', '140.213.91.17', '', 1572752939),
(20479, '114.5.212.231', '114-5-212-231.resources.indosat.com', '114.5.212.231', '', 1571226881),
(21126, '114.5.208.125', '114-5-208-125.resources.indosat.com', '114.5.208.125', '', 1572338919),
(18659, '54.36.149.98', 'ip-54-36-149-98.a.ahrefs.com', '54.36.149.98', '', 1573103790),
(18660, '54.36.149.65', 'ip-54-36-149-65.a.ahrefs.com', '54.36.149.65', '', 1572703893),
(18852, '54.36.150.86', 'ip-54-36-150-86.a.ahrefs.com', '54.36.150.86', '', 1572641968),
(20658, '207.46.13.151', 'msnbot-207-46-13-151.search.msn.com', '207.46.13.151', '', 1571530102),
(20911, '40.77.167.33', 'msnbot-40-77-167-33.search.msn.com', '40.77.167.33', '', 1572010890),
(18653, '54.36.150.169', 'ip-54-36-150-169.a.ahrefs.com', '54.36.150.169', '', 1572346314),
(20086, '114.5.223.11', '114-5-223-11.resources.indosat.com', '114.5.223.11', '', 1570526017),
(20421, '66.102.6.71', 'google-proxy-66-102-6-71.google.com', '120.188.79.22', '', 1573029905),
(21430, '182.255.4.244', '182.255.4.244', '182.255.4.244', '', 1572869832),
(21431, '182.255.4.243', '182.255.4.243', '182.255.4.243', '', 1572870327),
(18596, '54.36.148.195', 'ip-54-36-148-195.a.ahrefs.com', '54.36.148.195', '', 1573092906),
(18879, '54.36.149.32', 'ip-54-36-149-32.a.ahrefs.com', '54.36.149.32', '', 1572658434),
(20921, '182.1.196.37', '182.1.196.37', '182.1.196.37', '', 1572046923),
(20312, '182.0.232.149', '182.0.232.149', '182.0.232.149', '', 1570997946),
(20311, '66.220.149.13', '66.220.149.13', '66.220.149.13', '', 1572926410),
(17866, '54.36.150.157', 'ip-54-36-150-157.a.ahrefs.com', '54.36.150.157', '', 1573098594),
(14507, '46.229.168.146', 'crawl18.bl.semrush.com', '46.229.168.146', '', 1573100490);
INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(18362, '54.36.150.181', 'ip-54-36-150-181.a.ahrefs.com', '54.36.150.181', '', 1573103493),
(18363, '54.36.150.94', 'ip-54-36-150-94.a.ahrefs.com', '54.36.150.94', '', 1573105927),
(20947, '182.253.163.116', '182.253.163.116', '182.253.163.116', '', 1572100334),
(18846, '54.36.148.84', 'ip-54-36-148-84.a.ahrefs.com', '54.36.148.84', '', 1573088335),
(20569, '116.206.8.40', 'subs24-116-206-8-40.three.co.id', '116.206.8.40', '', 1571367717),
(20572, '207.46.13.36', 'msnbot-207-46-13-36.search.msn.com', '207.46.13.36', '', 1571370707),
(20170, '36.72.213.147', '36.72.213.147', '36.72.213.147', '', 1570768414),
(20600, '157.55.39.155', 'msnbot-157-55-39-155.search.msn.com', '157.55.39.155', '', 1571416394),
(18775, '54.36.148.9', 'ip-54-36-148-9.a.ahrefs.com', '54.36.148.9', '', 1573099852),
(19538, '207.46.13.137', 'msnbot-207-46-13-137.search.msn.com', '207.46.13.137', '', 1570565504),
(18536, '54.36.150.66', 'ip-54-36-150-66.a.ahrefs.com', '54.36.150.66', '', 1573083352),
(18243, '54.36.148.57', 'ip-54-36-148-57.a.ahrefs.com', '54.36.148.57', '', 1573103569),
(20197, '54.36.149.30', 'ip-54-36-149-30.a.ahrefs.com', '54.36.149.30', '', 1573088104),
(20588, '180.246.176.52', '180.246.176.52', '180.246.176.52', '', 1571391891),
(18244, '54.36.148.26', 'ip-54-36-148-26.a.ahrefs.com', '54.36.148.26', '', 1572924568),
(20178, '182.1.175.139', '182.1.175.139', '182.1.175.139', '', 1570786414),
(21105, '112.78.177.14', '112.78.177.14', '112.78.177.14', '', 1572315551),
(21060, '40.77.167.99', 'msnbot-40-77-167-99.search.msn.com', '40.77.167.99', '', 1572262356),
(18008, '54.36.148.13', 'ip-54-36-148-13.a.ahrefs.com', '54.36.148.13', '', 1573088569),
(19899, '54.36.148.110', 'ip-54-36-148-110.a.ahrefs.com', '54.36.148.110', '', 1572710113),
(19885, '54.36.148.34', 'ip-54-36-148-34.a.ahrefs.com', '54.36.148.34', '', 1572665509),
(20624, '40.77.191.47', 'msnbot-40-77-191-47.search.msn.com', '40.77.191.47', '', 1571434085),
(21121, '120.188.32.242', '120.188.32.242', '120.188.32.242', '', 1572334534),
(20716, '114.125.109.46', '114.125.109.46', '114.125.109.46', '', 1571653092),
(20677, '173.252.95.4', '173.252.95.4', '173.252.95.4', '', 1571565678),
(20686, '40.77.167.17', 'msnbot-40-77-167-17.search.msn.com', '40.77.167.17', '', 1571601260),
(19935, '40.77.167.222', 'msnbot-40-77-167-222.search.msn.com', '40.77.167.222', '', 1571923475),
(20179, '114.5.217.25', '114.5.217.25', '114.5.217.25', '', 1570788810),
(20176, '207.46.13.160', 'msnbot-207-46-13-160.search.msn.com', '207.46.13.160', '', 1570781053),
(20185, '36.80.159.214', '36.80.159.214', '36.80.159.214', '', 1570800574),
(21385, '120.188.6.175', '120.188.6.175', '120.188.6.175', '', 1572708819),
(21337, '17.58.98.36', '17-58-98-36.applebot.apple.com', '17.58.98.36', '', 1572611081),
(18308, '54.36.150.5', 'ip-54-36-150-5.a.ahrefs.com', '54.36.150.5', '', 1573096020),
(20198, '54.36.149.25', 'ip-54-36-149-25.a.ahrefs.com', '54.36.149.25', '', 1573094978),
(17992, '54.36.150.113', 'ip-54-36-150-113.a.ahrefs.com', '54.36.150.113', '', 1572369425),
(20616, '199.187.211.245', '245.211.187.199.wiredns.net', '199.187.211.245', '', 1571429437),
(17919, '54.36.150.171', 'ip-54-36-150-171.a.ahrefs.com', '54.36.150.171', '', 1573102907),
(17979, '54.36.148.203', 'ip-54-36-148-203.a.ahrefs.com', '54.36.148.203', '', 1572168557),
(20219, '182.1.107.146', '182.1.107.146', '182.1.107.146', '', 1570889639),
(21422, '103.10.106.134', '103.10.106.134', '103.10.106.134', '', 1572837511),
(17779, '54.36.149.103', 'ip-54-36-149-103.a.ahrefs.com', '54.36.149.103', '', 1572629047),
(21250, '157.167.34.180', '157.167.34.180', '157.167.34.180', '', 1572498592),
(21245, '40.77.189.104', 'msnbot-40-77-189-104.search.msn.com', '40.77.189.104', '', 1572497899),
(19971, '54.36.149.102', 'ip-54-36-149-102.a.ahrefs.com', '54.36.149.102', '', 1573084256),
(19748, '103.4.165.129', '129-165mills-mines-kamal.fiber.net.id', '103.4.165.129', '', 1570763876),
(18780, '23.100.232.233', '23.100.232.233', '23.100.232.233', '', 1572256653),
(18021, '54.36.150.190', 'ip-54-36-150-190.a.ahrefs.com', '54.36.150.190', '', 1573107414),
(19442, '54.36.148.18', 'ip-54-36-148-18.a.ahrefs.com', '54.36.148.18', '', 1572629937),
(18387, '54.36.149.27', 'ip-54-36-149-27.a.ahrefs.com', '54.36.149.27', '', 1571614268),
(18407, '54.36.148.157', 'ip-54-36-148-157.a.ahrefs.com', '54.36.148.157', '', 1572658080),
(18108, '54.36.150.96', 'ip-54-36-150-96.a.ahrefs.com', '54.36.150.96', '', 1573089342),
(18020, '54.36.148.16', 'ip-54-36-148-16.a.ahrefs.com', '54.36.148.16', '', 1572505409),
(20924, '36.82.249.148', '36.82.249.148', '36.82.249.148', '', 1572059893),
(20499, '207.46.13.113', 'msnbot-207-46-13-113.search.msn.com', '207.46.13.113', '', 1571255861),
(19793, '54.36.148.135', 'ip-54-36-148-135.a.ahrefs.com', '54.36.148.135', '', 1571291660),
(19933, '54.36.148.185', 'ip-54-36-148-185.a.ahrefs.com', '54.36.148.185', '', 1572470228),
(17861, '54.36.150.43', 'ip-54-36-150-43.a.ahrefs.com', '54.36.150.43', '', 1573101605),
(20990, '182.1.105.51', '182.1.105.51', '182.1.105.51', '', 1572174852),
(17940, '51.255.65.46', 'hydrogen044.a.ahrefs.com', '51.255.65.46', '', 1572676944),
(14690, '46.229.168.152', 'crawl24.bl.semrush.com', '46.229.168.152', '', 1573105995),
(17907, '54.36.148.127', 'ip-54-36-148-127.a.ahrefs.com', '54.36.148.127', '', 1571259261),
(19782, '54.36.149.57', 'ip-54-36-149-57.a.ahrefs.com', '54.36.149.57', '', 1573094129),
(14694, '46.229.168.135', 'crawl7.bl.semrush.com', '46.229.168.135', '', 1573108101),
(17957, '54.36.150.95', 'ip-54-36-150-95.a.ahrefs.com', '54.36.150.95', '', 1573099384),
(17959, '54.36.150.40', 'ip-54-36-150-40.a.ahrefs.com', '54.36.150.40', '', 1572707412),
(20168, '54.36.148.115', 'ip-54-36-148-115.a.ahrefs.com', '54.36.148.115', '', 1572943547),
(20800, '118.96.151.208', '208.static.118-96-151.astinet.telkom.net.id', '118.96.151.208', '', 1571815755),
(20574, '43.252.105.66', 'host-43-252-105-66.ldp.net.id', '43.252.105.66', '', 1571374001),
(20577, '36.72.213.93', '36.72.213.93', '36.72.213.93', '', 1571377584),
(19915, '54.36.148.146', 'ip-54-36-148-146.a.ahrefs.com', '54.36.148.146', '', 1572260161),
(18360, '54.36.149.36', 'ip-54-36-149-36.a.ahrefs.com', '54.36.149.36', '', 1572640503),
(20229, '54.36.148.196', 'ip-54-36-148-196.a.ahrefs.com', '54.36.148.196', '', 1572841817),
(20349, '34.69.69.104', '104.69.69.34.bc.googleusercontent.com', '34.69.69.104', '', 1571073059),
(19632, '103.10.107.55', '103.10.107.55', '103.10.107.55', '', 1572916236),
(20819, '40.77.167.7', 'msnbot-40-77-167-7.search.msn.com', '40.77.167.7', '', 1571849607),
(17842, '54.36.150.76', 'ip-54-36-150-76.a.ahrefs.com', '54.36.150.76', '', 1573099317),
(19787, '54.36.148.10', 'ip-54-36-148-10.a.ahrefs.com', '54.36.148.10', '', 1572711399),
(18601, '54.36.149.101', 'ip-54-36-149-101.a.ahrefs.com', '54.36.149.101', '', 1573108488),
(18587, '54.36.148.38', 'ip-54-36-148-38.a.ahrefs.com', '54.36.148.38', '', 1572813531),
(18209, '54.36.150.90', 'ip-54-36-150-90.a.ahrefs.com', '54.36.150.90', '', 1573109362),
(20280, '54.36.149.4', 'ip-54-36-149-4.a.ahrefs.com', '54.36.149.4', '', 1570972945),
(19905, '54.36.150.131', 'ip-54-36-150-131.a.ahrefs.com', '54.36.150.131', '', 1572925963),
(20717, '157.55.39.89', 'msnbot-157-55-39-89.search.msn.com', '157.55.39.89', '', 1571654463),
(17929, '54.36.150.91', 'ip-54-36-150-91.a.ahrefs.com', '54.36.150.91', '', 1572880306),
(17899, '54.36.150.143', 'ip-54-36-150-143.a.ahrefs.com', '54.36.150.143', '', 1572702216),
(20027, '66.102.6.84', 'google-proxy-66-102-6-84.google.com', '180.246.196.110', '', 1571444165),
(20031, '103.251.183.2', '103.251.183.2', '103.251.183.2', '', 1571296985),
(20117, '120.188.87.206', '120.188.87.206', '120.188.87.206', '', 1570624983),
(18416, '54.36.148.217', 'ip-54-36-148-217.a.ahrefs.com', '54.36.148.217', '', 1572711852),
(18417, '54.36.150.3', 'ip-54-36-150-3.a.ahrefs.com', '54.36.150.3', '', 1573094237),
(20844, '66.220.149.45', '66.220.149.45', '66.220.149.45', '', 1572413960),
(20369, '157.55.39.63', 'msnbot-157-55-39-63.search.msn.com', '157.55.39.63', '', 1571698715),
(21157, '103.54.0.2', '103.54.0.2', '103.54.0.2', '', 1572401456),
(14338, '46.229.168.131', 'crawl3.bl.semrush.com', '46.229.168.131', '', 1573107936),
(21005, '40.77.167.180', 'msnbot-40-77-167-180.search.msn.com', '40.77.167.180', '', 1573037378),
(21004, '203.78.118.132', '203.78.118.132', '203.78.118.132', '', 1572192115),
(21003, '40.77.190.238', 'msnbot-40-77-190-238.search.msn.com', '40.77.190.238', '', 1572190802),
(20667, '5.45.207.44', '5-45-207-44.spider.yandex.com', '5.45.207.44', '', 1571709228),
(20668, '40.77.167.140', 'msnbot-40-77-167-140.search.msn.com', '40.77.167.140', '', 1572907566),
(21076, '40.77.190.248', 'msnbot-40-77-190-248.search.msn.com', '40.77.190.248', '', 1572263558),
(20733, '157.55.39.166', 'msnbot-157-55-39-166.search.msn.com', '157.55.39.166', '', 1573051021),
(20740, '103.255.15.48', '103.255.15.48', '103.255.15.48', '', 1572237701),
(20925, '173.252.127.33', '173.252.127.33', '173.252.127.33', '', 1572060547),
(18843, '54.36.148.27', 'ip-54-36-148-27.a.ahrefs.com', '54.36.148.27', '', 1572511378),
(20438, '66.249.75.19', 'crawl-66-249-75-19.googlebot.com', '66.249.75.19', '', 1571172963),
(18855, '54.36.148.154', 'ip-54-36-148-154.a.ahrefs.com', '54.36.148.154', '', 1572668084),
(20886, '103.228.17.112', '103.228.17.112', '192.168.105.97', '', 1571968312),
(18861, '54.36.149.87', 'ip-54-36-149-87.a.ahrefs.com', '54.36.149.87', '', 1572211100),
(21474, '40.77.167.147', 'msnbot-40-77-167-147.search.msn.com', '40.77.167.147', '', 1573000304),
(18785, '54.36.148.150', 'ip-54-36-148-150.a.ahrefs.com', '54.36.148.150', '', 1570972732),
(20722, '114.125.110.141', '114.125.110.141', '114.125.110.141', '', 1571666568),
(18242, '54.36.148.105', 'ip-54-36-148-105.a.ahrefs.com', '54.36.148.105', '', 1572437888),
(20683, '207.46.13.252', 'msnbot-207-46-13-252.search.msn.com', '207.46.13.252', '', 1571585161),
(19503, '54.36.150.2', 'ip-54-36-150-2.a.ahrefs.com', '54.36.150.2', '', 1573088296),
(21057, '182.1.105.31', '182.1.105.31', '182.1.105.31', '', 1572248864),
(18023, '54.36.150.127', 'ip-54-36-150-127.a.ahrefs.com', '54.36.150.127', '', 1573094224),
(18024, '54.36.150.56', 'ip-54-36-150-56.a.ahrefs.com', '54.36.150.56', '', 1572129430),
(18025, '54.36.149.85', 'ip-54-36-149-85.a.ahrefs.com', '54.36.149.85', '', 1572176105),
(18026, '54.36.148.220', 'ip-54-36-148-220.a.ahrefs.com', '54.36.148.220', '', 1572642648),
(18027, '54.36.150.80', 'ip-54-36-150-80.a.ahrefs.com', '54.36.150.80', '', 1573098571),
(18028, '54.36.150.191', 'ip-54-36-150-191.a.ahrefs.com', '54.36.150.191', '', 1573101699),
(20803, '114.125.127.248', '114.125.127.248', '114.125.127.248', '', 1571820115),
(19724, '157.55.39.106', 'msnbot-157-55-39-106.search.msn.com', '157.55.39.106', '', 1572551995),
(18041, '54.36.150.84', 'ip-54-36-150-84.a.ahrefs.com', '54.36.150.84', '', 1572662441),
(18629, '54.36.150.79', 'ip-54-36-150-79.a.ahrefs.com', '54.36.150.79', '', 1573101828),
(17123, '54.36.149.7', 'ip-54-36-149-7.a.ahrefs.com', '54.36.149.7', '', 1572158875),
(17853, '54.36.148.202', 'ip-54-36-148-202.a.ahrefs.com', '54.36.148.202', '', 1572516706),
(17847, '54.36.150.128', 'ip-54-36-150-128.a.ahrefs.com', '54.36.150.128', '', 1573108029),
(17849, '54.36.148.56', 'ip-54-36-148-56.a.ahrefs.com', '54.36.148.56', '', 1573102195),
(19802, '54.36.148.222', 'ip-54-36-148-222.a.ahrefs.com', '54.36.148.222', '', 1573107784),
(20150, '114.5.208.234', '114-5-208-234.resources.indosat.com', '114.5.208.234', '', 1570716018),
(21162, '40.77.189.63', 'msnbot-40-77-189-63.search.msn.com', '40.77.189.63', '', 1572409353),
(18395, '54.36.150.144', 'ip-54-36-150-144.a.ahrefs.com', '54.36.150.144', '', 1573098812),
(21135, '40.77.188.221', 'msnbot-40-77-188-221.search.msn.com', '40.77.188.221', '', 1572349424),
(17905, '54.36.150.32', 'ip-54-36-150-32.a.ahrefs.com', '54.36.150.32', '', 1572696571),
(19747, '157.55.39.123', 'msnbot-157-55-39-123.search.msn.com', '157.55.39.123', '', 1570795904),
(17744, '54.36.148.41', 'ip-54-36-148-41.a.ahrefs.com', '54.36.148.41', '', 1573106444),
(16963, '54.36.150.69', 'ip-54-36-150-69.a.ahrefs.com', '54.36.150.69', '', 1572826086),
(21176, '178.154.200.39', '178-154-200-39.spider.yandex.com', '178.154.200.39', '', 1572476997),
(19102, '40.77.167.173', 'msnbot-40-77-167-173.search.msn.com', '40.77.167.173', '', 1570734835),
(20806, '140.213.58.168', '140.213.58.168', '140.213.58.168', '', 1571823749),
(21224, '114.5.216.166', '114-5-216-166.resources.indosat.com', '114.5.216.166', '', 1572485467),
(19832, '54.36.150.57', 'ip-54-36-150-57.a.ahrefs.com', '54.36.150.57', '', 1572674200),
(19829, '54.36.148.152', 'ip-54-36-148-152.a.ahrefs.com', '54.36.148.152', '', 1572711447),
(19828, '54.36.149.34', 'ip-54-36-149-34.a.ahrefs.com', '54.36.149.34', '', 1573109722),
(20685, '180.245.116.183', '180.245.116.183', '180.245.116.183', '', 1571596624),
(20122, '120.188.67.105', '120.188.67.105', '120.188.67.105', '', 1570639735),
(19073, '207.46.13.25', 'msnbot-207-46-13-25.search.msn.com', '207.46.13.25', '', 1571558257),
(17674, '54.36.150.29', 'ip-54-36-150-29.a.ahrefs.com', '54.36.150.29', '', 1573084879),
(19799, '54.36.149.48', 'ip-54-36-149-48.a.ahrefs.com', '54.36.149.48', '', 1572937625),
(21174, '95.181.179.200', 'kleshnya.neohost.net', '95.181.179.200', '', 1572417184),
(20559, '180.244.37.198', '180.244.37.198', '180.244.37.198', '', 1571349786),
(19964, '54.36.148.180', 'ip-54-36-148-180.a.ahrefs.com', '54.36.148.180', '', 1571241162),
(20006, '66.249.71.50', 'crawl-66-249-71-50.googlebot.com', '66.249.71.50', '', 1570926504),
(14375, '46.229.168.142', 'crawl14.bl.semrush.com', '46.229.168.142', '', 1573102158),
(20676, '173.252.95.14', '173.252.95.14', '173.252.95.14', '', 1571565677),
(18635, '54.36.148.194', 'ip-54-36-148-194.a.ahrefs.com', '54.36.148.194', '', 1572664543),
(20505, '40.77.167.211', 'msnbot-40-77-167-211.search.msn.com', '40.77.167.211', '', 1571269271),
(20521, '182.50.245.228', 'IP-245-228.hts.net.id', '182.50.245.228', '', 1571281880),
(20914, '207.46.13.18', 'msnbot-207-46-13-18.search.msn.com', '207.46.13.18', '', 1572025498),
(20523, '66.220.149.61', '66.220.149.61', '66.220.149.61', '', 1573097795),
(17724, '54.36.150.12', 'ip-54-36-150-12.a.ahrefs.com', '54.36.150.12', '', 1573109306),
(20316, '54.36.148.71', 'ip-54-36-148-71.a.ahrefs.com', '54.36.148.71', '', 1572685033),
(20955, '54.36.148.219', 'ip-54-36-148-219.a.ahrefs.com', '54.36.148.219', '', 1572651780),
(19801, '54.36.150.83', 'ip-54-36-150-83.a.ahrefs.com', '54.36.150.83', '', 1573012560),
(20091, '64.233.172.31', 'google-proxy-64-233-172-31.google.com', '114.5.210.235', '', 1570560077),
(21327, '114.5.144.52', '114-5-144-52.resources.indosat.com', '114.5.144.52', '', 1572584233),
(21308, '207.46.13.162', 'msnbot-207-46-13-162.search.msn.com', '207.46.13.162', '', 1572544013),
(19988, '66.249.71.48', 'crawl-66-249-71-48.googlebot.com', '66.249.71.48', '', 1570930293),
(20679, '173.252.95.36', '173.252.95.36', '173.252.95.36', '', 1571567482),
(20659, '157.55.39.57', 'msnbot-157-55-39-57.search.msn.com', '157.55.39.57', '', 1571532498),
(20691, '173.252.87.34', '173.252.87.34', '173.252.87.34', '', 1571613728),
(20116, '207.46.13.158', 'msnbot-207-46-13-158.search.msn.com', '207.46.13.158', '', 1572874381),
(17824, '54.36.150.126', 'ip-54-36-150-126.a.ahrefs.com', '54.36.150.126', '', 1572840701),
(19222, '54.36.148.80', 'ip-54-36-148-80.a.ahrefs.com', '54.36.148.80', '', 1573104632),
(17703, '54.36.150.99', 'ip-54-36-150-99.a.ahrefs.com', '54.36.150.99', '', 1572972784),
(18017, '54.36.149.104', 'ip-54-36-149-104.a.ahrefs.com', '54.36.149.104', '', 1572905957),
(19050, '54.36.148.214', 'ip-54-36-148-214.a.ahrefs.com', '54.36.148.214', '', 1572711502),
(18183, '54.36.148.6', 'ip-54-36-148-6.a.ahrefs.com', '54.36.148.6', '', 1572649792),
(20061, '207.46.13.136', 'msnbot-207-46-13-136.search.msn.com', '207.46.13.136', '', 1572903090),
(20812, '114.5.216.181', '114-5-216-181.resources.indosat.com', '114.5.216.181', '', 1571841853),
(21458, '5.9.144.234', 'static.234.144.9.5.clients.your-server.de', '5.9.144.234', '', 1572930720),
(21477, '40.77.167.88', 'msnbot-40-77-167-88.search.msn.com', '40.77.167.88', '', 1572992548),
(20097, '157.55.39.175', 'msnbot-157-55-39-175.search.msn.com', '157.55.39.175', '', 1571116119),
(20896, '66.220.149.33', '66.220.149.33', '66.220.149.33', '', 1571982243),
(19812, '157.55.39.163', 'msnbot-157-55-39-163.search.msn.com', '157.55.39.163', '', 1571799266),
(21195, '40.77.190.167', 'msnbot-40-77-190-167.search.msn.com', '40.77.190.167', '', 1572447673),
(19701, '66.102.7.93', 'google-proxy-66-102-7-93.google.com', '114.125.126.80', '', 1570678093),
(17933, '54.36.150.174', 'ip-54-36-150-174.a.ahrefs.com', '54.36.150.174', '', 1573105623),
(18866, '54.36.149.9', 'ip-54-36-149-9.a.ahrefs.com', '54.36.149.9', '', 1572918411),
(16693, '54.36.150.140', 'ip-54-36-150-140.a.ahrefs.com', '54.36.150.140', '', 1573097830),
(20797, '36.90.17.16', '36.90.17.16', '36.90.17.16', '', 1571813653),
(18066, '54.36.148.151', 'ip-54-36-148-151.a.ahrefs.com', '54.36.148.151', '', 1573096848),
(19225, '66.102.6.225', 'google-proxy-66-102-6-225.google.com', '112.215.245.207', '', 1572920006),
(19497, '207.46.13.245', 'msnbot-207-46-13-245.search.msn.com', '207.46.13.245', '', 1570987961),
(21100, '209.17.97.114', '209.17.97.114.rdns.cloudsystemnetworks.com', '209.17.97.114', '', 1572308437),
(20173, '3.9.23.192', 'ec2-3-9-23-192.eu-west-2.compute.amazonaws.com', '3.9.23.192', '', 1570773623),
(20166, '66.220.149.53', '66.220.149.53', '66.220.149.53', '', 1573072188),
(20203, '157.55.39.121', 'msnbot-157-55-39-121.search.msn.com', '157.55.39.121', '', 1572039660),
(20207, '209.17.96.10', '209.17.96.10.rdns.cloudsystemnetworks.com', '209.17.96.10', '', 1571788826),
(20205, '178.128.82.122', '178.128.82.122', '178.128.82.122', '', 1570851680),
(18323, '54.36.150.102', 'ip-54-36-150-102.a.ahrefs.com', '54.36.150.102', '', 1573051402),
(19946, '54.36.149.84', 'ip-54-36-149-84.a.ahrefs.com', '54.36.149.84', '', 1572839907),
(21205, '40.77.189.155', 'msnbot-40-77-189-155.search.msn.com', '40.77.189.155', '', 1572463452),
(17926, '54.36.148.118', 'ip-54-36-148-118.a.ahrefs.com', '54.36.148.118', '', 1573092864),
(17737, '54.36.150.0', 'ip-54-36-150-0.a.ahrefs.com', '54.36.150.0', '', 1573097775),
(13389, '66.249.79.112', 'crawl-66-249-79-112.googlebot.com', '66.249.79.112', '', 1571714683),
(13391, '66.249.79.93', 'crawl-66-249-79-93.googlebot.com', '66.249.79.93', '', 1571778984),
(18859, '54.36.150.10', 'ip-54-36-150-10.a.ahrefs.com', '54.36.150.10', '', 1573097013),
(20884, '157.55.39.250', 'msnbot-157-55-39-250.search.msn.com', '157.55.39.250', '', 1571954093),
(20892, '180.246.200.49', '180.246.200.49', '180.246.200.49', '', 1571975971),
(20709, '207.46.13.76', 'msnbot-207-46-13-76.search.msn.com', '207.46.13.76', '', 1571641660),
(20702, '40.77.167.205', 'msnbot-40-77-167-205.search.msn.com', '40.77.167.205', '', 1571649829),
(19743, '66.249.71.62', 'crawl-66-249-71-62.googlebot.com', '66.249.71.62', '', 1573107009),
(19742, '66.249.71.60', 'crawl-66-249-71-60.googlebot.com', '66.249.71.60', '', 1573107637),
(20442, '115.28.154.44', '115.28.154.44', '115.28.154.44', '', 1571177248),
(19617, '157.55.39.122', 'msnbot-157-55-39-122.search.msn.com', '157.55.39.122', '', 1572408955),
(18650, '54.36.148.123', 'ip-54-36-148-123.a.ahrefs.com', '54.36.148.123', '', 1572697078),
(18642, '54.36.149.75', 'ip-54-36-149-75.a.ahrefs.com', '54.36.149.75', '', 1573092895),
(18643, '54.36.148.153', 'ip-54-36-148-153.a.ahrefs.com', '54.36.148.153', '', 1572306933),
(18646, '54.36.149.76', 'ip-54-36-149-76.a.ahrefs.com', '54.36.149.76', '', 1573097561),
(21194, '40.77.188.25', 'msnbot-40-77-188-25.search.msn.com', '40.77.188.25', '', 1572447399),
(13425, '64.233.173.21', 'google-proxy-64-233-173-21.google.com', '114.125.247.115', '1.1 Chrome-Compression-Proxy', 1572253985),
(20669, '69.171.251.17', '69.171.251.17', '69.171.251.17', '', 1571552938),
(20641, '178.154.200.28', '178-154-200-28.spider.yandex.com', '178.154.200.28', '', 1571487676),
(21464, '40.77.167.64', 'msnbot-40-77-167-64.search.msn.com', '40.77.167.64', '', 1572944970),
(21457, '36.80.234.13', '36.80.234.13', '36.80.234.13', '', 1572929421),
(20585, '120.188.77.104', '120.188.77.104', '120.188.77.104', '', 1571388728),
(19712, '66.220.149.44', '66.220.149.44', '66.220.149.44', '', 1573072187),
(20681, '13.84.43.203', '13.84.43.203', '13.84.43.203', '', 1571571789),
(21271, '40.77.167.28', 'msnbot-40-77-167-28.search.msn.com', '40.77.167.28', '', 1572529279),
(18603, '54.36.149.46', 'ip-54-36-149-46.a.ahrefs.com', '54.36.149.46', '', 1572722029),
(20434, '54.36.148.168', 'ip-54-36-148-168.a.ahrefs.com', '54.36.148.168', '', 1572865459),
(20629, '173.252.95.24', '173.252.95.24', '173.252.95.24', '', 1571459335),
(18594, '54.36.148.90', 'ip-54-36-148-90.a.ahrefs.com', '54.36.148.90', '', 1573098551),
(21144, '173.252.87.41', '173.252.87.41', '173.252.87.41', '', 1572369295),
(20655, '120.188.66.140', '120.188.66.140', '120.188.66.140', '', 1571524221),
(17857, '54.36.148.114', 'ip-54-36-148-114.a.ahrefs.com', '54.36.148.114', '', 1573103768),
(19937, '54.36.149.52', 'ip-54-36-149-52.a.ahrefs.com', '54.36.149.52', '', 1573084919),
(21015, '103.255.15.151', '103.255.15.151', '103.255.15.151', '', 1572226030),
(21180, '37.9.113.55', '37-9-113-55.spider.yandex.com', '37.9.113.55', '', 1572505169),
(21159, '188.42.35.145', '188.42.35.145', '188.42.35.145', '', 1572403799),
(21480, '40.77.167.166', 'msnbot-40-77-167-166.search.msn.com', '40.77.167.166', '', 1573000241),
(20200, '54.36.148.49', 'ip-54-36-148-49.a.ahrefs.com', '54.36.148.49', '', 1571423434),
(20792, '157.55.39.234', 'msnbot-157-55-39-234.search.msn.com', '157.55.39.234', '', 1571805046),
(20657, '40.77.167.138', 'msnbot-40-77-167-138.search.msn.com', '40.77.167.138', '', 1572918015),
(20789, '182.1.114.19', '182.1.114.19', '182.1.114.19', '', 1571800295),
(21016, '36.72.213.195', '36.72.213.195', '36.72.213.195', '', 1572227415),
(21292, '115.178.239.8', '115.178.239.8', '115.178.239.8', '', 1572529914),
(18004, '54.36.150.22', 'ip-54-36-150-22.a.ahrefs.com', '54.36.150.22', '', 1573028507),
(20096, '167.99.212.214', '167.99.212.214', '167.99.212.214', '', 1570586196),
(20023, '103.87.78.122', '103.87.78.122', '103.87.78.122', '', 1571445497),
(20024, '36.72.228.227', '36.72.228.227', '36.72.228.227', '', 1572062100),
(19993, '66.102.6.83', 'google-proxy-66-102-6-83.google.com', '114.124.183.140', '', 1571303530),
(21339, '193.37.252.55', '193.37.252.55', '193.37.252.55', '', 1572611847),
(17807, '54.36.150.114', 'ip-54-36-150-114.a.ahrefs.com', '54.36.150.114', '', 1573107389),
(21183, '178.154.171.53', '178-154-171-53.spider.yandex.com', '178.154.171.53', '', 1572428995),
(16691, '54.36.150.58', 'ip-54-36-150-58.a.ahrefs.com', '54.36.150.58', '', 1572708088),
(21201, '207.46.13.64', 'msnbot-207-46-13-64.search.msn.com', '207.46.13.64', '', 1572475268),
(20129, '120.188.83.25', '120.188.83.25', '120.188.83.25', '', 1570663886),
(20526, '180.254.117.2', '180.254.117.2', '180.254.117.2', '', 1571286622),
(20448, '36.37.127.154', '36.37.127.154', '192.168.5.13', '1.1 192.168.5.1 (Mikrotik HttpProxy)', 1571188113),
(20098, '36.81.77.19', '36.81.77.19', '36.81.77.19', '', 1570588931),
(17812, '54.36.150.130', 'ip-54-36-150-130.a.ahrefs.com', '54.36.150.130', '', 1573097473),
(20975, '120.188.72.231', '120.188.72.231', '120.188.72.231', '', 1572160344),
(17993, '54.36.148.107', 'ip-54-36-148-107.a.ahrefs.com', '54.36.148.107', '', 1572323281),
(20108, '54.218.238.149', 'ec2-54-218-238-149.us-west-2.compute.amazonaws.com', '54.218.238.149', '', 1570610920),
(14706, '46.229.168.132', 'crawl4.bl.semrush.com', '46.229.168.132', '', 1573109572),
(20861, '114.4.213.136', '114-4-213-136.resources.indosat.com', '114.4.213.136', '', 1571909211),
(17953, '54.36.148.155', 'ip-54-36-148-155.a.ahrefs.com', '54.36.148.155', '', 1572706861),
(21160, '180.246.180.7', '180.246.180.7', '180.246.180.7', '', 1572406504),
(14686, '46.229.168.163', '46.229.168.163', '46.229.168.163', '', 1573109655),
(20485, '40.77.167.223', 'msnbot-40-77-167-223.search.msn.com', '40.77.167.223', '', 1572522323),
(20368, '125.163.1.2', '2.subnet125-163-1.speedy.telkom.net.id', '125.163.1.2', '', 1571081545),
(18217, '54.36.149.82', 'ip-54-36-149-82.a.ahrefs.com', '54.36.149.82', '', 1572808565),
(14092, '46.229.168.150', 'crawl22.bl.semrush.com', '46.229.168.150', '', 1573106092),
(17984, '54.36.150.105', 'ip-54-36-150-105.a.ahrefs.com', '54.36.150.105', '', 1573085852),
(17986, '54.36.148.98', 'ip-54-36-148-98.a.ahrefs.com', '54.36.148.98', '', 1572706023),
(17987, '54.36.150.4', 'ip-54-36-150-4.a.ahrefs.com', '54.36.150.4', '', 1573101517),
(17988, '54.36.150.19', 'ip-54-36-150-19.a.ahrefs.com', '54.36.150.19', '', 1573109248),
(21330, '207.46.13.116', 'msnbot-207-46-13-116.search.msn.com', '207.46.13.116', '', 1572585799),
(17863, '54.36.150.75', 'ip-54-36-150-75.a.ahrefs.com', '54.36.150.75', '', 1573050693),
(20976, '207.46.13.106', 'msnbot-207-46-13-106.search.msn.com', '207.46.13.106', '', 1572164496),
(17845, '54.36.148.47', 'ip-54-36-148-47.a.ahrefs.com', '54.36.148.47', '', 1572679492),
(20769, '111.94.62.111', 'fm-dyn-111-94-62-111.fast.net.id', '111.94.62.111', '', 1571783569),
(17828, '54.36.150.34', 'ip-54-36-150-34.a.ahrefs.com', '54.36.150.34', '', 1573092793),
(17832, '54.36.150.42', 'ip-54-36-150-42.a.ahrefs.com', '54.36.150.42', '', 1573082888),
(17831, '54.36.150.118', 'ip-54-36-150-118.a.ahrefs.com', '54.36.150.118', '', 1573108647),
(17876, '54.36.150.1', 'ip-54-36-150-1.a.ahrefs.com', '54.36.150.1', '', 1573108546),
(17860, '54.36.150.45', 'ip-54-36-150-45.a.ahrefs.com', '54.36.150.45', '', 1573094387),
(14138, '46.229.168.162', '46.229.168.162', '46.229.168.162', '', 1573102217),
(18241, '54.36.150.18', 'ip-54-36-150-18.a.ahrefs.com', '54.36.150.18', '', 1573108888),
(18233, '54.36.149.51', 'ip-54-36-149-51.a.ahrefs.com', '54.36.149.51', '', 1573101313),
(18235, '54.36.150.65', 'ip-54-36-150-65.a.ahrefs.com', '54.36.150.65', '', 1572707643),
(18236, '54.36.150.52', 'ip-54-36-150-52.a.ahrefs.com', '54.36.150.52', '', 1573108567),
(18237, '54.36.149.63', 'ip-54-36-149-63.a.ahrefs.com', '54.36.149.63', '', 1572678591),
(18238, '54.36.150.51', 'ip-54-36-150-51.a.ahrefs.com', '54.36.150.51', '', 1573102987),
(20650, '157.55.39.66', 'msnbot-157-55-39-66.search.msn.com', '157.55.39.66', '', 1571527023),
(20112, '114.5.147.192', '114-5-147-192.resources.indosat.com', '114.5.147.192', '', 1570615479),
(20157, '66.249.65.127', 'crawl-66-249-65-127.googlebot.com', '66.249.65.127', '', 1572328050),
(20482, '54.36.150.64', 'ip-54-36-150-64.a.ahrefs.com', '54.36.150.64', '', 1573004640),
(18545, '54.36.150.188', 'ip-54-36-150-188.a.ahrefs.com', '54.36.150.188', '', 1573108956),
(18614, '54.36.148.51', 'ip-54-36-148-51.a.ahrefs.com', '54.36.148.51', '', 1572836802),
(18615, '54.36.148.224', 'ip-54-36-148-224.a.ahrefs.com', '54.36.148.224', '', 1573094179),
(20640, '130.211.209.82', '82.209.211.130.bc.googleusercontent.com', '130.211.209.82', '', 1571484220),
(20853, '66.249.83.93', 'google-proxy-66-249-83-93.google.com', '66.249.83.93', '', 1572861814),
(20634, '209.17.97.98', '209.17.97.98.rdns.cloudsystemnetworks.com', '209.17.97.98', '', 1571464520),
(18622, '54.36.149.64', 'ip-54-36-149-64.a.ahrefs.com', '54.36.149.64', '', 1572140551),
(18623, '54.36.148.158', 'ip-54-36-148-158.a.ahrefs.com', '54.36.148.158', '', 1573105050),
(21145, '40.77.190.98', 'msnbot-40-77-190-98.search.msn.com', '40.77.190.98', '', 1572370004),
(18628, '54.36.148.189', 'ip-54-36-148-189.a.ahrefs.com', '54.36.148.189', '', 1573082040),
(20152, '40.77.167.68', 'msnbot-40-77-167-68.search.msn.com', '40.77.167.68', '', 1570728815),
(20551, '157.55.39.130', 'msnbot-157-55-39-130.search.msn.com', '157.55.39.130', '', 1572879104),
(20534, '173.252.87.23', '173.252.87.23', '173.252.87.23', '', 1572778045),
(20287, '66.249.75.3', 'crawl-66-249-75-3.googlebot.com', '66.249.75.3', '', 1571161078),
(19711, '207.46.13.102', 'msnbot-207-46-13-102.search.msn.com', '207.46.13.102', '', 1571786617),
(19714, '66.220.149.49', '66.220.149.49', '66.220.149.49', '', 1572994980),
(19263, '66.249.83.91', 'google-proxy-66-249-83-91.google.com', '114.125.71.98', '', 1572536155),
(18092, '54.36.149.21', 'ip-54-36-149-21.a.ahrefs.com', '54.36.149.21', '', 1573085137),
(21469, '5.188.84.158', '5.188.84.158', '5.188.84.158', '', 1572957386),
(20578, '180.251.95.107', '180.251.95.107', '180.251.95.107', '', 1571379914),
(17915, '54.36.150.70', 'ip-54-36-150-70.a.ahrefs.com', '54.36.150.70', '', 1573023496),
(21404, '173.252.87.26', '173.252.87.26', '173.252.87.26', '', 1572778044),
(20115, '157.55.39.111', 'msnbot-157-55-39-111.search.msn.com', '157.55.39.111', '', 1570623089),
(19954, '54.36.148.70', 'ip-54-36-148-70.a.ahrefs.com', '54.36.148.70', '', 1573103950),
(17699, '54.36.150.153', 'ip-54-36-150-153.a.ahrefs.com', '54.36.150.153', '', 1573103475),
(17700, '54.36.148.191', 'ip-54-36-148-191.a.ahrefs.com', '54.36.148.191', '', 1571394356),
(20745, '40.77.167.213', 'msnbot-40-77-167-213.search.msn.com', '40.77.167.213', '', 1571883018),
(20231, '157.55.39.168', 'msnbot-157-55-39-168.search.msn.com', '157.55.39.168', '', 1571704245),
(20233, '66.249.75.130', 'crawl-66-249-75-130.googlebot.com', '66.249.75.130', '', 1571161676),
(20174, '182.1.117.148', '182.1.117.148', '182.1.117.148', '', 1570777757),
(19843, '54.36.148.246', 'ip-54-36-148-246.a.ahrefs.com', '54.36.148.246', '', 1572150530),
(17872, '54.36.150.136', 'ip-54-36-150-136.a.ahrefs.com', '54.36.150.136', '', 1573096539),
(20047, '54.36.149.105', 'ip-54-36-149-105.a.ahrefs.com', '54.36.149.105', '', 1573094318),
(17870, '54.36.150.121', 'ip-54-36-150-121.a.ahrefs.com', '54.36.150.121', '', 1573083981),
(17882, '54.36.149.94', 'ip-54-36-149-94.a.ahrefs.com', '54.36.149.94', '', 1572696440),
(17884, '54.36.150.115', 'ip-54-36-150-115.a.ahrefs.com', '54.36.150.115', '', 1573094276),
(17885, '54.36.148.126', 'ip-54-36-148-126.a.ahrefs.com', '54.36.148.126', '', 1572688656),
(18588, '54.36.150.186', 'ip-54-36-150-186.a.ahrefs.com', '54.36.150.186', '', 1573031544),
(20553, '157.55.39.173', 'msnbot-157-55-39-173.search.msn.com', '157.55.39.173', '', 1571351016),
(20167, '40.77.167.117', 'msnbot-40-77-167-117.search.msn.com', '40.77.167.117', '', 1570764664),
(20566, '40.77.167.162', 'msnbot-40-77-167-162.search.msn.com', '40.77.167.162', '', 1572539197),
(21383, '51.89.170.152', 'ip152.ip-51-89-170.eu', '51.89.170.152', '', 1572834876),
(19500, '54.36.149.67', 'ip-54-36-149-67.a.ahrefs.com', '54.36.149.67', '', 1573088001),
(20544, '157.55.39.8', 'msnbot-157-55-39-8.search.msn.com', '157.55.39.8', '', 1572427549),
(20416, '202.43.93.8', 'host-202-43-93-8.ugm.ac.id', '202.43.93.8', '', 1573031854),
(20543, '40.77.167.22', 'msnbot-40-77-167-22.search.msn.com', '40.77.167.22', '', 1572686139),
(20084, '114.142.171.52', 'subs19-114-142-171-52.three.co.id', '114.142.171.52', '', 1570521308),
(20770, '114.142.170.6', 'subs18-114-142-170-6.three.co.id', '114.142.170.6', '', 1571783635),
(20278, '54.36.149.15', 'ip-54-36-149-15.a.ahrefs.com', '54.36.149.15', '', 1573081642),
(20279, '40.77.167.186', 'msnbot-40-77-167-186.search.msn.com', '40.77.167.186', '', 1570971590),
(18185, '54.36.148.199', 'ip-54-36-148-199.a.ahrefs.com', '54.36.148.199', '', 1573083953),
(18186, '54.36.150.35', 'ip-54-36-150-35.a.ahrefs.com', '54.36.150.35', '', 1573104613),
(20269, '54.36.150.135', 'ip-54-36-150-135.a.ahrefs.com', '54.36.150.135', '', 1573094860),
(18188, '54.36.148.243', 'ip-54-36-148-243.a.ahrefs.com', '54.36.148.243', '', 1572732631),
(20957, '173.252.79.22', '173.252.79.22', '173.252.79.22', '', 1572133536),
(20209, '114.125.81.25', '114.125.81.25', '114.125.81.25', '', 1570856527),
(20101, '104.144.177.232', '104.144.177.232', '104.144.177.232', '', 1570592310),
(21519, '36.82.102.47', '36.82.102.47', '36.82.102.47', '', 1573098862),
(20288, '66.249.75.191', 'crawl-66-249-75-191.googlebot.com', '66.249.75.191', '', 1571169484),
(20286, '66.249.69.188', 'crawl-66-249-69-188.googlebot.com', '66.249.69.188', '', 1571104378),
(20285, '66.249.69.189', 'crawl-66-249-69-189.googlebot.com', '66.249.69.189', '', 1571159865),
(20175, '182.1.108.177', '182.1.108.177', '182.1.108.177', '', 1570778817),
(21035, '103.25.55.93', '103.25.55.93', '103.25.55.93', '', 1572251730),
(17921, '54.36.150.151', 'ip-54-36-150-151.a.ahrefs.com', '54.36.150.151', '', 1573106312),
(20099, '66.102.6.67', 'google-proxy-66-102-6-67.google.com', '120.188.65.67', '', 1573052039),
(17071, '54.36.150.161', 'ip-54-36-150-161.a.ahrefs.com', '54.36.150.161', '', 1572672593),
(20860, '157.55.39.48', 'msnbot-157-55-39-48.search.msn.com', '157.55.39.48', '', 1572076525),
(20711, '202.43.95.43', 'host-202-43-95-43.ugm.ac.id', '202.43.95.43', '', 1571639600),
(20090, '141.0.8.226', 'sg23-05-12.opera-mini.net', '115.178.252.95', '', 1570549199),
(20128, '40.77.167.95', 'msnbot-40-77-167-95.search.msn.com', '40.77.167.95', '', 1570661707),
(19322, '66.102.6.252', 'google-proxy-66-102-6-252.google.com', '117.20.48.110', '', 1572915063),
(17927, '54.36.148.121', 'ip-54-36-148-121.a.ahrefs.com', '54.36.148.121', '', 1572642931),
(17922, '54.36.150.124', 'ip-54-36-150-124.a.ahrefs.com', '54.36.150.124', '', 1572692207),
(20089, '114.142.171.53', 'subs19-114-142-171-53.three.co.id', '114.142.171.53', '', 1570547994),
(19329, '157.55.39.179', 'msnbot-157-55-39-179.search.msn.com', '157.55.39.179', '', 1571059827),
(20083, '180.246.148.90', '180.246.148.90', '180.246.148.90', '', 1570517985),
(20087, '141.0.8.105', 'sg22-01-11.opera-mini.net', '115.178.252.95', '', 1570547471),
(18190, '54.36.148.82', 'ip-54-36-148-82.a.ahrefs.com', '54.36.148.82', '', 1573108917),
(17203, '54.36.150.39', 'ip-54-36-150-39.a.ahrefs.com', '54.36.150.39', '', 1573084895),
(18179, '54.36.148.79', 'ip-54-36-148-79.a.ahrefs.com', '54.36.148.79', '', 1572701912),
(18180, '54.36.150.72', 'ip-54-36-150-72.a.ahrefs.com', '54.36.150.72', '', 1572940936),
(18181, '54.36.150.183', 'ip-54-36-150-183.a.ahrefs.com', '54.36.150.183', '', 1572710507),
(17763, '54.36.150.122', 'ip-54-36-150-122.a.ahrefs.com', '54.36.150.122', '', 1573087918),
(20342, '40.77.189.23', 'msnbot-40-77-189-23.search.msn.com', '40.77.189.23', '', 1571037426),
(21147, '125.209.235.183', 'crawl.125-209-235-183.web.naver.com', '125.209.235.183', '', 1572378501),
(18218, '54.36.148.244', 'ip-54-36-148-244.a.ahrefs.com', '54.36.148.244', '', 1573095601),
(18231, '54.36.148.99', 'ip-54-36-148-99.a.ahrefs.com', '54.36.148.99', '', 1573106946),
(18232, '54.36.149.70', 'ip-54-36-149-70.a.ahrefs.com', '54.36.149.70', '', 1572894311),
(20775, '132.145.213.165', '132.145.213.165', '132.145.213.165', '', 1571791448),
(20591, '40.77.167.73', 'msnbot-40-77-167-73.search.msn.com', '40.77.167.73', '', 1572896054),
(20575, '3.9.177.168', 'ec2-3-9-177-168.eu-west-2.compute.amazonaws.com', '3.9.177.168', '', 1571375285),
(20141, '36.90.17.241', '36.90.17.241', '192.168.192.243', '1.1 192.168.192.1 (Mikrotik HttpProxy)', 1570689683),
(20125, '40.77.167.192', 'msnbot-40-77-167-192.search.msn.com', '40.77.167.192', '', 1572476625),
(20123, '40.77.167.187', 'msnbot-40-77-167-187.search.msn.com', '40.77.167.187', '', 1572637722),
(21297, '40.77.189.38', 'msnbot-40-77-189-38.search.msn.com', '40.77.189.38', '', 1572538888),
(19499, '207.46.13.227', 'msnbot-207-46-13-227.search.msn.com', '207.46.13.227', '', 1572528083),
(18455, '54.36.148.206', 'ip-54-36-148-206.a.ahrefs.com', '54.36.148.206', '', 1571336123),
(18456, '54.36.148.59', 'ip-54-36-148-59.a.ahrefs.com', '54.36.148.59', '', 1573098408),
(18457, '54.36.148.186', 'ip-54-36-148-186.a.ahrefs.com', '54.36.148.186', '', 1572275862),
(21093, '36.73.115.117', '36.73.115.117', '36.73.115.117', '', 1572284873),
(20134, '115.178.236.9', '115.178.236.9', '115.178.236.9', '', 1570679700),
(19953, '54.36.148.249', 'ip-54-36-148-249.a.ahrefs.com', '54.36.148.249', '', 1572684206),
(18435, '54.36.148.83', 'ip-54-36-148-83.a.ahrefs.com', '54.36.148.83', '', 1573094259),
(19490, '157.55.39.255', 'msnbot-157-55-39-255.search.msn.com', '157.55.39.255', '', 1571840303),
(20580, '40.77.188.2', 'msnbot-40-77-188-2.search.msn.com', '40.77.188.2', '', 1571381716),
(20576, '3.95.37.22', 'ec2-3-95-37-22.compute-1.amazonaws.com', '3.95.37.22', '', 1572368009),
(18441, '54.36.148.172', 'ip-54-36-148-172.a.ahrefs.com', '54.36.148.172', '', 1572351564),
(20570, '65.55.210.39', 'msnbot-65-55-210-39.search.msn.com', '65.55.210.39', '', 1571367939),
(20571, '36.92.48.35', '36.92.48.35', '36.92.48.35', '', 1571369701),
(21146, '64.145.79.228', '64-145-79-228.ipvanish.com', '64.145.79.228', '', 1572371208),
(20131, '66.102.6.2', 'google-proxy-66-102-6-2.google.com', '114.4.79.41', '', 1570666115),
(18446, '54.36.149.107', 'ip-54-36-149-107.a.ahrefs.com', '54.36.149.107', '', 1571204344),
(18447, '54.36.150.165', 'ip-54-36-150-165.a.ahrefs.com', '54.36.150.165', '', 1573102146),
(20877, '125.166.169.121', '125.166.169.121', '125.166.169.121', '', 1571931007),
(20898, '3.10.190.26', 'ec2-3-10-190-26.eu-west-2.compute.amazonaws.com', '3.10.190.26', '', 1571982982),
(17760, '54.36.149.26', 'ip-54-36-149-26.a.ahrefs.com', '54.36.149.26', '', 1572657469),
(21336, '157.55.39.206', 'msnbot-157-55-39-206.search.msn.com', '157.55.39.206', '', 1572607107),
(17877, '54.36.148.169', 'ip-54-36-148-169.a.ahrefs.com', '54.36.148.169', '', 1573036776),
(17878, '54.36.150.68', 'ip-54-36-150-68.a.ahrefs.com', '54.36.150.68', '', 1572678790),
(20917, '87.250.224.42', '87-250-224-42.spider.yandex.com', '87.250.224.42', '', 1572539514),
(17881, '54.36.148.204', 'ip-54-36-148-204.a.ahrefs.com', '54.36.148.204', '', 1572114224),
(19646, '157.55.39.141', 'msnbot-157-55-39-141.search.msn.com', '157.55.39.141', '', 1571039243),
(20651, '58.250.125.128', 'sogouspider-58-250-125-128.crawl.sogou.com', '58.250.125.128', '', 1571512222),
(17888, '54.36.150.55', 'ip-54-36-150-55.a.ahrefs.com', '54.36.150.55', '', 1572691809),
(19740, '66.249.71.61', 'crawl-66-249-71-61.googlebot.com', '66.249.71.61', '', 1570923534),
(20330, '115.178.251.0', '115.178.251.0', '115.178.251.0', '', 1571022814),
(20339, '74.208.18.128', '74.208.18.128', '74.208.18.128', '', 1571042353),
(18421, '54.36.149.68', 'ip-54-36-149-68.a.ahrefs.com', '54.36.149.68', '', 1571225709),
(18422, '54.36.149.66', 'ip-54-36-149-66.a.ahrefs.com', '54.36.149.66', '', 1573088786),
(20433, '66.249.75.192', 'crawl-66-249-75-192.googlebot.com', '66.249.75.192', '', 1571169119),
(20336, '36.90.41.190', '36.90.41.190', '36.90.41.190', '', 1571029749),
(20153, '157.55.39.53', 'msnbot-157-55-39-53.search.msn.com', '157.55.39.53', '', 1570743780),
(20147, '120.188.78.28', '120.188.78.28', '120.188.78.28', '', 1570704080),
(18396, '54.36.148.144', 'ip-54-36-148-144.a.ahrefs.com', '54.36.148.144', '', 1572972765),
(20956, '173.252.79.21', '173.252.79.21', '173.252.79.21', '', 1572133536),
(20149, '40.77.167.53', 'msnbot-40-77-167-53.search.msn.com', '40.77.167.53', '', 1570709547),
(17909, '54.36.150.158', 'ip-54-36-150-158.a.ahrefs.com', '54.36.150.158', '', 1572524022),
(20887, '157.55.39.188', 'msnbot-157-55-39-188.search.msn.com', '157.55.39.188', '', 1573014165),
(20560, '207.46.13.244', 'msnbot-207-46-13-244.search.msn.com', '207.46.13.244', '', 1571355117),
(20618, '65.55.210.182', 'msnbot-65-55-210-182.search.msn.com', '65.55.210.182', '', 1571432412),
(20155, '66.249.65.96', 'crawl-66-249-65-96.googlebot.com', '66.249.65.96', '', 1572393873),
(20156, '66.249.65.124', 'crawl-66-249-65-124.googlebot.com', '66.249.65.124', '', 1573033331),
(20583, '207.46.13.248', 'msnbot-207-46-13-248.search.msn.com', '207.46.13.248', '', 1572508591),
(19909, '54.36.148.111', 'ip-54-36-148-111.a.ahrefs.com', '54.36.148.111', '', 1573107617),
(20375, '158.140.187.192', 'host-158.140.187-192.myrepublic.co.id', '158.140.187.192', '', 1571097516),
(18290, '66.249.79.116', 'crawl-66-249-79-116.googlebot.com', '66.249.79.116', '', 1571629757),
(20211, '104.198.253.53', '53.253.198.104.bc.googleusercontent.com', '104.198.253.53', '', 1570866275),
(20210, '180.251.69.56', '180.251.69.56', '180.251.69.56', '', 1570859975),
(20180, '209.17.96.218', '209.17.96.218.rdns.cloudsystemnetworks.com', '209.17.96.218', '', 1571247119),
(21386, '209.17.96.50', '209.17.96.50.rdns.cloudsystemnetworks.com', '209.17.96.50', '', 1572709352),
(20224, '54.36.148.131', 'ip-54-36-148-131.a.ahrefs.com', '54.36.148.131', '', 1573088402),
(18379, '54.36.148.143', 'ip-54-36-148-143.a.ahrefs.com', '54.36.148.143', '', 1572804344),
(19471, '66.249.69.125', 'crawl-66-249-69-125.googlebot.com', '66.249.69.125', '', 1571172003),
(18381, '54.36.148.55', 'ip-54-36-148-55.a.ahrefs.com', '54.36.148.55', '', 1572831865),
(19794, '54.36.148.102', 'ip-54-36-148-102.a.ahrefs.com', '54.36.148.102', '', 1572376071),
(20105, '140.213.58.195', '140.213.58.195', '140.213.58.195', '', 1570599143),
(20201, '207.46.13.54', 'msnbot-207-46-13-54.search.msn.com', '207.46.13.54', '', 1570863170),
(20951, '104.198.126.228', '228.126.198.104.bc.googleusercontent.com', '104.198.126.228', '', 1572112913),
(18658, '54.36.148.175', 'ip-54-36-148-175.a.ahrefs.com', '54.36.148.175', '', 1572183872),
(17781, '54.36.150.152', 'ip-54-36-150-152.a.ahrefs.com', '54.36.150.152', '', 1573109475),
(19770, '40.77.167.36', 'msnbot-40-77-167-36.search.msn.com', '40.77.167.36', '', 1571331894),
(19975, '209.17.96.122', '209.17.96.122.rdns.cloudsystemnetworks.com', '209.17.96.122', '', 1570521028),
(21378, '192.99.7.128', 'ns508077.ip-192-99-7.net', '192.99.7.128', '', 1572688596),
(20258, '66.249.69.146', 'crawl-66-249-69-146.googlebot.com', '66.249.69.146', '', 1571117025),
(20277, '140.213.58.213', '140.213.58.213', '140.213.58.213', '', 1570963643),
(19488, '207.46.13.165', 'msnbot-207-46-13-165.search.msn.com', '207.46.13.165', '', 1571191673),
(18429, '54.36.150.177', 'ip-54-36-150-177.a.ahrefs.com', '54.36.150.177', '', 1572669800),
(18430, '54.36.150.189', 'ip-54-36-150-189.a.ahrefs.com', '54.36.150.189', '', 1573085476),
(18431, '54.36.148.63', 'ip-54-36-148-63.a.ahrefs.com', '54.36.148.63', '', 1573106585),
(20654, '66.220.149.51', '66.220.149.51', '66.220.149.51', '', 1572043151),
(20484, '157.55.39.157', 'msnbot-157-55-39-157.search.msn.com', '157.55.39.157', '', 1572912444),
(20310, '66.249.69.220', 'crawl-66-249-69-220.googlebot.com', '66.249.69.220', '', 1571107410),
(20214, '182.1.174.183', '182.1.174.183', '182.1.174.183', '', 1570877426),
(18040, '54.36.148.177', 'ip-54-36-148-177.a.ahrefs.com', '54.36.148.177', '', 1573094039),
(20225, '58.250.125.137', 'sogouspider-58-250-125-137.crawl.sogou.com', '58.250.125.137', '', 1570907420),
(20216, '114.125.78.213', '114.125.78.213', '114.125.78.213', '', 1570879651),
(18382, '54.36.148.24', 'ip-54-36-148-24.a.ahrefs.com', '54.36.148.24', '', 1572940492),
(18384, '54.36.149.62', 'ip-54-36-149-62.a.ahrefs.com', '54.36.149.62', '', 1572218932),
(21196, '40.77.188.98', 'msnbot-40-77-188-98.search.msn.com', '40.77.188.98', '', 1572522388),
(18386, '54.36.150.81', 'ip-54-36-150-81.a.ahrefs.com', '54.36.150.81', '', 1573085964),
(20218, '176.9.25.107', 'static.107.25.9.176.clients.your-server.de', '176.9.25.107', '', 1570882153),
(19868, '54.36.148.134', 'ip-54-36-148-134.a.ahrefs.com', '54.36.148.134', '', 1572970927),
(21207, '141.8.142.22', '141-8-142-22.spider.yandex.com', '141.8.142.22', '', 1572543196),
(20626, '182.1.87.10', '182.1.87.10', '182.1.87.10', '', 1571438449),
(21161, '36.80.0.67', '36.80.0.67', '36.80.0.67', '', 1572409039),
(18029, '54.36.148.104', 'ip-54-36-148-104.a.ahrefs.com', '54.36.148.104', '', 1571215503),
(20663, '36.73.207.220', '36.73.207.220', '36.73.207.220', '', 1571570127),
(21095, '112.215.153.6', '112.215.153.6', '112.215.153.6', '', 1572295121),
(20963, '40.77.167.179', 'msnbot-40-77-167-179.search.msn.com', '40.77.167.179', '', 1572139194),
(18657, '54.36.148.148', 'ip-54-36-148-148.a.ahrefs.com', '54.36.148.148', '', 1573082609),
(20154, '66.249.65.125', 'crawl-66-249-65-125.googlebot.com', '66.249.65.125', '', 1572393766),
(21351, '95.216.19.59', 'static.59.19.216.95.clients.your-server.de', '95.216.19.59', '', 1572631357),
(20579, '207.46.13.201', 'msnbot-207-46-13-201.search.msn.com', '207.46.13.201', '', 1572564015),
(20088, '140.213.58.144', '140.213.58.144', '140.213.58.144', '', 1572739169),
(18370, '54.36.150.148', 'ip-54-36-150-148.a.ahrefs.com', '54.36.150.148', '', 1573104529),
(17856, '54.36.150.23', 'ip-54-36-150-23.a.ahrefs.com', '54.36.150.23', '', 1573083083),
(19918, '157.55.39.47', 'msnbot-157-55-39-47.search.msn.com', '157.55.39.47', '', 1572302906),
(20843, '182.1.112.218', '182.1.112.218', '182.1.112.218', '', 1571892174),
(17873, '54.36.150.182', 'ip-54-36-150-182.a.ahrefs.com', '54.36.150.182', '', 1573101136),
(20263, '66.249.69.176', 'crawl-66-249-69-176.googlebot.com', '66.249.69.176', '', 1571275407),
(21338, '40.77.167.110', 'msnbot-40-77-167-110.search.msn.com', '40.77.167.110', '', 1572611215),
(18031, '54.36.150.168', 'ip-54-36-150-168.a.ahrefs.com', '54.36.150.168', '', 1572707179),
(17896, '54.36.150.62', 'ip-54-36-150-62.a.ahrefs.com', '54.36.150.62', '', 1572680139),
(20893, '207.46.13.55', 'msnbot-207-46-13-55.search.msn.com', '207.46.13.55', '', 1571977225),
(20661, '173.252.95.47', '173.252.95.47', '173.252.95.47', '', 1571535908),
(20355, '40.77.188.71', 'msnbot-40-77-188-71.search.msn.com', '40.77.188.71', '', 1571063434),
(21397, '114.124.215.166', '114.124.215.166', '114.124.215.166', '', 1572751032),
(18389, '54.36.150.129', 'ip-54-36-150-129.a.ahrefs.com', '54.36.150.129', '', 1572907833),
(21008, '203.78.114.17', '203.78.114.17', '203.78.114.17', '', 1572221756),
(21451, '114.5.216.3', '114-5-216-3.resources.indosat.com', '114.5.216.3', '', 1572921303),
(18548, '54.36.148.176', 'ip-54-36-148-176.a.ahrefs.com', '54.36.148.176', '', 1572660226),
(20371, '66.249.69.94', 'crawl-66-249-69-94.googlebot.com', '66.249.69.94', '', 1571091744),
(20370, '66.249.75.125', 'crawl-66-249-75-125.googlebot.com', '66.249.75.125', '', 1571169119),
(20535, '173.252.87.7', '173.252.87.7', '173.252.87.7', '', 1571295165),
(20427, '84.187.158.200', 'p54BB9EC8.dip0.t-ipconnect.de', '84.187.158.200', '', 1571149708),
(20428, '157.55.39.118', 'msnbot-157-55-39-118.search.msn.com', '157.55.39.118', '', 1571150067),
(20331, '40.77.167.43', 'msnbot-40-77-167-43.search.msn.com', '40.77.167.43', '', 1572505715),
(18410, '54.36.150.178', 'ip-54-36-150-178.a.ahrefs.com', '54.36.150.178', '', 1573108341),
(18411, '54.36.149.100', 'ip-54-36-149-100.a.ahrefs.com', '54.36.149.100', '', 1573089029),
(18412, '54.36.148.140', 'ip-54-36-148-140.a.ahrefs.com', '54.36.148.140', '', 1572795879),
(18424, '54.36.148.95', 'ip-54-36-148-95.a.ahrefs.com', '54.36.148.95', '', 1572107265),
(18425, '54.36.148.208', 'ip-54-36-148-208.a.ahrefs.com', '54.36.148.208', '', 1572690190),
(18426, '54.36.150.13', 'ip-54-36-150-13.a.ahrefs.com', '54.36.150.13', '', 1572696094),
(20664, '207.46.13.195', 'msnbot-207-46-13-195.search.msn.com', '207.46.13.195', '', 1571543985),
(20660, '39.69.98.190', '39.69.98.190', '39.69.98.190', '', 1571536958),
(19791, '54.36.149.40', 'ip-54-36-149-40.a.ahrefs.com', '54.36.149.40', '', 1573101061),
(20903, '203.78.117.124', '203.78.117.124', '203.78.117.124', '', 1571997288),
(18459, '54.36.149.5', 'ip-54-36-149-5.a.ahrefs.com', '54.36.149.5', '', 1572683678),
(20528, '66.249.80.33', 'google-proxy-66-249-80-33.google.com', '36.89.162.34', '', 1572992828),
(20527, '66.249.80.63', 'google-proxy-66-249-80-63.google.com', '36.89.162.34', '', 1572252165),
(18599, '54.36.149.99', 'ip-54-36-149-99.a.ahrefs.com', '54.36.149.99', '', 1573089176),
(20841, '114.125.95.199', '114.125.95.199', '114.125.95.199', '', 1571889876),
(18602, '54.36.149.73', 'ip-54-36-149-73.a.ahrefs.com', '54.36.149.73', '', 1571290656),
(18605, '54.36.149.77', 'ip-54-36-149-77.a.ahrefs.com', '54.36.149.77', '', 1573094650),
(18606, '54.36.149.3', 'ip-54-36-149-3.a.ahrefs.com', '54.36.149.3', '', 1573109487),
(18504, '54.36.150.21', 'ip-54-36-150-21.a.ahrefs.com', '54.36.150.21', '', 1572326745),
(19558, '35.239.58.193', '193.58.239.35.bc.googleusercontent.com', '35.239.58.193', '', 1570831158),
(20422, '138.68.219.162', '138.68.219.162', '138.68.219.162', '', 1571143624),
(20413, '3.8.160.189', 'ec2-3-8-160-189.eu-west-2.compute.amazonaws.com', '3.8.160.189', '', 1571115106),
(21089, '40.77.167.206', 'msnbot-40-77-167-206.search.msn.com', '40.77.167.206', '', 1572447657),
(19890, '157.55.39.247', 'msnbot-157-55-39-247.search.msn.com', '157.55.39.247', '', 1571356631),
(19880, '54.36.149.19', 'ip-54-36-149-19.a.ahrefs.com', '54.36.149.19', '', 1572132655),
(19845, '54.36.148.29', 'ip-54-36-148-29.a.ahrefs.com', '54.36.148.29', '', 1572975460),
(19878, '64.233.173.11', 'google-proxy-64-233-173-11.google.com', '64.233.173.11', '', 1571460300),
(20532, '54.36.150.117', 'ip-54-36-150-117.a.ahrefs.com', '54.36.150.117', '', 1572677220),
(20144, '54.197.242.0', 'ec2-54-197-242-0.compute-1.amazonaws.com', '54.197.242.0', '', 1570699358),
(19891, '54.36.148.15', 'ip-54-36-148-15.a.ahrefs.com', '54.36.148.15', '', 1572662343),
(20113, '114.5.145.233', '114-5-145-233.resources.indosat.com', '114.5.145.233', '', 1570619290),
(18114, '54.36.150.132', 'ip-54-36-150-132.a.ahrefs.com', '54.36.150.132', '', 1573097248),
(20357, '40.77.167.184', 'msnbot-40-77-167-184.search.msn.com', '40.77.167.184', '', 1571339333),
(20491, '54.36.150.49', 'ip-54-36-150-49.a.ahrefs.com', '54.36.150.49', '', 1573104757),
(20531, '54.36.149.47', 'ip-54-36-149-47.a.ahrefs.com', '54.36.149.47', '', 1572658310),
(20447, '115.178.236.19', '115.178.236.19', '115.178.236.19', '', 1571192043),
(21122, '112.215.237.101', '112.215.237.101', '112.215.237.101', '', 1572335744),
(20477, '114.4.220.107', '114-4-220-107.resources.indosat.com', '114.4.220.107', '', 1571224058),
(20475, '114.5.213.102', '114-5-213-102.resources.indosat.com', '114.5.213.102', '', 1571218273),
(20476, '103.76.149.26', '103.76.149.26', '192.168.76.102', '1.1 192.168.76.1 (Mikrotik HttpProxy)', 1571220782),
(20472, '113.111.83.204', '113.111.83.204', '113.111.83.204', '', 1571211024),
(19991, '13.230.223.150', 'ec2-13-230-223-150.ap-northeast-1.compute.amazonaws.com', '13.230.223.150', '', 1572082746),
(17671, '54.36.150.173', 'ip-54-36-150-173.a.ahrefs.com', '54.36.150.173', '', 1573099322),
(19873, '54.36.150.93', 'ip-54-36-150-93.a.ahrefs.com', '54.36.150.93', '', 1572702896),
(17034, '103.135.180.2', '103.135.180.2', '103.135.180.2', '', 1573108262),
(18654, '54.36.148.87', 'ip-54-36-148-87.a.ahrefs.com', '54.36.148.87', '', 1573099224),
(20494, '77.45.133.7', '7.133.c10008-a77.dsl-dynamic.vsi.ru', '77.45.133.7', '', 1571252156),
(19549, '54.36.148.167', 'ip-54-36-148-167.a.ahrefs.com', '54.36.148.167', '', 1572252155);
INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(20885, '207.46.13.41', 'msnbot-207-46-13-41.search.msn.com', '207.46.13.41', '', 1572692499),
(17973, '54.36.150.172', 'ip-54-36-150-172.a.ahrefs.com', '54.36.150.172', '', 1573094280),
(17972, '54.36.148.93', 'ip-54-36-148-93.a.ahrefs.com', '54.36.148.93', '', 1572646470),
(17971, '54.36.150.162', 'ip-54-36-150-162.a.ahrefs.com', '54.36.150.162', '', 1573092827),
(18560, '54.36.150.61', 'ip-54-36-150-61.a.ahrefs.com', '54.36.150.61', '', 1573081607),
(19630, '40.77.167.100', 'msnbot-40-77-167-100.search.msn.com', '40.77.167.100', '', 1571388943),
(21314, '207.191.252.13', '207.191.252.13', '207.191.252.13', '', 1572556738),
(21317, '182.1.111.90', '182.1.111.90', '182.1.111.90', '', 1572569482),
(21313, '207.46.13.96', 'msnbot-207-46-13-96.search.msn.com', '207.46.13.96', '', 1572578749),
(17833, '54.36.150.111', 'ip-54-36-150-111.a.ahrefs.com', '54.36.150.111', '', 1573012764),
(21256, '121.42.54.54', '121.42.54.54', '121.42.54.54', '', 1572508385),
(20538, '66.220.149.9', '66.220.149.9', '66.220.149.9', '', 1571303051),
(21184, '114.125.76.190', '114.125.76.190', '114.125.76.190', '', 1572429034),
(19930, '54.36.150.120', 'ip-54-36-150-120.a.ahrefs.com', '54.36.150.120', '', 1572921988),
(20555, '157.55.39.170', 'msnbot-157-55-39-170.search.msn.com', '157.55.39.170', '', 1572331543),
(18633, '54.36.149.59', 'ip-54-36-149-59.a.ahrefs.com', '54.36.149.59', '', 1571247955),
(21294, '207.46.13.81', 'msnbot-207-46-13-81.search.msn.com', '207.46.13.81', '', 1572533325),
(19591, '66.220.149.63', '66.220.149.63', '66.220.149.63', '', 1572880165),
(21006, '157.55.39.185', 'msnbot-157-55-39-185.search.msn.com', '157.55.39.185', '', 1572219981),
(17950, '54.36.150.141', 'ip-54-36-150-141.a.ahrefs.com', '54.36.150.141', '', 1573084506),
(17735, '54.36.150.139', 'ip-54-36-150-139.a.ahrefs.com', '54.36.150.139', '', 1573097726),
(20804, '182.1.118.95', '182.1.118.95', '182.1.118.95', '', 1571820238),
(19739, '66.249.71.34', 'crawl-66-249-71-34.googlebot.com', '66.249.71.34', '', 1573106007),
(19818, '54.36.148.159', 'ip-54-36-148-159.a.ahrefs.com', '54.36.148.159', '', 1572953951),
(18604, '54.36.148.72', 'ip-54-36-148-72.a.ahrefs.com', '54.36.148.72', '', 1572809148),
(21094, '157.55.39.196', 'msnbot-157-55-39-196.search.msn.com', '157.55.39.196', '', 1572284162),
(21128, '54.36.150.137', 'ip-54-36-150-137.a.ahrefs.com', '54.36.150.137', '', 1573092878),
(21149, '207.46.13.57', 'msnbot-207-46-13-57.search.msn.com', '207.46.13.57', '', 1572608376),
(19912, '54.36.148.138', 'ip-54-36-148-138.a.ahrefs.com', '54.36.148.138', '', 1572705262),
(19029, '54.36.148.130', 'ip-54-36-148-130.a.ahrefs.com', '54.36.148.130', '', 1572677961),
(19950, '54.36.148.254', 'ip-54-36-148-254.a.ahrefs.com', '54.36.148.254', '', 1571261825),
(19947, '114.142.170.8', 'subs18-114-142-170-8.three.co.id', '114.142.170.8', '', 1571622612),
(19941, '54.36.149.54', 'ip-54-36-149-54.a.ahrefs.com', '54.36.149.54', '', 1573085829),
(21193, '180.251.244.47', '180.251.244.47', '180.251.244.47', '', 1572445344),
(19943, '157.55.39.120', 'msnbot-157-55-39-120.search.msn.com', '157.55.39.120', '', 1571550447),
(19944, '157.55.39.197', 'msnbot-157-55-39-197.search.msn.com', '157.55.39.197', '', 1572135910),
(19940, '54.36.148.92', 'ip-54-36-148-92.a.ahrefs.com', '54.36.148.92', '', 1572336997),
(21197, '40.77.167.137', 'msnbot-40-77-167-137.search.msn.com', '40.77.167.137', '', 1572448758),
(19046, '54.36.148.106', 'ip-54-36-148-106.a.ahrefs.com', '54.36.148.106', '', 1573103386),
(19931, '54.36.148.209', 'ip-54-36-148-209.a.ahrefs.com', '54.36.148.209', '', 1572650194),
(21158, '115.178.222.177', '115.178.222.177', '115.178.222.177', '', 1572402505),
(19051, '216.244.66.228', '216.244.66.228', '216.244.66.228', '', 1572084733),
(21175, '103.255.15.140', '103.255.15.140', '103.255.15.140', '', 1572417110),
(20145, '114.5.208.215', '114-5-208-215.resources.indosat.com', '114.5.208.215', '', 1570700789),
(20888, '40.77.167.226', 'msnbot-40-77-167-226.search.msn.com', '40.77.167.226', '', 1572073379),
(19934, '54.36.148.173', 'ip-54-36-148-173.a.ahrefs.com', '54.36.148.173', '', 1571308627),
(19936, '54.36.148.20', 'ip-54-36-148-20.a.ahrefs.com', '54.36.148.20', '', 1573087893),
(21222, '207.46.13.120', 'msnbot-207-46-13-120.search.msn.com', '207.46.13.120', '', 1572616529),
(19962, '54.36.148.187', 'ip-54-36-148-187.a.ahrefs.com', '54.36.148.187', '', 1572969974),
(19963, '54.36.149.11', 'ip-54-36-149-11.a.ahrefs.com', '54.36.149.11', '', 1573096372),
(21253, '85.208.96.71', '85.208.96.71', '85.208.96.71', '', 1572505516),
(21342, '36.90.16.250', '36.90.16.250', '36.90.16.250', '', 1572620430),
(20013, '66.249.71.52', 'crawl-66-249-71-52.googlebot.com', '66.249.71.52', '', 1570929542),
(19152, '207.46.13.99', 'msnbot-207-46-13-99.search.msn.com', '207.46.13.99', '', 1571651688),
(20017, '54.36.148.216', 'ip-54-36-148-216.a.ahrefs.com', '54.36.148.216', '', 1573087389),
(21375, '182.1.96.159', '182.1.96.159', '182.1.96.159', '', 1572677584),
(21377, '54.36.148.166', 'ip-54-36-148-166.a.ahrefs.com', '54.36.148.166', '', 1572684444),
(21379, '66.220.149.43', '66.220.149.43', '66.220.149.43', '', 1572690095),
(20036, '103.251.181.2', '103.251.181.2', '103.251.181.2', '', 1571296883),
(20171, '36.72.212.64', '36.72.212.64', '36.72.212.64', '', 1570768065),
(21402, '40.77.167.153', 'msnbot-40-77-167-153.search.msn.com', '40.77.167.153', '', 1572784917),
(19195, '54.36.150.46', 'ip-54-36-150-46.a.ahrefs.com', '54.36.150.46', '', 1572711736),
(21409, '173.252.87.10', '173.252.87.10', '173.252.87.10', '', 1572790888),
(21411, '40.77.167.169', 'msnbot-40-77-167-169.search.msn.com', '40.77.167.169', '', 1572814953),
(19200, '54.36.148.240', 'ip-54-36-148-240.a.ahrefs.com', '54.36.148.240', '', 1573093048),
(19209, '54.36.148.223', 'ip-54-36-148-223.a.ahrefs.com', '54.36.148.223', '', 1573084545),
(19214, '54.36.149.0', 'ip-54-36-149-0.a.ahrefs.com', '54.36.149.0', '', 1572830967),
(21420, '115.178.235.0', '115.178.235.0', '115.178.235.0', '', 1572841481),
(19218, '54.36.148.75', 'ip-54-36-148-75.a.ahrefs.com', '54.36.148.75', '', 1572659100),
(19221, '54.36.148.251', 'ip-54-36-148-251.a.ahrefs.com', '54.36.148.251', '', 1572429660),
(20530, '178.128.104.221', '178.128.104.221', '178.128.104.221', '', 1571290114),
(19234, '207.46.13.38', 'msnbot-207-46-13-38.search.msn.com', '207.46.13.38', '', 1571659871),
(20056, '207.46.13.49', 'msnbot-207-46-13-49.search.msn.com', '207.46.13.49', '', 1571459159),
(20054, '66.102.6.82', 'google-proxy-66-102-6-82.google.com', '182.253.163.42', '', 1570862875),
(21434, '66.220.149.38', '66.220.149.38', '66.220.149.38', '', 1572880166),
(21435, '36.81.74.156', '36.81.74.156', '36.81.74.156', '', 1572883145),
(21439, '64.233.173.127', 'google-proxy-64-233-173-127.google.com', '64.233.173.127', '', 1572921535),
(20417, '34.209.188.173', 'ec2-34-209-188-173.us-west-2.compute.amazonaws.com', '34.209.188.173', '', 1571129494),
(20731, '66.220.149.30', '66.220.149.30', '66.220.149.30', '', 1572316522),
(21465, '54.36.150.54', 'ip-54-36-150-54.a.ahrefs.com', '54.36.150.54', '', 1572947245),
(21468, '51.91.175.177', 'ip177.ip-51-91-175.eu', '51.91.175.177', '', 1572955570),
(20118, '120.188.72.20', '120.188.72.20', '120.188.72.20', '', 1570627245),
(20573, '40.77.191.40', 'msnbot-40-77-191-40.search.msn.com', '40.77.191.40', '', 1571373345),
(21476, '207.46.13.129', 'msnbot-207-46-13-129.search.msn.com', '207.46.13.129', '', 1572991559),
(20136, '182.1.218.230', '182.1.218.230', '182.1.218.230', '', 1570679900),
(21421, '36.82.99.184', '36.82.99.184', '36.82.99.184', '', 1572832186),
(20133, '61.177.20.67', '61.177.20.67', '61.177.20.67', '', 1570672854),
(20114, '207.46.13.21', 'msnbot-207-46-13-21.search.msn.com', '207.46.13.21', '', 1570621216),
(20137, '3.8.202.243', 'ec2-3-8-202-243.eu-west-2.compute.amazonaws.com', '3.8.202.243', '', 1570681673),
(20138, '124.40.249.107', 'host-124-40-249-107.ldp.net.id', '124.40.249.107', '', 1570682070),
(20139, '36.75.191.169', '36.75.191.169', '36.75.191.169', '', 1570688522),
(20142, '210.130.195.47', 'sndr2.wg.epson.co.jp', '210.130.195.47', '1.1 04a0d8ab-4b3e-e888-0be9-00001741e045 (squid)', 1570690790),
(20146, '34.70.182.55', '55.182.70.34.bc.googleusercontent.com', '34.70.182.55', '', 1570703170),
(20151, '125.161.104.78', '78.subnet125-161-104.speedy.telkom.net.id', '10.0.189.120', '', 1570717964),
(20159, '54.36.149.8', 'ip-54-36-149-8.a.ahrefs.com', '54.36.149.8', '', 1572718392),
(20169, '157.55.39.62', 'msnbot-157-55-39-62.search.msn.com', '157.55.39.62', '', 1570774651),
(20183, '66.249.65.138', 'crawl-66-249-65-138.googlebot.com', '66.249.65.138', '', 1572732322),
(20184, '120.188.77.87', '120.188.77.87', '120.188.77.87', '', 1570799177),
(20186, '120.188.84.177', '120.188.84.177', '120.188.84.177', '', 1570801201),
(20189, '185.28.191.30', '185.28.191.30', '185.28.191.30', '', 1570805362),
(20190, '210.187.8.97', '210.187.8.97', '210.187.8.97', '', 1570808987),
(20191, '40.77.167.181', 'msnbot-40-77-167-181.search.msn.com', '40.77.167.181', '', 1570818975),
(20192, '54.36.149.33', 'ip-54-36-149-33.a.ahrefs.com', '54.36.149.33', '', 1573104752),
(20193, '192.99.10.93', 'ns501947.ip-192-99-10.net', '192.99.10.93', '', 1570812532),
(20194, '66.249.65.140', 'crawl-66-249-65-140.googlebot.com', '66.249.65.140', '', 1572913430),
(20195, '54.36.149.81', 'ip-54-36-149-81.a.ahrefs.com', '54.36.149.81', '', 1573019998),
(20196, '130.193.240.179', '130.193.240.179', '130.193.240.179', '', 1570819367),
(20199, '36.72.213.198', '36.72.213.198', '36.72.213.198', '', 1570826717),
(20204, '114.142.169.9', 'subs17-114-142-169-9.three.co.id', '114.142.169.9', '', 1570850059),
(20206, '120.188.78.48', '120.188.78.48', '120.188.78.48', '', 1570853130),
(20208, '3.9.144.47', 'ec2-3-9-144-47.eu-west-2.compute.amazonaws.com', '3.9.144.47', '', 1570855354),
(20217, '207.46.13.140', 'msnbot-207-46-13-140.search.msn.com', '207.46.13.140', '', 1570886575),
(20226, '54.36.149.79', 'ip-54-36-149-79.a.ahrefs.com', '54.36.149.79', '', 1573105541),
(20227, '40.77.167.212', 'msnbot-40-77-167-212.search.msn.com', '40.77.167.212', '', 1571915067),
(20234, '66.249.75.5', 'crawl-66-249-75-5.googlebot.com', '66.249.75.5', '', 1571343542),
(20235, '66.249.69.252', 'crawl-66-249-69-252.googlebot.com', '66.249.69.252', '', 1571103760),
(20236, '66.249.75.149', 'crawl-66-249-75-149.googlebot.com', '66.249.75.149', '', 1571159842),
(20237, '66.249.75.220', 'crawl-66-249-75-220.googlebot.com', '66.249.75.220', '', 1571160427),
(20238, '66.249.75.61', 'crawl-66-249-75-61.googlebot.com', '66.249.75.61', '', 1571109193),
(20239, '40.77.167.115', 'msnbot-40-77-167-115.search.msn.com', '40.77.167.115', '', 1571913589),
(20240, '66.249.69.92', 'crawl-66-249-69-92.googlebot.com', '66.249.69.92', '', 1571103763),
(20241, '66.249.75.222', 'crawl-66-249-75-222.googlebot.com', '66.249.75.222', '', 1571434393),
(20242, '66.249.75.221', 'crawl-66-249-75-221.googlebot.com', '66.249.75.221', '', 1571095403),
(20243, '52.170.26.203', '52.170.26.203', '52.170.26.203', '', 1570931284),
(20244, '66.249.69.223', 'crawl-66-249-69-223.googlebot.com', '66.249.69.223', '', 1571276604),
(20245, '66.249.69.253', 'crawl-66-249-69-253.googlebot.com', '66.249.69.253', '', 1570931912),
(20246, '66.249.75.189', 'crawl-66-249-75-189.googlebot.com', '66.249.75.189', '', 1570931925),
(20247, '66.249.69.178', 'crawl-66-249-69-178.googlebot.com', '66.249.69.178', '', 1571174866),
(20248, '66.249.69.191', 'crawl-66-249-69-191.googlebot.com', '66.249.69.191', '', 1570999559),
(20249, '66.249.75.127', 'crawl-66-249-75-127.googlebot.com', '66.249.75.127', '', 1571169239),
(20250, '66.249.69.180', 'crawl-66-249-69-180.googlebot.com', '66.249.69.180', '', 1571174886),
(20251, '66.249.69.62', 'crawl-66-249-69-62.googlebot.com', '66.249.69.62', '', 1571159845),
(20252, '54.36.148.179', 'ip-54-36-148-179.a.ahrefs.com', '54.36.148.179', '', 1572494361),
(20253, '66.249.69.147', 'crawl-66-249-69-147.googlebot.com', '66.249.69.147', '', 1571125412),
(20254, '66.249.69.251', 'crawl-66-249-69-251.googlebot.com', '66.249.69.251', '', 1571094218),
(20255, '66.249.75.7', 'crawl-66-249-75-7.googlebot.com', '66.249.75.7', '', 1571340927),
(20256, '66.249.69.130', 'crawl-66-249-69-130.googlebot.com', '66.249.69.130', '', 1571122963),
(20257, '66.249.69.190', 'crawl-66-249-69-190.googlebot.com', '66.249.69.190', '', 1571093003),
(20259, '66.249.69.132', 'crawl-66-249-69-132.googlebot.com', '66.249.69.132', '', 1571301720),
(20260, '3.8.199.166', 'ec2-3-8-199-166.eu-west-2.compute.amazonaws.com', '3.8.199.166', '', 1570940820),
(20261, '40.77.167.123', 'msnbot-40-77-167-123.search.msn.com', '40.77.167.123', '', 1570940895),
(20264, '40.77.167.225', 'msnbot-40-77-167-225.search.msn.com', '40.77.167.225', '', 1571435486),
(20265, '40.77.188.166', 'msnbot-40-77-188-166.search.msn.com', '40.77.188.166', '', 1570943601),
(20266, '52.34.117.247', 'ec2-52-34-117-247.us-west-2.compute.amazonaws.com', '52.34.117.247', '', 1570944063),
(20268, '157.55.39.209', 'msnbot-157-55-39-209.search.msn.com', '157.55.39.209', '', 1570945008),
(20270, '40.77.167.183', 'msnbot-40-77-167-183.search.msn.com', '40.77.167.183', '', 1571148324),
(20271, '207.46.13.226', 'msnbot-207-46-13-226.search.msn.com', '207.46.13.226', '', 1572528090),
(20272, '40.77.190.31', 'msnbot-40-77-190-31.search.msn.com', '40.77.190.31', '', 1570947846),
(20273, '65.55.210.157', 'msnbot-65-55-210-157.search.msn.com', '65.55.210.157', '', 1570947854),
(20274, '40.77.190.19', 'msnbot-40-77-190-19.search.msn.com', '40.77.190.19', '', 1570948148),
(20275, '40.77.189.212', 'msnbot-40-77-189-212.search.msn.com', '40.77.189.212', '', 1572447703),
(20276, '40.77.191.81', 'msnbot-40-77-191-81.search.msn.com', '40.77.191.81', '', 1570949703),
(20289, '54.36.149.24', 'ip-54-36-149-24.a.ahrefs.com', '54.36.149.24', '', 1573082729),
(20290, '120.188.5.233', '120.188.5.233', '120.188.5.233', '', 1570982533),
(20291, '66.249.75.124', 'crawl-66-249-75-124.googlebot.com', '66.249.75.124', '', 1571093001),
(20292, '114.142.168.32', 'subs16-114-142-168-32.three.co.id', '114.142.168.32', '', 1570984550),
(20293, '66.249.75.151', 'crawl-66-249-75-151.googlebot.com', '66.249.75.151', '', 1571276626),
(20294, '66.249.75.60', 'crawl-66-249-75-60.googlebot.com', '66.249.75.60', '', 1570981596),
(20295, '66.249.75.62', 'crawl-66-249-75-62.googlebot.com', '66.249.75.62', '', 1571111002),
(20297, '114.142.168.21', 'subs16-114-142-168-21.three.co.id', '114.142.168.21', '', 1570983547),
(20298, '40.77.167.200', 'msnbot-40-77-167-200.search.msn.com', '40.77.167.200', '', 1572522316),
(20299, '31.184.218.89', '31.184.218.89', '31.184.218.89', '', 1570985586),
(20300, '66.249.69.60', 'crawl-66-249-69-60.googlebot.com', '66.249.69.60', '', 1571104379),
(20301, '207.46.13.240', 'msnbot-207-46-13-240.search.msn.com', '207.46.13.240', '', 1571256835),
(20302, '40.77.188.187', 'msnbot-40-77-188-187.search.msn.com', '40.77.188.187', '', 1570987993),
(20303, '54.36.148.125', 'ip-54-36-148-125.a.ahrefs.com', '54.36.148.125', '', 1573103671),
(20304, '54.36.149.12', 'ip-54-36-149-12.a.ahrefs.com', '54.36.149.12', '', 1572388344),
(20305, '66.249.83.92', 'google-proxy-66-249-83-92.google.com', '65.57.245.11', '', 1572832255),
(20307, '40.77.189.80', 'msnbot-40-77-189-80.search.msn.com', '40.77.189.80', '', 1570993891),
(20308, '40.77.167.185', 'msnbot-40-77-167-185.search.msn.com', '40.77.167.185', '', 1572544765),
(20309, '40.77.191.45', 'msnbot-40-77-191-45.search.msn.com', '40.77.191.45', '', 1570993949),
(20314, '66.249.75.188', 'crawl-66-249-75-188.googlebot.com', '66.249.75.188', '', 1571319218),
(20317, '66.249.66.85', 'crawl-66-249-66-85.googlebot.com', '66.249.66.85', '', 1571079017),
(20318, '66.249.66.91', 'crawl-66-249-66-91.googlebot.com', '66.249.66.91', '', 1571078432),
(20319, '66.249.66.54', 'crawl-66-249-66-54.googlebot.com', '66.249.66.54', '', 1571039179),
(20320, '65.55.210.202', 'msnbot-65-55-210-202.search.msn.com', '65.55.210.202', '', 1571008076),
(20321, '66.249.66.93', 'crawl-66-249-66-93.googlebot.com', '66.249.66.93', '', 1571060511),
(20322, '54.36.149.23', 'ip-54-36-149-23.a.ahrefs.com', '54.36.149.23', '', 1573100632),
(20323, '54.36.148.145', 'ip-54-36-148-145.a.ahrefs.com', '54.36.148.145', '', 1572674845),
(20324, '36.72.212.17', '36.72.212.17', '36.72.212.17', '', 1571017078),
(20325, '66.249.66.92', 'crawl-66-249-66-92.googlebot.com', '66.249.66.92', '', 1571085099),
(20326, '180.248.43.5', '180.248.43.5', '180.248.43.5', '', 1571018449),
(20327, '182.1.78.194', '182.1.78.194', '182.1.78.194', '', 1571019708),
(20328, '54.36.148.37', 'ip-54-36-148-37.a.ahrefs.com', '54.36.148.37', '', 1573103527),
(20333, '115.178.238.63', '115.178.238.63', '115.178.238.63', '', 1571027256),
(20334, '36.72.214.185', '36.72.214.185', '36.72.214.185', '', 1571027596),
(20335, '3.8.164.173', 'ec2-3-8-164-173.eu-west-2.compute.amazonaws.com', '3.8.164.173', '', 1571027751),
(20340, '40.77.167.193', 'msnbot-40-77-167-193.search.msn.com', '40.77.167.193', '', 1572073372),
(20341, '65.55.210.96', 'msnbot-65-55-210-96.search.msn.com', '65.55.210.96', '', 1571037122),
(20343, '202.158.25.243', 'ip25-243.cbn.net.id', '202.158.25.243', '', 1571038768),
(20344, '54.36.148.25', 'ip-54-36-148-25.a.ahrefs.com', '54.36.148.25', '', 1572359137),
(20345, '66.249.66.86', 'crawl-66-249-66-86.googlebot.com', '66.249.66.86', '', 1571078794),
(20346, '207.46.13.230', 'msnbot-207-46-13-230.search.msn.com', '207.46.13.230', '', 1572594081),
(20347, '182.1.116.164', '182.1.116.164', '182.1.116.164', '', 1571041456),
(20350, '182.1.46.189', '182.1.46.189', '182.1.46.189', '', 1571048363),
(20351, '103.28.112.183', 'host-103-28-112-183.ldp.net.id', '103.28.112.183', '', 1571049581),
(20352, '65.132.59.34', '65.132.59.34', '65.132.59.34', '', 1571050489),
(20353, '207.46.13.59', 'msnbot-207-46-13-59.search.msn.com', '207.46.13.59', '', 1572394032),
(20356, '66.249.80.61', 'google-proxy-66-249-80-61.google.com', '114.125.70.224', '', 1572102812),
(20358, '40.77.190.254', 'msnbot-40-77-190-254.search.msn.com', '40.77.190.254', '', 1571067916),
(20360, '40.77.188.254', 'msnbot-40-77-188-254.search.msn.com', '40.77.188.254', '', 1571075075),
(20361, '40.77.190.148', 'msnbot-40-77-190-148.search.msn.com', '40.77.190.148', '', 1571075097),
(20362, '40.77.189.208', 'msnbot-40-77-189-208.search.msn.com', '40.77.189.208', '', 1571112901),
(20363, '40.77.188.9', 'msnbot-40-77-188-9.search.msn.com', '40.77.188.9', '', 1571076304),
(20364, '40.77.188.103', 'msnbot-40-77-188-103.search.msn.com', '40.77.188.103', '', 1571076305),
(20365, '40.77.189.18', 'msnbot-40-77-189-18.search.msn.com', '40.77.189.18', '', 1571076309),
(20366, '40.77.188.134', 'msnbot-40-77-188-134.search.msn.com', '40.77.188.134', '', 1571079314),
(20367, '40.77.190.70', 'msnbot-40-77-190-70.search.msn.com', '40.77.190.70', '', 1571079456),
(20376, '54.36.148.88', 'ip-54-36-148-88.a.ahrefs.com', '54.36.148.88', '', 1572631918),
(20377, '115.28.212.181', '115.28.212.181', '115.28.212.181', '', 1571099323),
(20378, '125.166.179.54', '125.166.179.54', '125.166.179.54', '', 1571099335),
(20379, '207.46.13.35', 'msnbot-207-46-13-35.search.msn.com', '207.46.13.35', '', 1571106067),
(20380, '66.220.149.40', '66.220.149.40', '66.220.149.40', '', 1572305962),
(20381, '66.220.149.6', '66.220.149.6', '66.220.149.6', '', 1571716979),
(20382, '120.188.72.32', '120.188.72.32', '120.188.72.32', '', 1571102387),
(20383, '116.254.112.184', 'ipv4-184-112.254.116.as55666.net', '116.254.112.184', '', 1571102912),
(20384, '114.4.220.37', '114-4-220-37.resources.indosat.com', '114.4.220.37', '', 1571103028),
(20385, '66.249.69.226', 'crawl-66-249-69-226.googlebot.com', '66.249.69.226', '', 1571194788),
(20386, '66.249.69.222', 'crawl-66-249-69-222.googlebot.com', '66.249.69.222', '', 1571159844),
(20387, '66.249.69.61', 'crawl-66-249-69-61.googlebot.com', '66.249.69.61', '', 1571178606),
(20388, '66.220.149.56', '66.220.149.56', '66.220.149.56', '', 1572926410),
(20389, '66.220.149.31', '66.220.149.31', '66.220.149.31', '', 1571104339),
(20390, '66.249.75.63', 'crawl-66-249-75-63.googlebot.com', '66.249.75.63', '', 1571166117),
(20391, '66.249.75.194', 'crawl-66-249-75-194.googlebot.com', '66.249.75.194', '', 1571104986),
(20392, '66.249.75.162', 'crawl-66-249-75-162.googlebot.com', '66.249.75.162', '', 1571105582),
(20393, '66.249.75.134', 'crawl-66-249-75-134.googlebot.com', '66.249.75.134', '', 1571105583),
(20394, '66.249.75.18', 'crawl-66-249-75-18.googlebot.com', '66.249.75.18', '', 1571172842),
(20395, '203.116.238.24', '203.116.238.24', '203.116.238.24', 'Proxy', 1571105959),
(20396, '66.249.75.190', 'crawl-66-249-75-190.googlebot.com', '66.249.75.190', '', 1571106154),
(20397, '125.161.129.62', '62.subnet125-161-129.speedy.telkom.net.id', '125.161.129.62', '', 1571106367),
(20398, '114.4.221.45', '114-4-221-45.resources.indosat.com', '114.4.221.45', '', 1571107166),
(20399, '66.249.75.223', 'crawl-66-249-75-223.googlebot.com', '66.249.75.223', '', 1571107408),
(20400, '66.249.75.98', 'crawl-66-249-75-98.googlebot.com', '66.249.75.98', '', 1571108585),
(20401, '66.249.75.34', 'crawl-66-249-75-34.googlebot.com', '66.249.75.34', '', 1571108586),
(20402, '36.73.83.156', '36.73.83.156', '36.73.83.156', '', 1571109455),
(20403, '14.1.227.34', '14.1.227.34', '14.1.227.34', '', 1571109766),
(20404, '120.188.76.15', '120.188.76.15', '120.188.76.15', '', 1571110322),
(20405, '207.46.13.231', 'msnbot-207-46-13-231.search.msn.com', '207.46.13.231', '', 1572718047),
(20406, '65.55.210.4', 'msnbot-65-55-210-4.search.msn.com', '65.55.210.4', '', 1571110511),
(20407, '116.0.1.123', '116.0.1.123', '116.0.1.123', '', 1571116652),
(20408, '182.1.79.239', '182.1.79.239', '182.1.79.239', '', 1571112910),
(20409, '207.46.13.253', 'msnbot-207-46-13-253.search.msn.com', '207.46.13.253', '', 1572508585),
(20410, '207.46.13.68', 'msnbot-207-46-13-68.search.msn.com', '207.46.13.68', '', 1571113770),
(20411, '202.43.93.14', 'host-202-43-93-14.ugm.ac.id', '202.43.93.14', '', 1572922089),
(20414, '110.136.88.9', '9.subnet110-136-88.speedy.telkom.net.id', '110.136.88.9', '', 1571116191),
(20415, '115.178.252.161', '115.178.252.161', '115.178.252.161', '', 1571116794),
(20425, '40.77.189.96', 'msnbot-40-77-189-96.search.msn.com', '40.77.189.96', '', 1571148336),
(20426, '40.77.190.39', 'msnbot-40-77-190-39.search.msn.com', '40.77.190.39', '', 1571148339),
(20429, '157.55.39.235', 'msnbot-157-55-39-235.search.msn.com', '157.55.39.235', '', 1571150789),
(20435, '157.55.39.220', 'msnbot-157-55-39-220.search.msn.com', '157.55.39.220', '', 1571857852),
(20436, '40.77.190.134', 'msnbot-40-77-190-134.search.msn.com', '40.77.190.134', '', 1571172095),
(20439, '54.36.149.55', 'ip-54-36-149-55.a.ahrefs.com', '54.36.149.55', '', 1573092754),
(20440, '157.55.39.90', 'msnbot-157-55-39-90.search.msn.com', '157.55.39.90', '', 1572670026),
(20441, '120.188.81.95', '120.188.81.95', '120.188.81.95', '', 1571177124),
(20443, '40.77.167.2', 'msnbot-40-77-167-2.search.msn.com', '40.77.167.2', '', 1572259252),
(20444, '64.233.172.33', 'google-proxy-64-233-172-33.google.com', '202.182.160.162', '', 1571178307),
(20445, '66.249.69.192', 'crawl-66-249-69-192.googlebot.com', '66.249.69.192', '', 1571340604),
(20446, '114.5.208.45', '114-5-208-45.resources.indosat.com', '114.5.208.45', '', 1571179675),
(20449, '110.137.146.90', '90.subnet110-137-146.speedy.telkom.net.id', '110.137.146.90', '', 1571216119),
(20450, '103.17.244.125', 'ipv4-125-244-17.as55666.net', '103.17.244.125', '', 1571189979),
(20452, '61.94.43.155', '61.94.43.155', '61.94.43.155', '', 1571194816),
(20453, '120.188.78.110', '120.188.78.110', '120.188.78.110', '', 1571195347),
(20454, '173.252.127.27', '173.252.127.27', '173.252.127.27', '', 1571195379),
(20455, '173.252.127.3', '173.252.127.3', '173.252.127.3', '', 1571195381),
(20456, '120.188.83.233', '120.188.83.233', '120.188.83.233', '', 1571195959),
(20457, '40.77.167.52', 'msnbot-40-77-167-52.search.msn.com', '40.77.167.52', '', 1571195593),
(20458, '36.90.18.252', '36.90.18.252', '36.90.18.252', '', 1571196714),
(20459, '173.252.127.17', '173.252.127.17', '173.252.127.17', '', 1571197572),
(20460, '173.252.127.41', '173.252.127.41', '173.252.127.41', '', 1571197573),
(20461, '182.1.8.237', '182.1.8.237', '182.1.8.237', '', 1571199261),
(20462, '157.55.39.128', 'msnbot-157-55-39-128.search.msn.com', '157.55.39.128', '', 1571199275),
(20463, '43.252.105.34', 'host-43-252-105-34.ldp.net.id', '43.252.105.34', '', 1571200123),
(20465, '180.254.106.223', '180.254.106.223', '180.254.106.223', '', 1571203098),
(20466, '114.142.168.62', 'subs16-114-142-168-62.three.co.id', '114.142.168.62', '', 1571203494),
(20467, '3.10.54.39', 'ec2-3-10-54-39.eu-west-2.compute.amazonaws.com', '3.10.54.39', '', 1571203641),
(20468, '66.249.88.127', 'google-proxy-66-249-88-127.google.com', '112.215.153.93', '', 1571210871),
(20470, '54.36.149.61', 'ip-54-36-149-61.a.ahrefs.com', '54.36.149.61', '', 1573096406),
(20471, '110.76.147.74', '110.76.147.74', '110.76.147.74', '', 1571207550),
(20473, '157.55.39.52', 'msnbot-157-55-39-52.search.msn.com', '157.55.39.52', '', 1572543262),
(20474, '202.67.37.9', '202.67.37.9', '202.67.37.9', '', 1571214739),
(20480, '54.36.148.181', 'ip-54-36-148-181.a.ahrefs.com', '54.36.148.181', '', 1572642516),
(20483, '65.55.210.13', 'msnbot-65-55-210-13.search.msn.com', '65.55.210.13', '', 1571233852),
(20486, '40.77.188.151', 'msnbot-40-77-188-151.search.msn.com', '40.77.188.151', '', 1572497966),
(20487, '54.36.148.108', 'ip-54-36-148-108.a.ahrefs.com', '54.36.148.108', '', 1572696021),
(20488, '114.125.108.103', '114.125.108.103', '114.125.108.103', '', 1571238530),
(20492, '54.36.148.212', 'ip-54-36-148-212.a.ahrefs.com', '54.36.148.212', '', 1572685732),
(20493, '54.36.149.43', 'ip-54-36-149-43.a.ahrefs.com', '54.36.149.43', '', 1572455142),
(20495, '54.36.148.237', 'ip-54-36-148-237.a.ahrefs.com', '54.36.148.237', '', 1572692612),
(20496, '40.77.167.202', 'msnbot-40-77-167-202.search.msn.com', '40.77.167.202', '', 1572321835),
(20497, '40.77.167.203', 'msnbot-40-77-167-203.search.msn.com', '40.77.167.203', '', 1571731048),
(20498, '40.77.190.30', 'msnbot-40-77-190-30.search.msn.com', '40.77.190.30', '', 1571252345),
(20501, '207.46.13.26', 'msnbot-207-46-13-26.search.msn.com', '207.46.13.26', '', 1571257697),
(20502, '157.55.39.143', 'msnbot-157-55-39-143.search.msn.com', '157.55.39.143', '', 1571277742),
(20506, '54.36.149.90', 'ip-54-36-149-90.a.ahrefs.com', '54.36.149.90', '', 1573105116),
(20507, '40.77.188.39', 'msnbot-40-77-188-39.search.msn.com', '40.77.188.39', '', 1571271279),
(20508, '40.77.167.228', 'msnbot-40-77-167-228.search.msn.com', '40.77.167.228', '', 1571271289),
(20509, '103.28.115.110', 'host-103-28-115-110.ldp.net.id', '103.28.115.110', '', 1571272612),
(20510, '54.36.148.45', 'ip-54-36-148-45.a.ahrefs.com', '54.36.148.45', '', 1572694837),
(20511, '40.77.167.154', 'msnbot-40-77-167-154.search.msn.com', '40.77.167.154', '', 1571273697),
(20512, '207.46.13.235', 'msnbot-207-46-13-235.search.msn.com', '207.46.13.235', '', 1572593413),
(20513, '40.77.190.143', 'msnbot-40-77-190-143.search.msn.com', '40.77.190.143', '', 1572522377),
(20514, '40.77.190.74', 'msnbot-40-77-190-74.search.msn.com', '40.77.190.74', '', 1571274276),
(20515, '54.36.149.1', 'ip-54-36-149-1.a.ahrefs.com', '54.36.149.1', '', 1572948260),
(20516, '54.36.149.17', 'ip-54-36-149-17.a.ahrefs.com', '54.36.149.17', '', 1572669436),
(20517, '114.125.118.76', '114.125.118.76', '114.125.118.76', '', 1571279575),
(20518, '36.90.184.210', '36.90.184.210', '36.90.184.210', '', 1571279913),
(20519, '66.249.75.96', 'crawl-66-249-75-96.googlebot.com', '66.249.75.96', '', 1571280214),
(20520, '66.249.75.20', 'crawl-66-249-75-20.googlebot.com', '66.249.75.20', '', 1571280578),
(20529, '35.178.175.10', 'ec2-35-178-175-10.eu-west-2.compute.amazonaws.com', '35.178.175.10', '', 1571287477),
(20536, '110.35.82.35', 'IP-82-35.napinfo.net', '110.35.82.35', '', 1571296090),
(20539, '66.220.149.47', '66.220.149.47', '66.220.149.47', '', 1571982241),
(20542, '182.1.99.41', '182.1.99.41', '182.1.99.41', '', 1571306233),
(20545, '207.46.13.110', 'msnbot-207-46-13-110.search.msn.com', '207.46.13.110', '', 1571317251),
(20546, '36.79.85.114', '36.79.85.114', '36.79.85.114', '', 1571311700),
(20557, '40.77.188.147', 'msnbot-40-77-188-147.search.msn.com', '40.77.188.147', '', 1571339646),
(20561, '40.77.190.165', 'msnbot-40-77-190-165.search.msn.com', '40.77.190.165', '', 1571355132),
(20562, '120.188.66.215', '120.188.66.215', '120.188.66.215', '', 1571355667),
(20563, '115.178.235.240', '115.178.235.240', '115.178.235.240', '', 1571356351),
(20564, '157.55.39.64', 'msnbot-157-55-39-64.search.msn.com', '157.55.39.64', '', 1571356400),
(20565, '61.14.175.79', 'ip-61-14-175-79.asianetcom.net', '61.14.175.79', '', 1571358622),
(20567, '40.77.190.240', 'msnbot-40-77-190-240.search.msn.com', '40.77.190.240', '', 1571363324),
(20581, '40.77.190.155', 'msnbot-40-77-190-155.search.msn.com', '40.77.190.155', '', 1571381720),
(20582, '40.77.167.216', 'msnbot-40-77-167-216.search.msn.com', '40.77.167.216', '', 1572528086),
(20584, '207.46.13.206', 'msnbot-207-46-13-206.search.msn.com', '207.46.13.206', '', 1572544447),
(20586, '40.77.167.210', 'msnbot-40-77-167-210.search.msn.com', '40.77.167.210', '', 1571388977),
(20587, '120.188.64.209', '120.188.64.209', '120.188.64.209', '', 1571390656),
(20589, '114.4.222.228', '114-4-222-228.resources.indosat.com', '114.4.222.228', '', 1571392914),
(20590, '114.142.168.22', 'subs16-114-142-168-22.three.co.id', '114.142.168.22', '', 1571394798),
(20592, '182.1.123.200', '182.1.123.200', '182.1.123.200', '', 1571398549),
(20593, '40.77.190.250', 'msnbot-40-77-190-250.search.msn.com', '40.77.190.250', '', 1572539251),
(20594, '103.124.137.31', 'host-103.124.137-31.gmdp.net.id', '103.124.137.31', '', 1571402538),
(20595, '114.5.211.230', '114-5-211-230.resources.indosat.com', '114.5.211.230', '', 1571402588),
(20596, '157.55.39.138', 'msnbot-157-55-39-138.search.msn.com', '157.55.39.138', '', 1571670498),
(20597, '40.77.189.116', 'msnbot-40-77-189-116.search.msn.com', '40.77.189.116', '', 1571404307),
(20598, '40.77.190.220', 'msnbot-40-77-190-220.search.msn.com', '40.77.190.220', '', 1571407648),
(20599, '40.77.189.103', 'msnbot-40-77-189-103.search.msn.com', '40.77.189.103', '', 1571407679),
(20602, '66.220.149.54', '66.220.149.54', '66.220.149.54', '', 1572413963),
(20603, '58.22.65.34', '58.22.65.34', '58.22.65.34', '', 1571416296),
(20604, '40.77.167.227', 'msnbot-40-77-167-227.search.msn.com', '40.77.167.227', '', 1572583155),
(20605, '207.46.13.207', 'msnbot-207-46-13-207.search.msn.com', '207.46.13.207', '', 1571816497),
(20606, '65.55.210.122', 'msnbot-65-55-210-122.search.msn.com', '65.55.210.122', '', 1571416605),
(20607, '40.77.188.137', 'msnbot-40-77-188-137.search.msn.com', '40.77.188.137', '', 1571416611),
(20608, '65.55.210.231', 'msnbot-65-55-210-231.search.msn.com', '65.55.210.231', '', 1571416616),
(20609, '40.77.188.57', 'msnbot-40-77-188-57.search.msn.com', '40.77.188.57', '', 1571426136),
(20610, '65.55.210.20', 'msnbot-65-55-210-20.search.msn.com', '65.55.210.20', '', 1571416906),
(20611, '157.55.39.191', 'msnbot-157-55-39-191.search.msn.com', '157.55.39.191', '', 1571416923),
(20612, '103.60.14.180', '103.60.14.180', '103.60.14.180', '', 1572427981),
(20614, '207.46.13.246', 'msnbot-207-46-13-246.search.msn.com', '207.46.13.246', '', 1572409651),
(20615, '40.77.190.44', 'msnbot-40-77-190-44.search.msn.com', '40.77.190.44', '', 1571426075),
(20617, '40.77.188.224', 'msnbot-40-77-188-224.search.msn.com', '40.77.188.224', '', 1571430789),
(20619, '40.77.188.131', 'msnbot-40-77-188-131.search.msn.com', '40.77.188.131', '', 1572522330),
(20620, '40.77.188.243', 'msnbot-40-77-188-243.search.msn.com', '40.77.188.243', '', 1571432450),
(20621, '66.249.75.174', 'crawl-66-249-75-174.googlebot.com', '66.249.75.174', '', 1571433613),
(20622, '40.77.189.84', 'msnbot-40-77-189-84.search.msn.com', '40.77.189.84', '', 1571433845),
(20623, '66.249.69.194', 'crawl-66-249-69-194.googlebot.com', '66.249.69.194', '', 1571433852),
(20625, '114.5.215.52', '114-5-215-52.resources.indosat.com', '114.5.215.52', '', 1571437113),
(20630, '173.252.95.41', '173.252.95.41', '173.252.95.41', '', 1571459337),
(20631, '77.45.150.107', '107.150.c10008-a77.dsl-dynamic.vsi.ru', '77.45.150.107', '', 1571460249),
(20632, '64.233.173.10', 'google-proxy-64-233-173-10.google.com', '64.233.173.10', '', 1571460299),
(20633, '54.184.74.64', 'ec2-54-184-74-64.us-west-2.compute.amazonaws.com', '54.184.74.64', '', 1571463174),
(20635, '120.188.92.151', '120.188.92.151', '120.188.92.151', '', 1571468463),
(20637, '157.55.39.70', 'msnbot-157-55-39-70.search.msn.com', '157.55.39.70', '', 1572979067),
(20638, '209.17.96.114', '209.17.96.114.rdns.cloudsystemnetworks.com', '209.17.96.114', '', 1571477603),
(20639, '114.5.214.57', '114-5-214-57.resources.indosat.com', '114.5.214.57', '', 1571480207),
(20642, '157.55.39.100', 'msnbot-157-55-39-100.search.msn.com', '157.55.39.100', '', 1572568019),
(20643, '65.55.210.86', 'msnbot-65-55-210-86.search.msn.com', '65.55.210.86', '', 1571489488),
(20644, '66.220.149.46', '66.220.149.46', '66.220.149.46', '', 1571974434),
(20645, '66.220.149.36', '66.220.149.36', '66.220.149.36', '', 1571490001),
(20646, '66.249.88.35', 'google-proxy-66-249-88-35.google.com', '140.213.92.143', '', 1571490428),
(20647, '66.249.88.37', 'google-proxy-66-249-88-37.google.com', '140.213.92.143', '', 1571490431),
(20648, '66.102.8.254', 'google-proxy-66-102-8-254.google.com', '140.213.92.143', '', 1571623704),
(20649, '82.145.221.211', 'n11-10-04.opera-mini.net', '115.178.237.195', '', 1571490882),
(20662, '173.252.95.10', '173.252.95.10', '173.252.95.10', '', 1571535908),
(20665, '114.5.219.26', '114-5-219-26.resources.indosat.com', '114.5.219.26', '', 1571540674),
(20666, '207.46.13.30', 'msnbot-207-46-13-30.search.msn.com', '207.46.13.30', '', 1571541956),
(20670, '69.171.251.43', '69.171.251.43', '69.171.251.43', '', 1571676889),
(20671, '40.77.167.71', 'msnbot-40-77-167-71.search.msn.com', '40.77.167.71', '', 1571553207),
(20672, '120.188.34.145', '120.188.34.145', '120.188.34.145', '', 1571553573),
(20673, '182.1.20.237', '182.1.20.237', '182.1.20.237', '', 1571554099),
(20675, '54.36.148.253', 'ip-54-36-148-253.a.ahrefs.com', '54.36.148.253', '', 1572693010),
(20680, '207.46.13.133', 'msnbot-207-46-13-133.search.msn.com', '207.46.13.133', '', 1571570326),
(20697, '114.125.125.0', '114.125.125.0', '114.125.125.0', '', 1571625256),
(20698, '202.152.141.93', '202-152-141-93.citra.net.id', '202.152.141.93', '', 1571625350),
(20699, '114.125.111.129', '114.125.111.129', '114.125.111.129', '', 1571626302),
(20700, '114.125.110.128', '114.125.110.128', '114.125.110.128', '', 1571666991),
(20704, '103.210.116.131', '103.210.116.131', '103.210.116.131', '', 1571634600),
(20705, '207.46.13.115', 'msnbot-207-46-13-115.search.msn.com', '207.46.13.115', '', 1571634830),
(20706, '52.56.177.145', 'ec2-52-56-177-145.eu-west-2.compute.amazonaws.com', '52.56.177.145', '', 1571635094),
(20707, '202.43.95.71', 'host-202-43-95-71.ugm.ac.id', '202.43.95.71', '', 1572509454),
(20708, '180.254.89.235', '180.254.89.235', '180.254.89.235', '', 1571635652),
(20713, '173.252.87.6', '173.252.87.6', '173.252.87.6', '', 1571641947),
(20714, '173.252.87.19', '173.252.87.19', '173.252.87.19', '', 1571641947),
(20715, '60.191.38.77', '60.191.38.77', '60.191.38.77', '', 1571647125),
(20719, '66.220.149.14', '66.220.149.14', '66.220.149.14', '', 1572994979),
(20720, '114.4.217.178', '114-4-217-178.resources.indosat.com', '114.4.217.178', '', 1571659034),
(20721, '157.55.39.223', 'msnbot-157-55-39-223.search.msn.com', '157.55.39.223', '', 1571662262),
(20726, '54.184.71.15', 'ec2-54-184-71-15.us-west-2.compute.amazonaws.com', '54.184.71.15', '', 1571672480),
(20728, '69.171.251.3', '69.171.251.3', '69.171.251.3', '', 1571676891),
(20736, '207.46.13.83', 'msnbot-207-46-13-83.search.msn.com', '207.46.13.83', '', 1571708453),
(20737, '125.161.137.75', '75.subnet125-161-137.speedy.telkom.net.id', '125.161.137.75', '', 1571708908),
(20738, '120.188.74.245', '120.188.74.245', '120.188.74.245', '', 1571712273),
(20743, '36.76.246.191', '36.76.246.191', '36.76.246.191', '', 1571722614),
(20744, '157.55.39.76', 'msnbot-157-55-39-76.search.msn.com', '157.55.39.76', '', 1571726689),
(20746, '65.55.210.212', 'msnbot-65-55-210-212.search.msn.com', '65.55.210.212', '', 1571731163),
(20747, '36.73.42.171', '36.73.42.171', '36.73.42.171', '', 1571731179),
(20748, '40.77.191.29', 'msnbot-40-77-191-29.search.msn.com', '40.77.191.29', '', 1571731180),
(20749, '40.77.188.78', 'msnbot-40-77-188-78.search.msn.com', '40.77.188.78', '', 1571731217),
(20750, '65.55.210.167', 'msnbot-65-55-210-167.search.msn.com', '65.55.210.167', '', 1572386026),
(20751, '40.77.188.141', 'msnbot-40-77-188-141.search.msn.com', '40.77.188.141', '', 1571731349),
(20752, '112.215.153.3', '112.215.153.3', '112.215.153.3', '', 1571731476),
(20753, '66.220.149.41', '66.220.149.41', '66.220.149.41', '', 1571735657),
(20754, '36.81.42.190', '36.81.42.190', '36.81.42.190', '', 1571739589),
(20757, '120.188.92.208', '120.188.92.208', '120.188.92.208', '', 1571747667),
(20761, '173.252.87.21', '173.252.87.21', '173.252.87.21', '', 1571758727),
(20762, '173.252.87.36', '173.252.87.36', '173.252.87.36', '', 1571758730),
(20765, '207.46.13.238', 'msnbot-207-46-13-238.search.msn.com', '207.46.13.238', '', 1572539186),
(20766, '65.55.210.131', 'msnbot-65-55-210-131.search.msn.com', '65.55.210.131', '', 1571769431),
(20768, '65.55.210.159', 'msnbot-65-55-210-159.search.msn.com', '65.55.210.159', '', 1571769833),
(20771, '114.5.216.68', '114-5-216-68.resources.indosat.com', '114.5.216.68', '', 1571787748),
(20773, '192.99.9.25', 'ns500999.ip-192-99-9.net', '192.99.9.25', '', 1571789532),
(20774, '66.249.79.226', 'crawl-66-249-79-226.googlebot.com', '66.249.79.226', '', 1571790177),
(20776, '36.81.76.177', '36.81.76.177', '36.81.76.177', '', 1571792675),
(20777, '66.220.149.24', '66.220.149.24', '66.220.149.24', '', 1572043152),
(20778, '66.220.149.10', '66.220.149.10', '66.220.149.10', '', 1571794456),
(20779, '66.249.79.252', 'crawl-66-249-79-252.googlebot.com', '66.249.79.252', '', 1571796278),
(20780, '66.249.79.254', 'crawl-66-249-79-254.googlebot.com', '66.249.79.254', '', 1571796278),
(20781, '40.77.167.151', 'msnbot-40-77-167-151.search.msn.com', '40.77.167.151', '', 1571850429),
(20783, '120.188.92.241', '120.188.92.241', '120.188.92.241', '', 1571800121),
(20784, '182.1.113.200', '182.1.113.200', '182.1.113.200', '', 1571799461),
(20785, '114.5.209.168', '114-5-209-168.resources.indosat.com', '114.5.209.168', '', 1571799637),
(20786, '203.78.117.171', '203.78.117.171', '203.78.117.171', '', 1571808228),
(20787, '115.178.238.217', '115.178.238.217', '115.178.238.217', '', 1571799958),
(20788, '36.72.214.60', '36.72.214.60', '36.72.214.60', '', 1571799748),
(20790, '182.1.110.144', '182.1.110.144', '182.1.110.144', '', 1571800527),
(20791, '120.188.92.86', '120.188.92.86', '120.188.92.86', '', 1571801792),
(20793, '54.201.94.56', 'ec2-54-201-94-56.us-west-2.compute.amazonaws.com', '54.201.94.56', '', 1571803583),
(20794, '114.4.215.252', '114-4-215-252.resources.indosat.com', '114.4.215.252', '', 1571804343),
(20795, '18.130.211.117', 'ec2-18-130-211-117.eu-west-2.compute.amazonaws.com', '18.130.211.117', '', 1571804701),
(20801, '40.77.190.69', 'msnbot-40-77-190-69.search.msn.com', '40.77.190.69', '', 1571816532),
(20802, '40.77.167.38', 'msnbot-40-77-167-38.search.msn.com', '40.77.167.38', '', 1571817229),
(20805, '185.26.180.176', 'n30-02-09.opera-mini.net', '114.125.116.57', '', 1571820967),
(20807, '114.5.210.171', '114-5-210-171.resources.indosat.com', '114.5.210.171', '', 1571824030),
(20808, '40.69.154.124', '40.69.154.124', '40.69.154.124', '', 1571824184),
(20809, '112.215.241.40', '112.215.241.40', '112.215.241.40', '', 1571827192),
(20810, '140.213.59.253', '140.213.59.253', '140.213.59.253', '', 1571826319),
(20811, '140.213.28.87', '140.213.28.87', '140.213.28.87', '', 1571827651),
(20813, '207.46.13.63', 'msnbot-207-46-13-63.search.msn.com', '207.46.13.63', '', 1571829786),
(20816, '207.46.13.4', 'msnbot-207-46-13-4.search.msn.com', '207.46.13.4', '', 1571862155),
(20821, '120.188.67.232', '120.188.67.232', '120.188.67.232', '', 1571852721),
(20822, '35.173.249.223', 'ec2-35-173-249-223.compute-1.amazonaws.com', '35.173.249.223', '', 1571853186),
(20823, '66.249.65.110', 'crawl-66-249-65-110.googlebot.com', '66.249.65.110', '', 1572886434),
(20824, '35.202.94.3', '3.94.202.35.bc.googleusercontent.com', '35.202.94.3', '', 1571856965),
(20826, '207.46.13.75', 'msnbot-207-46-13-75.search.msn.com', '207.46.13.75', '', 1572232819),
(20827, '31.13.115.7', '31.13.115.7', '31.13.115.7', '', 1571877967),
(20828, '31.13.115.15', '31.13.115.15', '31.13.115.15', '', 1571877968),
(20829, '180.254.58.27', '180.254.58.27', '180.254.58.27', '', 1571879208),
(20830, '36.75.195.82', '36.75.195.82', '36.75.195.82', '', 1571881328),
(20831, '40.77.167.8', 'msnbot-40-77-167-8.search.msn.com', '40.77.167.8', '', 1571882345),
(20832, '207.46.13.186', 'msnbot-207-46-13-186.search.msn.com', '207.46.13.186', '', 1572508597),
(20833, '65.55.210.63', 'msnbot-65-55-210-63.search.msn.com', '65.55.210.63', '', 1571882725),
(20834, '40.77.167.199', 'msnbot-40-77-167-199.search.msn.com', '40.77.167.199', '', 1572476639),
(20835, '65.55.210.102', 'msnbot-65-55-210-102.search.msn.com', '65.55.210.102', '', 1571882732),
(20836, '40.77.188.229', 'msnbot-40-77-188-229.search.msn.com', '40.77.188.229', '', 1571882735),
(20837, '40.77.188.204', 'msnbot-40-77-188-204.search.msn.com', '40.77.188.204', '', 1571883096),
(20838, '40.77.190.246', 'msnbot-40-77-190-246.search.msn.com', '40.77.190.246', '', 1571883102),
(20839, '40.77.190.160', 'msnbot-40-77-190-160.search.msn.com', '40.77.190.160', '', 1571883131),
(20840, '210.210.140.60', 'static-210-140-60.cbn.net.id', '210.210.140.60', '1.1 idproxy.nead.danet 0ACB8226', 1571885007),
(20846, '36.81.65.67', '36.81.65.67', '36.81.65.67', '', 1571891394),
(20847, '157.55.39.245', 'msnbot-157-55-39-245.search.msn.com', '157.55.39.245', '', 1571895694),
(20848, '36.78.57.114', '36.78.57.114', '36.78.57.114', '', 1572266870),
(20849, '207.46.13.182', 'msnbot-207-46-13-182.search.msn.com', '207.46.13.182', '', 1571895394),
(20851, '180.249.213.244', '180.249.213.244', '180.249.213.244', '', 1571896629),
(20852, '18.130.246.209', 'ec2-18-130-246-209.eu-west-2.compute.amazonaws.com', '18.130.246.209', '', 1571897121),
(20854, '103.71.191.117', '103.71.191.117', '103.71.191.117', '', 1571900489),
(20855, '182.23.53.74', '182.23.53.74', '182.23.53.74', '', 1571900657),
(20864, '120.188.87.32', '120.188.87.32', '120.188.87.32', '', 1571914030),
(20865, '40.77.167.4', 'msnbot-40-77-167-4.search.msn.com', '40.77.167.4', '', 1572872340),
(20866, '114.125.92.213', '114.125.92.213', '114.125.92.213', '', 1571919131),
(20867, '91.231.84.94', '91.231.84.94.ip.ukrnames.com', '91.231.84.94', '', 1571919177),
(20868, '182.1.65.135', '182.1.65.135', '182.1.65.135', '', 1571922194),
(20869, '140.213.56.210', '140.213.56.210', '140.213.56.210', '', 1571922933),
(20870, '114.125.125.47', '114.125.125.47', '114.125.125.47', '', 1571924732),
(20871, '120.188.73.83', '120.188.73.83', '120.188.73.83', '', 1571924732),
(20872, '180.249.15.29', '180.249.15.29', '180.249.15.29', '', 1571925050),
(20873, '182.1.102.145', '182.1.102.145', '182.1.102.145', '', 1571932069),
(20874, '66.249.65.136', 'crawl-66-249-65-136.googlebot.com', '66.249.65.136', '', 1571928463),
(20875, '40.77.188.107', 'msnbot-40-77-188-107.search.msn.com', '40.77.188.107', '', 1571928671),
(20876, '157.55.39.227', 'msnbot-157-55-39-227.search.msn.com', '157.55.39.227', '', 1571929740),
(20878, '157.55.39.208', 'msnbot-157-55-39-208.search.msn.com', '157.55.39.208', '', 1571945143),
(20879, '66.220.149.1', '66.220.149.1', '66.220.149.1', '', 1572316522),
(20880, '31.14.72.34', '31.14.72.34', '31.14.72.34', '', 1571941006),
(20881, '66.249.65.112', 'crawl-66-249-65-112.googlebot.com', '66.249.65.112', '', 1572883176),
(20889, '207.46.13.5', 'msnbot-207-46-13-5.search.msn.com', '207.46.13.5', '', 1571983951),
(20890, '36.70.78.42', '36.70.78.42', '36.70.78.42', '', 1571971764),
(20894, '52.171.38.247', '52.171.38.247', '52.171.38.247', '', 1572394875),
(20895, '36.73.122.57', '36.73.122.57', '36.73.122.57', '', 1571977503),
(20899, '203.190.43.5', '203.190.43.5', '203.190.43.5', '', 1571986331),
(20900, '40.77.167.76', 'msnbot-40-77-167-76.search.msn.com', '40.77.167.76', '', 1572387180),
(20902, '35.163.1.140', 'ec2-35-163-1-140.us-west-2.compute.amazonaws.com', '35.163.1.140', '', 1571995954),
(20904, '34.198.170.138', 'ec2-34-198-170-138.compute-1.amazonaws.com', '34.198.170.138', '', 1571997338),
(20908, '114.5.223.71', '114-5-223-71.resources.indosat.com', '114.5.223.71', '', 1572008524),
(20909, '209.17.97.50', '209.17.97.50.rdns.cloudsystemnetworks.com', '209.17.97.50', '', 1572009697),
(20910, '119.76.32.98', 'cm-119-76-32-98.revip17.asianet.co.th', '119.76.32.98', 'HTTP/1.1 NetScaler0003349312143908774002', 1572010329),
(20912, '110.232.84.229', 'host-84-229.bdl.nusa.net.id', '110.232.84.40', '1.1 proxy-serv-filter.bdl.nusa.net.id (squid/3.3.8)', 1572011403),
(20913, '207.46.13.213', 'msnbot-207-46-13-213.search.msn.com', '207.46.13.213', '', 1573021548),
(20927, '209.17.96.42', '209.17.96.42.rdns.cloudsystemnetworks.com', '209.17.96.42', '', 1572060909),
(20929, '157.55.39.142', 'msnbot-157-55-39-142.search.msn.com', '157.55.39.142', '', 1572063870),
(20930, '157.55.39.156', 'msnbot-157-55-39-156.search.msn.com', '157.55.39.156', '', 1572064148),
(20931, '157.55.39.165', 'msnbot-157-55-39-165.search.msn.com', '157.55.39.165', '', 1572064375),
(20932, '182.1.88.246', '182.1.88.246', '182.1.88.246', '', 1572071540),
(20933, '40.77.167.163', 'msnbot-40-77-167-163.search.msn.com', '40.77.167.163', '', 1572750524),
(20934, '40.77.188.212', 'msnbot-40-77-188-212.search.msn.com', '40.77.188.212', '', 1572486342),
(20935, '40.77.189.32', 'msnbot-40-77-189-32.search.msn.com', '40.77.189.32', '', 1572073368),
(20936, '40.77.189.147', 'msnbot-40-77-189-147.search.msn.com', '40.77.189.147', '', 1572073369),
(20937, '40.77.189.65', 'msnbot-40-77-189-65.search.msn.com', '40.77.189.65', '', 1572073371),
(20938, '40.77.188.104', 'msnbot-40-77-188-104.search.msn.com', '40.77.188.104', '', 1572073377),
(20939, '40.77.188.239', 'msnbot-40-77-188-239.search.msn.com', '40.77.188.239', '', 1572073413),
(20940, '40.77.189.59', 'msnbot-40-77-189-59.search.msn.com', '40.77.189.59', '', 1572073396),
(20942, '182.1.72.119', '182.1.72.119', '182.1.72.119', '', 1572074970),
(20952, '36.81.26.232', '36.81.26.232', '36.81.26.232', '', 1572113111),
(20953, '123.126.113.116', 'sogouspider-123-126-113-116.crawl.sogou.com', '123.126.113.116', '', 1572116793),
(20954, '54.183.207.154', 'ec2-54-183-207-154.us-west-1.compute.amazonaws.com', '54.183.207.154', '', 1572117597),
(20958, '207.46.13.211', 'msnbot-207-46-13-211.search.msn.com', '207.46.13.211', '', 1572133838),
(20959, '54.36.149.45', 'ip-54-36-149-45.a.ahrefs.com', '54.36.149.45', '', 1573086234),
(20960, '54.36.148.233', 'ip-54-36-148-233.a.ahrefs.com', '54.36.148.233', '', 1573104538),
(20961, '66.220.149.64', '66.220.149.64', '66.220.149.64', '', 1572667831),
(20962, '36.90.17.31', '36.90.17.31', '36.90.17.31', '', 1572137957),
(20964, '112.215.173.92', '112.215.173.92', '112.215.173.92', '', 1572143712),
(20966, '157.55.39.74', 'msnbot-157-55-39-74.search.msn.com', '157.55.39.74', '', 1572147591),
(20967, '194.153.113.13', '194.153.113.13', '194.153.113.13', '', 1572149132),
(20968, '40.77.167.60', 'msnbot-40-77-167-60.search.msn.com', '40.77.167.60', '', 1572150049),
(20969, '115.178.237.70', '115.178.237.70', '115.178.237.70', '', 1572152069),
(20970, '182.1.106.147', '182.1.106.147', '182.1.106.147', '', 1572152876),
(20972, '34.219.123.104', 'ec2-34-219-123-104.us-west-2.compute.amazonaws.com', '34.219.123.104', '', 1572155242),
(20974, '54.36.149.80', 'ip-54-36-149-80.a.ahrefs.com', '54.36.149.80', '', 1572698945),
(20977, '115.178.220.80', '115.178.220.80', '115.178.220.80', '', 1572164821),
(20978, '207.46.13.216', 'msnbot-207-46-13-216.search.msn.com', '207.46.13.216', '', 1572476629),
(20979, '40.77.167.209', 'msnbot-40-77-167-209.search.msn.com', '40.77.167.209', '', 1572299462),
(20980, '40.77.188.122', 'msnbot-40-77-188-122.search.msn.com', '40.77.188.122', '', 1572165157),
(20981, '40.77.190.127', 'msnbot-40-77-190-127.search.msn.com', '40.77.190.127', '', 1572165133),
(20982, '40.77.189.15', 'msnbot-40-77-189-15.search.msn.com', '40.77.189.15', '', 1572165137),
(20983, '40.77.190.211', 'msnbot-40-77-190-211.search.msn.com', '40.77.190.211', '', 1572165610),
(20984, '40.77.188.192', 'msnbot-40-77-188-192.search.msn.com', '40.77.188.192', '', 1572165612),
(20985, '54.36.149.39', 'ip-54-36-149-39.a.ahrefs.com', '54.36.149.39', '', 1572887987),
(20986, '54.36.148.218', 'ip-54-36-148-218.a.ahrefs.com', '54.36.148.218', '', 1572355756),
(20987, '140.213.59.212', '140.213.59.212', '140.213.59.212', '', 1572174078),
(20988, '140.213.97.159', '140.213.97.159', '140.213.97.159', '', 1572174451),
(20989, '140.0.183.185', 'fm-dyn-140-0-183-185.fast.net.id', '140.0.183.185', '', 1572174692),
(20991, '114.5.218.240', '114-5-218-240.resources.indosat.com', '114.5.218.240', '', 1572176017),
(20992, '40.77.167.91', 'msnbot-40-77-167-91.search.msn.com', '40.77.167.91', '', 1572176140),
(20993, '182.1.123.27', '182.1.123.27', '182.1.123.27', '', 1572175478),
(20994, '157.55.39.167', 'msnbot-157-55-39-167.search.msn.com', '157.55.39.167', '', 1572446837),
(20995, '112.215.237.232', '112.215.237.232', '112.215.237.232', '', 1572188769),
(20996, '40.77.167.158', 'msnbot-40-77-167-158.search.msn.com', '40.77.167.158', '', 1572520377),
(20997, '120.188.74.126', '120.188.74.126', '120.188.74.126', '', 1572177316),
(20999, '114.4.82.83', '114-4-82-83.resources.indosat.com', '114.4.82.83', '', 1572181522),
(21000, '173.252.87.16', '173.252.87.16', '173.252.87.16', '', 1572182987),
(21001, '173.252.87.45', '173.252.87.45', '173.252.87.45', '', 1572182987),
(21002, '40.77.167.126', 'msnbot-40-77-167-126.search.msn.com', '40.77.167.126', '', 1572184063),
(21007, '54.36.148.183', 'ip-54-36-148-183.a.ahrefs.com', '54.36.148.183', '', 1572685635),
(21010, '66.220.149.23', '66.220.149.23', '66.220.149.23', '', 1572836051),
(21011, '207.46.13.44', 'msnbot-207-46-13-44.search.msn.com', '207.46.13.44', '', 1572444414),
(21012, '3.86.239.11', 'ec2-3-86-239-11.compute-1.amazonaws.com', '3.86.239.11', '', 1572223531),
(21013, '36.73.46.144', '36.73.46.144', '36.73.46.144', '', 1572223756),
(21014, '157.55.39.12', 'msnbot-157-55-39-12.search.msn.com', '157.55.39.12', '', 1572224740);
INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(21018, '54.72.123.137', 'ec2-54-72-123-137.eu-west-1.compute.amazonaws.com', '54.72.123.137', '', 1572232181),
(21019, '120.188.77.193', '120.188.77.193', '120.188.77.193', '', 1572233089),
(21020, '103.210.35.226', '103.210.35.226', '103.210.35.226', '', 1572237516),
(21021, '115.178.255.149', '115.178.255.149', '115.178.255.149', '', 1572233580),
(21022, '68.227.186.99', 'ip68-227-186-99.ri.ri.cox.net', '68.227.186.99', '', 1572234442),
(21023, '114.4.223.27', '114-4-223-27.resources.indosat.com', '114.4.223.27', '', 1572234999),
(21024, '142.44.167.43', '142.44.167.43', '142.44.167.43', '', 1572235102),
(21025, '142.44.166.135', '142.44.166.135', '142.44.166.135', '', 1572244287),
(21026, '173.252.95.9', '173.252.95.9', '173.252.95.9', '', 1572236459),
(21027, '173.252.95.6', '173.252.95.6', '173.252.95.6', '', 1572236460),
(21028, '103.123.120.9', '103.123.120.9', '103.123.120.9', '', 1572259325),
(21029, '109.110.88.207', 'host-207-88-110-109.sevstar.net', '109.110.88.207', '', 1573109280),
(21030, '182.1.99.59', '182.1.99.59', '182.1.99.59', '', 1572245031),
(21031, '125.160.67.173', '173.subnet125-160-67.speedy.telkom.net.id', '125.160.67.173', '', 1572243063),
(21032, '114.142.169.53', 'subs17-114-142-169-53.three.co.id', '114.142.169.53', '', 1572248050),
(21033, '114.125.109.225', '114.125.109.225', '114.125.109.225', '', 1572245520),
(21034, '114.125.126.232', '114.125.126.232', '114.125.126.232', '', 1572243753),
(21036, '182.1.112.54', '182.1.112.54', '182.1.112.54', '', 1572244677),
(21037, '120.188.77.194', '120.188.77.194', '120.188.77.194', '', 1572244924),
(21038, '114.125.81.55', '114.125.81.55', '114.125.81.55', '', 1572249497),
(21039, '114.125.109.246', '114.125.109.246', '114.125.109.246', '', 1572245239),
(21040, '115.178.238.33', '115.178.238.33', '115.178.238.33', '', 1572245526),
(21041, '182.1.115.61', '182.1.115.61', '182.1.115.61', '', 1572245280),
(21043, '182.1.121.22', '182.1.121.22', '182.1.121.22', '', 1572245517),
(21044, '120.188.77.93', '120.188.77.93', '120.188.77.93', '', 1572245488),
(21045, '120.188.77.73', '120.188.77.73', '120.188.77.73', '', 1572245854),
(21046, '114.125.124.234', '114.125.124.234', '114.125.124.234', '', 1572245547),
(21047, '120.188.72.133', '120.188.72.133', '120.188.72.133', '', 1572245560),
(21048, '182.1.113.152', '182.1.113.152', '182.1.113.152', '', 1572245601),
(21049, '120.188.79.13', '120.188.79.13', '120.188.79.13', '', 1572245830),
(21050, '114.125.108.83', '114.125.108.83', '114.125.108.83', '', 1572246308),
(21051, '182.1.122.184', '182.1.122.184', '182.1.122.184', '', 1572249396),
(21052, '112.215.172.36', '112.215.172.36', '112.215.172.36', '', 1572269474),
(21053, '182.1.123.184', '182.1.123.184', '182.1.123.184', '', 1572247114),
(21054, '120.188.83.4', '120.188.83.4', '120.188.83.4', '', 1572247898),
(21055, '182.1.107.63', '182.1.107.63', '182.1.107.63', '', 1572247773),
(21056, '114.4.79.163', '114-4-79-163.resources.indosat.com', '114.4.79.163', '', 1572252444),
(21058, '114.142.170.36', 'subs18-114-142-170-36.three.co.id', '114.142.170.36', '', 1572249369),
(21059, '114.125.126.159', '114.125.126.159', '114.125.126.159', '', 1572249657),
(21061, '182.1.65.53', '182.1.65.53', '182.1.65.53', '', 1572251118),
(21062, '114.125.127.233', '114.125.127.233', '114.125.127.233', '', 1572251631),
(21063, '114.4.222.143', '114-4-222-143.resources.indosat.com', '114.4.222.143', '', 1572252164),
(21064, '114.125.108.126', '114.125.108.126', '114.125.108.126', '', 1572252828),
(21065, '36.90.18.42', '36.90.18.42', '10.10.50.24', '1.1 10.10.50.1 (Mikrotik HttpProxy)', 1572253076),
(21066, '180.254.103.86', '180.254.103.86', '180.254.103.86', '', 1572253826),
(21067, '112.215.244.189', '112.215.244.189', '112.215.244.189', '', 1572254034),
(21068, '114.5.217.29', '114.5.217.29', '114.5.217.29', '', 1572255930),
(21069, '120.188.38.183', '120.188.38.183', '120.188.38.183', '', 1572256110),
(21070, '182.1.121.186', '182.1.121.186', '182.1.121.186', '', 1572256751),
(21071, '54.36.148.235', 'ip-54-36-148-235.a.ahrefs.com', '54.36.148.235', '', 1573087110),
(21073, '120.188.80.12', '120.188.80.12', '120.188.80.12', '', 1572261492),
(21074, '140.213.31.54', '140.213.31.54', '140.213.31.54', '', 1572262238),
(21075, '207.46.13.217', 'msnbot-207-46-13-217.search.msn.com', '207.46.13.217', '', 1572262507),
(21077, '40.77.189.110', 'msnbot-40-77-189-110.search.msn.com', '40.77.189.110', '', 1572522287),
(21078, '40.77.189.228', 'msnbot-40-77-189-228.search.msn.com', '40.77.189.228', '', 1572263602),
(21079, '40.77.188.158', 'msnbot-40-77-188-158.search.msn.com', '40.77.188.158', '', 1572263629),
(21080, '54.36.148.213', 'ip-54-36-148-213.a.ahrefs.com', '54.36.148.213', '', 1572666456),
(21081, '182.1.100.48', '182.1.100.48', '182.1.100.48', '', 1572265115),
(21082, '117.20.48.109', '117-20-48-109.soho.jogja.citra.net.id', '117.20.48.109', '', 1572750222),
(21083, '112.215.172.52', '112.215.172.52', '112.215.172.52', '', 1572267746),
(21084, '120.188.79.192', '120.188.79.192', '120.188.79.192', '', 1572266852),
(21085, '40.77.167.152', 'msnbot-40-77-167-152.search.msn.com', '40.77.167.152', '', 1572746091),
(21086, '120.188.67.66', '120.188.67.66', '120.188.67.66', '', 1572308901),
(21087, '140.213.28.252', '140.213.28.252', '140.213.28.252', '', 1572268929),
(21088, '207.46.13.166', 'msnbot-207-46-13-166.search.msn.com', '207.46.13.166', '', 1572269104),
(21090, '40.77.189.69', 'msnbot-40-77-189-69.search.msn.com', '40.77.189.69', '', 1572273262),
(21091, '66.220.149.17', '66.220.149.17', '66.220.149.17', '', 1572274278),
(21099, '114.125.111.242', '114.125.111.242', '114.125.111.242', '', 1572305998),
(21102, '125.163.208.24', '24.subnet125-163-208.speedy.telkom.net.id', '125.163.208.24', '', 1572309069),
(21103, '24.44.86.102', 'ool-182c5666.dyn.optonline.net', '24.44.86.102', '', 1572310493),
(21104, '114.4.222.105', '114-4-222-105.resources.indosat.com', '114.4.222.105', '', 1572310821),
(21106, '157.55.39.242', 'msnbot-157-55-39-242.search.msn.com', '157.55.39.242', '', 1572329134),
(21107, '112.215.172.160', '112.215.172.160', '112.215.172.160', '', 1572362362),
(21108, '40.77.167.122', 'msnbot-40-77-167-122.search.msn.com', '40.77.167.122', '', 1572316879),
(21111, '157.55.39.241', 'msnbot-157-55-39-241.search.msn.com', '157.55.39.241', '', 1573084417),
(21112, '105.107.90.109', '105.107.90.109', '105.107.90.109', '', 1572321624),
(21113, '61.9.102.52', '61.9.102.52', '61.9.102.52', '', 1572321628),
(21114, '158.69.30.198', 'ip198.ip-158-69-30.net', '158.69.30.198', '', 1572321649),
(21115, '36.80.219.49', '36.80.219.49', '36.80.219.49', '', 1572410927),
(21116, '54.36.148.68', 'ip-54-36-148-68.a.ahrefs.com', '54.36.148.68', '', 1572444975),
(21117, '114.5.147.83', '114-5-147-83.resources.indosat.com', '114.5.147.83', '', 1572329771),
(21118, '54.36.148.174', 'ip-54-36-148-174.a.ahrefs.com', '54.36.148.174', '', 1573088098),
(21119, '120.188.38.93', '120.188.38.93', '120.188.38.93', '', 1572331905),
(21120, '202.43.95.78', 'host-202-43-95-78.ugm.ac.id', '202.43.95.78', '', 1572330999),
(21123, '66.220.149.7', '66.220.149.7', '66.220.149.7', '', 1572356170),
(21124, '36.73.124.190', '36.73.124.190', '192.168.0.149', '1.1 192.168.0.254 (Mikrotik HttpProxy)', 1572341709),
(21125, '40.77.167.194', 'msnbot-40-77-167-194.search.msn.com', '40.77.167.194', '', 1572338026),
(21127, '114.5.214.218', '114-5-214-218.resources.indosat.com', '114.5.214.218', '', 1572340304),
(21131, '40.77.167.135', 'msnbot-40-77-167-135.search.msn.com', '40.77.167.135', '', 1572346290),
(21132, '52.33.8.151', 'ec2-52-33-8-151.us-west-2.compute.amazonaws.com', '52.33.8.151', '', 1572347268),
(21133, '54.36.148.77', 'ip-54-36-148-77.a.ahrefs.com', '54.36.148.77', '', 1573103586),
(21134, '114.5.213.157', '114-5-213-157.resources.indosat.com', '114.5.213.157', '', 1572348422),
(21136, '120.188.87.1', '120.188.87.1', '120.188.87.1', '', 1572352330),
(21139, '103.131.104.3', '103.131.104.3', '103.131.104.3', '', 1572354766),
(21140, '66.220.149.21', '66.220.149.21', '66.220.149.21', '', 1572445452),
(21141, '66.220.149.42', '66.220.149.42', '66.220.149.42', '', 1572445450),
(21143, '40.77.167.121', 'msnbot-40-77-167-121.search.msn.com', '40.77.167.121', '', 1572365114),
(21148, '207.46.13.154', 'msnbot-207-46-13-154.search.msn.com', '207.46.13.154', '', 1572383123),
(21150, '40.77.167.219', 'msnbot-40-77-167-219.search.msn.com', '40.77.167.219', '', 1572385989),
(21151, '40.77.190.213', 'msnbot-40-77-190-213.search.msn.com', '40.77.190.213', '', 1572386159),
(21152, '40.77.190.237', 'msnbot-40-77-190-237.search.msn.com', '40.77.190.237', '', 1572386477),
(21153, '40.77.167.75', 'msnbot-40-77-167-75.search.msn.com', '40.77.167.75', '', 1572387266),
(21154, '120.188.84.69', '120.188.84.69', '120.188.84.69', '', 1572387845),
(21155, '36.90.18.199', '36.90.18.199', '36.90.18.199', '', 1572395843),
(21156, '209.17.96.146', '209.17.96.146.rdns.cloudsystemnetworks.com', '209.17.96.146', '', 1572447857),
(21164, '40.77.189.180', 'msnbot-40-77-189-180.search.msn.com', '40.77.189.180', '', 1572409528),
(21165, '40.77.188.140', 'msnbot-40-77-188-140.search.msn.com', '40.77.188.140', '', 1572409655),
(21166, '40.77.188.62', 'msnbot-40-77-188-62.search.msn.com', '40.77.188.62', '', 1572409659),
(21167, '40.77.188.126', 'msnbot-40-77-188-126.search.msn.com', '40.77.188.126', '', 1572409668),
(21168, '112.215.172.121', '112.215.172.121', '112.215.172.121', '', 1572411501),
(21169, '114.5.146.83', '114-5-146-83.resources.indosat.com', '114.5.146.83', '', 1572413207),
(21171, '115.178.251.26', '115.178.251.26', '115.178.251.26', '', 1572413219),
(21172, '207.46.13.155', 'msnbot-207-46-13-155.search.msn.com', '207.46.13.155', '', 1572413733),
(21173, '66.220.149.25', '66.220.149.25', '66.220.149.25', '', 1572413968),
(21177, '37.9.113.67', '37-9-113-67.spider.yandex.com', '37.9.113.67', '', 1572421323),
(21178, '180.246.82.94', '180.246.82.94', '180.246.82.94', '', 1572423953),
(21179, '73.16.208.76', 'c-73-16-208-76.hsd1.ma.comcast.net', '73.16.208.76', '', 1572424775),
(21181, '36.84.115.251', '36.84.115.251', '36.84.115.251', '', 1572427608),
(21186, '5.45.207.40', '5-45-207-40.spider.yandex.com', '5.45.207.40', '', 1572432030),
(21187, '115.178.203.75', '115.178.203.75', '115.178.203.75', '', 1572433717),
(21188, '213.180.203.50', '213-180-203-50.spider.yandex.com', '213.180.203.50', '', 1572455939),
(21189, '114.4.223.253', '114-4-223-253.resources.indosat.com', '114.4.223.253', '', 1572436677),
(21190, '114.122.9.80', '114.122.9.80', '114.122.9.80', '', 1572438578),
(21199, '95.108.213.12', '95-108-213-12.spider.yandex.com', '95.108.213.12', '', 1572539556),
(21200, '104.168.136.59', 'hwsrv-380888.hostwindsdns.com', '104.168.136.59', '', 1572627401),
(21203, '54.36.148.229', 'ip-54-36-148-229.a.ahrefs.com', '54.36.148.229', '', 1572699469),
(21204, '207.46.13.239', 'msnbot-207-46-13-239.search.msn.com', '207.46.13.239', '', 1572668624),
(21208, '213.180.203.51', '213-180-203-51.spider.yandex.com', '213.180.203.51', '', 1572473510),
(21210, '40.77.188.207', 'msnbot-40-77-188-207.search.msn.com', '40.77.188.207', '', 1572476357),
(21211, '65.55.210.173', 'msnbot-65-55-210-173.search.msn.com', '65.55.210.173', '', 1572476366),
(21212, '40.77.189.156', 'msnbot-40-77-189-156.search.msn.com', '40.77.189.156', '', 1572476370),
(21213, '65.55.210.183', 'msnbot-65-55-210-183.search.msn.com', '65.55.210.183', '', 1572476472),
(21214, '40.77.190.25', 'msnbot-40-77-190-25.search.msn.com', '40.77.190.25', '', 1572476426),
(21215, '40.77.190.71', 'msnbot-40-77-190-71.search.msn.com', '40.77.190.71', '', 1572476647),
(21216, '40.77.188.18', 'msnbot-40-77-188-18.search.msn.com', '40.77.188.18', '', 1572522290),
(21217, '40.77.190.184', 'msnbot-40-77-190-184.search.msn.com', '40.77.190.184', '', 1572476699),
(21218, '37.46.129.198', 'yffugifu5.fvds.ru', '37.46.129.198', '', 1572477008),
(21219, '157.55.39.145', 'msnbot-157-55-39-145.search.msn.com', '157.55.39.145', '', 1572477635),
(21220, '141.8.142.87', '141-8-142-87.spider.yandex.com', '141.8.142.87', '', 1572478437),
(21221, '207.46.13.171', 'msnbot-207-46-13-171.search.msn.com', '207.46.13.171', '', 1572479608),
(21225, '125.165.49.193', '125.165.49.193', '125.165.49.193', '', 1572486094),
(21226, '40.77.189.173', 'msnbot-40-77-189-173.search.msn.com', '40.77.189.173', '', 1572486346),
(21227, '65.55.210.228', 'msnbot-65-55-210-228.search.msn.com', '65.55.210.228', '', 1572486347),
(21228, '40.77.191.25', 'msnbot-40-77-191-25.search.msn.com', '40.77.191.25', '', 1572486348),
(21229, '40.77.188.43', 'msnbot-40-77-188-43.search.msn.com', '40.77.188.43', '', 1572486403),
(21230, '40.77.190.51', 'msnbot-40-77-190-51.search.msn.com', '40.77.190.51', '', 1572521995),
(21231, '40.77.189.243', 'msnbot-40-77-189-243.search.msn.com', '40.77.189.243', '', 1572486643),
(21232, '40.77.189.93', 'msnbot-40-77-189-93.search.msn.com', '40.77.189.93', '', 1572486643),
(21233, '40.77.189.246', 'msnbot-40-77-189-246.search.msn.com', '40.77.189.246', '', 1572486651),
(21234, '40.77.191.78', 'msnbot-40-77-191-78.search.msn.com', '40.77.191.78', '', 1572486655),
(21235, '40.77.188.195', 'msnbot-40-77-188-195.search.msn.com', '40.77.188.195', '', 1572486659),
(21236, '40.77.188.106', 'msnbot-40-77-188-106.search.msn.com', '40.77.188.106', '', 1572486727),
(21237, '125.163.225.55', '55.subnet125-163-225.speedy.telkom.net.id', '125.163.225.55', '', 1572488868),
(21238, '36.70.78.28', '36.70.78.28', '36.70.78.28', '', 1572491407),
(21239, '182.1.90.51', '182.1.90.51', '182.1.90.51', '', 1572492811),
(21240, '114.79.46.74', '114.79.46.74', '114.79.46.74', '', 1572494969),
(21241, '180.249.203.220', '180.249.203.220', '180.249.203.220', '', 1572494997),
(21246, '40.77.188.27', 'msnbot-40-77-188-27.search.msn.com', '40.77.188.27', '', 1572497909),
(21247, '40.77.189.64', 'msnbot-40-77-189-64.search.msn.com', '40.77.189.64', '', 1572528198),
(21248, '40.77.188.168', 'msnbot-40-77-188-168.search.msn.com', '40.77.188.168', '', 1572497914),
(21249, '40.77.190.231', 'msnbot-40-77-190-231.search.msn.com', '40.77.190.231', '', 1572497924),
(21251, '52.88.126.64', 'ec2-52-88-126-64.us-west-2.compute.amazonaws.com', '52.88.126.64', '', 1572499221),
(21255, '36.73.216.183', '36.73.216.183', '36.73.216.183', '', 1572508073),
(21257, '40.77.188.215', 'msnbot-40-77-188-215.search.msn.com', '40.77.188.215', '', 1572508315),
(21258, '40.77.188.159', 'msnbot-40-77-188-159.search.msn.com', '40.77.188.159', '', 1572508302),
(21259, '40.77.190.112', 'msnbot-40-77-190-112.search.msn.com', '40.77.190.112', '', 1572508313),
(21260, '65.55.210.74', 'msnbot-65-55-210-74.search.msn.com', '65.55.210.74', '', 1572508399),
(21261, '40.77.188.182', 'msnbot-40-77-188-182.search.msn.com', '40.77.188.182', '', 1572508608),
(21262, '65.55.210.208', 'msnbot-65-55-210-208.search.msn.com', '65.55.210.208', '', 1572508655),
(21263, '40.77.190.27', 'msnbot-40-77-190-27.search.msn.com', '40.77.190.27', '', 1572508655),
(21264, '40.77.189.2', 'msnbot-40-77-189-2.search.msn.com', '40.77.189.2', '', 1572508667),
(21265, '65.55.210.18', 'msnbot-65-55-210-18.search.msn.com', '65.55.210.18', '', 1572508683),
(21266, '114.125.111.140', '114.125.111.140', '114.125.111.140', '', 1572509188),
(21267, '37.9.113.199', '37-9-113-199.spider.yandex.com', '37.9.113.199', '', 1572509464),
(21268, '103.110.91.155', '103.110.91.155', '103.110.91.155', '', 1572510326),
(21269, '103.131.104.27', '103.131.104.27', '103.131.104.27', '', 1572511008),
(21273, '120.188.81.226', '120.188.81.226', '120.188.81.226', '', 1572521074),
(21274, '65.55.210.97', 'msnbot-65-55-210-97.search.msn.com', '65.55.210.97', '', 1572521999),
(21275, '40.77.188.81', 'msnbot-40-77-188-81.search.msn.com', '40.77.188.81', '', 1572522001),
(21276, '120.188.76.114', '120.188.76.114', '120.188.76.114', '', 1572523709),
(21277, '40.77.188.169', 'msnbot-40-77-188-169.search.msn.com', '40.77.188.169', '', 1572522290),
(21278, '40.77.190.38', 'msnbot-40-77-190-38.search.msn.com', '40.77.190.38', '', 1572522314),
(21279, '40.77.191.43', 'msnbot-40-77-191-43.search.msn.com', '40.77.191.43', '', 1572539229),
(21280, '40.77.191.83', 'msnbot-40-77-191-83.search.msn.com', '40.77.191.83', '', 1572522299),
(21281, '40.77.189.183', 'msnbot-40-77-189-183.search.msn.com', '40.77.189.183', '', 1572522329),
(21282, '40.77.188.49', 'msnbot-40-77-188-49.search.msn.com', '40.77.188.49', '', 1572522312),
(21283, '40.77.190.146', 'msnbot-40-77-190-146.search.msn.com', '40.77.190.146', '', 1572522324),
(21284, '65.55.210.34', 'msnbot-65-55-210-34.search.msn.com', '65.55.210.34', '', 1572522351),
(21285, '40.77.188.149', 'msnbot-40-77-188-149.search.msn.com', '40.77.188.149', '', 1572522329),
(21286, '40.77.190.229', 'msnbot-40-77-190-229.search.msn.com', '40.77.190.229', '', 1572522335),
(21287, '40.77.190.170', 'msnbot-40-77-190-170.search.msn.com', '40.77.190.170', '', 1572522336),
(21288, '40.77.190.163', 'msnbot-40-77-190-163.search.msn.com', '40.77.190.163', '', 1572522376),
(21289, '125.162.244.110', '110.subnet125-162-244.speedy.telkom.net.id', '125.162.244.110', '', 1572525969),
(21290, '40.77.191.105', 'msnbot-40-77-191-105.search.msn.com', '40.77.191.105', '', 1572528166),
(21291, '40.77.191.42', 'msnbot-40-77-191-42.search.msn.com', '40.77.191.42', '', 1572528197),
(21293, '120.188.77.116', '120.188.77.116', '120.188.77.116', '', 1572531190),
(21296, '87.250.224.53', '87-250-224-53.spider.yandex.com', '87.250.224.53', '', 1572566136),
(21299, '40.77.189.213', 'msnbot-40-77-189-213.search.msn.com', '40.77.189.213', '', 1572539187),
(21300, '40.77.189.211', 'msnbot-40-77-189-211.search.msn.com', '40.77.189.211', '', 1572539193),
(21301, '40.77.188.232', 'msnbot-40-77-188-232.search.msn.com', '40.77.188.232', '', 1572539196),
(21302, '40.77.188.63', 'msnbot-40-77-188-63.search.msn.com', '40.77.188.63', '', 1572539199),
(21303, '40.77.190.12', 'msnbot-40-77-190-12.search.msn.com', '40.77.190.12', '', 1572539199),
(21304, '40.77.189.239', 'msnbot-40-77-189-239.search.msn.com', '40.77.189.239', '', 1572539203),
(21305, '40.77.191.15', 'msnbot-40-77-191-15.search.msn.com', '40.77.191.15', '', 1572539204),
(21306, '40.77.189.120', 'msnbot-40-77-189-120.search.msn.com', '40.77.189.120', '', 1572539209),
(21307, '178.154.171.68', '178-154-171-68.spider.yandex.com', '178.154.171.68', '', 1572571935),
(21309, '65.55.210.214', 'msnbot-65-55-210-214.search.msn.com', '65.55.210.214', '', 1572544460),
(21310, '65.55.210.80', 'msnbot-65-55-210-80.search.msn.com', '65.55.210.80', '', 1572544782),
(21311, '64.237.236.193', 'adsl-64-237-236-193.prtc.net', '64.237.236.193', '', 1572548595),
(21312, '120.188.92.222', '120.188.92.222', '120.188.92.222', '', 1572551677),
(21315, '114.4.217.242', '114-4-217-242.resources.indosat.com', '114.4.217.242', '', 1572561619),
(21316, '157.55.39.60', 'msnbot-157-55-39-60.search.msn.com', '157.55.39.60', '', 1572567942),
(21318, '143.137.194.13', '13.194.137.143.dyn.rvrnetwork.com', '143.137.194.13', '', 1572569509),
(21319, '37.9.113.204', '37-9-113-204.spider.yandex.com', '37.9.113.204', '', 1572571914),
(21320, '185.222.59.107', 'hosted-by.rootlayer.net', '185.222.59.107', '', 1572574085),
(21321, '120.188.37.50', '120.188.37.50', '120.188.37.50', '', 1572575272),
(21322, '40.77.167.0', 'msnbot-40-77-167-0.search.msn.com', '40.77.167.0', '', 1572577655),
(21323, '66.220.149.15', '66.220.149.15', '66.220.149.15', '', 1572577941),
(21324, '36.73.68.172', '36.73.68.172', '36.73.68.172', '', 1572608521),
(21325, '112.215.172.105', '112.215.172.105', '112.215.172.105', '', 1572578376),
(21326, '40.77.189.91', 'msnbot-40-77-189-91.search.msn.com', '40.77.189.91', '', 1572583336),
(21328, '120.188.39.163', '120.188.39.163', '120.188.39.163', '', 1572585577),
(21329, '115.178.238.128', '115.178.238.128', '115.178.238.128', '', 1572588572),
(21331, '66.249.64.94', 'crawl-66-249-64-94.googlebot.com', '66.249.64.94', '', 1572586580),
(21332, '36.73.216.232', '36.73.216.232', '36.73.216.232', '', 1572592672),
(21333, '202.80.216.130', '202.80.216.130', '202.80.216.130', '', 1572589187),
(21334, '182.1.98.19', '182.1.98.19', '182.1.98.19', '', 1572590795),
(21340, '36.72.215.59', '36.72.215.59', '36.72.215.59', '', 1572614233),
(21343, '69.171.251.4', '69.171.251.4', '69.171.251.4', '', 1572621537),
(21344, '69.171.251.20', '69.171.251.20', '69.171.251.20', '', 1572621538),
(21346, '157.55.39.127', 'msnbot-157-55-39-127.search.msn.com', '157.55.39.127', '', 1572883538),
(21347, '207.46.13.138', 'msnbot-207-46-13-138.search.msn.com', '207.46.13.138', '', 1572627725),
(21348, '157.55.39.69', 'msnbot-157-55-39-69.search.msn.com', '157.55.39.69', '', 1572767236),
(21349, '120.27.103.132', '120.27.103.132', '120.27.103.132', '', 1572628955),
(21350, '24.50.216.189', '24.50.216.189', '24.50.216.189', '', 1572633345),
(21352, '54.36.148.171', 'ip-54-36-148-171.a.ahrefs.com', '54.36.148.171', '', 1573096847),
(21353, '54.36.148.35', 'ip-54-36-148-35.a.ahrefs.com', '54.36.148.35', '', 1572738013),
(21354, '54.36.148.101', 'ip-54-36-148-101.a.ahrefs.com', '54.36.148.101', '', 1572924386),
(21355, '157.55.39.150', 'msnbot-157-55-39-150.search.msn.com', '157.55.39.150', '', 1572654255),
(21356, '46.4.251.243', 'vfx42gm.jayahost.net', '46.4.251.243', '', 1572646353),
(21357, '20.37.47.10', '20.37.47.10', '20.37.47.10', '', 1572648617),
(21358, '209.17.97.90', '209.17.97.90.rdns.cloudsystemnetworks.com', '209.17.97.90', '', 1572648856),
(21362, '54.36.148.19', 'ip-54-36-148-19.a.ahrefs.com', '54.36.148.19', '', 1572730701),
(21363, '112.215.174.58', '112.215.174.58', '112.215.174.58', '', 1572658829),
(21365, '54.36.148.192', 'ip-54-36-148-192.a.ahrefs.com', '54.36.148.192', '', 1572666964),
(21366, '103.75.48.178', '178.48.75.103.konnectnepal.com.np', '103.75.48.178', '', 1572667571),
(21367, '66.220.149.26', '66.220.149.26', '66.220.149.26', '', 1572667831),
(21368, '54.36.148.0', 'ip-54-36-148-0.a.ahrefs.com', '54.36.148.0', '', 1572697476),
(21369, '36.70.97.224', '36.70.97.224', '36.70.97.224', '', 1572670484),
(21371, '54.36.148.14', 'ip-54-36-148-14.a.ahrefs.com', '54.36.148.14', '', 1572670760),
(21372, '54.36.148.120', 'ip-54-36-148-120.a.ahrefs.com', '54.36.148.120', '', 1572710810),
(21373, '52.38.97.25', 'ec2-52-38-97-25.us-west-2.compute.amazonaws.com', '52.38.97.25', '', 1572672586),
(21374, '54.36.149.49', 'ip-54-36-149-49.a.ahrefs.com', '54.36.149.49', '', 1572673180),
(21376, '54.36.148.28', 'ip-54-36-148-28.a.ahrefs.com', '54.36.148.28', '', 1572679455),
(21380, '66.220.149.48', '66.220.149.48', '66.220.149.48', '', 1572690095),
(21382, '157.55.39.91', 'msnbot-157-55-39-91.search.msn.com', '157.55.39.91', '', 1572727001),
(21388, '115.178.235.233', '115.178.235.233', '115.178.235.233', '', 1572716042),
(21389, '218.30.103.3', 'sogouspider-218-30-103-3.crawl.sogou.com', '218.30.103.3', '', 1572721938),
(21390, '139.180.221.114', '139.180.221.114.vultr.com', '139.180.221.114', '', 1572724045),
(21391, '40.77.167.142', 'msnbot-40-77-167-142.search.msn.com', '40.77.167.142', '', 1572732557),
(21392, '207.46.13.124', 'msnbot-207-46-13-124.search.msn.com', '207.46.13.124', '', 1572735981),
(21394, '117.54.106.114', 'rev-114-106-54-117.indo.net.id', '117.54.106.114', '', 1572741220),
(21406, '40.77.167.45', 'msnbot-40-77-167-45.search.msn.com', '40.77.167.45', '', 1572784577),
(21408, '54.70.40.11', 'ec2-54-70-40-11.us-west-2.compute.amazonaws.com', '54.70.40.11', '', 1572787694),
(21410, '173.252.87.46', '173.252.87.46', '173.252.87.46', '', 1572790889),
(21413, '140.213.57.204', '140.213.57.204', '140.213.57.204', '', 1572801927),
(21414, '207.46.13.224', 'msnbot-207-46-13-224.search.msn.com', '207.46.13.224', '', 1572805387),
(21415, '139.193.49.68', 'fm-dyn-139-193-49-68.fast.net.id', '139.193.49.68', '', 1572806105),
(21417, '157.245.126.140', 'jobqueue-listener.jobqueue.netcraft.com-ubf36291cfe7b11e9befda946838d6ab1u-digitalocean', '157.245.126.140', '', 1572818206),
(21418, '66.249.65.114', 'crawl-66-249-65-114.googlebot.com', '66.249.65.114', '', 1572892129),
(21424, '182.1.122.80', '182.1.122.80', '182.1.122.80', '', 1572840339),
(21425, '207.46.13.232', 'msnbot-207-46-13-232.search.msn.com', '207.46.13.232', '', 1572840282),
(21429, '36.81.71.95', '36.81.71.95', '36.81.71.95', '', 1572855029),
(21437, '207.46.13.215', 'msnbot-207-46-13-215.search.msn.com', '207.46.13.215', '', 1572900714),
(21438, '40.77.167.20', 'msnbot-40-77-167-20.search.msn.com', '40.77.167.20', '', 1572892408),
(21440, '64.233.173.97', 'google-proxy-64-233-173-97.google.com', '64.233.173.97', '', 1572897582),
(21441, '114.142.168.6', 'subs16-114-142-168-6.three.co.id', '114.142.168.6', '', 1572897847),
(21442, '66.220.149.55', '66.220.149.55', '66.220.149.55', '', 1572897739),
(21443, '66.220.149.32', '66.220.149.32', '66.220.149.32', '', 1572897741),
(21444, '197.15.5.243', '197.15.5.243', '197.15.5.243', '', 1572899796),
(21445, '66.249.65.142', 'crawl-66-249-65-142.googlebot.com', '66.249.65.142', '', 1572901939),
(21446, '54.189.159.190', 'ec2-54-189-159-190.us-west-2.compute.amazonaws.com', '54.189.159.190', '', 1572902863),
(21447, '34.234.54.252', 'ec2-34-234-54-252.compute-1.amazonaws.com', '34.234.54.252', '', 1572903469),
(21452, '64.233.173.125', 'google-proxy-64-233-173-125.google.com', '64.233.173.125', '', 1572921536),
(21453, '103.65.212.78', '103.65.212.78', '103.65.212.78', '', 1572921710),
(21454, '36.81.49.58', '36.81.49.58', '36.81.49.58', '', 1572921649),
(21455, '122.144.6.102', '102.6.144.122.maxindo.net', '122.144.6.102', '', 1572923793),
(21459, '157.55.39.133', 'msnbot-157-55-39-133.search.msn.com', '157.55.39.133', '', 1572957347),
(21460, '40.77.167.120', 'msnbot-40-77-167-120.search.msn.com', '40.77.167.120', '', 1572932587),
(21461, '173.252.95.15', '173.252.95.15', '173.252.95.15', '', 1572935499),
(21462, '180.246.133.25', '180.246.133.25', '180.246.133.25', '', 1572938155),
(21463, '207.46.13.16', 'msnbot-207-46-13-16.search.msn.com', '207.46.13.16', '', 1572959378),
(21466, '207.46.13.183', 'msnbot-207-46-13-183.search.msn.com', '207.46.13.183', '', 1572959530),
(21467, '54.36.148.147', 'ip-54-36-148-147.a.ahrefs.com', '54.36.148.147', '', 1572953710),
(21470, '36.73.58.119', '36.73.58.119', '36.73.58.119', '', 1572962488),
(21471, '209.17.96.210', '209.17.96.210.rdns.cloudsystemnetworks.com', '209.17.96.210', '', 1572962635),
(21472, '175.42.87.92', '175.42.87.92', '175.42.87.92', '', 1572962683),
(21475, '40.77.167.218', 'msnbot-40-77-167-218.search.msn.com', '40.77.167.218', '', 1572979487),
(21478, '36.81.57.166', '36.81.57.166', '36.81.57.166', '', 1572993406),
(21479, '207.46.13.90', 'msnbot-207-46-13-90.search.msn.com', '207.46.13.90', '', 1572999708),
(21481, '180.251.246.212', '180.251.246.212', '180.251.246.212', '', 1573000723),
(21482, '5.188.84.120', '5.188.84.120', '5.188.84.120', '', 1573003549),
(21483, '157.55.39.192', 'msnbot-157-55-39-192.search.msn.com', '157.55.39.192', '', 1573008744),
(21484, '103.255.15.10', '103.255.15.10', '103.255.15.10', '', 1573011638),
(21485, '36.72.116.97', '36.72.116.97', '36.72.116.97', '', 1573013839),
(21486, '114.5.145.229', '114-5-145-229.resources.indosat.com', '114.5.145.229', '', 1573017221),
(21487, '207.46.13.95', 'msnbot-207-46-13-95.search.msn.com', '207.46.13.95', '', 1573017781),
(21488, '207.46.13.209', 'msnbot-207-46-13-209.search.msn.com', '207.46.13.209', '', 1573031167),
(21489, '114.4.218.212', '114-4-218-212.resources.indosat.com', '114.4.218.212', '', 1573026244),
(21490, '66.102.8.193', 'google-proxy-66-102-8-193.google.com', '65.57.245.11', '', 1573026294),
(21491, '207.46.13.210', 'msnbot-207-46-13-210.search.msn.com', '207.46.13.210', '', 1573026707),
(21492, '103.44.37.86', '103.44.37.86', '103.44.37.86', '', 1573048688),
(21493, '114.79.46.73', '114.79.46.73', '114.79.46.73', '', 1573033522),
(21494, '36.81.20.71', '36.81.20.71', '36.81.20.71', '', 1573040824),
(21495, '40.77.167.204', 'msnbot-40-77-167-204.search.msn.com', '40.77.167.204', '', 1573053617),
(21496, '66.102.6.69', 'google-proxy-66-102-6-69.google.com', '103.105.27.143', '', 1573049921),
(21497, '115.178.254.188', '115.178.254.188', '115.178.254.188', '', 1573045787),
(21498, '207.46.13.168', 'msnbot-207-46-13-168.search.msn.com', '207.46.13.168', '', 1573048277),
(21499, '157.55.39.93', 'msnbot-157-55-39-93.search.msn.com', '157.55.39.93', '', 1573070295),
(21500, '209.17.96.162', '209.17.96.162.rdns.cloudsystemnetworks.com', '209.17.96.162', '', 1573054135),
(21501, '54.36.148.211', 'ip-54-36-148-211.a.ahrefs.com', '54.36.148.211', '', 1573054569),
(21502, '207.46.13.89', 'msnbot-207-46-13-89.search.msn.com', '207.46.13.89', '', 1573070743),
(21503, '40.77.167.29', 'msnbot-40-77-167-29.search.msn.com', '40.77.167.29', '', 1573060297),
(21504, '114.142.171.41', 'subs19-114-142-171-41.three.co.id', '114.142.171.41', '', 1573059396),
(21505, '40.77.167.27', 'msnbot-40-77-167-27.search.msn.com', '40.77.167.27', '', 1573069497),
(21506, '34.220.105.117', 'ec2-34-220-105-117.us-west-2.compute.amazonaws.com', '34.220.105.117', '', 1573079198),
(21507, '64.237.236.87', 'adsl-64-237-236-87.prtc.net', '64.237.236.87', '', 1573080539),
(21508, '84.187.159.81', 'p54BB9F51.dip0.t-ipconnect.de', '84.187.159.81', '', 1573081243),
(21509, '157.55.39.56', 'msnbot-157-55-39-56.search.msn.com', '157.55.39.56', '', 1573085535),
(21510, '40.77.167.65', 'msnbot-40-77-167-65.search.msn.com', '40.77.167.65', '', 1573102401),
(21511, '182.1.77.226', '182.1.77.226', '182.1.77.226', '', 1573087146),
(21512, '36.90.18.208', '36.90.18.208', '36.90.18.208', '', 1573090787),
(21513, '125.163.148.168', '168.subnet125-163-148.speedy.telkom.net.id', '125.163.148.168', '', 1573089582),
(21514, '36.72.214.57', '36.72.214.57', '36.72.214.57', '', 1573090221),
(21516, '114.79.46.67', '114.79.46.67', '114.79.46.67', '', 1573091366),
(21517, '103.131.104.51', '103.131.104.51', '103.131.104.51', '', 1573092925),
(21518, '40.77.167.157', 'msnbot-40-77-167-157.search.msn.com', '40.77.167.157', '', 1573094620),
(21520, '64.233.172.95', 'google-proxy-64-233-172-95.google.com', '140.213.59.247', '', 1573099683),
(21521, '140.213.59.247', '140.213.59.247', '140.213.59.247', '', 1573099693),
(21522, '140.213.57.74', '140.213.57.74', '140.213.57.74', '', 1573099762),
(21523, '54.36.148.21', 'ip-54-36-148-21.a.ahrefs.com', '54.36.148.21', '', 1573100765),
(21525, '54.36.149.106', 'ip-54-36-149-106.a.ahrefs.com', '54.36.149.106', '', 1573103993);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modul_id` (`modul_id`);

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `aduanx`
--
ALTER TABLE `aduanx`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topik` (`topik`),
  ADD KEY `tags` (`tags`);

--
-- Indeks untuk tabel `bukutamu`
--
ALTER TABLE `bukutamu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bukutamu_config`
--
ALTER TABLE `bukutamu_config`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `halaman`
--
ALTER TABLE `halaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `intrusions`
--
ALTER TABLE `intrusions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jmlonline`
--
ALTER TABLE `jmlonline`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_users`
--
ALTER TABLE `menu_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mod_cat_download`
--
ALTER TABLE `mod_cat_download`
  ADD PRIMARY KEY (`kid`);

--
-- Indeks untuk tabel `mod_cat_link`
--
ALTER TABLE `mod_cat_link`
  ADD PRIMARY KEY (`kid`);

--
-- Indeks untuk tabel `mod_download`
--
ALTER TABLE `mod_download`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mod_download_ratings`
--
ALTER TABLE `mod_download_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mod_gallery`
--
ALTER TABLE `mod_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mod_gallery_kat`
--
ALTER TABLE `mod_gallery_kat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mod_link`
--
ALTER TABLE `mod_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indeks untuk tabel `mod_news_ratings`
--
ALTER TABLE `mod_news_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `polling`
--
ALTER TABLE `polling`
  ADD PRIMARY KEY (`pid`);

--
-- Indeks untuk tabel `polling_ip`
--
ALTER TABLE `polling_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posted_ip`
--
ALTER TABLE `posted_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shoutbox`
--
ALTER TABLE `shoutbox`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_browse`
--
ALTER TABLE `stat_browse`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu2`
--
ALTER TABLE `submenu2`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_kalender`
--
ALTER TABLE `tbl_kalender`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indeks untuk tabel `topik`
--
ALTER TABLE `topik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `useraura`
--
ALTER TABLE `useraura`
  ADD PRIMARY KEY (`UserId`);

--
-- Indeks untuk tabel `usercounter`
--
ALTER TABLE `usercounter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `useronline`
--
ALTER TABLE `useronline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipanda` (`ipanda`),
  ADD KEY `timevisit` (`timevisit`),
  ADD KEY `ipproxy` (`ipproxy`);

--
-- Indeks untuk tabel `useronlineday`
--
ALTER TABLE `useronlineday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipanda` (`ipanda`),
  ADD KEY `timevisit` (`timevisit`),
  ADD KEY `ipproxy` (`ipproxy`);

--
-- Indeks untuk tabel `useronlinemonth`
--
ALTER TABLE `useronlinemonth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipanda` (`ipanda`),
  ADD KEY `timevisit` (`timevisit`),
  ADD KEY `ipproxy` (`ipproxy`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `actions`
--
ALTER TABLE `actions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `aduanx`
--
ALTER TABLE `aduanx`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `bukutamu`
--
ALTER TABLE `bukutamu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bukutamu_config`
--
ALTER TABLE `bukutamu_config`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `form`
--
ALTER TABLE `form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `halaman`
--
ALTER TABLE `halaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `intrusions`
--
ALTER TABLE `intrusions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jmlonline`
--
ALTER TABLE `jmlonline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `menu_users`
--
ALTER TABLE `menu_users`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `modul`
--
ALTER TABLE `modul`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `mod_cat_download`
--
ALTER TABLE `mod_cat_download`
  MODIFY `kid` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mod_cat_link`
--
ALTER TABLE `mod_cat_link`
  MODIFY `kid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mod_download`
--
ALTER TABLE `mod_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mod_gallery`
--
ALTER TABLE `mod_gallery`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mod_gallery_kat`
--
ALTER TABLE `mod_gallery_kat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mod_link`
--
ALTER TABLE `mod_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `polling`
--
ALTER TABLE `polling`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `polling_ip`
--
ALTER TABLE `polling_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `posted_ip`
--
ALTER TABLE `posted_ip`
  MODIFY `id` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT untuk tabel `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `shoutbox`
--
ALTER TABLE `shoutbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `stat_browse`
--
ALTER TABLE `stat_browse`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT untuk tabel `submenu2`
--
ALTER TABLE `submenu2`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `tbl_kalender`
--
ALTER TABLE `tbl_kalender`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `themes`
--
ALTER TABLE `themes`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `topik`
--
ALTER TABLE `topik`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `useraura`
--
ALTER TABLE `useraura`
  MODIFY `UserId` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `usercounter`
--
ALTER TABLE `usercounter`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `useronline`
--
ALTER TABLE `useronline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `useronlineday`
--
ALTER TABLE `useronlineday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `useronlinemonth`
--
ALTER TABLE `useronlinemonth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21526;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
