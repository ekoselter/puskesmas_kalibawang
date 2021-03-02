<?php
function amankan_teks($teks) {
	$cari = ["<script>", "</script>"];
	$ganti = ["", ""];

	return str_replace($cari, $ganti, $teks);
}

function g_captcha($kode) {
	$ci = &get_instance();

	$data = array(
		"secret" => $ci->config->item('g_captcha_secretkey'),
		"response" => $kode,
	);

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $ci->config->item('g_captcha_url'));
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$result = json_decode(curl_exec($ch), true);

	curl_close($ch);

	return $result['success'];
}

function yurl($url) {
	if (in_array($url, ["","contact.html","guestbook.html","statistik.html"])) {
		return "#";
	} else {
		if (preg_match('/index\.php\?pilih=hal&/', $url)) {
			$pc_url = explode("=", $url);
			$id = end($pc_url);

			// return "{{base_url}}detil/".$id."/artikel-".$id;
			return "#";
		} else {
			return $url;
		}
	}
}

function array_move(&$a, $oldpos, $newpos) {
	if ($oldpos == $newpos) {return;}
	array_splice($a, max($newpos, 0), 0, array_splice($a, max($oldpos, 0), 1));
}

/*
function jsonDecode($json, $assoc = false)
{
$ret = json_decode($json, $assoc);
if ($error = json_last_error())
{
$errorReference = [
JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
JSON_ERROR_SYNTAX => 'Syntax error.',
JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
];
$errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
throw new \Exception("JSON decode error ($error): $errStr");
}
return $ret;
}
 */
/* fungsi non database */
function tjs($tgl) {
	$pc_satu = explode(" ", $tgl);
	if (count($pc_satu) < 2) {
		$tgl1 = $pc_satu[0];
		$jam1 = "";
	} else {
		$jam1 = $pc_satu[1];
		$tgl1 = $pc_satu[0];
	}
	$pc_dua = explode("-", $tgl1);
	$tgl = $pc_dua[2];
	$bln = $pc_dua[1];
	$thn = $pc_dua[0];
	if ($bln == "01") {$bln_txt = "Januari";} else if ($bln == "02") {$bln_txt = "Februari";} else if ($bln == "03") {$bln_txt = "Maret";} else if ($bln == "04") {$bln_txt = "April";} else if ($bln == "05") {$bln_txt = "Mei";} else if ($bln == "06") {$bln_txt = "Juni";} else if ($bln == "07") {$bln_txt = "Juli";} else if ($bln == "08") {$bln_txt = "Agustus";} else if ($bln == "09") {$bln_txt = "September";} else if ($bln == "10") {$bln_txt = "Oktober";} else if ($bln == "11") {$bln_txt = "November";} else if ($bln == "12") {$bln_txt = "Desember";} else { $bln_txt = "";}
	return $tgl . " " . $bln_txt . " " . $thn . "  " . $jam1;
}

function get_bulan($bln) {
	if ($bln == "01") {$bln_txt = "Januari";} else if ($bln == "02") {$bln_txt = "Februari";} else if ($bln == "03") {$bln_txt = "Maret";} else if ($bln == "04") {$bln_txt = "April";} else if ($bln == "05") {$bln_txt = "Mei";} else if ($bln == "06") {$bln_txt = "Juni";} else if ($bln == "07") {$bln_txt = "Juli";} else if ($bln == "08") {$bln_txt = "Agustus";} else if ($bln == "09") {$bln_txt = "September";} else if ($bln == "10") {$bln_txt = "Oktober";} else if ($bln == "11") {$bln_txt = "November";} else if ($bln == "12") {$bln_txt = "Desember";} else { $bln_txt = "";}
	return $bln_txt;
}

/* penyederhanaan fungsi */
function _page($total_row, $per_page, $uri_segment, $url) {
	$CI = &get_instance();
	$CI->load->library('pagination');
	$config['base_url'] = $url;
	$config['total_rows'] = $total_row;
	$config['uri_segment'] = $uri_segment;
	$config['per_page'] = $per_page;
	$config['num_tag_open'] = '<li class="page-item">';
	$config['num_tag_close'] = '</li>';
	$config['prev_link'] = '&lt;';
	$config['prev_tag_open'] = '<li class="page-item">';
	$config['prev_tag_close'] = '</li>';
	$config['next_link'] = '&gt;';
	$config['next_tag_open'] = '<li class="page-item">';
	$config['next_tag_close'] = '</li>';
	$config['cur_tag_open'] = '<li class="page-item active disabled"><a href="#" class="page-link">';
	$config['cur_tag_close'] = '</a></li>';
	$config['first_tag_open'] = '<li class="page-item">';
	$config['first_tag_close'] = '</li>';
	$config['last_tag_open'] = '<li class="page-item">';
	$config['last_tag_close'] = '</li>';
	$config['reuse_query_string'] = true;
	$config['attributes'] = array('class' => 'page-link');

	$CI->pagination->initialize($config);
	return $CI->pagination->create_links();
}

function base_image($file, $pengganti = "tidakada", $thumb = true) {
	$CI = &get_instance();

	if ($thumb) {
		if (is_file($CI->config->item('base_url_news_images') . "/thumbnail/" . $file)) {
			return $CI->config->item('base_url_news_images') . "/thumbnail/" . $file;
		} else if (is_file($CI->config->item('base_url_news_images') . "/" . $file)) {
			return $CI->config->item('base_url_news_images') . "/" . $file;
		} else {
			if ($pengganti == "tidakada") {
				return $CI->config->item('base_url_news_images') . "/no_image_kp.jpg";
			} else if ($pengganti == "kosong") {
				return "";
			} else {
				return $pengganti;
			}
		}
	} else {
		if (is_file($CI->config->item('base_url_news_images') . "/" . $file)) {
			return $CI->config->item('base_url_news_images') . "/" . $file;
		} else {
			if ($pengganti == "tidakada") {
				return $CI->config->item('base_url_news_images') . "/no_image_kp.jpg";
			} else if ($pengganti == "kosong") {
				return "";
			} else {
				return $pengganti;
			}
		}
	}
}

function bersihkan_teks($teks) {
	$balik = strip_tags($teks, "<p></p>");
	$balik = preg_replace('/(<[^>]+) style=".*?"/i', '$1', $balik);
	$balik = str_replace(array("<p>&nbsp;</p>", "<p>\n</p>"), array("", ""), $balik);
	return $balik;
}

function valid_request($harus, $redirect) {
	$CI = &get_instance();
	if (empty($harus)) {
		redirect($redirect);
	} else {
		if ($CI->input->server('REQUEST_METHOD') != $harus) {
			redirect($redirect);
		}
	}
}

function cek_login() {
	$CI = &get_instance();
	$ref = uri_string();

	if ($CI->session->userdata('valid') == false && $CI->session->userdata('userid') == "" && $CI->session->userdata('username') == "") {
		if (empty($ref)) {
			redirect("adm/login");
		} else {
			redirect("adm/login?goto=" . urlencode($ref));
		}
	}
}

function resizeImage($source, $target, $filename) {
	$CI = &get_instance();

	$source_path = $source . "/" . $filename;
	$target_path = $target;

	// echo $source_path."<br>";
	// echo $target_path;
	// exit;

	$config_manip = array(
		'image_library' => 'gd2',
		'source_image' => $source_path,
		'new_image' => $target_path,
		'maintain_ratio' => TRUE,
		'create_thumb' => TRUE,
		'thumb_marker' => '',
		'width' => 400,
	);

	$CI->load->library('image_lib', $config_manip);

	if (!$CI->image_lib->resize()) {
		return false;
	} else {
		$CI->image_lib->clear();
		return true;
	}
}

function counter() {
	$CI = &get_instance();
	// HITSS
	// ========================
	$IPnum = "0.0.0.0"; //Set as a String
	$userStatus = 0;
	$maxadmindata = !isset($maxadmindata) ? 5 : $maxadmindata;
	// Get the current IP number ------------------------------
	$IPnum = getenv("REMOTE_ADDR");
	//Get stored IP's from a file --------------------------------
	//Compare it to the ones stored in ip_data.dat ---
	$perintah = "SELECT * FROM usercounter WHERE id=1";
	$hasil = $CI->db->query($perintah);
	$total = $hasil->num_rows();
	if ($total <= 0) {
		$upDate = $CI->db->query("INSERT INTO `usercounter` (`id`,`ip`,`counter`,`hits`) VALUES ('1','$IPnum','1','1')");
		$hasil = $CI->db->query($perintah);
	}
	$data = $hasil->result_array();
	foreach ($data as $d1) {
		$IPdata = $d1['ip'];
		$theCount = $d1['counter'];
		$hits = $d1['hits'];
	}
	$IParray = explode("-", $IPdata); //Make array of IPs
	// Start comparing IPs
	for ($ipCount = 0; $ipCount < count($IParray); $ipCount++) {
		if ($IParray[$ipCount] == $IPnum) {
			$userStatus = 1;
		} //Been before
	} // End for loop
	// OK it's a new visitor
	// Store the IP number in case they ever come back.
	// The counter, give it one.
	$IPdata = "";
	if ($userStatus == 0) {
		$IPdata = "$IPnum-";
		for ($i = 0; $i < $maxadmindata; $i++):
			$IPdata .= "$IParray[$i]-";
		endfor;
		$theCount++;
		$perintah = "UPDATE usercounter SET ip='$IPdata',counter='$theCount' WHERE id=1";
		$hasil = $CI->db->query($perintah);
	}
	$hits++;
	$perintah = "UPDATE usercounter SET hits='$hits' WHERE id=1";
	$hasil = $CI->db->query($perintah);
	$get_counter_hits = $CI->db->query("SELECT * FROM usercounter WHERE id = 1")->row_array();
	$__counter = $get_counter_hits['counter'];
	$__hit = $get_counter_hits['hits'];
	// NOW
	// ===============================
	if (preg_match('/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/', getenv("HTTP_X_FORWARDED_FOR")) == '') {
		$uipanda = getenv('REMOTE_ADDR');
	} else {
		$uipanda = getenv('HTTP_X_FORWARDED_FOR');
	}
	$uproxyserver = getenv("HTTP_VIA");
	$uipproxy = getenv("REMOTE_ADDR");
	$uhost = gethostbyaddr($uipproxy);
	$utime = time();
	$now = $utime - 600; // (in seconds)
	$CI->db->query("DELETE FROM useronline WHERE  timevisit < $now");
	$qw = $CI->db->query("SELECT COUNT(id) AS total FROM useronline WHERE ipproxy = '$uipproxy'");
	$countdataquery = $qw->row_array();
	$uexists = $countdataquery['total'];
	if ($uexists > 0) {
		$CI->db->query("UPDATE useronline SET timevisit='$utime' WHERE ipproxy='$uipproxy'");
	} else {
		$CI->db->query("INSERT INTO useronline (ipproxy,host,ipanda,proxyserver,timevisit) VALUES ('$uipproxy','$uhost','$uipanda','$uproxyserver','$utime')");
	}
	// to do insert ke jml online
	$get_online = $CI->db->query("SELECT id FROM useronline")->num_rows();
	$__online = $get_online;
	// DAY
	// ================================
	if (preg_match('/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/', getenv("HTTP_X_FORWARDED_FOR")) == '') {
		$uipanda = getenv('REMOTE_ADDR');
	} else {
		$uipanda = getenv('HTTP_X_FORWARDED_FOR');
	}
	$uproxyserver = getenv("HTTP_VIA");
	$uipproxy = getenv("REMOTE_ADDR");
	$uhost = gethostbyaddr($uipproxy);
	$utime = time();
	$day = $utime - 86400; // (in seconds)
	$CI->db->query("DELETE FROM useronlineday WHERE timevisit < $day");
	$qw = $CI->db->query("SELECT count(id) as total FROM useronlineday WHERE ipproxy = '$uipproxy'");
	$countdataquery = $qw->row_array();
	$uexists = $countdataquery['total'];
	if ($uexists > 0) {
		$CI->db->query("update useronlineday set timevisit='$utime' where ipproxy='$uipproxy'");
	} else {
		$CI->db->query("insert into useronlineday (ipproxy,host,ipanda,proxyserver,timevisit) values ('$uipproxy','$uhost','$uipanda','$uproxyserver','$utime')");
	}
	// to do insert ke jml online
	$get_day = $CI->db->query("SELECT id FROM useronlineday")->num_rows();
	$__day = $get_day;
	// MONTH
	if (preg_match('/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/', getenv("HTTP_X_FORWARDED_FOR")) == '') {
		$uipanda = getenv('REMOTE_ADDR');
	} else {
		$uipanda = getenv('HTTP_X_FORWARDED_FOR');
	}
	$uproxyserver = getenv("HTTP_VIA");
	$uipproxy = getenv("REMOTE_ADDR");
	$uhost = gethostbyaddr($uipproxy);
	$utime = time();
	$month = $utime - 2592000; // (in seconds)
	$CI->db->query("DELETE from useronlinemonth WHERE timevisit < $month");
	$qw = $CI->db->query("SELECT count(id) as total FROM useronlinemonth WHERE ipproxy = '$uipproxy'");
	$countdataquery = $qw->row_array();
	$uexists = $countdataquery['total'];
	if ($uexists > 0) {
		$CI->db->query("UPDATE useronlinemonth SET timevisit='$utime' WHERE ipproxy='$uipproxy'");
	} else {
		$CI->db->query("INSERT INTO useronlinemonth (ipproxy,host,ipanda,proxyserver,timevisit) VALUES ('$uipproxy','$uhost','$uipanda','$uproxyserver','$utime')");
	}
	// todo
	$get_month = $CI->db->query("SELECT id FROM useronlinemonth")->num_rows();
	$__month = $get_month;
	$cek_tabel_jmlonline = $CI->db->query("SELECT id FROM jmlonline")->num_rows();
	if ($cek_tabel_jmlonline > 0) {
		$CI->db->query("UPDATE jmlonline SET counter = '" . $__counter . "', online = '" . $__online . "', day = '" . $__day . "', month = '" . $__month . "', hit = '" . $__hit . "' WHERE id = 1");
	} else {
		$CI->db->query("INSERT INTO jmlonline (counter, online, day, month, hit) VALUES ('" . $__counter . "', '" . $__online . "', '" . $__day . "', '" . $__month . "', '" . $__hit . "')");
	}
}

function getStringBetween($teks, $sebelum, $sesudah) {
	$teks = " " . $teks;
	$ini = strpos($teks, $sebelum);
	if ($ini == 0) {
		return "";
	}

	$ini += strlen($sebelum);
	$panjang = strpos($teks, $sesudah, $ini) - $ini;

	$pjg_sebelum = strlen($sebelum);

	return substr($teks, ($ini - $pjg_sebelum), $panjang);
}

function getGempaBumi($teks, $sebelum, $sesudah) {
	$teks = " " . $teks;
	$ini = strpos($teks, $sebelum);
	if ($ini == 0) {
		return "";
	}

	$ini += strlen($sebelum);
	$panjang = strpos($teks, $sesudah, $ini) - $ini;

	$pjg_sebelum = strlen($sebelum);

	return substr($teks, ($ini - $pjg_sebelum), ($panjang + 75));
}

function j($data) {
	header('Content-Type: application/json');
	echo json_encode($data);
}

function get_web_page($url, $cookiesIn = '') {
	$options = array(
		CURLOPT_RETURNTRANSFER => true, // return web page
		CURLOPT_HEADER => true, //return headers in addition to content
		CURLOPT_FOLLOWLOCATION => true, // follow redirects
		CURLOPT_ENCODING => "", // handle all encodings
		CURLOPT_AUTOREFERER => true, // set referer on redirect
		CURLOPT_CONNECTTIMEOUT => 120, // timeout on connect
		CURLOPT_TIMEOUT => 120, // timeout on response
		CURLOPT_MAXREDIRS => 10, // stop after 10 redirects
		CURLINFO_HEADER_OUT => true,
		CURLOPT_SSL_VERIFYPEER => true, // Validate SSL Cert
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_COOKIE => $cookiesIn,
	);

	$ch = curl_init($url);
	curl_setopt_array($ch, $options);
	$rough_content = curl_exec($ch);
	$err = curl_errno($ch);
	$errmsg = curl_error($ch);
	$header = curl_getinfo($ch);
	curl_close($ch);

	$header_content = substr($rough_content, 0, $header['header_size']);
	$body_content = trim(str_replace($header_content, '', $rough_content));
	$pattern = "#Set-Cookie:\\s+(?<cookie>[^=]+=[^;]+)#m";
	preg_match_all($pattern, $header_content, $matches);
	$cookiesOut = implode("; ", $matches['cookie']);

	$header['errno'] = $err;
	$header['errmsg'] = $errmsg;
	$header['headers'] = $header_content;
	$header['content'] = $body_content;
	$header['cookies'] = $cookiesOut;
	return $header;
}

function intPart($floatNum) {
	return ($floatNum < -0.0000001 ? ceil($floatNum - 0.0000001) : floor($floatNum + 0.0000001));
}

function hdate($format, $time = '') {
	$FR = Array('Muharram', 'Safar', 'Rabi Al-Awwal', 'Rabi Al-Thani', 'Jumada Al-Ula', 'Jumada Al-Thani', 'Rajab', 'Shaban', 'Ramadan', 'Shawwal', 'Dhul Qada', 'Dhul Hijja');
	$FI = Array('Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember');
	$FRI = Array('Muharram', 'Safar', 'Rabi\'ul Awal', 'Rabi\'ul Akhir', 'Jumadil Awal', 'Jumadil Akhir', 'Rajab', 'Sya\'ban', 'Ramadhan', 'Syawal', 'Dzul Qa\'dah', 'Dzul Hijjah');
	$FJ = Array('Suro', 'Sapar', 'Mulud', 'Ba\'da Mulud', 'Jumadil Awal', 'Jumadil Akhir', 'Rejeb', 'Ruwah', 'Poso', 'Syawal', 'Dulkaidah', 'Besar');

	$MR = Array('Muh', 'Saf', 'RAw', 'RTn', 'JUl', 'JTn', 'Raj', 'Sbn', 'Ram', 'Swl', 'DQd', 'DHj');
	$MI = Array('Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agt', 'Sep', 'Okt', 'Nov', 'Des');
	$MRI = Array('Muh', 'Saf', 'RAw', 'RAk', 'JAw', 'JAk', 'Raj', 'Sbn', 'Ram', 'Swl', 'DQd', 'DHj');
	$MJ = Array('Sur', 'Sap', 'Mld', 'BMd', 'JAw', 'JAk', 'Rejeb', 'Ruw', 'Pos', 'Swl', 'Dkd', 'Bes');

	$lR = Array('Al-Hamis', 'Al-Jum\'a', 'As-Sabt', 'Al-Ahad', 'Al-Itsnayna', 'Ats-Tsalatsa\'', 'Al-Arba\'a\'');
	$lRI = Array('Kamis', 'Jum\'at', 'Sabtu', 'Ahad', 'Senin', 'Selasa', 'Rabu');
	$lI = Array('Kamis', 'Jumat', 'Sabtu', 'Minggu', 'Senin', 'Selasa', 'Rabu');
	$lJ = Array('Wage', 'Kliwon', 'Legi', 'Pahing', 'Pon', 'Wage', 'Kliwon');

	$DR = Array('Ham', 'Jum', 'Sab', 'Ahd', 'Its', 'Tsa', 'Arb');
	$DRI = Array('Kam', 'Jum', 'Sab', 'Ahd', 'Sen', 'Sel', 'Rab');
	$DI = Array('Kam', 'Jum', 'Sab', 'Min', 'Sen', 'Sel', 'Rab');
	$DJ = Array('Wag', 'Kli', 'Leg', 'Pah', 'Pon', 'Wag', 'Kli');

	$time = $time == '' ? time() : date('U', $time);

	$d = date('j', $time);
	$m = date('n', $time) - 1;
	$y = date('Y', $time);

	$mPart = ($m - 13) / 12;
	$jd = intPart((1461 * ($y + 4800 + intPart($mPart))) / 4) +
	intPart((367 * ($m - 1 - 12 * (intPart($mPart)))) / 12) -
	intPart((3 * (intPart(($y + 4900 + intPart($mPart)) / 100))) / 4) + $d - 32075;

	$k = $jd - 1948440 + 10632;
	$n = intPart(($k - 1) / 10631);
	$k = $k - 10631 * $n + 354;
	$j = (intPart((10985 - $k) / 5316)) * (intPart((50 * $k) / 17719)) + (intPart($k / 5670)) * (intPart((43 * $k) / 15238));
	$k = $k - (intPart((30 - $j) / 15)) * (intPart((17719 * $j) / 50)) - (intPart($j / 16)) * (intPart((15238 * $j) / 43)) + 29;

	$mL = intPart((24 * $k) / 709);
	$dL = $k - intPart((709 * $mL) / 24);
	$yL = 30 * $n + $j - 30;
	$yJ = $yL + 512;
	$mL -= 1;

	switch ($dL) {
	case 1:
		$SL = 'st';
		break;
	case 2:
		$SL = 'nd';
		break;
	case 3:
		$SL = 'rd';
		break;
	default:$SL = 'th';
		break;
	}

	$zmL = $mL < 10 ? '0' . $mL : $mL;
	$zdL = $dL < 10 ? '0' . $dL : $dL;

	$FFR = $FFJ = $FFRI = $MMR = $MMJ = $MMRI = $mL;
	$FFI = $FFE = $MMI = $MME = $m;
	$llR = (mktime(0, 0, 0, $m + 1, $d, $y) / 60 / 60 / 24) + 1;
	$llJ = $DDJ = $llR % 5;
	$llI = $llRI = $llE = $DDI = $DDRI = $DDR = $DDE = $llR = $llR % 7;

	$format = ' ' . $format . ' ';
	$format = str_replace('&', '&', $format);
	$format = str_replace('%', '%', $format);
	$format = preg_replace('#([adeghijlmnrstwyzADFGHMNOPSTUWYZ])#', '&$1%', $format);
	$format = preg_replace('#\\\&([adeghijlmnrstwyzADFGHMNOPSTUWYZ])%#', '$1', $format);

	$format = preg_replace('#&([adeghijlmnrstwyzADFGHMNOPSTUWYZ])%(E|J|RI|I|R)#', '&$1$2%', $format);

	$format = preg_replace('#&([djlmnrwyDFMNSY])%#', '&$1RI%', $format);
	$format = preg_replace('#&([tWz])%#', '&$1E%', $format);

	$format = preg_replace('#&d(J|RI|R)%#', $zdL, $format);
	$format = preg_replace('#&j(J|RI|R)%#', $dL, $format);

	$format = preg_replace('#&m(J|RI|R)%#', $zmL, $format);
	$format = preg_replace('#&n(J|RI|R)%#', $mL, $format);

	$format = preg_replace('#&Y(RI|R)%#', $yL, $format);
	$format = preg_replace('#&y(RI|R)%#', substr($yL, -2, 2), $format);

	$format = str_replace('&YJ%', $yJ, $format);
	$format = str_replace('&yJ%', substr($yJ, -2, 2), $format);

	$format = preg_replace('#&(N|w)(E|RI|I|R)%#e', "date('$1', $time)", $format);

	$format = preg_replace('#&([djmntyzSWY])[EI]%#e', "date('$1', $time)", $format);

	$format = preg_replace('#&S(J|RI|R)%#', $SL, $format);

	$format = preg_replace('#&([aeghisAGHOPTUZ])(E|J|RI|I|R|)%#e', "date('$1', $time)", $format);

	$format = preg_replace('#&([lrDFM])E%#e', "date('$1', $time)", $format);

	$format = str_replace('&rI%', $DI[$DDI] . ', ' . ($d < 10 ? '0' : '') . $d . ' ' . $MI[$MMI] . ' ' . $y . ' ' . date('H:i:s O', $time), $format);
	$format = str_replace('&rJ%', $DI[$DDI] . ' ' . $DJ[$DDJ] . ', ' . ($dL < 10 ? '0' : '') . $dL . ' ' . $MJ[$MMJ] . ' ' . $yJ . ' ' . date('H:i:s O', $time), $format);
	$format = str_replace('&rR%', $DR[$DDR] . ', ' . ($dL < 10 ? '0' : '') . $dL . ' ' . $MR[$MMR] . ' ' . $yL . ' ' . date('H:i:s O', $time), $format);
	$format = str_replace('&rRI%', $DRI[$DDRI] . ', ' . ($dL < 10 ? '0' : '') . $dL . ' ' . $MRI[$MMRI] . ' ' . $yL . ' ' . date('H:i:s O', $time), $format);

	$format = preg_replace('#&([lDFM])(J|RI|I|R)%#e', '$$1$2[$$1$1$2]', $format);

	$format = str_replace('%', '%', $format);
	$format = str_replace('&', '&', $format);

	return substr($format, 1, strlen($format) - 2);
}

function tgl_jawa() {
	return "<h4 style='text-align: center'>" . hdate('lI lJ') . "<br/>
							" . hdate('jJ FJ YJ') . "<br/>
							" . hdate('jI FI YI ') . "</h4> ";
}

function megamenu_able($array_menu, $css='bs3') {
	if ($css=="bs3") {
		$htm = '';
		$htm .= '<ul class="nav navbar-nav navbar-left" data-in="" data-out="">';
		if (!empty($array_menu)) {
			foreach ($array_menu as $a) {
				if (empty($a['children'])) {
					$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '" target="' . $a['target'] . '"><i class="' . $a['icon'] . '"></i> ' . $a['text'] . '</a>';
				} else {
					$htm .= '<li  class="dropdown"><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '" class="dropdown-toggle" data-toggle="dropdown" ><i class="' . $a['icon'] . '"></i> ' . $a['text'] . '</a>
											<ul class="dropdown-menu">';
					foreach ($a['children'] as $b) {
						if (empty($b['children'])) {
							$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '" target="' . $b['target'] . '"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a></li>';
						} else {
							$htm .= '<li class="dropdown"><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '" class="dropdown-toggle" data-toggle="dropdown"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a>
													<ul class="dropdown-menu">';
							foreach ($b['children'] as $c) {
								if (empty($c['children'])) {
									$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '" target="' . $c['target'] . '"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a></li>';
								} else {
									$htm .= '<li class="dropdown"><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '" class="dropdown-toggle" data-toggle="dropdown"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a>
													<ul class="dropdown-menu">';
									foreach ($c['children'] as $d) {
										$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $d['href']) . '" target="' . $d['target'] . '"><i class="' . $d['icon'] . '"></i> ' . $d['text'] . '</a></li>';
									}
									$htm .= '</ul></li>';
								}
							}

							$htm .= '</ul></li>';
						}
					}

					$htm .= '</ul></li>';
				}
			}
		}

		$htm .= '</ul>';
	} else if ($css=="bs4") {
		$htm = '<nav class="nav-menu d-none d-lg-block">';
		$htm .= '<ul>';
		if (!empty($array_menu)) {
			foreach ($array_menu as $a) {
				if (empty($a['children'])) {
					$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '" target="' . $a['target'] . '"><i class="' . $a['icon'] . '"></i> ' . $a['text'] . '</a>';
				} else {
					$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '"><i class="'. $a['icon'] . '"></i> ' . $a['text'] . '</a>
											<ul>';
					foreach ($a['children'] as $b) {
						if (empty($b['children'])) {
							$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '" target="' . $b['target'] . '"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a></li>';
						} else {
							$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a>
							<ul>';
							foreach ($b['children'] as $c) {
								if (empty($c['children'])) {
									$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '" target="' . $c['target'] . '"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a></li>';
								} else {
									$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a>
									<ul>';
									foreach ($c['children'] as $d) {
										$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $d['href']) . '" target="' . $d['target'] . '"><i class="' . $d['icon'] . '"></i> ' . $d['text'] . '</a></li>';
									}
									$htm .= '</ul></li>';
								}
							}

							$htm .= '</ul></li>';
						}
					}

					$htm .= '</ul></li>';
				}
			}
		}

		$htm .= '</ul></nav>';
	} else if ($css=="none") {
		$htm = '<ul>';
		if (!empty($array_menu)) {
			foreach ($array_menu as $a) {
				if (empty($a['children'])) {
					$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '" target="' . $a['target'] . '"><i class="' . $a['icon'] . '"></i> ' . $a['text'] . '</a>';
				} else {
					$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $a['href']) . '"><i class="'. $a['icon'] . '"></i> ' . $a['text'] . '</a>
											<ul>';
					foreach ($a['children'] as $b) {
						if (empty($b['children'])) {
							$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '" target="' . $b['target'] . '"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a></li>';
						} else {
							$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $b['href']) . '"><i class="' . $b['icon'] . '"></i> ' . $b['text'] . '</a>
							<ul>';
							foreach ($b['children'] as $c) {
								if (empty($c['children'])) {
									$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '" target="' . $c['target'] . '"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a></li>';
								} else {
									$htm .= '<li class="drop-down"><a href="' . str_replace("{{base_url}}", base_url(), $c['href']) . '"><i class="' . $c['icon'] . '"></i> ' . $c['text'] . '</a>
									<ul>';
									foreach ($c['children'] as $d) {
										$htm .= '<li><a href="' . str_replace("{{base_url}}", base_url(), $d['href']) . '" target="' . $d['target'] . '"><i class="' . $d['icon'] . '"></i> ' . $d['text'] . '</a></li>';
									}
									$htm .= '</ul></li>';
								}
							}

							$htm .= '</ul></li>';
						}
					}

					$htm .= '</ul></li>';
				}
			}
		}

		$htm .= '</ul>';
	}

	return $htm;
}

function http_request($url) {
	// persiapkan curl
	$ch = curl_init();

	// set url
	curl_setopt($ch, CURLOPT_URL, $url);

	// return the transfer as a string
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

	// $output contains the output string
	$output = curl_exec($ch);

	// tutup curl
	curl_close($ch);

	// mengembalikan hasil curl
	return $output;
}


function curl_post($url, $data) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	
	$output = curl_exec($ch);
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    return ['status'=>$httpcode, 'data'=>$output];
}
