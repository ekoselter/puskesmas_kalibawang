<h3 class="info_page">Galleri > <?=$data_galleri['name'];?></h3>
<hr>

<?=$this->session->flashdata('k');?>

<div class="row">
<div class="col-md-12">
    <div class="card mb-3">
        <div class="card-body">
            <?php 
            echo form_open_multipart(base_url('index.php/admin/galleri/save_detil'), 'class="form"');
            echo form_hidden('id_galleri', $data_galleri['id']);
            ?>

            <div class="form-group">
                <label for="">File</label>
                <?=form_upload('name', '', 'class="form-control" required');?>
            </div>
            <div class="form-group">
                <label for="">Deskripsi Foto</label>
                <?=form_input('desc', '', 'class="form-control" ');?>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success">Simpan</button>
                <a href="<?=base_url('index.php/admin/galleri');?>" class="btn btn-info" style="margin-top: 0">Kembali</a>
            </div>

            <?php 
            echo form_close();
            ?>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
    	    <div class="alert alert-info">Alamat URL galleri di web depan : <a href="<?=base_url('galleri-detil/'.$data_galleri['id'].'/'.url_title($data_galleri['name'],"-",true));?>" target="_blank"><b><i><?=base_url('galleri-detil/'.$data_galleri['id'].'/'.url_title($data_galleri['name'],"-",true));?></i></b></a></div>
            <?php 
            if (!empty($data_galleri_detil)) {
                $jml = 1;
                echo '<div class="row">'."\n";
                foreach ($data_galleri_detil as $dgd) {
                    echo '<div class="col-sm-2 mb-3">'."\n";
                    echo '<div class="card card-default"><div class="card-body">'."\n";
                    echo '<img src="'.config_item('base_url_file_url').'galleri/'.$dgd['name'].'" style="width: 100%">'."\n";
                    echo '</div><div class="card-footer text-center"><a href="'.base_url('admin/galleri/hapus_detil/'.$dgd['id']).'" class="text-danger" onclick="return confirm(\'Anda yakin..?\');">Hapus</a></div></div></div>'."\n";
                    if (($jml%6) == 0) {
                        echo '</div><div class="row">'."\n";
                    }
                    $jml++;
                }
                echo '</div>';
            } else {
                echo '<div class="alert alert-warning">Belum ada foto dalam album ini</div>';
            }
            ?>
            
        </div>
    </div>
</div>
</div>