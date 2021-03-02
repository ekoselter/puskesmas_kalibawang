<h3 class="info_page">PPID - Permohonan Informasi</h3>
<hr>
<div class="card">
<div class="card-body">
	<div class="col-md-6">
		<h5>Halaman : </h5>
		<ul class="pagination" style="margin-left: 0px">
		<?php 
		for ($i = 1; $i <= $data['jumlah_halaman']; $i++) {
			if ($data['mulai'] == ($i-1)) {
				echo "<li class='active disabled page-item'><a href='#' style=\"background: #e3e3e3\" class='page-link'>".$i."</a></li>";
			} else {
				echo "<li class='page-item'><a href='".base_url('admin/ppid?mulai='.($i-1).'&limit='.$data['limit'])."' class='page-link'>".$i."</a></li>";
			}
		}
		?>
		</ul>
	</div>
	<!-- <div class="col-md-6">
		<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" class="form-horizontal" method="get">
			<label>Pencarian</label>
			<input type="text" name="katakunci" placeholder="Ketikkan kata kunci..." value="<?php echo $katakunci; ?>" class="form-control">
			<button class="btn btn-info"><i class="fa fa-search"></i> Cari</button>
		</form>
	</div> -->
</div>
</div>

<?=$this->session->flashdata('k');?>

<div class="table-responsive mt-3">
	<table class="table table-bordered table-sm table-hover">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="10%">Dibuat Tgl</th>
				<th width="10%">Dinas Dituju</th>
				<th width="10%">NIK</th>
				<th width="15%">Nama</th>
				<th width="10%">Informasi Yg Dibutuhkan</th>
				<th width="10%">Status</th>
				<th width="10%">Aksi</th>
			</tr>
		</thead>
		<tbody>
		<?php
		if (empty($data['data'])) {
			echo "<tr><td colspan='6'>belum ada data</td></tr>";
		} else {
			$no = ($data['mulai'] * $data['limit']) + 1;
			foreach($data['data'] as $d) {
				$status = "";

				if ($d['status'] == "1") {
					$status = '<div class="badge badge-primary">Baru</div>';
				} else if ($d['status'] == "2") {
					$status = '<div class="badge badge-warning">Diproses</div>';
				} else if ($d['status'] == "3") {
					$status = '<div class="badge badge-info">Sudah Ditanggapi</div>';
				} else if ($d['status'] == "4" && $d['tanggapan'] != "") {
					$status = '<div class="badge badge-success">Selesai</div>';
				}
		?>
			<tr>
				<td class="text-center"><?=($no++);?></td>
				<td><?=tjs($d['created_at']);?></td>
				<td><?=$d['kode_dinas'];?></td>
				<td><?=$d['nik'];?></td>
				<td><?=$d['nama'];?></td>
				<td><?=$d['informasi_yg_dibutuhkan'];?></td>
				<td><?=$status;?></td>
				<td>
					<a href="<?php echo base_url(); ?>admin/ppid/edit/<?php echo $d['id']; ?>?mulai=<?=$data['mulai'];?>&limit=<?=$data['limit'];?>" class="badge badge-danger"><i class="fa fa-pencil"></i> Tanggapi</a>
				</td>
			</tr>
		<?php
			}
		}
		?>
		</tbody>
	</table>
</div>
