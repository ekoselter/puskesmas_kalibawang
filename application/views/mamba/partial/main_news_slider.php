<div class="news mb-3">
	<!--post header-->
	<div class="news-header">
		<h2 class="title"><strong><?=htmlentities($data['title']);?></strong></h2>
	</div>
	<!-- post body -->
	<div class="news-body">
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

						<h2 class="badge badge-info mt-3"><span><i class="fa fa-tags"></i> <?=$b['nmtopik'];?></span></h2>

						<h3><a href="<?=$url;?>"><?=htmlentities($b['judul']);?></a></h3>
						<ul class="news-info">
							<li><i class="fa fa-calendar"></i> <?=tjs($b['create_at']);?></li>
							<li><i class="fa fa-eye"></i> <?=$b['hits'];?> views</li>
						</ul>
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
