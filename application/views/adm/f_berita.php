
<?php echo form_open_multipart("#", 'id="FBerita"'); ?>
	<input type="hidden" name="id" value="<?php echo $d['id']; ?>">
	<input type="hidden" name="mode" value="<?php echo $d['mode']; ?>">
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
			<label for="">Tipe</label>
				<?php echo form_dropdown('topik', $p_topik, $d['topik'], 'class="form-control col-md-12" required'); ?>
			</div>
			<div class="form-group">
				<label for="">Status</label>
				<?php echo form_dropdown('publikasi', array(""=>"-publikasi-","1"=>"Publish","0"=>"Draft"), $d['publikasi'], 'class="form-control" required'); ?>
			</div>
			<div class="form-group">
				<label for="">Tanggal</label>
				<input type="date" class="form-control" required id="tanggal" value="<?=$d['tgl'];?>" name="tgl">
			</div>
			<div class="form-group">
				<label for="">Sumber</label>
				<?php echo form_input('sumber', $d['sumber'], 'class="form-control" required'); ?>
			</div>
			<div class="form-group">
				<label for="">Foto</label>
				<input type="file" name="foto__" class="form-control">
				<div class="petunjuk" style="font-size: 10px">*) Jenis file dibolehkan : JPG, PNG, GIF maksimal <?=$ms;?> MB</div>
			</div>
			<div class="form-group">
				<label for="">Tags</label>
				<?php echo form_input('tags', $d['tags'], 'class="form-control" required'); ?>
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group">
				<label for="">Judul</label>
				<?php echo form_input('judul', $d['judul'], 'class="form-control" required'); ?>
			</div>
			<div class="form-group">
				<label for="">Konten</label>
				<!-- <a href="#" onclick="return show_fm();" class="btn btn-success btn-xs">Buka File Manager</a><br><br> -->
				
				<?php echo form_textarea('konten', $d['konten'], 'class="form-control summernote"'); ?>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success" id="tb_simpan"><i class="fa fa-check"></i> Simpan</button>
				<button type="button" onclick="window.open('<?php echo base_url(); ?>admin/berita', '_self')" class="btn btn-info"><i class="fa fa-arrow-left"></i> Kembali</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(document).on('submit','#FBerita',function(e){
    	e.preventDefault();
	    tinyMCE.triggerSave();
	    let data = new FormData(this);

		$.ajax({
		    type: "POST",
		    data: data,
			contentType: false,
			processData : false,
		    url: base_url + "admin/berita/simpan",
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
		            window.open(base_url + 'admin/berita', '_self');
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
