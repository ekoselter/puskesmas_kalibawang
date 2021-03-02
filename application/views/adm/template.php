<!DOCTYPE html>
<html lang="en"> <!--<![endif]-->
<head>
    <title>Halaman Admin</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <!-- JS Global Compulsory -->
    <!-- Javascript files -->
    <!-- jQuery -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
    <link href="<?=base_url();?>aset/admin_/bootstrap.min.css" rel="stylesheet">

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/css/style.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/css/green.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/js/jui/jquery-ui.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/js/tag/bootstrap-tagsinput.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/js/summernote/summernote.css" rel="stylesheet"> -->
    <!-- <link href="<?php echo base_url(); ?>aset/admin_/js/menu-editor/bs-iconpicker/css/bootstrap-iconpicker.min.css" rel="stylesheet"> -->
    <!-- <link id="bsdp-css" href="https://uxsolutions.github.io/bootstrap-datepicker/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"> -->
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" /> -->
    <style type="text/css">
        .table-form, .table-form tr, .table-form tr td { border: none; }
        th {text-align: center; background: #eee;}
        .ctr { text-align: center }
        .form-control {width: 100% !important}
        .mb-2 {margin-bottom: 10px}
    </style>
    <script type="text/javascript">
    base_url = "<?php echo base_url(); ?>";
    </script>
    <script src="<?php echo base_url(); ?>aset/admin_/js/jquery.js"></script>
    <script src="<?=base_url();?>aset/admin_/bootstrap.bundle.min.js"></script>
    <?php 
    if ($_SERVER['HTTP_HOST'] == "localhost") {
    ?>
    <script src="https://ppid.kulonprogokab.go.id/cdn/tinymce/tinymce.min.js"></script>
    <?php 
    } else {
    ?>
    <script src="https://ppid.kulonprogokab.go.id/cdn/tinymce/tinymce.min.js"></script>
    <?php } ?>
    
    <script src='<?php echo base_url(); ?>aset/admin_/js/bootstrap3-typeahead.min.js'></script>
    
    <style type="text/css">
        .panel-body ul {
            margin-top: 10px;
            /*margin-left: -25px;*/
        }
        .panel-body ul {
            list-style: none;
        }
        .panel-body ul li a {
            font-size: 14px;
        }
    </style>
</head>
<body class="">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<?=base_url('adm');?>">adminPANEL</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item "><a class="nav-link" href="<?php echo base_url(); ?>adm"><i class="fa fa-home"> </i> Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-globe"> </i> Website</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/berita"><i class="fa fa-rss"> </i> Berita & Artikel</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/agenda"><i class="fa fa-calendar"> </i> Agenda</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/topik"><i class="fa fa-tags"> </i> Topik</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/galleri"><i class="fa fa-picture-o"> </i> Galleri</a>
                    </div>
                </li>
                <li class="nav-item "><a class="nav-link" href="<?php echo base_url(); ?>admin/ppid"><i class="fa fa-bullhorn"> </i> e-PPID</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-wrench"> </i> Setting</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/set_menu">Menu</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/layout">Layout Website</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>adm/website">Website</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/set_header">Header Website</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/set_footer">Footer Website</a>
                        <a class="dropdown-item" href="<?php echo base_url(); ?>admin/pengguna">User Manager</a>
                    </div>
                </li>
                <li class="nav-item "><a class="nav-link" href="<?php echo base_url(); ?>" target="_blank"><i class="fa fa-globe"></i> Lihat Web</a></li>
            </ul>


            <form class="form-inline my-2 my-lg-0">
                <a class="btn btn-outline-success my-2 my-sm-0" href="<?php echo base_url(); ?>adm/logout" type="submit">Logout</a>&nbsp;
                <button class="btn btn-outline-success my-2 my-sm-0" id="btn-file-manager">File Manager</button>
            </form>
        </div>
    </nav>

    <!--=== Content Part ===-->
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12 mt-3" id="main-bar">
                <?php $this->load->view('adm/'.$p); ?>
            </div><!--/container-->

            <div id="fm-bar">
                <div class="card mt-2">
                    <div class="card-body">
                        <legend>Upload File</legend>
                        <div class="alert alert-info">File diperbolehkan : <?=str_replace("|", ", ", ("jpg|gif|png|doc|docx|xls|xlsx|zip|pdf"));?></div>
                        <form action="<?=base_url('adm/save_file');?>" method="post" enctype="multipart/form-data" class="form" id="fm_form" onsubmit="return fm_do_upload();">
                            <div class="form-group">
                                <label for="">Filenya</label>
                                <?=form_upload('file_upload', '', 'class="form-control" id="form_file_upload" onchange="return isi_nama_file(this);" required');?>
                            </div>
                            <div class="form-group">
                                <label for="">Nama File</label>
                                <?=form_input('nama_file', '', 'class="form-control" id="nama_file"');?>
                            </div>
                            <button type="submit" class="btn btn-success">Upload</button>
                            
                        </form>
                        </fieldset>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header" id="fm_pagination"></div>
                    <div class="card-body" id="load-fm">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Content Part -->
    <!--=== Copyright ===-->
    <div class="col-md-12">
        <div class="row">
            <div class="col-lg-12 pt-3 pb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="float-left">Versi 3.1</div>
                        <div class="float-right">2020 &copy; Admin Website Panel :: Pemkab Kabupaten Kulon Progo </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=== End Copyright ===-->
    <script type="text/javascript"> 
        $(document).on("ready", function() {   
            if (localStorage.getItem("fm_show") && localStorage.getItem("fm_show") == "true") {
                show_fm();
            } else {
                hide_fm();
            }
            
            tinymce.init({
                selector: '.summernote',
                height: 500,
                menubar: false,
                relative_urls: false,
                convert_urls: false,
                images_upload_url: base_url + 'adm/save_file_summernote',
                plugins: [
                    'advlist autolink lists link image charmap print preview anchor',
                    'searchreplace visualblocks code fullscreen',
                    'insertdatetime media table paste code help wordcount example paste'
                ],
                toolbar: 'undo redo | paste | formatselect | bold italic underline | backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | image link | code example | help | media',
                
                media_poster: true,
                media_live_embeds: true
            });

            
            if (localStorage.getItem("DontShow")) {
                $("#ModalInfoBerita").modal('hide');
            } else {
                $("#ModalInfoBerita").modal('show');
            }
            $(document).on("click", "#forgetMeBerita", function() {
                localStorage.setItem("DontShow", "true");
                $("#ModalInfoBerita").modal('hide');
            });
        });


        tinymce.PluginManager.add('example', function(editor, url) {
          var openDialog = function () {
            return editor.windowManager.open({
              title: 'Tambahkan File Google Drive',
              body: {
                type: 'panel',
                items: [
                  {
                    type: 'textarea',
                    name: 'title',
                    label: 'Pastekan scriptnya'
                  }
                ]
              },
              buttons: [
                {
                  type: 'cancel',
                  text: 'Close'
                },
                {
                  type: 'submit',
                  text: 'Save',
                  primary: true
                }
              ],
              onSubmit: function (api) {
                var data = api.getData();
                // Insert content when the window form is submitted
                editor.insertContent(data.title);
                api.close();
              }
            });
          };
          
          // Add a button that opens a window
          editor.ui.registry.addButton('example', {
            icon: 'plus',
            text: 'Tambah G-Drive',
            onAction: function () {
              // Open window
              openDialog();
            }
          });

        });

        $(document).on("click", "#btn-file-manager", function() {
            var status_fm = localStorage.getItem('fm_show');

            if (status_fm == "true") {
                hide_fm();
            } else {
                show_fm();
            }
        });

        function show_fm() {
            localStorage.setItem("fm_show", "true");
            $("#main-bar").removeClass('col-md-12');
            $("#main-bar").addClass('col-md-9');
            $("#fm-bar").addClass('col-md-3');
            $("#fm-bar").show();

            load_fm(base_url + 'index.php/admin/file_manager/paginate');
        }

        function hide_fm() {
            localStorage.setItem("fm_show", "false");
            $("#main-bar").removeClass('col-md-9');
            $("#main-bar").addClass('col-md-12');
            $("#fm-bar").hide();
            $("#fm-bar").removeClass('col-md-3');
        }

        function isi_nama_file(e) {
            var fileName = $("#form_file_upload").val().split('\\').pop();
            $("#nama_file").val(fileName);
        }

        function fm_do_upload() {
            var form = $("#fm_form");
            var formdata = false;
            if (window.FormData){
                formdata = new FormData(form[0]);
            }

            var formAction = form.attr('action');

            var data    = $(this).serialize();

            $.ajax({
                type: "POST",
                data: formdata ? formdata : data,
                cache: false,
                contentType: false,
                processData : false,
                url: base_url + "index.php/admin/file_manager/save_file",
                beforeSend: function(){
                    $("#frm_form input, select, button").attr("disabled", true);
                },
                success: function(r, textStatus, jqXHR) {
                    $("#frm_form input, select, button").attr("disabled", false);
                    if (r.success == false) {
                        alert(r.message);
                    } else {
                        alert(r.message);
                        load_fm(base_url + 'index.php/admin/file_manager/paginate');
                    }
                },
                error: function(xhr) {
                    $("#frm_form input, select, button").attr("disabled", false);
                    alert(xhr);
                }
            });
            return false;
        }


        $(document).on('click', '.fm-page-link', function (event) {
            var tautan = $(this).attr('href');
            console.log(tautan);
            load_fm(tautan);
            return false;
        });

        function copy_alamat(alamat) {
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val(alamat).select();
            document.execCommand("copy");
            $temp.remove();

            alert(alamat + " tercopy. Silakan tinggal di paste..");
            return false;
        };

        function hapus_fm(id) {
            if (confirm('Anda yakin..?')) {
                $.get(base_url + 'index.php/admin/file_manager/hapus/'+id, function(data) {
                    if (data.success) {
                        alert(data.message);
                        load_fm(base_url + 'index.php/admin/file_manager/paginate');
                    } else {
                        alert(data);
                    }

                });
            }
            return false;
        }
        function load_fm(url) {
            $.ajax({
                url: url,
                type: 'GET',
            })
            .done(function(r) {
                // console.log(r.tabel);
                $("#load-fm").html(r.tabel);
                $("#fm_pagination").html(r.link);
            })
            .fail(function() {
                console.log("error");
            });
            
        }

        function popupwindow(url, title, w, h) {
            wLeft = window.screenLeft ? window.screenLeft : window.screenX;
            wTop = window.screenTop ? window.screenTop : window.screenY;

            var left = wLeft + (window.innerWidth / 2) - (w / 2);
            var top = wTop + (window.innerHeight / 2) - (h / 2);
            return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        }
        
        function sendFile(file, el) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: base_url + "adm/save_file_summernote",
                cache: false,
                contentType: false,
                processData: false,
                success: function(url) {
                    if (url.success) {
                        $(el).summernote('editor.insertImage', url.url);
                    } else {
                        alert(url.url);
                    }
                }
            });
        }
    </script>
</div><!--/wrapper-->
</body>
</html>
