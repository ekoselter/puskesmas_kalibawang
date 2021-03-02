<div class="sidebar-panel mb-3">
    <?php 
    if (!empty($is_header)) {
    ?>
    <div class="sidebar-panel-header">
    <h5> <?=$title;?></h5>
    </div>
    <?php } ?>
    <div class="sidebar-panel-body">
    <?php 
    echo $data;
    ?>
    </div>
</div>
