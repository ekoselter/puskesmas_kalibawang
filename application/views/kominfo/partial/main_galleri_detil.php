<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner post-inner-2">
    <!--post header-->
    <div class="post-head">
        <h2 class="title"><strong><?=@$title;?></strong></h2>
    </div>
    <!-- post body -->
    <div class="post-body">
        <a href="<?=base_url('galleri');?>" class="btn btn-info" style="margin-bottom: 10px"><i class="fa fa-arrow-left"></i> Kembali</a>
        <?php 
        if (!empty($detil)) {
            $jml = 1;
            echo '<div class="row">'."\n";
            foreach ($detil as $dtl) {
                $cover = is_file($this->config->item('base_url_file').'galleri/'.$dtl['name']) ? config_item('base_url_file_url').'galleri/'.$dtl['name'] : base_url('aset/no_pict.png');
                
                echo '<div class="col-sm-4">'."\n";
                echo '<div class="panel panel-default"><div class="panel-body" style="padding: 0px !important">'."\n";
                echo '<a  data-fancybox="gallery" href="'.$cover.'" class="text-info" style="font-size: 10pt"><img src="'.$cover.'" style="width: 100%"></a>'."\n";
                echo '</div><div class="panel-footer">'.$dtl['desc'].'</div></div></div>'."\n";
                if (($jml%3) == 0) {
                    echo '</div><div class="row">'."\n";
                }
                $jml++;
            }
            echo '</div>';
        } else {
            echo '<div class="alert alert-info" style="margin-top: 20px">Belum ada</div>';
        }
        ?>
    </div> <!-- /. post body -->
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
