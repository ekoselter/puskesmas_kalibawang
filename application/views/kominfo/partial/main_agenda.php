<!-- START POST CATEGORY STYLE FOUR (Latest articles ) -->
<div class="post-inner">
    <!--post header-->
    <div class="post-head">
        <h2 class="title"><strong><?=htmlentities($title);?></strong></h2>
    </div>
    <!-- post body -->
    <div class="post-body">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Tanggal</th>
                    <th class="text-center">Deskripsi</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                if (!empty($detil)) {
                    $jml = 1;

                    foreach ($detil as $dtl) {
                        $tgl = tjs($dtl['waktu_mulai'])." s.d. ".tjs($dtl['waktu_akhir']);

                        if ($dtl['waktu_mulai'] == $dtl['waktu_akhir']) {
                            $tgl = tjs($dtl['waktu_mulai']);
                        }

                        echo '<tr><td class="text-center">'.$jml.'</td><td>'.$tgl.'</td><td><a href="'.base_url('agenda-detil/'.$dtl['id'].'/'.url_title($dtl['judul'],'-',true)).'" class="text-info" style="font-size: 10pt"><h4><i>'.$dtl['judul'].'</i></h4><p>'.$dtl['isi'].'</p></a></td></tr>
                        ';


                        $jml++;
                    }
                }
                ?>
            </tbody>
        </table>
        
	</div> <!-- /. post body -->
</div>
<!-- END OF /. POST CATEGORY STYLE FOUR (Latest articles ) -->
