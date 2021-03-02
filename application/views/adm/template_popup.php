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
	<link href="<?php echo base_url(); ?>aset/admin_/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>aset/admin_/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>aset/admin_/css/style.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>aset/admin_/css/green.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>aset/admin_/js/summernote/summernote.css" rel="stylesheet">
	<style type="text/css">
	.table-form, .table-form tr, .table-form tr td { border: none; }
	th {text-align: center; background: #eee;}
	.ctr { text-align: center }
    .form-control {width: 100% !important}
	</style>
	<script type="text/javascript">
	var base_url = "<?php echo base_url(); ?>";
	</script>
	<script src="<?php echo base_url(); ?>aset/admin_/js/jquery.js"></script>
	<script src="<?php echo base_url(); ?>aset/admin_/js/bootstrap.min.js"></script>
    <!-- <script src="<?php echo base_url(); ?>aset/admin_/js/summernote/summernote.js"></script> -->
    <!-- <script src="<?php echo base_url(); ?>aset/admin_/js/summernote/summernote-cleaner.js"></script> -->
    <script src="https://ppid.kulonprogokab.go.id/cdn/tinymce/tinymce.min.js"></script>
    
    <script type="text/javascript">
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
                url: "<?=base_url('adm/save_file_summernote');?>",
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
        $(document).on("ready", function() {
            tinymce.init({
                selector: '.summernote',
                height: 500,
                menubar: false,
                relative_urls: false,
                convert_urls: false,
                images_upload_url: '<?=base_url('adm/save_file_summernote');?>',
                plugins: [
                    'advlist autolink lists link image charmap print preview anchor textcolor',
                    'searchreplace visualblocks code fullscreen',
                    'insertdatetime media table paste code help wordcount example paste'
                ],
                toolbar: 'undo redo | paste | formatselect | bold italic underline | backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | image link | code example | help',
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
          // Adds a menu item, which can then be included in any menu via the menu/menubar configuration
          editor.ui.registry.addMenuItem('example', {
            text: 'Example plugin',
            onAction: function() {
              // Open window
              openDialog();
            }
          });
          return {
            getMetadata: function () {
              return  {
                name: "Example plugin",
                url: "http://exampleplugindocsurl.com"
              };
            }
          };
        });
    </script>
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
<body class="col-md-12"  style="background: #fff">
    <div class="">
    <form action="#" method="post" id="frmEditPage">
        <input type="hidden" name="id_page" value="<?=$this->uri->segment(3);?>">
        <div class="form-group">
            <label for="">Judul</label>
            <?=form_input('judul', $judul, 'class="form-control" required'); ?>
        </div>
        <div class="form-group">
            <label for="">Isi</label>
            <br>
            <a href="https://nanggulan.kulonprogokab.go.id/adm/get_dir" onclick="mywindow=window.open(this.href,'targetWindow','toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=0, width=600,height=600');mywindow.moveTo(750, 0);return false;" class="btn btn-success btn-xs">Buka File Manager</a>
            <br><br>
            <?=form_textarea('content_page', $konten, 'class="form-control summernote"'); ?>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success">Simpan</button>
        </div>
    </form>
    </div>
    
    <script type="text/javascript">
        $("#frmEditPage").on("submit", function() {
            tinyMCE.triggerSave();
            var fdata = $("#frmEditPage").serialize();
            $.ajax({
                type: "POST",
                data: fdata,
                url: "<?=base_url('api/savepage');?>",
                beforeSend: function(){
                    $("#frmEditPage input, select, button").attr("disabled", true);
                    console.log(fdata);
                },
                success: function(r, textStatus, jqXHR) {   
                    $("#frmEditPage input, select, button").attr("disabled", false);
                    if (r.success == false) {
                        alert(r.message);
                    } else {
                        window.opener.$("#url").val(r.data);
                        window.close();
                        // var p = parent.document.$("#url").val(r.data);
                        // console.log(p);

                        // $("#url").val(r.data);
                    }
                },
                error: function(xhr) {
                    $("#frmEditPage input, select, button").attr("disabled", false);
                    alert(r.message);
                }
            });
            // window.close();
            return false;
        });
    </script>
</body>
</html>
