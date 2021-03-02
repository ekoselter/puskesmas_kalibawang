<div class="card">
	<div class="card-header"><?=$title;?></div>
	<div class="card-body">
		
	<?php echo form_open_multipart(base_url()."admin/".$url."/simpan", 'id="FBerita"'); ?>
	<input type="hidden" name="id" value="<?php echo $d['id']; ?>">
	<input type="hidden" name="mode" value="<?php echo $d['mode']; ?>">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="">Topik</label>
				<input type="text" class="form-control" required id="topik" value="<?=$d['topik'];?>" name="topik">
			</div>
			<div class="form-group">
				<label for="">Keterangan</label>
				<input type="text" class="form-control" required id="ket" value="<?=$d['ket'];?>" name="ket">
			</div>
			<div class="form-group">
				<label for="">Publik</label>
				<?=form_dropdown('publik', ['1'=>'Publik','0'=>'Tidak publik'], '', 'class="form-control" required');?>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Simpan</button>
				<button type="button" onclick="window.open('<?php echo base_url(); ?>admin/agenda', '_self')" class="btn btn-info"><i class="fa fa-arrow-left"></i> Kembali</button>
			</div>
		</div>
	</div>
	</form>
	</div>
</div>
