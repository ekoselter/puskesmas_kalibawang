<!-- START CATEGORIES WIDGET -->
<div class="panel_inner categories-widget">
    <div class="panel_header">
        <h4><strong><?=$title;?></strong></h4>
    </div>
    <div class="panel_body sidemenu">
        <ul class="category-list">
            <?php 
            if (!empty($data)) {
                foreach ($data as $d) {
            ?>
            <li><a href="<?=base_url('category/'.$d['id'].'/'.url_title($d['topik'],"-",true));?>"><?=$d['topik'];?> <span><?=$d['jml'];?></span></a></li>
            <?php 
                }
            }
            ?>
        </ul>
    </div>
</div>
<!-- END OF /. CATEGORIES WIDGET -->