<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$CI =& get_instance();
if( ! isset($CI))
{
    $CI = new CI_Controller();
}
$CI->load->helper('url');

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Halaman tidak ditemukan</title>
<link href="https://fonts.googleapis.com/css?family=PT+Sans|Righteous" rel="stylesheet">
<style type="text/css">
	body {
		/*background: #296ae0;*/
		color: #296ae0;
		padding: 30px;
	}
	.empatnolempat {
		padding: 30px;
		margin: 0;
		position: absolute;
		top: 40%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
	}
	.empatnolempat h1 {
		font-size: 200px;
		font-family: 'Righteous', cursive;
	}
	.empatnolempat p {
		margin-top: -140px;
		font-size: 30px;
		font-family: 'PT Sans', sans-serif;
	}
	.empatnolempat a {
		color: #fff;
		font-weight: bold;
		text-decoration: none;
	}
</style>
</head>
<body>
	
	<div class="empatnolempat">
		<h1>404</h1>
	    <p>Halaman yang anda akses, tidak ditemukan.<br><a href="<?=base_url();?>">Kembali</a>
    </div>
</body>
</html>
