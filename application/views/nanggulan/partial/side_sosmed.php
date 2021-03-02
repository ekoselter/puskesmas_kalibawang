<div class="panel_inner categories-widget side-menu">
    <div class="panel_header">
        <h4 style="font-weight: bold; text-transform: uppercase;"><strong>Media Sosial Resmi</strong></h4>
    </div>
</div>
<div class="social-media-inner">
    <ul class="social-media clearfix">
        <?php 
        if ($setting['fb'] != "") {
        ?>
        <li>
            <a href="<?=$setting['fb'];?>" class="fb">
                <i class="fa fa-facebook"></i>
                <p>Facebook</p>
            </a>
        </li>
        <?php } ?>
        <?php 
        if ($setting['instagram'] != "") {
        ?>
        <li>
            <a href="<?=$setting['instagram'];?>" class="g_plus">
                <i class="fa fa-instagram"></i>
                <p>Instagram</p>
            </a>
        </li>
        <?php } ?>
        <?php 
        if ($setting['youtube'] != "") {
        ?>
        <li>
            <a href="<?=$setting['youtube'];?>" class="you_tube">
                <i class="fa fa-youtube-play"></i>
                <p>Youtube</p>
            </a>
        </li>
        <?php } ?>
        <?php 
        if ($setting['twitter'] != "") {
        ?>
        <li>
            <a href="<?=$setting['twitter'];?>" class="twitter">
                <i class="fa fa-twitter"></i>
                <p>Twitter</p>
            </a>
        </li>
        <?php } ?>
    </ul>    
</div>


