<h3 class="info_page">PPID - Permohonan Informasi</h3>
<hr>
<div class="card">
<div class="card-body">
	<form action="#" method="post" id="f_jawaban_permohonan_informasi">
		<input type="hidden" name="id" value="<?=$data['data']['id'];?>">
		<input type="hidden" name="mulai" value="<?=$data['mulai'];?>">
		<input type="hidden" name="limit" value="<?=$data['limit'];?>">
		<div class="row">
			<div class="col-md-5">
				<table class="table table-sm table-hover table-bordered">
					<tr><td>Tgl Dibuat</td><td>
						<div id="tgl_dibuat"><?=tjs($data['data']['created_at']);?></div>
					</td></tr>
					<tr><td>NIK</td><td>
						<div id="nik"><?=$data['data']['nik'];?></div>
					</td></tr>
					<tr><td>Nama</td><td>
						<div id="nama"><?=$data['data']['nama'];?></div>
					</td></tr>
					<tr><td>Alamat</td><td>
						<div id="alamat"><?=$data['data']['alamat'];?></div>
					</td></tr>
					<tr><td>Nomor HP</td><td>
						<div id="no_hp"><?=$data['data']['no_hp'];?></div>
					</td></tr>
					<tr><td>Kategori Pemohon</td><td>
						<div id="kategori_pemohon"><?=$data['data']['kategori_pemohon'];?></div>
					</td></tr>
					<tr><td>Email Pemohon</td><td>
						<div id="email"><?=$data['data']['email'];?></div>
					</td></tr>
					<tr><td>Informasi yang dibutuhkan</td><td>
						<div id="informasi_yg_dibutuhkan"><?=$data['data']['informasi_yg_dibutuhkan'];?></div>
					</td></tr>
					<tr><td>Tujuan Penggunaan</td><td>
						<div id="tujuan_penggunaan"><?=$data['data']['tujuan_penggunaan'];?></div>
					</td></tr>
					<tr><td>Dinas Dituju</td><td>
						<div id="dinas_dituju"><?=$data['data']['dinas_dituju'];?></div>
					</td></tr>
					<tr><td>Cara Memperoleh File</td><td>
						<div id="cara_memperoleh_informasi"><?=$data['data']['cara_memperoleh_informasi'];?></div>
					</td></tr>
					<tr><td>Cara Mendapatkan Salinan</td><td>
						<div id="cara_mendapatkan_salinan"><?=$data['data']['cara_mendapatkan_salinan'];?></div>
					</td></tr>
				</table>
			</div>
			<div class="col-md-7">
				<div class="form-group">
					<label for="">Tanggapan</label>
					<textarea name="tanggapan" id="tanggapan" class="form-control summernote" style="height: 300px;"><?=$data['data']['tanggapan'];?></textarea>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary" id="tb_simpan"><i class="fa fa-check"></i> Save</button>
					<a href="<?=base_url('admin/ppid');?>" class="btn btn-secondary"><i class="fa fa-times"></i> Kembali</a>
				</div>
			</div>
		</div>
		
	</form>
</div>
</div>


<script type="text/javascript">
	$(document).on('submit','#f_jawaban_permohonan_informasi',function(e){
    	e.preventDefault();
	    tinyMCE.triggerSave();
	    let data = new FormData(this);

		$.ajax({
		    type: "POST",
		    data: data,
			contentType: false,
			processData : false,
		    url: base_url + "admin/ppid/simpan",
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
		            window.open(r.redirect, '_self');
		        }
		    },
		    error: function(xhr) {
			    $("#tb_simpan").attr('disabled', false);
			    $("#tb_simpan").html('<i class="fa fa-check"></i> Simpan');
				console.log(xhr)
		    }
		});
	});
</script>
