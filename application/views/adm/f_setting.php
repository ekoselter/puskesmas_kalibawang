<h3 class="info_page">Berita</h3>
<hr>
<form action="#" method="post" id="frm_post">
	<button type="submit" class="btn btn-success">Simpan</button> &nbsp;
	<!-- <a href="<?= base_url('adm/website/homepage_setting'); ?>" target="_blank" class="btn btn-warning">Setting Template</a> -->
	<br><br>
	<table class="table table-bordered table-hover table-sm" id="dt">
		<thead>
			<tr>
				<th width="30%">No</th>
				<th width="70%">Nama</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Nama OPD 1</td>
				<td><input type="text" name="nama_skpd1" class="form-control" value="<?= ($nama_skpd1 = (!empty($data['nama_skpd1'])) ? $data['nama_skpd1'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Nama OPD 2</td>
				<td><input type="text" name="nama_skpd2" class="form-control" value="<?= ($nama_skpd2 = (!empty($data['nama_skpd2'])) ? $data['nama_skpd2'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Nama OPD Singkat</td>
				<td><input type="text" name="nama_opd_singkat" class="form-control" value="<?= ($nama_opd_singkat = (!empty($data['nama_opd_singkat'])) ? $data['nama_opd_singkat'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Tautan FB</td>
				<td><input type="text" name="fb" class="form-control" value="<?= ($fb = (!empty($data['fb'])) ? $data['fb'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Tautan Twitter</td>
				<td><input type="text" name="twitter" class="form-control" value="<?= ($twitter = (!empty($data['twitter'])) ? $data['twitter'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Tautan Instagram</td>
				<td><input type="text" name="instagram" class="form-control" value="<?= ($instagram = (!empty($data['instagram'])) ? $data['instagram'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Tautan Youtube</td>
				<td><input type="text" name="youtube" class="form-control" value="<?= ($youtube = (!empty($data['youtube'])) ? $data['youtube'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Alamat Kantor</td>
				<td><input type="text" name="alamat_jalan" class="form-control" value="<?= ($alamat_jalan = (!empty($data['alamat_jalan'])) ? $data['alamat_jalan'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Nomor Telpon Kantor</td>
				<td><input type="text" name="alamat_notelp" class="form-control" value="<?= ($alamat_notelp = (!empty($data['alamat_notelp'])) ? $data['alamat_notelp'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Email Kantor</td>
				<td><input type="text" name="alamat_email" class="form-control" value="<?= ($alamat_email = (!empty($data['alamat_email'])) ? $data['alamat_email'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Peta Lokasi</td>
				<td><input type="text" name="petalokasi" class="form-control" value="<?= ($petalokasi = (!empty($data['petalokasi'])) ? htmlentities($data['petalokasi']) : "") ?>"></td>
			</tr>
			<tr>
				<td>Slogan/Motto</td>
				<td><input type="text" name="slogan" class="form-control" value="<?= ($slogan = (!empty($data['slogan'])) ? $data['slogan'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Default Keyword</td>
				<td><input type="text" name="keywords" class="form-control" value="<?= ($keywords = (!empty($data['keywords'])) ? $data['keywords'] : "") ?>"></td>
			</tr>
			<tr>
				<td>Akun ePPID</td>
				<td><input type="text" name="ppid_account" class="form-control" value="<?= ($ppid_account = (!empty($data['ppid_account'])) ? $data['ppid_account'] : "") ?>"></td>
			</tr>
		</tbody>
	</table>
</form>

<script type="text/javascript">
	$("#frm_post").on("submit", function() {
		// var form = $(this);
		//    var formdata = false;
		//    if (window.FormData){
		//        formdata = new FormData(form[0]);
		//    }

		//    var formAction = form.attr('action');

		var data = $(this).serialize();

		$.ajax({
			type: "POST",
			// data: formdata ? formdata : data,
			data: data,
			// cache: false,
			// contentType: false,
			// processData : false,
			url: base_url + "adm/website/simpan",
			// url: base_url + "adm/website",
			beforeSend: function() {
				$("#frm_post input, select, button").attr("disabled", true);
			},
			success: function(r, textStatus, jqXHR) {

				$("#frm_post input, select, button").attr("disabled", false);
				if (r.success == false) {
					alert(r.message);
				} else {
					alert(r.message);
				}
			},
			error: function(xhr) {
				$("#frm_post input, select, button").attr("disabled", false);
				alert(r.message);
			}
		});
		return false;
	});
</script>