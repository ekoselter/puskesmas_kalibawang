<div class="news mb-3">
	<!--post header-->
	<div class="news-header">
		<h2><strong><?=htmlentities($title);?></strong></h2>
	</div>
	<!-- post body -->
	<div class="news-body">
        <?php
		if (!empty($data)) {
    	foreach ($data as $b) {
    		// $img = '<img src="' . base_url('aset/no_pict.png') . '" alt="" class="img-responsive" style="height: 130px; width: 100%">';

    		if (is_file($this->config->item('base_url_file') . "news/thumb/" . $b['gambar'])) {
    			$img = '<img src="' . config_item('base_url_file_url') . "news/thumb/" . $b['gambar'] . '" alt="" class="img-responsive" style="width: 100%">';
    		} else {
    			preg_match('/<img.+src=[\'"](?P<src>.+?)[\'"].*>/i', $b['konten'], $image);
 				
 				if (!empty($image)) {
	    			$img = '<img src="' . $image['src'] . '" alt="" class="img-responsive" style="height: 130px; width: 100%">';
	    		} else {
	    			$img = '<img src="' . base_url('aset/no_pict.png') . '" alt="" class="img-responsive" style="width: 100%">';
	    		}
    		}

	        // $img = is_file("./" . $this->config->item('base_url_news_images') . "/normal/" . $b['gambar']) ? '<img src="' . base_url($this->config->item('base_url_news_images') . "/normal/" . $b['gambar']) . '" alt="" class="img-responsive" style="height: 130px; width: 100%">' : '';
			$url = 'detil/' . $b['id'] . '/' . url_title($b['judul'], "-", true);
			$konten = strip_tags($b['konten']);
			$konten = substr($konten, 0, 200);
			$konten = str_replace("&nbsp;", " ", $konten);
        ?>

		<div class="row">
			<div class="col-md-4">
				<a href="<?=base_url($url);?>" class="thumb"><?=$img;?></a>
			</div>
			<div class="col-md-8">
				<h5><a href="<?=base_url($url);?>" class="title"><?=htmlentities($b['judul']);?></a></h5>
				<ul class="news-info">
					<li><i class="fa fa-calendar"></i> <?=tjs($b['create_at']);?></li>
					<li><i class="fa fa-eye"></i> <?=$b['hits'];?> views</li>
				</ul>
				<p class="news-content"><?=$konten;?>...</p>
				<a href="<?=base_url($url);?>" class="btn btn-primary col-md-12 btn-flat"><i class="fa fa-eye"></i> Baca selanjutnya..</a>
			</div>
		</div>
		<hr>
        <?php
}
}
?>
	</div> <!-- /. post body -->
	<!--Post footer-->
	<div class="news-footer">
        <a href="<?php echo base_url('category'); ?>" class="btn btn-secondary col-md-12"><i class="fa fa-book"></i> Arsip</a>
    </div>
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->