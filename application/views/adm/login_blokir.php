<!DOCTYPE html>
<html lang="en"> <!--<![endif]-->  
<head>
    <title>adminPANEL</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	
    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <!-- CSS Global Compulsory -->
    <link href="<?=base_url();?>aset/admin_/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
        body {
            background: url(<?=base_url();?>aset/admin_/img/bgadmin.webp);
            background-size: cover;
        }
	</style>
</head> 
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header text-center"><h2>Login ke adminPANEL</h2></div>
                <div class="card-body">
                    <div class="alert alert-danger col-md-12">
                        <p>Anda sudah gagal login selama 3x. Silakan kembali lagi setelah <?=$sisa_waktu;?> menit. </p>
                        <p>Atau hubungi call-center Dinas Kominfo Kabupaten Kulon Progo</p>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <a href="<?php echo base_url(); ?>" class="text-center new-account">Aplikasi oleh Dinas Kominfo Kabupaten Kulon Progo</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">&nbsp;</div>
    </div>
</div>
</body>
</html>	
