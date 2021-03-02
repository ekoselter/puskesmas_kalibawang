<div class="card">
	<div class="card-header"><?=$title;?></div>
	<div class="card-body">
		
	<?php echo form_open_multipart(base_url()."admin/".$url."/simpan", 'id="f_user" onsubmit="return simpan();"'); ?>
	<input type="hidden" name="id" value="<?php echo $d['UserId']; ?>">
	<input type="hidden" name="mode" value="<?php echo $d['mode']; ?>">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="">Username</label>
				<input type="text" class="form-control" required id="user" value="<?=$d['user'];?>" name="user">
			</div>
			<div class="form-group">
				<label for="">Password Baru</label>
				<input type="text" class="form-control" <?=$d['required'];?> id="password1" value="" name="password1">
			</div>
			<div class="form-group">
				<label for="">Konfirmasi Password Baru</label>
				<input type="text" class="form-control" <?=$d['required'];?> id="password2" value="" name="password2">
			</div>
			<div class="form-group">
				<label for="">Email</label>
				<input type="text" class="form-control" required id="email" value="<?=$d['email'];?>" value="" name="email">
			</div>
			<div class="form-group">
				<label for="">Level</label>
				<?=form_dropdown('level', ['Administrator'=>'Administrator', 'Kontributor'=>'Kontributor'], '', 'class="form-control" required');?>
			</div>
			<div class="form-group">
				<label for="">Aktif</label>
				<?=form_dropdown('tipe', ['aktif'=>'Aktif','non_aktif'=>'Tidak Aktif'], '', 'class="form-control" required');?>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Simpan</button>
				<button type="button" onclick="window.open('<?php echo base_url(); ?>admin/pengguna', '_self')" class="btn btn-info"><i class="fa fa-arrow-left"></i> Kembali</button>
			</div>
		</div>
	</div>
	</form>
	</div>
</div>


<script type="text/javascript">

	function simpan() {
		let data = $("#f_user").serialize();
		$.ajax({
		    type: "POST",
		    data: data,
		    url: "<?=base_url('admin/pengguna/simpan');?>",
		    beforeSend: function(){
				$("#f_user input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {	
		    	$("#f_user input, select, button").attr("disabled", false);
		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            alert(r.message);
		            
		        }
		    },
		    error: function(xhr) {
		    	$("#f_user input, select, button").attr("disabled", false);
				console.log(xhr)
		    }
		});

		return false;
	}
	
</script>