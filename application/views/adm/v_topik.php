<?php
$tipe		= $this->uri->segment(3);
?>
<h3 class="info_page"><?=$title;?></h3>
<hr>
<div class="card card-default">
<div class="card-body">
	<div class="row">
		<div class="col-md-12">
			<a href="<?php echo base_url()."admin/".$url."/edit/0"; ?>" class="btn btn-success" style="margin-bottom: 20px"><i class="fa fa-plus"></i> Tambah <?=$title;?></a>
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
	</div>
</div>
</div>

<?=$this->session->flashdata('k');?>

<div class="mt-3">
	<table class="table table-bordered table-hover table-sm">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="45%">Topik</th>
				<th width="25%">Keterangan</th>
				<th width="15%">Publik</th>
				<th width="20%">Aksi</th>
			</tr>
		</thead>
		<tbody>
		<?php
		if (empty($data)) {
			echo "<tr><td colspan='5'>belum ada data, <a href='".base_url()."admin/".$url."/edit/0'>buat baru</a></td></tr>";
		} else {
			$no = ($this->uri->segment(4) + 1);
			foreach($data as $d) {
		?>
			<tr>
				<td class="text-center"><?=($no++);?></td>
				<td><?=$d['topik'];?></td>
				<td><?=$d['ket'];?></td>
				<td class="text-center"><?=$d['publik'];?></td>
				<td class="text-center">
					<a href="<?php echo base_url('admin/'.$url.'/edit/'.$d['id']); ?>" class="badge badge-success"><i class="fa fa-pencil"></i> Edit</a>
					<a href="<?php echo base_url('admin/'.$url.'/hapus/'.$d['id']); ?>" class="badge badge-danger" onclick="return confirm('Anda yakin..?');"><i class="fa fa-times"></i> Hapus</a>
				</td>
			</tr>
		<?php
			}
		}
		?>
		</tbody>
	</table>
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

		window.open("<?php echo base_url('admin/'.$url);?>" + uri_params, "_self");
	});
</script>