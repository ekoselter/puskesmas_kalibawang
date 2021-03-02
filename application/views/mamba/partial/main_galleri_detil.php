<div class="news mb-3">
    <!--post header-->
    <div class="news-header">
        <h3 class="title"><strong><?=htmlentities($title);?></strong></h3>
    </div>

    <div class="news-body">
        <a href="<?=base_url('galleri');?>" class="btn btn-info" style="margin-bottom: 10px"><i class="fa fa-arrow-left"></i> Kembali</a>
        <?php 
        if (!empty($detil)) {
            $jml = 1;
            echo '<div class="row">'."\n";
            foreach ($detil as $dtl) {
                $cover = is_file($this->config->item('base_url_file').'galleri/'.$dtl['name']) ? config_item('base_url_file_url').'galleri/'.$dtl['name'] : base_url('aset/no_pict.png');
                
                echo '<div class="col-sm-4 mb-3">'."\n";
                echo '<div class="card card-default"><div class="card-body" style="padding: 0px !important">'."\n";
                echo '<a  data-fancybox="gallery" href="'.$cover.'" class="text-info" style="font-size: 10pt"><img src="'.$cover.'" style="width: 100%"></a>'."\n";
                echo '</div><div class="card-footer">'.$dtl['desc'].'</div></div></div>'."\n";
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
