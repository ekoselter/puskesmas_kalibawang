//console.log(base_url);

function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

function hanya_angka() {
	var charCode = (event.which) ? event.which : event.keyCode
	if ((charCode >= 48 && charCode <= 57) || charCode == 46 || charCode == 44)
		return true;
	return false;
}

function pad(n, width, z) {
	z = z || '0';
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

/* form function */
function f_open(aksi, tambah) {
	return '<form method="post" accept-charset="utf-8" action="'+aksi+'" '+tambah+'/>';
}
function f_input(nama, valu, tambah) {
	return '<input type="text" name="'+nama+'" value="'+valu+'" '+tambah+' />';
}
function f_hidden(nama, valu, tambah) {
	return '<input type="hidden" name="'+nama+'" value="'+valu+'" '+tambah+' />';
}
function f_select(nama, pil, valu, tambah) {
	var teks = '<select name="'+nama+'" '+tambah+'>';
	for	(index = 0; index < pil.length; index++) {
		if (valu == pil[index][0]) {
			teks += '<option value="'+pil[index][0]+'" selected>'+pil[index][1]+'</option>';
		} else {
			teks += '<option value="'+pil[index][0]+'">'+pil[index][1]+'</option>';
		}
	}
	teks += '</select>';
	return teks;
}
/* end form function */


/* setting menu */
function tampil_menu() {
	$.ajax({
		type: "GET",
    	dataType: "json",
		url: base_url+"api/menu",
		success: function(data) {
			$("#tampilkan").html(data.tampil);
		}	
	});
}


function edit_menu(mode,id,mode2) {
	$('#m_menu').modal('show');

	$.ajax({
		type: "GET",
    	dataType: "json",
		url: base_url+"api/menu/det/"+id+"/"+mode+"/"+mode2,
		success: function(data) {
			$("#id").val(data.id);
			$("#kode").val(data.kode);
			$("#mode").val(data.mode);
			$("#nama").val(data.nama);
			$("#ikon").val(data.ikon);
			$("#url").val(data.url);
			$("#nama").focus();
		}	
	});
	return false;
}

function hapus_menu(id) {
	if (confirm('Anda yakin..?')) {
		$.ajax({
			type: "GET",
	    	dataType: "json",
			url: base_url+"api/menu/hapus/"+id,
			success: function(data) {
				if (data.status == "ok") {
					tampil_menu();
				} else {
					alert('gagal');
				}
			}	
		});
	}
	return false;
}

function simpan_menu() {
	var f_asal	= $("#f_menu");
	var form	= getFormData(f_asal);
	$.ajax({		
		type: "POST",
		url: base_url+"api/menu/simpan",
		data: JSON.stringify(form),
		dataType: 'json',
		contentType: 'application/json; charset=utf-8'
	}).done(function(response) {
		if (response.status == "ok") {
			$('#m_menu').modal('hide');
			tampil_menu();
		} else {
			console.log('gagal');
		}
	});
	return false;
}


$(document).ready(function() {
	

});