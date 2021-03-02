<?php
$tipe		= $this->uri->segment(3);
?>
<h3 class="info_page">Berita (<?=$total_row;?> postingan)</h3>
<hr>
<div class="card card-default">
<div class="card-body">
	<div class="row">
		<div class="col-md-12">
			<a href="<?php echo base_url()."admin/berita/edit"; ?>" class="btn btn-success" style="margin-bottom: 20px"><i class="fa fa-plus"></i> Tambah Berita</a>
		</div>
		<div class="col-md-4">
			<label for="">Pencarian</label>
			<form class="form-inline" action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="get">
				<div class="form-group mb-2 mr-2">
					<label for="inputPassword2" class="sr-only">Password</label>
					<input type="text" name="katakunci" class="form-control" id="inputPassword2" placeholder="Kata kunci" value="<?=$this->input->get('katakunci');?>">
				</div>
				<button type="submit" class="btn btn-primary mb-2"><i class="fa fa-search"></i> Cari</button>
			</form>
		</div>
		<div class="col-md-5">
			<label for="">Halaman : </label><br>
			<ul class="pagination"><?php echo $pagi; ?></ul>
		</div>
		<div class="col-md-3">
			<label for="">Per Topik : </label>
			<?php echo form_dropdown('per_topik',$p_topik, $this->input->get('topik'), 'class="form-control" id="per_topik"'); ?>
		</div>
	</div>
</div>
</div>

<?=$this->session->flashdata('k');?>

<div class="mt-3">
	<table class="table table-bordered table-hover table-sm">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="10%">Kategori</th>
				<th width="50%">Judul</th>
				<th width="15%">Tgl Upload</th>
				<th width="10%">Status</th>
				<th width="20%">Aksi</th>
			</tr>
		</thead>
		<tbody>
		<?php
		if (empty($data)) {
			echo "<tr><td colspan='5'>belum ada data, <a href='".base_url()."adm/berita/add'>buat baru</a></td></tr>";
		} else {
			$no = ($this->uri->segment(4) + 1);
			foreach($data as $d) {
				$publikasi = ($d['publikasi'] == 1) ? '<div class="badge badge-success"><i class="fa fa-check"></i> Publish</div>' : '<div class="badge badge-warning"><i class="fa fa-minus"></i> Draft</div>';
		?>
			<tr>
				<td class="text-center"><?=($no++);?></td>
				<td><div class="badge badge-info"><i class="fa fa-tag"></i> <?=$d['topik'];?></div></td>
				<td><?=htmlentities($d['judul']);?></td>
				<td><?=tjs($d['tgl']);?></td>
				<td class="text-center"><?=$publikasi;?></td>
				<td class="text-center">
					<a href="<?php echo base_url(); ?>admin/berita/edit/<?php echo $d['id']; ?>" class="badge badge-success"><i class="fa fa-pencil"></i> Edit</a>
					<a href="#" class="badge badge-danger" onclick="return hapus(<?php echo $d['id']; ?>);"><i class="fa fa-times"></i> Hapus</a>
				</td>
			</tr>
		<?php
			}
		}
		?>
		</tbody>
	</table>
</div>


<div class="modal fade" id="ModalInfoBerita" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Informasi Admin</h4>
			</div>
			<div class="modal-body">
				<p>Menurut penelitian, berita dengan gambar, lebih memberikan daya tarik lebih kepada pengunjung untuk melihat lebih jauh terhadap berita tersebut. Disamping itu, oleh mesin pencari Google dan lain-lainnya, lebih memprioritaskan berita bergambar untuk diindeks, sehingga mudah ditemukan oleh pengunjung. Tahu, kan, rasanya lebih diprioritaskan itu gimana..? </p>

				<br>

				<p>Oleh karena itu, dimohon untuk selalu menyertakan gambar, pada setiap postingan di website ini. Because, your images describe your post. :D</p>
				
				<div class="text-center"><b>Terima Kasih, selamat bekerja</b></div>
			</div>
			<div class="modal-footer">
				<button type=button id="forgetMeBerita" class="btn btn-danger">Jangan tampilkan lagi</button>
				<button type="button" class="btn btn-info" data-dismiss="modal">Tutup</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// $("#myModal").modal('show');
	<?php 
	$uri_params = $_SERVER['QUERY_STRING'];
	?>

	$("#per_topik").on("change", function() {
		var id = $(this).val();
		var uri_params = "<?php echo $uri_params; ?>";
		var pc_uriparams = uri_params.split("&");
		var tmp = [];
		var ada = 0;
		$.each(pc_uriparams, function(i, j) {
			var pcj = j.split("=");
			if (pcj[0] == "topik") {
				tmp.push("topik=" + id);	
				ada++;
			} else {
				tmp.push(j);
			}
		});

		uri_params = (ada > 0) ? "?" + tmp.join("&") : "?" + tmp.join("&") + "&topik=" + id;

		window.open("<?php echo base_url('admin/berita');?>" + uri_params, "_self");
	});
	
	function hapus(id) {
	    if (confirm('Anda yakin..?')) {
	        $.ajax({
                type: "GET",
                url: base_url + "admin/berita/hapus/"+id,
                success: function(r, textStatus, jqXHR) {   
                    if (r.success == false) {
                        alert(r.message);
                    } else {
                        alert(r.message);
		                window.open(base_url + 'admin/berita', '_self');
                    }
                },
                error: function(xhr) {
                    console.log(xhr)
                }
             });
	    }
	    
	    return false;
	}
</script>