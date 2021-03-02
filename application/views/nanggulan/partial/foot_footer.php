<?php 
$settin_site_footer = json_decode($setting['site_footer'], true);

if (!empty($settin_site_footer['content'])) {
?>

<!-- *** START FOOTER *** -->
<footer>
	<div class="container">
		<div class="row">
			<?php 
			
			$jml_kolom = count($settin_site_footer['content']);
			$lebar_kolom = 12 / $jml_kolom;
			$css_lebar_kolom = "col-sm-".$lebar_kolom;

			foreach ($settin_site_footer['content'] as $f) {
			?>
			<!-- START FOOTER BOX (About) -->
			<div class="<?=$css_lebar_kolom;?> footer-box">
				<h3 class="wiget-title"><?=$f['header'];?></h3>
				<div class="about-inner">
					<?=$f['content'];?>
				</div>
			</div>
			<!--  END OF /. FOOTER BOX (About) -->

			<?php } ?>
		</div>
	</div>
</footer>
<!-- *** END OF /. FOOTER *** -->

<?php } ?>