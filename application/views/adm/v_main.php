<h3><i class="fa fa-home"></i> adminPanel Website <?=$setting['nama_skpd1']." ".$setting['nama_skpd2'];?></h3>
<hr>
<div class="row">
	<div class="col-md-6">
		<div class="alert alert-success">
		Selamat Datang, <b><?=strtoupper($this->session->userdata('username'));?></b>
		</div>
		<div class="alert alert-warning">
			<h4>Anda mau apa..?</h4>
			<ul>
				<li>Tambah Berita ..? <a href="<?php echo base_url('admin/berita/edit/0'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Tambah Agenda ..? <a href="<?php echo base_url('admin/agenda/edit/0'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Galleri Foto ..? <a href="<?php echo base_url('admin/galleri'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Setting Menu yang tampil di depan ..? <a href="<?php echo base_url('admin/set_menu'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Setting Layout website, tambah panel/widget ..? <a href="<?php echo base_url('admin/layout'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Setting Alamat Medsos, Alamat Kantor, Telp, Fax, dll ..? <a href="<?php echo base_url('adm/website'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Setting Header website mau dibuat gerak-gerak atau statis, termasuk ubah foto-nya, kasih running text ..? <a href="<?php echo base_url('admin/set_header'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Setting Footer website, misalnya mau kasih daftar feed instagram, youtube, twitter, dll ..? <a href="<?php echo base_url('admin/set_footer'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				<li>Cek siapa saja yang punya akses ke website ini..? <a href="<?php echo base_url('admin/pengguna'); ?>"><b><blink>Klik Disini.. </blink></b></a></li>
				
			</ul><br>

			<p>BINGUNG, tidak tau mau apa..? Silakan baca petunjuk meng-admin-i website ini. <a href="https://kominfo.kulonprogokab.go.id/web/view_berita/997" target="_blank"><b><blink>Klik Disini.. </blink></b></a></p>
		</div>
		<div class="alert alert-danger" style="overflow: auto">
			<h4>PPID : Permohonan Informasi</h4>
			<a href="<?php echo base_url('admin/ppid'); ?>" id="jml_permohonan" style="display: inline; float: left; font-weight: bold; font-size: 45px; padding-left: 30px; padding-right: 30px" class="btn btn-danger"><?=$jml_permohonan_informasi;?></a>
			<div style="display: inline; float: left; margin-left: 40px">Ada <span id="jml_permohonan_span"><?=$jml_permohonan_informasi;?></span> Jumlah permohonan Informasi. Segera tindaklanjuti.. <br><a href="<?php echo base_url('admin/ppid'); ?>">KLIK DISINI</a></div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="alert alert-success">
			<h4>Statistik</h4>
			<ul>
				<li>Jumlah Berita diposting : <b><?php echo $statistik_postingan['jumlah_postingan_semua']; ?></b> berita</li>
				<li>Jumlah Berita diposting bulan ini : <b><?php echo $statistik_postingan['jumlah_postingan_bulan_ini']; ?></b> berita</li>
				<li>Jumlah Online Sekarang : <b><?php echo number_format($statistik_pengunjung['online_now']); ?></b> orang</li>
				<li>Visitor Hari Ini : <b><?php echo number_format($statistik_pengunjung['hari_ini_visitor']); ?></b> orang</li>
				<li>Hits Hari Ini : <b><?php echo number_format($statistik_pengunjung['hari_ini_hits']); ?></b> orang</li>
				<li>Visitor Bulan Ini : <b><?php echo number_format($statistik_pengunjung['bulan_ini_visitor']); ?></b> orang</li>
				<li>Hits Bulan Ini : <b><?php echo number_format($statistik_pengunjung['bulan_ini_hits']); ?></b> orang</li>
			</ul>
		</div>
		<!-- <div class="alert alert-success">
		<b>10 kata kunci pencarian terpopuler</b> di web kulon progo
		</div>
		
		<div class="alert alert-info">
			<ul>
				<?php 
				foreach ($statistik['katakunci'] as $k) {
					echo '<li>'.$k['katakunci'].'</li>';
				}
				?>
			</ul>
		</div> -->
	</div>
</div>