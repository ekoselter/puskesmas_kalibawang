<?php 
$settin_site_footer = json_decode($setting['site_footer'], true);

if (!empty($settin_site_footer['content'])) {
?>

<!-- *** START FOOTER *** -->
<section class="articles-wrapper">
	<div class="container">
		<div class="row row-m">
			<?php 
			
			$jml_kolom = count($settin_site_footer['content']);
			$lebar_kolom = 12 / $jml_kolom;
			$css_lebar_kolom = "col-sm-".$lebar_kolom;

			foreach ($settin_site_footer['content'] as $f) {
			?>
			<!-- START FOOTER BOX (About) -->
			<div class="<?=$css_lebar_kolom;?> col-p main-content">
			<div class="post-inner post-inner-2">
				<!--post header-->
				<div class="post-head">
				<h2 class="title"><strong><?=$f['header'];?></strong></h2>
				</div>
				<div class="post-body">
					<div class="item">
						<div class="row">
							<div class="col-sm-12">
							<?=$f['content'];?>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!--  END OF /. FOOTER BOX (About) -->

			<?php } ?>
		</div>
	</div>
</section>
<!-- *** END OF /. FOOTER *** -->

<?php } ?>