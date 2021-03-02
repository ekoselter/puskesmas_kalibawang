<?php 
$settin_site_footer = json_decode($setting['site_footer'], true);

if (!empty($settin_site_footer['content'])) {
?>

<!-- *** START FOOTER *** -->
<div class="container mb-3">
	<div class="row">
		<?php 
		
		$jml_kolom = count($settin_site_footer['content']);
		$lebar_kolom = 12 / $jml_kolom;
		$css_lebar_kolom = "col-sm-".$lebar_kolom;

		foreach ($settin_site_footer['content'] as $f) {
		?>
		<!-- START FOOTER BOX (About) -->
		<div class="<?=$css_lebar_kolom;?> col-p main-content">
		<div class="footer">
			<!--post header-->
			<div class="footer-header">
			<strong><?=$f['header'];?></strong>
			</div>
			<div class="footer-body">
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
<!-- *** END OF /. FOOTER *** -->

<?php } ?>