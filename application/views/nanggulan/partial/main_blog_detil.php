<style type="text/css">
    .isi-konten iframe {
        width: 100%;
    }
    
    .isi-konten img {
        width: 100%;
    }
</style>

<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner post-inner-2">
	<!--post header-->
	<div class="post-head">
		<h2 class="title"><strong><?=htmlentities($title);?></strong></h2>
	</div>
	<!-- post body -->
	<div class="post-body">
        <?php 
        // $detil = $detil;

        $img = is_file($this->config->item('base_url_file')."news/normal/".$detil['gambar']) ? '<img src="'.config_item('base_url_file_url')."news/normal/".$detil['gambar'].'" alt="" class="img-responsive img-thumbnail" style="width: 100%">' : '';
        $url = url_title($detil['judul'],"-",true);
        ?>
        
        <div class="post_details_inner">
            <div class="post_details_block" style="padding: 0px">
                <ul class="authar-info" style="margin-top: 0px">
                    <li><a href="#" class="link">oleh <?=$detil['user'];?></a></li>
                    <li><i class="fa fa-calendar"></i> <?=tjs($detil['create_at']);?></li>
                    <li><i class="fa fa-file"></i> <a href="#" class="link"><?=$detil['hits'];?> views</a></li>
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
                <div style="" class="isi-konten"><?=amankan_teks($detil['konten']);?></div>
            </div>
        </div>
	</div> <!-- /. post body -->
	<!--Post footer-->
	<div class="post-footer">
        <div class="row thm-margin">
            <div class="col-xs-12 col-sm-12 col-md-12 thm-padding">
                <a href="<?php echo base_url('category'); ?>" class="more-btn">Arsip</a>
            </div>
        </div>
    </div>
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
