<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner post-inner-2">
	<!--post header-->
	<div class="post-head">
		<h2 class="title"><strong><?=$title;?></strong></h2>
	</div>
	<!-- post body -->
	<div class="post-body">
        <?php
		if (!empty($data)) {
    	foreach ($data as $b) {
    		if (is_file($this->config->item('base_url_file') . "news/thumb/" . $b['gambar'])) {
            $img = '<img src="' . config_item('base_url_file_url') . "news/thumb/" . $b['gambar'] . '" alt="" class="img-responsive" style="width: 100%">';
		} else {
			preg_match('/<img.+src=[\'"](?P<src>.+?)[\'"].*>/i', $b['konten'], $image);

			if (!empty($image)) {
				$img = '<img src="' . $image['src'] . '" alt="" class="img-responsive" style="width: 100%">';
			} else {
				$img = '<img src="' . base_url('aset/no_pict.png') . '" alt="" class="img-responsive" style="width: 100%">';
			}
		}
        $url = 'detil/' . $b['id'] . '/' . url_title($b['judul'], "-", true);
        $teks = (strlen(strip_tags($b['konten'])) < 100) ? amankan_teks(strip_tags($b['konten'])) : amankan_teks(substr(strip_tags($b['konten']), 0, 100))." ...";
        ?>

		<div class="row">
			<div class="col-md-4">
				<a href="<?=base_url($url);?>" class="thumb"><?=$img;?></a>
			</div>
			<div class="col-md-8">
				<h5 class="news_title"><a href="<?=base_url($url);?>" class="title"><?=htmlentities($b['judul']);?></a></h5>
				<ul class="authar-info" style="margin-top: -10px; margin-bottom: 0px">
					<li><i class="ti-timer"></i> <?=tjs($b['create_at']);?></li>
					<li class="like"><a href="#"><i class="ti-thumb-up"></i><?=$b['hits'];?> views</a></li>
				</ul>
				<p class="news_body"><?=$teks;?></p>
			</div>
		</div>
		<hr>
        <?php
}
}
?>
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