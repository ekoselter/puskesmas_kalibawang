<h3 class="info_page">Setting Footer Website</h3>
<hr>

<div class="row">
    <div class="col-md-12">
    <div class="card">
        <div class="card-body">
            <a href="#" onclick="return tambahPanel()" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Kolom</a><br><br>
            <div id="footer_prev" class="row"></div>
        </div>
    </div>
    </div>
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
					<input type="hidden" name="urutan" id="urutan">
					<input type="hidden" name="mode" id="mode">
					<div class="form-group">
						<label for="">Nama Panel</label>
						<input type="text" name="nama_panel" id="nama_panel" class="form-control">
					</div>
					<div class="form-group">
						<label for="">Tipe</label>
						<?=form_dropdown("tipe", ["html"=>"html"], '', 'class="form-control" id="tipe"');?>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit" id="tbSave">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mdlEditKontent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Nama Panel</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="#" id="frmEditKontent" method="post">
					<input type="hidden" name="urutan" id="EditKontentUrutan">
					<input type="hidden" name="mode" id="EditKontentMode">
					<div class="form-group">
						<label for="">Isi Konten</label>
						<textarea name="EditKontentIsi" id="EditKontentIsi" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit" id="tbSaveEditKonten">Simpan</button>
						<button class="btn btn-info pull-right" data-dismiss="modal" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).on('ready', function() {
		gen_footer();
    });
    $("#frmPanel").on('submit', function(e) {
        e.preventDefault();
        var data = new FormData(this);
        $.ajax({
            type: "POST",
            url: base_url + "index.php/admin/set_footer/save_panel",
            data: data,
            processData: false,
            contentType: false,
            beforeSend: function() {
                $("#tbSave").attr("disabled", true);
            },
            success: function (r){
                $("#tbSave").attr("disabled", false);

                if (r.success) {
                    gen_footer();        
                    $("#mdlTambahPanel").modal('hide');
                } else {
                    alert(r.message);
                }
            },
            error: function(xhr){
                $("#tbSave").attr("disabled", false);
            }
        });
    });
    $("#frmEditKontent").on('submit', function(e) {
        e.preventDefault();
        var data = new FormData(this);
        $.ajax({
            type: "POST",
            url: base_url + "index.php/admin/set_footer/save_panel",
            data: data,
            processData: false,
            contentType: false,
            beforeSend: function() {
                $("#tbSave").attr("disabled", true);
            },
            success: function (r){
                $("#tbSave").attr("disabled", false);

                if (r.success) {
                    gen_footer();        
                    $("#mdlEditKontent").modal('hide');
                } else {
                    alert(r.message);
                }
            },
            error: function(xhr){
                $("#tbSave").attr("disabled", false);
            }
        });
    });

	function gen_footer() {
		$.ajax({
		    type: "GET",
		    url: base_url+"admin/set_footer/json",
		    success: function(r, textStatus, jqXHR) {	
                let htm = '';
                if (r.content.length > 0) {
                    let no = 0;
                    $.each(r.content, function(i, v) {
                        let int_pjg_kolom = 12 / parseInt(r.content.length);
                        let pjg_kolom = "col-md-"+int_pjg_kolom;

                        htm += '<div class="'+pjg_kolom+'">'+
                        '<div class="card card-default">'+
                        '<div class="card-header">'+v.header.substr(0,15)+
                        '<div class="pull-right">'+
                            '<div class="btn-group" role="group">'+
                            '<a href="#" class="btn btn-sm btn-info" onclick="return pindahPanel('+no+', \'down\');"><i class="fa fa-arrow-right"></i> </a>'+
                            '<a href="#" class="btn btn-sm btn-info" onclick="return pindahPanel('+no+', \'up\');"><i class="fa fa-arrow-left"></i> </a>'+
                            '<a href="#" class="btn btn-sm btn-success" onclick="return editPanel('+no+');"><i class="fa fa-edit"></i> </a>'+
                            '<a href="#" class="btn btn-sm btn-danger" onclick="return hapusPanel('+no+');"><i class="fa fa-times"></i> </a>'+
                            '</div>'+
                        '</div>'+
                        '</div>'+
                        '<div class="card-body"><a href="#" onclick="return editKontent('+no+');" class="label label-info"><i class="fa fa-edit"></i> Edit</a><br>'+
                        v.content+'</div>'+
                        '</div>'+
                        '</div>';
                        no++;
                    });
                }

		    	$("#footer_prev").html(htm);
		    },
		    error: function(xhr) {
				$("footer_prev").html(xhr.text);
		    }
		});
    }

    function editKontent(urutan) {
        $("#EditKontentUrutan").val(urutan);
        $("#EditKontentMode").val("edit");
        $.ajax({
		    type: "GET",
		    url: base_url+"admin/set_footer/detil_panel/"+urutan,
		    success: function(r, textStatus, jqXHR) {	
                $("#EditKontentIsi").val(r.data.content);
		    },
		    error: function(xhr) {
                console.log(xhr);
		    }
        });
        
        $("#mdlEditKontent").modal('show');
    
    }
    
    function tambahPanel() {
        $("#mode").val("add");
        $("#mdlTambahPanel").modal('show');
    }
    
    function editPanel(urutan) {
        $("#urutan").val(urutan);
        $("#mode").val("edit");

        $.ajax({
		    type: "GET",
		    url: base_url+"admin/set_footer/detil_panel/"+urutan,
		    success: function(r, textStatus, jqXHR) {	
                $("#nama_panel").val(r.data.header);
                $("#tipe").val(r.data.jenis);
		    },
		    error: function(xhr) {
                console.log(xhr);
		    }
		});

        $("#mdlTambahPanel").modal('show');
    }
    
    function pindahPanel(urutan, kemana) {
        $.ajax({
		    type: "GET",
		    url: base_url+"admin/set_footer/pindah_panel/"+urutan+"/"+kemana,
		    success: function(r, textStatus, jqXHR) {	
                if (r.success) {
                    gen_footer();        
                } else {
                    alert(r.message);
                }
		    },
		    error: function(xhr) {
                console.log(xhr);
		    }
        });
        return false;
    }

    function hapusPanel(urutan) {
        $.ajax({
            type: "GET",
            url: base_url + "index.php/admin/set_footer/hapus_panel?urutan="+urutan,
            success: function (r){
                if (r.success) {
                    gen_footer();        
                } else {
                    alert(r.message);
                }
            },
            error: function(xhr){
                console.log(xhr);
            }
        });
    }
</script>
