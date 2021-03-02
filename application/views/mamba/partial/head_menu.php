<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-none d-lg-block">
    <div class="container clearfix">
    <div class="contact-info float-left">
    <i class="icofont-envelope"></i><a href="mailto:<?=$setting['alamat_email'];?>"><?=$setting['alamat_email'];?></a>
    <i class="icofont-phone"></i> <?=$setting['alamat_notelp'];?>
    </div>
    <div class="social-links float-right">
    <a href="<?=$setting['twitter'];?>" class="twitter"><i class="icofont-twitter"></i></a>
    <a href="<?=$setting['fb'];?>" class="facebook"><i class="icofont-facebook"></i></a>
    <a href="<?=$setting['instagram'];?>" class="instagram"><i class="icofont-instagram"></i></a>
    <a href="<?=$setting['youtube'];?>" class="youtube"><i class="icofont-youtube"></i></a>
    </div>
    </div>
</section>

<!-- ======= Header ======= -->
<header id="header">
<div class="container">

<div class="logo float-left">
<h1 class="text-light">
    <a class="hidden-sm hidden-md hidden-lg" href="<?=base_url();?>" style="float: left !important; margin-top: -10px">
        <img src="<?=base_url('aset/logokp.jpg')?>" class="logo" alt="" style="margin-top: 4px; width: 30px; display: inline; float: left">
        <div style="display: inline; float: left; margin-left: 10px; font-family: 'Exo 2', sans-serif; text-transform: uppercase; text-align: left;">
            <div style=""><?=$setting['nama_opd_singkat'];?></div>
            <div style="font-size: 12pt; letter-spacing: 1px"><?=$setting['nama_skpd2'];?></div>
        </div>
    </a>
</h1>
<!-- Uncomment below if you prefer to use an image logo -->
<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
</div>

<nav class="nav-menu float-right d-none d-lg-block">
    <?=megamenu_able($menu, 'none');?>
</nav><!-- .nav-menu -->

</div>

</header><!-- End Header -->

