<!-- START NEWSTRICKER -->
<div class="container">
	<div class="newstricker_inner">
		<div class="trending"><strong>Berita</strong> Terbaru</div>
		<div id="NewsTicker" class="owl-carousel owl-theme">
			<?php 
			if (!empty($newsticker)) {
				foreach ($newsticker as $n) {
			?>


			<div class="item">
				<a href="<?=base_url('detil/'.$n['id'].'/'.url_title($n['judul'],"-",true));?>"><?=strtoupper($n['nmtopik']).": ".htmlentities($n['judul']);?></a>
			</div>

			<?php 
				}
			}
			?>

		</div>
	</div>
</div>
<!--  END OF /. NEWSTRICKER -->
