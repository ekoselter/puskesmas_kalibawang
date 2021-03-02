<h3 class="info_page">Setting Header Website</h3>
<hr>

<div class="row">
	<div class="col-md-12">

        <div class="card card-default mb-3">
            <div class="card-header">Running Text</div>
            <div class="card-body">
                <?=form_open('#', 'id="form_running_text" onsubmit="return simpan_running_text();"');?>
                <div class="form-group">
                    <?=form_textarea('running_text', $running_text, 'class="form-control" style="height: 50px"'); ?>
                </div>
                <div class="form-group">
                    <button class="btn btn-success" type="submit">Simpan</button>
                </div>
                <?=form_close();?>
            </div>
        </div>

		<div class="card card-default mb-3">
            <div class="card-header">Setting Jenis Header</div>
			<div class="card-body">
				<div class="form-group">
					<?=form_dropdown('def_header', array("N"=>"Header Tunggal","Y"=>"Header Slider","X"=>"No Header"), $is_slider_header, 'class="form-control input-lg" onchange="return ubah_default_header();" id="dd_default_header"'); ?>
				</div>
			</div>
		</div>

		<div class="card card-default mb-3">
            <div class="card-header">Setting Header Tunggal</div>
			<div class="card-body">
				
				<div class="alert alert-info" style="margin-top: 10px">Gambar JPEG maksimal 1MB, ukuran 1070px (lebar) x 200px (tinggi)</div>
				<form action="#" class="form" method="post" enctype="multipart/form-data" style="margin-top: 10px" id="f_gambarheader">
					<div class="form-group row" style="margin-bottom: 10px">
						<div class="col-md-4">
						<input type="file" name="gambarheader" class="form-control"></div>
						<div class="col-md-3">
							<?php 
							echo form_dropdown('tampil_teks_header',array(''=>'- tampilkan teks header-','true'=>'Tampil','false'=>'Tidak'),'','class="form-control" id="tampil_teks_header"'); 
							?>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-success"><i class="fa fa-upload"></i> Simpan</button>
							<button type="button" class="btn btn-info" onclick="return viewGambar();"><i class="fa fa-search"></i> Lihat Gambar </button>
                            <button type="button" class="btn btn-danger" onclick="return hapusGambar();"><i class="fa fa-times"></i> Hapus Gambar </button>
						</div>
						
					</div>
				</form>
				<div id="gbheader" style="display: none"></div>
			</div>
		</div>

		<div class="card card-default mb-3">
            <div class="card-header">Setting Header Slider</div>
			<div class="card-body">
				
				<div class="alert alert-info" style="margin-top: 10px">Gambar JPEG maksimal 1MB, ukuran 1070px (lebar) x 200px (tinggi)</div>
				<form action="#" class="form" method="post" enctype="multipart/form-data" style="margin-top: 10px" id="f_gambarheader_slider">
					<div class="form-group row" style="margin-bottom: 10px">
						<div class="col-md-2">
							<label for="">File Slider</label>
							<input type="file" name="gambar_background" class="form-control" >
						</div>
						<div class="col-md-3">
							<label for="">Caption</label>
							<input type="text" name="teks" class="form-control">
						</div>
						<div class="col-md-3" style="padding-top: 30px">
							<button type="submit" class="btn btn-success"><i class="fa fa-upload"></i> Upload</button>
							<!-- <button type="button" class="btn btn-info" onclick="return viewGambarSlider();"><i class="fa fa-search"></i> Lihat Gambar </button> -->
						</div>
						
					</div>
				</form>
				<div id="gbheader_slider"></div>
			</div>
		</div>
	</div>
	<!-- <div id="cont"></div>	 -->
</div>

<script>
	$(document).on('ready', function() {
		gen_gbheader();
		gen_gbheader_slider();
	});
	$("#f_gambarheader").on("submit", function() {
		var form = $(this);
	    var formdata = false;
	    var tampil_teks_header = $("#tampil_teks_header").val();
	    tampil_teks_header = (tampil_teks_header == null) ? false : tampil_teks_header;
	    if (window.FormData){
	        formdata = new FormData(form[0]);
	        formdata.append("tampil_teks", tampil_teks_header);
	    }
			var data    = $(this).serialize();
        $.ajax({
          type: "POST",
          data: formdata ? formdata : data,
        	cache: false,
        	contentType: false,
        	processData : false,
          url: base_url+"admin/set_header/simpan_header",
          beforeSend: function(){
	    			console.log(formdata);
						$("#f_gambarheader input, select, button").attr("disabled", true);
					},
          success: function(r, textStatus, jqXHR) {
          	$("#f_gambarheader input, select, button").attr("disabled", false);
          	alert(r.message);
          	gen_gbheader();
          },
          error: function(xhr) {
          	$("#f_gambarheader input, select, button").attr("disabled", false);
						alert(xhr);
          }
        });
        return false;
	});
	$("#f_gambarheader_slider").on("submit", function() {
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
          	url: base_url+"admin/set_header/simpan_header_slider",
          	beforeSend: function(){
    			console.log(formdata);
				$("#f_gambarheader_slider input, select, button").attr("disabled", true);
			},
          	success: function(r, textStatus, jqXHR) {
	          	$("#f_gambarheader_slider input, select, button").attr("disabled", false);
	          	alert(r.message);
	          	gen_gbheader_slider();
          	},
          	error: function(xhr) {
          		$("#f_gambarheader_slider input, select, button").attr("disabled", false);
				alert(xhr);
          	}
        });
        return false;
	});
    function hapusGambar() {
        if (confirm('Anda yakin..?')) {
            $.ajax({
                type: "GET",
                url: base_url+"admin/set_header/hapus_gambar_header_tunggal",
                success: function(r, textStatus, jqXHR) {   
                    alert(r.message);
                },
                error: function(xhr) {
                    alert(xhr);
                }
            });
        }
        return false;
    }
	function gen_gbheader() {
		$.ajax({
		    type: "GET",
		    url: base_url+"admin/set_header/load_gambarheader",
		    success: function(r, textStatus, jqXHR) {	
		    	$("#gbheader").html(r.message.gb_header);
		    	$("#tampil_teks_header").val(r.message.teks_header);
		    },
		    error: function(xhr) {
				alert(xhr);
		    }
		});
	}
	function gen_gbheader_slider() {
		$.ajax({
		    type: "GET",
		    url: base_url+"admin/set_header/load_gambar_slider",
		    success: function(r, textStatus, jqXHR) {	
		    	$("#gbheader_slider").html(r.data);
		    },
		    error: function(xhr) {
				alert(xhr);
		    }
		});
	}
	function viewGambar() {
		$("#gbheader").toggle();
	}

	function edit_label_slider(id, teks) {
		var capt = prompt("Silakan input caption", teks);

		var kirim = "id="+id+"&teks="+capt;

		$.ajax({
        	type: "POST",
        	data: kirim,
          	url: base_url+"admin/set_header/simpan_caption",
          	success: function(r, textStatus, jqXHR) {
	          	alert(r.message);
	          	gen_gbheader_slider();
          	},
          	error: function(xhr) {
				alert(xhr);
          	}
        });
		return false;
	}

	function hapus_gambar_slider(id) {
		if (confirm('Anda yakin..?')) {
			$.ajax({
	        	type: "GET",
	          	url: base_url+"admin/set_header/hapus_slider/"+id,
	          	success: function(r, textStatus, jqXHR) {
		          	alert(r.message);
		          	gen_gbheader_slider();
	          	},
	          	error: function(xhr) {
					alert(xhr);
	          	}
	        });
		}

		return false;
	}

	function ubah_default_header() {
		var isi = $("#dd_default_header").val();

		$.ajax({
        	type: "GET",
          	url: base_url+"admin/set_header/ubah_is_slider_header/"+isi,
          	success: function(r, textStatus, jqXHR) {
	          	alert(r.message);
	          	// gen_gbheader_slider();
          	},
          	error: function(xhr) {
				alert(xhr);
          	}
        });
	}

    function simpan_running_text() {
        let fdata = $("#form_running_text").serialize();

        $.ajax({
            type: "POST",
            data: fdata,
            url: base_url + "admin/set_header/simpan_running_text",
            beforeSend: function(){
                $("#form_running_text input, select, button").attr("disabled", true);
            },
            success: function(r, textStatus, jqXHR) {    
                $("#form_running_text input, select, button").attr("disabled", false);
                if (r.success == false) {
                    alert(r.message);
                } else {
                    alert(r.message);
                    
                }
            },
            error: function(xhr) {
                $("#form_running_text input, select, button").attr("disabled", false);
                console.log(xhr)
            }
        });
        
        return false;
    }
</script>
