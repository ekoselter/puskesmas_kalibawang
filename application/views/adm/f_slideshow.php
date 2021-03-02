<h3 class="info_page">Slideshow</h3>
<hr>
<?php echo form_open_multipart(base_url()."adm/slideshow/".$act); ?>
	<input type="hidden" name="id_berita" value="<?php echo $d['id']; ?>">

	<table border="0" style="width: 75%" class="table table-form">
		
		<tr><td>Caption</td><td><?php echo form_input('tema', $d['tema'], 'class="form-control col-md-12" required'); ?></td></tr>
		<tr><td>Foto Thumbnail</td><td><input type="file" name="foto__" class="form-control col-md-12">
		<div class="petunjuk">*) File support : JPG, PNG, GIF maksimal 10 MB</div>
		</td></tr>
		<tr><td>Tgl Mulai Tampil</td><td><input type="date" name="tgl_tampil_start" class="form-control col-md-12" value="<?php echo $d['tgl_tampil_start']; ?>"></td></tr>
		<tr><td>Tgl Selesai Tampil</td><td><input type="date" name="tgl_tampil_end" class="form-control col-md-12" value="<?php echo $d['tgl_tampil_end']; ?>"></td></tr>

		<tr><td colspan="2">
		<button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Simpan</button>
		<button onclick="window.open('<?php echo base_url(); ?>adm/berita', '_self')" class="btn btn-info"><i class="fa fa-arrow-left"></i> Kembali</button>

		</td></tr>
	</table>		
</form>		