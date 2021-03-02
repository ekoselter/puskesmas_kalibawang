<div class="card">
	<div class="card-body">
		
	<?php echo form_open_multipart(base_url()."admin/agenda/simpan", 'id="fAgenda" onsubmit="return SubmitForm();"'); ?>
	<input type="hidden" name="id" value="<?php echo $d['id']; ?>">
	<input type="hidden" name="mode" value="<?php echo $d['mode']; ?>">
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label for="">Tanggal Mulai</label>
				<input type="date" class="form-control" required id="waktu_mulai" value="<?=$d['waktu_mulai'];?>" name="waktu_mulai">
			</div>
			<div class="form-group">
				<label for="">Tanggal Selesai</label>
				<input type="date" class="form-control" required id="waktu_akhir" value="<?=$d['waktu_akhir'];?>" name="waktu_akhir">
			</div>
			<div class="form-group">
				<label for="">Foto Sampul</label>
				<input type="file" name="foto__" class="form-control" <?=$d['required'];?>>
				<div class="petunjuk" style="font-size: 10px">*) Jenis file dibolehkan : JPG, PNG, GIF maksimal 1 MB</div>
			</div>
			<div class="form-group">
				<?php 
				if (is_file(config_item('base_url_file').'agenda/'.$d['filenya'])) {
					echo '<img src="'.config_item('base_url_file_url').'agenda/'.$d['filenya'].'" style="width: 100%">';
				}
				?>
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group">
				<label for="">Judul</label>
				<?php echo form_input('judul', $d['judul'], 'class="form-control" required'); ?>
			</div>
			<div class="form-group">
				<label for="">Isi</label>
				<?php echo form_textarea('isi', $d['isi'], 'class="form-control summernote"'); ?>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success" id="tb_simpan"><i class="fa fa-check"></i> Simpan</button>
				<button type="button" onclick="window.open('<?php echo base_url(); ?>admin/agenda', '_self')" class="btn btn-info"><i class="fa fa-arrow-left"></i> Kembali</button>
			</div>
		</div>
	</div>
	</form>
	</div>
</div>

<script type="text/javascript">
	$(document).on('submit','#fAgenda',function(e){
    	e.preventDefault();
	    tinyMCE.triggerSave();
	    let data = new FormData(this);

		$.ajax({
		    type: "POST",
		    data: data,
			contentType: false,
			processData : false,
		    url: base_url + "admin/agenda/simpan",
		    beforeSend: function(){
			    $("#tb_simpan").attr('disabled', true);
			    $("#tb_simpan").html('<i class="fa fa-spin fa-spinner"></i> Menyimpan ...');
			},
		    success: function(r, textStatus, jqXHR) {	
			    $("#tb_simpan").attr('disabled', false);
			    $("#tb_simpan").html('<i class="fa fa-check"></i> Simpan');

		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            alert(r.message);
		            window.open(base_url + 'admin/agenda', '_self');
		        }
		    },
		    error: function(xhr) {
			    $("#tb_simpan").attr('disabled', false);
			    $("#tb_simpan").html('<i class="fa fa-check"></i> Simpan');
					console.log(xhr)
		    }
		});
		

	    // console.log(data);
	    // $('#FBerita').submit();
	    // return false;
	});
</script>
