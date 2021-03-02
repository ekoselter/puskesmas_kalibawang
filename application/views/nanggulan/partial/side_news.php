<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner post-inner-2">
	<!--post header-->
	<div class="post-head">
        <h4 style="font-weight: bold; text-transform: uppercase;"><strong><?=$title;?></strong></h4>
	</div>
	<!-- post body -->
	<div class="post-body">
        <?php
        $url = base_url('api/get_post_list?order_by='.$data['order_by'].'&jml_maks='.$data['jml_maks'].'&topik='.implode('--', $data['topik']));
        $curl = json_decode(http_request($url), true);

        echo '<ul style="list-style: none; margin-left: -40px; margin-top: -20px">';
        if (!empty($curl['data'])) {
            foreach ($curl['data'] as $b) {
                $url = base_url('detil/' . $b['id'] . '/' . url_title($b['judul'], "-", true));

                echo '<li style="padding-top: 10px; padding-bottom: 10px; border-bottom: solid 1px #eee"><a href="'.$url.'">'.$b['judul'].'</a></li>';
            }
        }
        echo '</ul>';

		?>
    
    </div>
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->