<div class="news mb-3">
    <!--post header-->
    <div class="news-header">
        <h2 class="title"><strong><?=htmlentities($title);?></strong></h2>
    </div>


    <div class="news-body">
        <?php 
        if (!empty($detil)) {
            $jml = 1;
            echo '<div class="row">'."\n";
            foreach ($detil as $dtl) {
                $cover = is_file($this->config->item('base_url_file').'agenda/'.$dtl['filenya']) ? config_item('base_url_file_url').'agenda/'.$dtl['filenya'] : base_url('aset/no_pict.png');
                
                echo '<div class="col-sm-4 mb-2">'."\n";
                echo '<div class="card card-default"><div class="card-body" style="padding: 0px !important">'."\n";
                echo '<img src="'.$cover.'" style="width: 100%">'."\n";
                echo '</div><div class="card-footer text-center"><a href="'.base_url('agenda-detil/'.$dtl['id'].'/'.url_title($dtl['judul'],'-',true)).'" class="text-info" style="font-size: 10pt">'.$dtl['judul'].'</a></div></div></div>'."\n";
                if (($jml%4) == 0) {
                    echo '</div><div class="row">'."\n";
                }
                $jml++;
            }
            echo '</div>';
        }
        ?>
	</div> <!-- /. post body -->
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
