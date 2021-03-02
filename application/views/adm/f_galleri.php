<?php
$tipe		= $this->uri->segment(3);
?>
<h3 class="info_page">Galleri</h3>
<hr>

<?=$this->session->flashdata('k');?>

<?php 
$hidden = array('id'=>$det['id'], 'mode'=>$det['mode']);
echo form_open_multipart(base_url('index.php/admin/galleri/save'), 'class="form"', $hidden);
?>

<div class="form-group">
	<label for="">Nama Album</label>
	<?=form_input('name', $det['name'], 'class="form-control" required');?>
</div>
<div class="form-group">
	<label for="">Deskripsi Album</label>
	<?=form_input('desc', $det['desc'], 'class="form-control" required');?>
</div>
<div class="form-group">
	<button type="submit" class="btn btn-success">Simpan</button>
	<a href="<?=base_url('index.php/admin/galleri');?>" class="btn btn-info">Kembali</a>
</div>

<?php 
echo form_close();
?>
