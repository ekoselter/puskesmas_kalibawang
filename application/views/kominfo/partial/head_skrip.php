<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title><?=htmlentities($title);?></title>
	<!-- Favicon and touch icons -->
	<link rel="shortcut icon" href="<?=base_url('aset/logokp.jpg')?>" type="image/x-icon">
	<?=meta($meta);?>
	<!-- Facebook Meta -->
	<meta property="og:url" content="<?=$fburl=!empty($meta[0]['content'])?$meta[0]['content']:'';?>" />
	<meta property="og:type" content="article" />
	<meta property="og:title" content="<?=$fbtitle=!empty($meta[1]['content'])?htmlentities($meta[1]['content']):'';?>" />
	<meta property="og:description" content="<?=$fbdesc=!empty($meta[2]['content'])?$meta[2]['content']:'';?>" />
	<meta property="og:image" content="<?=$fbimg=!empty($meta[3]['content'])?$meta[3]['content']:'';?>" />

	<!-- jquery ui css -->
	<link href="<?=base_url().'aset/web_/';?>assets/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<!-- Bootstrap -->
	<link href="<?=base_url().'aset/web_/';?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<!--Animate css-->
	<link href="<?=base_url().'aset/web_/';?>assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- Navigation css-->
	<link href="<?=base_url().'aset/web_/';?>assets/bootsnav/css/bootsnav.css" rel="stylesheet" type="text/css"/>
	<!-- youtube css -->
	<link href="<?=base_url().'aset/web_/';?>assets/css/RYPP.css" rel="stylesheet" type="text/css"/>
	<!-- font awesome -->
	<link href="<?=base_url().'aset/web_/';?>assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<!-- themify-icons -->
	<link href="<?=base_url().'aset/web_/';?>assets/themify-icons/themify-icons.css" rel="stylesheet" type="text/css"/>
	<!-- weather-icons -->
	<link href="<?=base_url().'aset/web_/';?>assets/weather-icons/css/weather-icons.min.css" rel="stylesheet" type="text/css"/>
	<!-- flat icon -->
	<link href="<?=base_url().'aset/web_/';?>assets/css/flaticon.css" rel="stylesheet" type="text/css"/>
	<!-- Important Owl stylesheet -->
	<link href="<?=base_url().'aset/web_/';?>assets/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css"/>
	<!-- Default Theme -->
	<link href="<?=base_url().'aset/web_/';?>assets/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css"/>
	<!-- owl transitions -->
	<link href="<?=base_url().'aset/web_/';?>assets/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css"/>
	<!-- style css -->
	<link href="<?=base_url().'aset/web_/';?>assets/css/style.css" rel="stylesheet" type="text/css"/>
	
	<!--<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">-->
	<!--<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@800&display=swap" rel="stylesheet">-->
	<!-- <link href="https://<fonts class="goog"></fonts>leapis.com/css?family=Raleway&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
	
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" /> -->
	
	<!-- <script src='https://www.google.com/recaptcha/api.js'></script> -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<?=base_url().'aset/web_/';?>assets/js/jquery.min.js"></script>
	
	<style type="text/css">
		body {
			/*font-family: 'Roboto', sans-serif;*/
			font-size: 10pt;
			/*font-family: 'Raleway', sans-serif;*/
		    font-family: 'Montserrat', sans-serif;
		    
		}
		.side-menu .panel_body {
			padding-top: 15px;
		}
		ul.category-list-menu li {
			width: 100%;
			padding-bottom: 0px;
		} 
		ul.category-list-menu li a {
			padding-bottom: 0px;
			padding-top: 0px;
		} 
		ul.category-list-menu li:nth-child(2n) {
			padding-left: 0px !important; 
		}
		.panel_header {
			padding: 10px !important;
		}
		.pagination > li > a, .pagination > li > span {
			width: auto !important;
		}
		.isi-konten {
			text-align: justify; 
			margin-top: 30px;
		}
		.isi-konten ol, .isi-konten ul {
		    margin-bottom: 10px;
		}
		.isi-konten ol li, .isi-konten ul li {
		    font-size: 16px;
		    line-height: 32px;
		}
		.isi-konten table {
			width: 100%;
		}
		.news_title {
			margin-top: 0px;
			line-height: 22px;
		}
		.news_body {
			margin-top: 10px;
			line-height: 22px;
			text-align: justify;
			font-size: 11pt;
		}
	</style>
</head>
