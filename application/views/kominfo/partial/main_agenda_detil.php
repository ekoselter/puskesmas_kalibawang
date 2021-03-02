<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner">
    <!--post header-->
    <div class="post-head">
        <h2 class="title"><strong><?=htmlentities($title);?></strong></h2>
    </div>
    <!-- post body -->
    <div class="post-body">
        <?php 
        $img = '';
        if (is_file($this->config->item('base_url_file') . "agenda/" . $detil['filenya'])) {
            $img = '<img src="' . config_item('base_url_file_url') . "agenda/" . $detil['filenya'] . '" alt="" class="img-responsive" style="width: 100%">';
        } 

        $url = url_title($detil['judul'],"-",true);
        ?>

		<div class="sharethis-inline-share-buttons" style="margin-bottom: 30px"></div>
        <?=$img;?>
            <!-- <div>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="hidden-xs"><i class="fa fa-linkedin"></i></a>
                <a href="#" class="hidden-xs"><i class="fa fa-pinterest-p"></i></a>
            </div>	 -->
        <div class="" style="margin-top: 20px">
            <table class="table table-bordered table-hovered table-stripped">
                <tr><td width="30%">Tanggal Mulai Agenda</td><td width="70%"><?=tjs($detil['waktu_mulai']);?></td></tr>
                <tr><td>Tanggal Selesai Agenda</td><td><?=tjs($detil['waktu_mulai']);?></td></tr>
                <tr><td>Nama Agenda</td><td><?=$detil['judul'];?></td></tr>
                <tr><td>Deskripsi Agenda</td><td><?=$detil['isi'];?></td></tr>
            </table>
        </div>
    </div> <!-- /. post body -->
    <!--Post footer-->
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
