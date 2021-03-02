<form method="POST" action="<?php echo base_url('adm/fm_buat_file'); ?>" accept-charset="UTF-8" class="" enctype="multipart/form-data">
	<label>Buat File</label>
	<input type="text" size="80" value="" name="path_file_buat"> &nbsp; <button type="submit">Buat</button>
</form>

<hr style="border: solid 1px #eee; width: 50%; float: left; display: block"><br><br>
<form method="POST" action="<?php echo base_url('adm/fm'); ?>" accept-charset="UTF-8" class="" enctype="multipart/form-data">
	<label>Edit File</label>
	<input type="text" size="80" value="<?php echo $path; ?>" name="url_file"> &nbsp; <button type="submit">Buka</button>
</form>

<form method="POST" action="<?php echo base_url('adm/fm_save'); ?>" accept-charset="UTF-8" class="" enctype="multipart/form-data">
	<input type="hidden" name="path_file" value="<?php echo $path; ?>">
	<textarea cols="100" rows="30" name="isi"><?php echo $isi; ?></textarea>
	<br>
	<button type="submit">Simpan</button>
</form>

<form method="POST" action="<?php echo base_url('adm/fm_get_list_folder'); ?>" accept-charset="UTF-8" class="" enctype="multipart/form-data">
	<label>Buka Folder</label>
	<input type="text" size="80" value="<?php echo $path; ?>" name="path_tujuan"> &nbsp; <button type="submit">Buka</button>
</form>