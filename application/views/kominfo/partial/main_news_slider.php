<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner">
	<!--post header-->
	<div class="post-head">
		<h2 class="title"><strong><?=htmlentities($data['title']);?></strong></h2>
	</div>
	<!-- post body -->
	<div class="post-body">
		<div class="slider-wrapper">
			<div id="owl-slider<?=$id_slider;?>" class="owl-carousel owl-theme">

				<?php 
				if (!empty($data['data'])) {
					foreach ($data['data'] as $b) {
						if (is_file($this->config->item('base_url_file') . "news/thumb/" . $b['gambar'])) {
			    			$img = '<img src="' . config_item('base_url_file_url') . "news/thumb/" . $b['gambar'] . '" alt="" class="img-responsive">';
			    		} else {
			    			preg_match('/<img.+src=[\'"](?P<src>.+?)[\'"].*>/i', $b['konten'], $image);
			 				
			 				if (!empty($image)) {
				    			$img = '<img src="' . $image['src'] . '" alt="" class="img-responsive" style="width: 100%">';
				    		} else {
				    			$img = '<img src="' . base_url('aset/no_pict.png') . '" alt="" class="img-responsive" style="width: 100%">';
				    		}
			    		}

						$url = base_url('detil/'.$b['id'].'/'.url_title($b['judul'],"-",true));
				?>
				<!-- Slider item one -->
				<div class="item">
					<div class="slider-post post-height-1">
						<a href="<?=$url;?>" class="news-image"><?=$img;?></a>
						<div class="post-text">
							<span class="post-category"><?=$b['nmtopik'];?></span>
							<h2><a href="<?=$url;?>"><?=htmlentities($b['judul']);?></a></h2>
							<ul class="authar-info">
								<li class="authar"><a href="<?=$url;?>">by <?=$b['user'];?></a></li>
								<li class="date"><?=tjs($b['tgl']);?></li>
								<li class="view"><a href="<?=$url;?>"><?=$b['hits'];?> views</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.Slider item one -->
				<?php 
					}
				}
				?>
			</div>
		</div>
	</div>
</div>
