<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-6 footer-info">
                    <h3><?=$setting['nama_opd_singkat']. " ".$setting['nama_skpd2'];?> </h3>
                    <p>
                        <?=$setting['alamat_jalan'];?>
                        <strong>Phone:</strong> <?=$setting['alamat_notelp'];?><br>
                        <strong>Email:</strong> <?=$setting['alamat_email'];?><br>
                    </p>
                    <div class="social-links mt-3">
                        <a href="<?=$setting['twitter'];?>" class="twitter"><i class="bx bxl-twitter"></i></a>
                        <a href="<?=$setting['fb'];?>" class="facebook"><i class="bx bxl-facebook"></i></a>
                        <a href="<?=$setting['instagram'];?>" class="instagram"><i class="bx bxl-instagram"></i></a>
                        <a href="<?=$setting['youtube'];?>" class="youtube"><i class="bx bxl-youtube"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Pencarian Artikel</h4>
                    <form action="<?=base_url('cari');?>" method="get" class="form-inline">
                        <input type="text" id="q" name="q" placeholder="Kata kunci .." value="<?=$this->input->get('q');?>">
                        <input type="submit" value="Cari">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            © Copyright <strong><span><?=$setting['nama_skpd1']." ".$setting['nama_skpd2'];?></span></strong>. All Rights Reserved
        </div>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
</footer>