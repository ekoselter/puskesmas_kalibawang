<?php
$tipe		= $this->uri->segment(3);
?>
<h3 class="info_page">Galleri</h3>
<hr>
<?=$this->session->flashdata('k');?>

<div class="alert alert-info">Alamat URL galleri di web depan : <a href="<?=base_url('galleri');?>" target="_blank"><b><i><?=base_url('galleri');?></i></b></a></div>

<a href="<?php echo base_url()."admin/galleri/edit/0"; ?>" class="btn btn-success" style="margin-bottom: 20px"><i class="fa fa-plus"></i> Tambah Galeri</a>

<div style="table-responsive">
	<table class="table table-hover table-sm table-bordered">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="30%">Nama Album</th>
				<th width="30%">Deskripsi</th>
				<th width="15%">Jml Foto</th>
				<th width="20%">Aksi</th>
			</tr>
		</thead>
		<tbody>
		<?php
		$no = 1;
		if (empty($kategori)) {
			echo "<tr><td colspan='5'>belum ada data, <a href='".base_url()."index.php/admin/galleri/edit/0'>buat baru</a></td></tr>";
		} else {
			foreach($kategori as $d) {
		?>
			<tr>
				<td><?=($no++);?></td>
				<td><?=$d['name'];?></td>
				<td><?=$d['desc'];?></td>
				<td><?=$d['jml_foto'];?></td>
				<td>
					<a href="<?php echo base_url('index.php/admin/galleri/edit/'.$d['id']); ?>" class="badge badge-success"><i class="fa fa-pencil"></i> Edit</a>
					<a href="<?php echo base_url('index.php/admin/galleri/hapus/'.$d['id']); ?>" class="badge badge-danger" onclick="return confirm('Anda yakin..?');"><i class="fa fa-times"></i> Hapus</a>
					<a href="<?php echo base_url('index.php/admin/galleri/detil/'.$d['id']); ?>" class="badge badge-info"><i class="fa fa-th-list"></i> Detil</a>
				</td>
			</tr>
		<?php
			}
		}
		?>
		</tbody>
	</table>
</div>
