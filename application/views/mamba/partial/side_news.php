<div class="sidebar-panel mb-3">
    <div class="sidebar-panel-header">
        <h5> <?=$title;?></h5>
    </div>
    <div class="sidebar-panel-body">
        <?php
        $url = base_url('api/get_post_list?order_by='.$data['order_by'].'&jml_maks='.$data['jml_maks'].'&topik='.implode('--', $data['topik']));
        $curl = json_decode(http_request($url), true);

        echo '<ul style="list-style: none; margin-left: -40px;">';
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