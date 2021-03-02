<h3 class="info_page">Setting Menu</h3>
<hr>

<style type="text/css">
    #result {
        position: absolute;
        width: 100%;
        max-width:870px;
        cursor: pointer;
        overflow-y: auto;
        max-height: 400px;
        box-sizing: border-box;
        z-index: 1001;
    }
    .link-class:hover{
        background-color:#f1f1f1;
    }
</style>

<div class="alert alert-info">
    Menu bisa terdiri dari beberapa tingkat sub sub menu, dan maksimal 4 level tingkatan sub menu. Pada halaman Admin, akan ditampilkan secara vertikal, dan di website utama akan ditampilkan horizontal (mendatar).
</div>

<div id="view_edit_menu"></div>

<div class="modal fade" id="mdlEditUrl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">URL</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form action="#" id="frmEditUrl" method="post">
                    <input type="hidden" name="id1" id="id1">
                    <input type="hidden" name="id2" id="id2">
                    <input type="hidden" name="id3" id="id3">
                    <input type="hidden" name="id4" id="id4">
                    <input type="hidden" name="mode" id="mode">
                    <div class="form-group">
                        <label for="">Icon Font-awesome</label>
                        <?=form_input('faicon', '', 'id="icon" class="form-control" ');?>
                        <ul class="list-group" id="result" autocomplete="off"></ul>
                    </div>
                    <div class="form-group">
                        <label for="">Teks URL</label>
                        <?=form_input('text', '', 'id="teks" class="form-control" required'); ?>
                    </div>
                    <div class="form-group">
                        <label for="">URL</label>
                        <?=form_input('href', '', 'id="href" class="form-control" required placeholder="ketikkan judul halaman.."'); ?>
                    </div>
                    <div class="form-group">
                        <label for="">Target</label>
                        <?=form_dropdown('target', array('_self'=>'Halaman Sendiri','_blank'=>'New Tab'),'', 'id="target" class="form-control" required placeholder="ketikkan judul halaman.."'); ?>
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

<script type="text/javascript">
    $(document).on('ready', function() {
        $('#href').typeahead({
            source: function (query, process) {
                return $.get('<?=base_url('admin/set_menu/get_hal');?>', { query: query }, function (data) {
                    return process(data);
                });
            },
            afterSelect: function(data) {
                $("#href").val(data.id);
            }
        });

        $('#icon').keyup(function(){
            $('#result').html('');
            $('#state').val('');

            var searchField = $('#icon').val();
            var expression = new RegExp(searchField, "i");

            $.getJSON(base_url + 'aset/admin_/fa.json', function(data) {
                $.each(data, function(key, value){
                    if (value.search(expression) != -1) {
                        $('#result').append('<li class="list-group-item link-class"><i class="fa '+value+'"></i> '+value+'</li>');
                    }
                });   
            });
        });

        $('#result').on('click', 'li', function() {
            var click_text = $(this).text().split('|');
            $('#icon').val("fa "+$.trim(click_text[0]));
            $("#result").html('');
        });


        load_awal();
    });

    $("#frmEditUrl").on('submit', function () {
        var data = $("#frmEditUrl").serialize();
        $.ajax({
            type: "POST",
            data: data,
            url: "<?=base_url();?>admin/set_menu/simpan",
            beforeSend: function(){
                $("#frmEditUrl input, select, button").attr("disabled", true);
            },
            success: function(r, textStatus, jqXHR) {    
                $("#frmEditUrl input, select, button").attr("disabled", false);
                if (r.success == false) {
                    alert(r.message);
                } else {
                    load_awal();
                    $("#mdlEditUrl").modal("hide");
                }
            },
            error: function(xhr) {
                $("#frmEditUrl input, select, button").attr("disabled", false);
                alert(xhr);
            }
        });
        return false;
    });
    
    function load_awal() {
        $.ajax({
            type: "GET",
            url: "<?=base_url();?>admin/set_menu/ajaks2",
            success: function(r, textStatus, jqXHR) {
                let html = '<a href="#" onclick="return edit(\'no\',\'no\',\'no\',\'no\',\'tambah\');" class="btn btn-success"><i class="fa fa-plus"></i> Tambah</a><br><br>';
                html += '<table class="table table-bordered table-sm table-hover">';


                if (r.length > 0) {
                    let no = 0;
                    $.each( r, function( a, b ) {
                        let url_edit_postingan = '';

                        if (b.href != "#" || b.href != "") {
                            let uri1 = b.href.replace('{{base_url}}', '');
                            let pc_uri1 = uri1.split("/");

                            if (pc_uri1.length > 1) {
                                url_edit_postingan = '<a href="'+base_url+'admin/berita/edit/'+pc_uri1[1]+'" class="btn btn-primary btn-sm" target="_blank">Edit Isi</a>';
                            }
                        }

                        let href_replace_base_url = b.href.replace("{{base_url}}", base_url);

                        html += '<tr>'+
                        '<td width="200px">'+
                        '<div class="btn-group" role="group">'+
                        '<a href="#" onclick="return edit('+no+');" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>'+
                        '<a href="#" onclick="return hapus('+no+');" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>'+
                        '<a href="#" onclick="return edit('+no+',\'no\',\'no\',\'no\',\'tambah\');" class="btn btn-sm btn-info"><i class="fa fa-plus"></i></a>'+ 
                        '<a href="#" onclick="return pindah('+no+', \'no\', \'no\', \'no\', \'up\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-up"></i></a>'+
                        '<a href="#" onclick="return pindah('+no+', \'no\', \'no\', \'no\', \'down\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-down"></i></a>'+
                        '</div>'+
                        '</td>'+
                        '<td colspan="4">'+
                            '<i class="'+b.icon+'"></i> '+b.text+
                            '&nbsp;<a href="'+href_replace_base_url+'" target="_blank">'+href_replace_base_url+'</a>&nbsp;'+
                            url_edit_postingan+
                        '</td></tr>';
                        
                        if (typeof b.children !== "undefined") {
                            let no2 = 0;
                            $.each( b.children, function( c, d ) {
                                let url_edit_postingan = '';
                                if (d.href != "#" || d.href != "") {
                                    let uri1 = d.href.replace('{{base_url}}', '');
                                    let pc_uri1 = uri1.split("/");

                                    if (pc_uri1.length > 1) {
                                        url_edit_postingan = '<a href="'+base_url+'admin/berita/edit/'+pc_uri1[1]+'" class="btn btn-primary btn-sm" target="_blank">Edit Isi</a>';
                                    }
                                }
                                let href_replace_base_url = d.href.replace("{{base_url}}", base_url);

                                html += '<tr>'+
                                '<td width="200px">'+
                                '<div class="btn-group" role="group">'+
                                '<a href="#" onclick="return edit('+no+', '+no2+');" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>'+
                                '<a href="#" onclick="return hapus('+no+', '+no2+');" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>'+
                                '<a href="#" onclick="return edit('+no+', '+no2+',\'no\',\'no\',\'tambah\');" class="btn btn-sm btn-info"><i class="fa fa-plus"></i></a>'+ 
                                '<a href="#" onclick="return pindah('+no+', '+no2+', \'no\', \'no\', \'up\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-up"></i></a>'+
                                '<a href="#" onclick="return pindah('+no+', '+no2+', \'no\', \'no\', \'down\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-down"></i></a>'+
                                '</div>'+
                                '</td>'+
                                '<td style="width: 30px">--</td>'+
                                '<td colspan="3">'+
                                    '<i class="'+d.icon+'"></i> '+d.text+
                                    '&nbsp;<a href="'+href_replace_base_url+'" target="_blank">'+href_replace_base_url+'</a>&nbsp;'+
                                    url_edit_postingan+
                                '</td></tr>';

                                if (typeof d.children !== "undefined") {
                                    let no3 = 0;
                                    $.each( d.children, function( e, f ) {
                                        let url_edit_postingan = '';
                                        if (typeof f.href !== "undefined" && f.href != "#" && f.href != "") {
                                            let uri1 = f.href.replace('{{base_url}}', '');
                                            let pc_uri1 = uri1.split("/");

                                            if (pc_uri1.length > 1) {
                                                url_edit_postingan = '<a href="'+base_url+'admin/berita/edit/'+pc_uri1[1]+'" class="btn btn-primary btn-sm" target="_blank">Edit Isi</a>';
                                            }
                                        }
                                        let href_replace_base_url = f.href.replace("{{base_url}}", base_url);

                                        html += '<tr>'+
                                        '<td width="200px">'+
                                        '<div class="btn-group" role="group">'+
                                        '<a href="#" onclick="return edit('+no+', '+no2+', '+no3+');" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>'+
                                        '<a href="#" onclick="return hapus('+no+', '+no2+', '+no3+');" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>'+
                                        '<a href="#" onclick="return edit('+no+', '+no2+', '+no3+',\'no\',\'tambah\');" class="btn btn-sm btn-info"><i class="fa fa-plus"></i></a>'+ 
                                        '<a href="#" onclick="return pindah('+no+', '+no2+', '+no3+', \'no\', \'up\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-up"></i></a>'+
                                        '<a href="#" onclick="return pindah('+no+', '+no2+', '+no3+', \'no\', \'down\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-down"></i></a>'+
                                        '</div>'+
                                        '</td>'+
                                        '<td style="width: 30px">--</td><td style="width: 30px">--</td>'+
                                        '<td colspan="3">'+
                                            '<i class="'+f.icon+'"></i> '+f.text+
                                            '&nbsp;<a href="'+href_replace_base_url+'" target="_blank">'+href_replace_base_url+'</a>&nbsp;'+
                                            url_edit_postingan+
                                        '</td></tr>';

                                        if (typeof f.children !== "undefined" && f.children !== null) {
                                            let no4 = 0;
                                            $.each( f.children, function( g, h) {
                                                let url_edit_postingan = '';
                                                if (h.href != "#" || h.href != "") {
                                                    let uri1 = h.href.replace('{{base_url}}', '');
                                                    let pc_uri1 = uri1.split("/");

                                                    if (pc_uri1.length > 1) {
                                                        url_edit_postingan = '<a href="'+base_url+'admin/berita/edit/'+pc_uri1[1]+'" class="btn btn-primary btn-sm" target="_blank">Edit Isi</a>';
                                                    }
                                                }
                                                let href_replace_base_url = h.href.replace("{{base_url}}", base_url);

                                                html += '<tr>'+
                                                '<td width="200px">'+
                                                '<div class="btn-group" role="group">'+
                                                '<a href="#" onclick="return edit('+no+', '+no2+', '+no3+', '+no4+');" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>'+
                                                '<a href="#" onclick="return hapus('+no+', '+no2+', '+no3+', '+no4+');" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>'+
                                                // '<a href="#" onclick="return edit('+no+', '+no2+', '+no3+', '+no4+',\'tambah\');" class="btn btn-sm btn-info"><i class="fa fa-plus"></i></a>'+ 
                                                '<a href="#" onclick="return pindah('+no+', '+no2+', '+no3+', '+no4+', \'up\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-up"></i></a>'+
                                                '<a href="#" onclick="return pindah('+no+', '+no2+', '+no3+', '+no4+', \'down\');" class="btn btn-sm btn-primary"><i class="fa fa-arrow-down"></i></a>'+
                                                '</div>'+
                                                '</td>'+
                                                '<td style="width: 30px; text-align: center">--</td><td style="width: 30px; text-align: center">--</td><td style="width: 30px; text-align: center">--</td>'+
                                                '<td >'+
                                                    '<i class="'+h.icon+'"></i> '+h.text+
                                                    '&nbsp;<a href="'+href_replace_base_url+'" target="_blank">'+href_replace_base_url+'</a>&nbsp;'+
                                                    url_edit_postingan+
                                                '</td></tr>';
                                                no4++;
                                            // end FOREACH
                                            });
                                        // end IF
                                        }
                                        no3++;
                                    // end FOREACH
                                    });
                                // end IF
                                }
                                no2++;
                            // end FOREACH
                            });
                        // end IF
                        }
                        no++;
                    });
                }

                html += '</table>';

                $("#view_edit_menu").html(html);
            },
            error: function(xhr) {
                $("#view_edit_menu").html(xhr);
            }
        });
    }

    function edit(id1,id2="no",id3="no",id4="no",mode="edit") {
        var id = "?id1="+id1+"&id2="+id2+"&id3="+id3+"&id4="+id4+"&mode="+mode;
        $("#frmEditUrl > #id1").val(id1);
        $("#frmEditUrl > #id2").val(id2);
        $("#frmEditUrl > #id3").val(id3);
        $("#frmEditUrl > #id4").val(id4);
        $("#frmEditUrl > #mode").val(mode);

        $.ajax({
            type: "GET",
            url: "<?=base_url();?>admin/set_menu/edit/" + id,
            beforeSend: function(){
                // $("#view_edit_menu").html('loading..')
            },
            success: function(r, textStatus, jqXHR) {   
                console.log(r); 
                $("#teks").val(r.text);
                $("#href").val(r.href);
                $("#target").val(r.target);
                $("#icon").val(r.icon);
                // $("#view_edit_menu").html(r);
            },
            error: function(xhr) {
                // $("#view_edit_menu").html(xhr);
            }
        });

        $("#mdlEditUrl").modal('show');
        return false;
    }
    function hapus(id1,id2="no",id3="no",id4="no") {
        if (confirm('Yakin dihapus..?')) {
            var id = "?id1="+id1+"&id2="+id2+"&id3="+id3+"&id4="+id4;

            $.ajax({
                type: "GET",
                url: "<?=base_url();?>admin/set_menu/hapus/" + id,
                beforeSend: function(){
                    // $("#view_edit_menu").html('loading..')
                },
                success: function(r, textStatus, jqXHR) {   
                    if (r.success == false) {
                        alert(r.message);
                    } else {
                        load_awal();
                    }
                },
                error: function(xhr) {
                    alert(xhr);
                }
            });
        }

        return false;
    }
    function pindah(id1,id2="no",id3="no",id4="no",mode="up") {
        var id = "?id1="+id1+"&id2="+id2+"&id3="+id3+"&id4="+id4+"&mode="+mode;

        $.ajax({
            type: "GET",
            url: "<?=base_url();?>admin/set_menu/pindah/" + id,
            beforeSend: function(){
                // $("#view_edit_menu").html('loading..')
            },
            success: function(r, textStatus, jqXHR) {   
                if (r.success == false) {
                    alert(r.message);
                } else {
                    load_awal();
                }
            },
            error: function(xhr) {
                alert(xhr);
            }
        });
        return false;
    }
</script>
