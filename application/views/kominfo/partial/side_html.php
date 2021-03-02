<!-- START CATEGORIES WIDGET -->
<div class="panel_inner categories-widget side-menu">
  <?php 
  if (!empty($is_header)) {
  ?>
  <div class="panel_header">
    <h4 style="font-weight: bold; text-transform: uppercase;"><strong><?=$title;?></strong></h4>
  </div>
  <?php } ?>
  <div class="panel_body sidemenu" style="overflow: auto">
    <?php 
    echo $data;
    ?>
  </div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->
