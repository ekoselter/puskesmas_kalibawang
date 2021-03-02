<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title><?=htmlentities($title);?></title>
	<link rel="shortcut icon" href="<?=base_url('aset/logokp.jpg')?>" type="image/x-icon">
	<?=meta($meta);?>

	<!-- Facebook Meta -->
	<meta property="og:url" content="<?=$fburl=!empty($meta[0]['content'])?$meta[0]['content']:'';?>" />
	<meta property="og:type" content="article" />
	<meta property="og:title" content="<?=$fbtitle=!empty($meta[1]['content'])?htmlentities($meta[1]['content']):'';?>" />
	<meta property="og:description" content="<?=$fbdesc=!empty($meta[2]['content'])?$meta[2]['content']:'';?>" />
	<meta property="og:image" content="<?=$fbimg=!empty($meta[3]['content'])?$meta[3]['content']:'';?>" />
	

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@800&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

	<!-- Vendor CSS Files -->
	<link href="<?=base_url();?>aset/web_/mamba/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/icofont/icofont.min.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/animate.css/animate.min.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="<?=base_url();?>aset/web_/mamba/vendor/aos/aos.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="<?=base_url();?>aset/web_/mamba/css/style.css?v=<?=time();?>" rel="stylesheet">

	<!-- =======================================================
	* Template Name: Mamba - v2.3.0
	* Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->

	<script src="<?=base_url();?>aset/web_/mamba/vendor/jquery/jquery.min.js"></script>	
</head>
