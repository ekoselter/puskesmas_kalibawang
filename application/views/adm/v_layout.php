<h3 class="info_page">Setting Layout Website</h3>
<hr>
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<a href="#" class="badge badge-danger">Setting Background Website</a>

				<div class="alert alert-info" style="margin-top: 10px">Gambar JPEG maksimal 1MB, ukuran 1070px (lebar) x 200px (tinggi)</div>
				<form action="#" class="form" method="post" enctype="multipart/form-data" style="margin-top: 10px" id="f_gambarbackground">
					<div class="form-group row" style="margin-bottom: 10px">
						<div class="col-md-4">
							<label for="">Gambar Background</label>
							<input type="file" name="gambar_background" class="form-control">
						</div>
						<div class="col-md-2">
							<label for="">Warna Background </label>
							<input type="color" name="warna_background" class="form-control">
						</div>
						<!-- <div class="col-md-3">
							<?php
							echo form_dropdown('tampil_teks_header', array('' => '- tampilkan teks header-', 'true' => 'Tampil', 'false' => 'Tidak'), '', 'class="form-control" id="tampil_teks_header"');
							?>
						</div> -->
						<div class="col-md-3">
							<br>
							<button type="submit" class="btn btn-success"><i class="fa fa-upload"></i> Simpan</button>
							<button type="button" class="btn btn-info" onclick="return viewGambarBackground();"><i class="fa fa-search"></i> Lihat Gambar </button>
						</div>

					</div>
				</form>
				<div id="gbbackground" style="display: none"></div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div id="cont" class="col-md-12"></div>
</div>

<div class="modal fade" id="mdlTambahPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Nama Panel</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmPanel" method="post">
					<input type="hidden" name="posisi_panel" id="posisi_panel">
					<input type="hidden" name="urutan" id="urutan">
					<div class="form-group">
						<label for="">Nama Panel</label>
						<input type="text" name="nama_panel" id="nama_panel" class="form-control">
					</div>
					<div class="form-group">
						<label for="">Tipe</label>
						<?=form_dropdown("tipe", array(), '', 'class="form-control" id="tipe"');?>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mdlTambahUrl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">URL</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmUrl" method="post">
					<input type="hidden" name="posisi" id="posisi">
					<input type="hidden" name="nomor_kanan" id="nomor_kanan">
					<input type="hidden" name="nomor_url" id="nomor_url">
					<div class="form-group">
						<label for="">Label</label>
						<input type="text" name="label" id="label" class="form-control">
					</div>
					<div class="form-group">
						<label for="">URL</label>
						<input type="text" name="url" id="url" autocomplete="off" placeholder="ketikkan judul halaman .." class="form-control">
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">Simpan</button>
						<button class="btn btn-warning" type="button" onclick="return edit_page();">Edit</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mdlEditContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Edit Konten</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmEditKonten" method="post">
					<input type="hidden" name="posisi_edit_konten" id="posisi_edit_konten">
					<input type="hidden" name="nomor_edit_konten" id="nomor_edit_konten">
					<div class="form-group">
						<label for="is_header_edit_konten">
							<input type="checkbox" value="1" name="is_header_edit_konten" id="is_header_edit_konten"> Tampilkan Panel Header
						</label>
					</div>
					<div class="form-group">
						<a href="<?=base_url('adm/get_dir')?>" onclick="mywindow=window.open(this.href,'targetWindow','toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=0, width=600,height=600');mywindow.moveTo(750, 0);return false;" class="btn btn-success btn-xs">Buka File Manager</a><br><br>
						<label for="">Isi Content (Isikan kode HTML / javascript)</label>
						<textarea name="content" id="content" class="form-control" rows="8"></textarea>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mdlEditPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Edit Page</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmEditPage" method="post">
					<input type="hidden" name="judul_page" id="judul_page">
					<input type="hidden" name="id_page" id="id_page">
					<div class="form-group">

						<a href="<?=base_url('adm/get_dir')?>" onclick="mywindow=window.open(this.href,'targetWindow','toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=0, width=600,height=600');mywindow.moveTo(750, 0);return false;" class="btn btn-success btn-xs">Buka File Manager</a><br><br>

						<label for="">Isi Content</label>
						<textarea name="content_page" id="content_page" class="form-control " rows="8"></textarea>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mdlSettingSlideshow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Edit Panel Postingan</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmSettingSlideshow" method="post">
					<input type="hidden" name="slideshow_tipe" id="slideshow_tipe">
					<input type="hidden" name="slideshow_posisi" id="slideshow_posisi">
					<input type="hidden" name="slideshow_urutan" id="slideshow_urutan">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="">Maksimal Jumlah Postingan</label>
								<input type="number" name="slideshow_max" id="slideshow_max" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="">Urutkan menurut (default DESC)</label>
								<?=form_dropdown('slideshow_orderby', array("last_created" => "Terakhir diposting", "popularitas" => "Popularitas"), '', 'class="form-control" required id="slideshow_orderby"');?>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="">Topik</label>
						<div>
						<?php
						if (!empty($topik)) {
						    foreach ($topik as $t) {
						        echo '<label><input type="checkbox" name="slideshow_topik[]" id="topik_' . $t['id'] . '" value="' . $t['id'] . '"> ' . $t['topik'] . '</label><br>';
						    }
						}
						?>
						</div>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).on('ready', function() {
		gen_layout();
		gen_gbbackground();
		$('#url').typeahead({
		    source: function (query, process) {
		        return $.get('<?=base_url('admin/layout_detil/get_hal');?>', { query: query }, function (data) {
		            return process(data);
		        });
		    },
		    afterSelect: function(data) {
		    	$("#url").val(data.id);
		    }
		});
	});
	$("#f_gambarbackground").on("submit", function() {
		var form = $(this);
	    var formdata = false;


	    if (window.FormData){
	        formdata = new FormData(form[0]);
	    }

		var data    = $(this).serialize();

        $.ajax({
			type: "POST",
			data: formdata ? formdata : data,
			cache: false,
			contentType: false,
			processData : false,
			url: base_url+"admin/layout/simpan_background",
          	beforeSend: function(){
				console.log(formdata);
				$("#f_gambarbackground input, select, button").attr("disabled", true);
			},
			success: function(r, textStatus, jqXHR) {
				$("#f_gambarbackground input, select, button").attr("disabled", false);
				alert(r.message);
				gen_gbbackground();
			},
			error: function(xhr) {
				$("#f_gambarbackground input, select, button").attr("disabled", false);
				alert(xhr);
			}
        });
        return false;
	});
	function gen_gbbackground() {
		$.ajax({
		    type: "GET",
		    url: base_url+"admin/layout/load_gambarbackground",
		    success: function(r, textStatus, jqXHR) {
		    	$("#gbbackground").html(r.message.gambar_background);
		    },
		    error: function(xhr) {
				alert(xhr);
		    }
		});
	}
	function edit_page() {
		var url = $("#url").val();
		if (url == "#" || url == "") {
			var judul = $("#label").val();
			$("#judul_page").val(judul);
			$("#id_page").val(0);
			popupwindow("<?=base_url('admin/layout_detil/detil_hal/0');?>","Editor",800,650);
		} else if (url.substr(0,18) == "{{base_url}}detil/") {
			var pc_to_id = url.split("/");
			var id_page = pc_to_id[1];
			popupwindow("<?=base_url('admin/layout_detil/detil_hal/');?>"+id_page,"Editor",800,650);
		}
		return false;
	}
	function gen_layout() {
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/gen_setting');?>",
		    success: function(r, textStatus, jqXHR) {
		    	$("#cont").html(r);
		    },
		    error: function(xhr) {
				alert(xhr);
		    }
		});
	}
	function editContent(posisi, urutan) {
		$("#posisi_edit_konten").val(posisi);
		$("#nomor_edit_konten").val(urutan);
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/editcontent/');?>"+posisi+"/"+urutan,
		    beforeSend: function(){
				$("#frmEditKonten input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmEditKonten input, select, button").attr("disabled", false);
		        if (r.success) {
		          $("#content").val(r.data);
		        } else {
		            alert(r.message);
		        }
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});

		$("#mdlEditContent").modal('show');
		$('#mdlEditContent').on('shown.bs.modal', function () {
        $(".note-popover").css("z-index", 2000);
        /* $("#content").summernote({
        	dialogsInBody: true,
					callbacks: {
	          onImageUpload : function(files, editor, welEditable) {
	              for(var i = files.length - 1; i >= 0; i--) {
	                  sendFile(files[i], this);
	              }
	          },
	        }
			}); */
    });
		return false;
	}
	function editPanel(posisi, urutan) {
		$("#posisi_panel").val(posisi);
		$("#urutan").val(urutan);
		var pilihan_menu = '';
		if (posisi != "tengah") {
			pilihan_menu =
			'<option value=""> -- jenis -- </option>'+
			'<option value="list_url">List URL</option>'+
			'<option value="html">HTML</option>'+
			'<option value="statistik">Statistik</option>'+
			'<option value="kategori">Kategori</option>'+
			'<option value="arsip_bulanan">Arsip Bulanan</option>'+
			'<option value="list_posting">List Posting</option>';
		} else {
			pilihan_menu =
			'<option value=""> -- jenis -- </option>'+
			'<option value="html">HTML</option>'+
			'<option value="post">Postingan</option>'+
			'<option value="slideshow">Slideshow</option>';
		}
		$("#tipe").html(pilihan_menu);

		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/editpanel/');?>"+posisi+"/"+urutan,
		    beforeSend: function(){
					$("#frmPanel input, select, button").attr("disabled", true);
				},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmPanel input, select, button").attr("disabled", false);
		        if (r.success) {
		            $("#nama_panel").val(r.data.title);
		            $("#tipe").val(r.data.tipe);
		        } else {
		            alert(r.message);
		        }
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});

		$("#mdlTambahPanel").modal('show');
		return false;
	}
	function hapusPanel(posisi, urutan) {
		if (confirm('Anda yakin..?')) {
			$.ajax({
			    type: "GET",
			    url: "<?=base_url('admin/layout_detil/hapuspanel/');?>"+posisi+"/"+urutan,
			    success: function(r, textStatus, jqXHR) {
			    	gen_layout();
			    },
			    error: function(xhr) {
			        alert(xhr);
			    }
			});
		}
		return false;
	}
	function upPanel(posisi, nomor) {
		// console.log(posisi + " " + nomor);
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/uppanel/');?>"+posisi+"/"+nomor,
		    success: function(r, textStatus, jqXHR) {
		    	gen_layout();
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});
		return false;
	}
	function downPanel(posisi, nomor) {
		// console.log(posisi + " " + nomor);
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/downpanel/');?>"+posisi+"/"+nomor,
		    success: function(r, textStatus, jqXHR) {
		    	gen_layout();
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});
		return false;
	}
	function hapusUrl(posisi, nomor, urutan_url) {
		if (confirm('Anda yakin..?')) {
			$.ajax({
			    type: "GET",
			    url: "<?=base_url('admin/layout_detil/hapusurl/');?>"+posisi+"/"+nomor+"/"+urutan_url,
			    success: function(r, textStatus, jqXHR) {
			    	gen_layout();
			    },
			    error: function(xhr) {
			        alert(xhr);
			    }
			});
		}
		return false;
	}
	function editUrl(posisi, nomor, urutan_url) {
		$("#posisi").val(posisi);
		$("#nomor_kanan").val(nomor);
		$("#nomor_url").val(urutan_url);

		$("#mdlTambahUrl").modal('show');
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/editurl/');?>"+posisi+"/"+nomor+"/"+urutan_url,
		    beforeSend: function(){
				$("#frmUrl input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmUrl input, select, button").attr("disabled", false);
		        if (r.success) {
		        	$('#mdlTambahUrl').on('shown.bs.modal', function () {
					    $('#label').focus();
					})
		            $("#label").val(r.data.label);
		            $("#url").val(r.data.url);
		        } else {
		            alert(r.message);
		        }
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});
		return false;
	}
	function hapusUrl(posisi, nomor, urutan_url) {
		if (confirm('Anda yakin..?')) {
			$.ajax({
			    type: "GET",
			    url: "<?=base_url('admin/layout_detil/hapusurl/');?>"+posisi+"/"+nomor+"/"+urutan_url,
			    success: function(r, textStatus, jqXHR) {
			    	gen_layout();
			    },
			    error: function(xhr) {
			        alert(xhr);
			    }
			});
		}
		return false;
	}
	function setting_slideshow(posisi, nomor) {
		$("#slideshow_posisi").val(posisi);
		$("#slideshow_urutan").val(nomor);
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/edittengah/');?>"+posisi+"/"+nomor,
		    beforeSend: function(){
				$("#frmSettingSlideshow input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmSettingSlideshow input, select, button").attr("disabled", false);
		        if (r.success) {
					$("#slideshow_tipe").val(r.data.tipe);
					$("#slideshow_max").val(r.data.data.jml_maks);
					$("#slideshow_orderby").val(r.data.data.order_by);
					$.each(r.data.data.topik, function (i, v) {
						$("#topik_"+v).attr("checked", true);
					});
		        } else {
		            alert(r.message);
		        }
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});
		$("#mdlSettingSlideshow").modal('show');
		return false;
	}
	$("#frmPanel").on("submit", function() {
		var fdata = $("#frmPanel").serialize();
		$.ajax({
		    type: "POST",
		    data: fdata,
		    url: "<?=base_url('admin/layout_detil/savepanel');?>",
		    beforeSend: function(){
				$("#frmPanel input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmPanel input, select, button").attr("disabled", false);
		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            // alert(r.message);
		            $("#mdlTambahPanel").modal('hide');
		            gen_layout();
		        }
		    },
		    error: function(xhr) {
		    	$("#frmPanel input, select, button").attr("disabled", false);
		        alert(r.message);
		    }
		});
		return false;
	});
	$("#frmUrl").on("submit", function() {
		var fdata = $("#frmUrl").serialize();
		$.ajax({
		    type: "POST",
		    data: fdata,
		    url: "<?=base_url('admin/layout_detil/saveurl');?>",
		    beforeSend: function(){
				$("#frmUrl input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmUrl input, select, button").attr("disabled", false);
		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            // alert(r.message);
		            $("#mdlTambahUrl").modal('hide');
		            gen_layout();
		        }
		    },
		    error: function(xhr) {
		    	$("#frmUrl input, select, button").attr("disabled", false);
		        alert(r.message);
		    }
		});
		return false;
	});
	$("#frmEditKonten").on("submit", function() {
		var fdata = $("#frmEditKonten").serialize();
		$.ajax({
		    type: "POST",
		    data: fdata,
		    url: "<?=base_url('admin/layout_detil/savecontent');?>",
		    beforeSend: function(){
				$("#frmEditKonten input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmEditKonten input, select, button").attr("disabled", false);
		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            // alert(r.message);
		            $("#mdlEditContent").modal('hide');
		            gen_layout();
		        }
		    },
		    error: function(xhr) {
		    	$("#frmEditKonten input, select, button").attr("disabled", false);
		        alert(r.message);
		    }
		});
		return false;
	});
	$("#frmSettingSlideshow").on("submit", function() {
		var fdata = $("#frmSettingSlideshow").serialize();
		$.ajax({
		    type: "POST",
		    data: fdata,
		    url: "<?=base_url('admin/layout_detil/saveslideshow');?>",
		    beforeSend: function(){
				$("#frmSettingSlideshow input, select, button").attr("disabled", true);
			},
		    success: function(r, textStatus, jqXHR) {
		    	$("#frmSettingSlideshow input, select, button").attr("disabled", false);
		        if (r.success == false) {
		            alert(r.message);
		        } else {
		            $("#mdlSettingSlideshow").modal('hide');
		        }
		    },
		    error: function(xhr) {
		    	$("#frmSettingSlideshow input, select, button").attr("disabled", false);
		        alert(r.message);
		    }
		});
		return false;
	});
	function pindah_side(posisi, nomor) {
		$.ajax({
		    type: "GET",
		    url: "<?=base_url('admin/layout_detil/pindah_side/');?>"+posisi+"/"+nomor,
		    success: function(r, textStatus, jqXHR) {
		    	gen_layout();
		    },
		    error: function(xhr) {
		        alert(xhr);
		    }
		});
		return false;
	}
	function viewGambar() {
		$("#gbheader").toggle();
	}
	function viewGambarBackground() {
		$("#gbbackground").toggle();
	}
</script>
