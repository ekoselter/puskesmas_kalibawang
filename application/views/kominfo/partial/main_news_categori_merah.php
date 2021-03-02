<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner">
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
    		$img = '<img src="' . config_item('base_url_file_url') . "news/thumb/" . $b['gambar'] . '" alt="" class="img-responsive" style="height: 130px; width: 100%">';
		} else {
			preg_match('/<img.+src=[\'"](?P<src>.+?)[\'"].*>/i', $b['konten'], $image);

			$img = '<img src="' . $image['src'] . '" alt="" class="img-responsive" style="width: 100%">';
		}
        $url = 'detil/' . $b['id'] . '/' . url_title($b['judul'], "-", true);
        ?>

		<div class="news-list-item articles-list">
			<div class="img-wrapper">
				<a href="<?=base_url($url);?>" class="thumb"><?=$img;?></a>
			</div>
			<div class="post-info-2">
				<h4><a href="<?=base_url($url);?>" class="title"><?=$b['judul'];?></a></h4>
				<ul class="authar-info" style="margin-top: -10px; margin-bottom: 0px">
					<li><i class="ti-timer"></i> <?=tjs($b['tgl']);?></li>
					<li class="like"><a href="#"><i class="ti-thumb-up"></i><?=$b['hits'];?> views</a></li>
				</ul>
				<p class="hidden-sm" style="text-align: justify"><?=substr(strip_tags($b['konten']), 0, 200);?>...</p>
			</div>
		</div>
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