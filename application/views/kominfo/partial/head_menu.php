<!-- START HEADER TOP SECTION -->
<div class="header-top">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-6 col-sm-6 col-lg-6">
                <!-- Start header social -->
                <div class="header-social">
                    <ul>
                        <li><span style="color: #fff; font-weight: bold"><?= date('d M Y'); ?></span></li>
                    </ul>
                </div>
                <!-- End of /. header social -->
                <!-- Start top left menu -->
                <!-- <div class="top-left-menu">
                    <ul>
                        <li> <a href="<?= base_url('adm'); ?>"><i class="fa fa-lock"></i>  Login</a></li>
                    </ul>
                </div> -->
                <!-- End of /. top left menu -->
            </div>
            <!-- Start header top right menu -->
            <div class="col-md-6 col-sm-6 col-lg-6">
                <div class="header-right-menu">
                    <ul>
                        <li class="hidden-xs"><a href="<?= $setting['fb']; ?>"><i class="fa fa-facebook"></i></a></li>
                        <li class="hidden-xs"><a href="<?= $setting['twitter']; ?>"><i class="fa fa-twitter"></i></a></li>
                        <li class="hidden-xs"><a href="<?= $setting['instagram']; ?>"><i class="fa fa-instagram"></i></a></li>
                        <li class="hidden-xs"><a href="<?= $setting['youtube']; ?>"><i class="fa fa-youtube-play"></i></a></li>
                        <li><a href="<?= base_url('adm'); ?>"><i class="fa fa-lock"></i> Login</a></li>
                    </ul>
                </div>
            </div> <!-- end of /. header top right menu -->
        </div> <!-- end of /. row -->
    </div> <!-- end of /. container -->
</div>
<!-- END OF /. HEADER TOP SECTION -->
<!-- START NAVIGATION -->
<nav class="navbar navbar-default navbar-sticky navbar-mobile bootsnav">
    <!-- Start Top Search -->
    <div class="top-search">
        <form action="<?= base_url('cari'); ?>" method="get">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" name="q" value="<?= $this->input->get('q'); ?>" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </form>
    </div>
    <!-- End Top Search -->
    <div class="container">
        <!-- Start Atribute Navigation -->
        <div class="attr-nav">
            <ul>
                <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
            </ul>
        </div>
        <!-- End Atribute Navigation -->
        <!-- Start Header Navigation -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu" style="z-index: 100; padding: 10px">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand hidden-sm hidden-md hidden-lg" href="<?= base_url(); ?>" style="float: left !important; margin-left: 10% !important">
                <img src="<?= base_url('aset/logokp.jpg') ?>" class="logo" alt="" style="width: 30px; margin-top: 14px; display: inline; float: left">
                <div style="display: inline; float: left; margin-left: 10px; margin-top: 11px; font-family: 'Exo 2', sans-serif; text-transform: uppercase; text-align: left;">
                    <div style=""><?= $setting['nama_opd_singkat']; ?></div>
                    <div style="font-size: 12pt"><?= $setting['nama_skpd2']; ?></div>
                </div>
            </a>
        </div>
        <!-- End Header Navigation -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-menu">
            <?= megamenu_able($menu); ?>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<!-- END OF/. NAVIGATION -->