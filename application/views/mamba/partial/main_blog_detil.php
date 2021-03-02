<div class="news mb-3">
    <!--post header-->
    <div class="news-header">
        <h2 class="title"><strong><?=htmlentities($title);?></strong></h2>
    </div>


    <div class="news-body">
        <?php 
        $img = '';
        if (is_file($this->config->item('base_url_file') . "news/normal/" . $detil['gambar'])) {
            $img = '<img src="' . config_item('base_url_file_url') . "news/normal/" . $detil['gambar'] . '" alt="" class="img-responsive" style="width: 100%">';
        } 

        $url = url_title($detil['judul'],"-",true);
        ?>
        
        <ul class="news-info">
            <li><i class="fa fa-calendar"></i> <?=tjs($detil['create_at']);?></li>
            <li><i class="fa fa-eye"></i> <?=$detil['hits'];?> views</li>
        </ul>
		<div class="sharethis-inline-share-buttons" style="margin-bottom: 30px"></div>
        <?=$img;?>
            <!-- <div>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="hidden-xs"><i class="fa fa-linkedin"></i></a>
                <a href="#" class="hidden-xs"><i class="fa fa-pinterest-p"></i></a>
            </div>	 -->
        <div class="mt-5"><?=$detil['konten'];?></div>
    </div> <!-- /. post body -->
    <!--Post footer-->
    <div class="news-footer">
        <a href="<?php echo base_url('category'); ?>" class="btn btn-secondary col-md-12"><i class="fa fa-book"></i> Arsip</a>
    </div>
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
