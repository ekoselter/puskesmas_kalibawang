<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner post-inner-2">
	<!--post header-->
	<div class="post-head">
		<h2 class="title"><strong><?=@$title;?></strong></h2>
	</div>
	<!-- post body -->
	<div class="post-body">
        <?php 
        if (!empty($detil)) {
            $jml = 1;
            echo '<div class="row">'."\n";
            foreach ($detil as $dtl) {
                $cover = is_file($this->config->item('base_url_file').'galleri/'.$dtl['cover']) ? config_item('base_url_file_url').'galleri/'.$dtl['cover'] : base_url('aset/no_pict.png');
                
                echo '<div class="col-sm-4">'."\n";
                echo '<div class="panel panel-default"><div class="panel-body" style="padding: 0px !important">'."\n";
                echo '<img src="'.$cover.'" style="width: 100%">'."\n";
                echo '</div><div class="panel-footer"><a href="'.base_url('galleri-detil/'.$dtl['id'].'/'.url_title($dtl['name'],'-',true)).'" class="text-info" style="font-size: 10pt">'.$dtl['name'].'</a></div></div></div>'."\n";
                if (($jml%3) == 0) {
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
