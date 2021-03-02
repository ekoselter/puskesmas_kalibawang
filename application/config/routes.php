<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'web';
$route['rss'] = 'web/rss';

$route['detil/(:num)/(:any)'] = 'web/detil/$1/$2';
$route['category'] = 'web/category';
$route['category/hal'] = 'web/category/hal';
$route['category/hal/(:num)'] = 'web/category/hal/$1';
$route['category/(:num)/(:any)'] = 'web/category/$1/$2';
$route['category/(:num)/(:any)/hal/(:num)'] = 'web/category/$1/$2/hal/$3';
$route['category/(:num)/(:any)/hal'] = 'web/category/$1/$2/hal';


$route['galleri'] = 'web/galleri';
$route['galleri-detil/(:num)/(:any)'] = 'web/galleri_detil/$1/$2';

$route['agenda'] = 'web/agenda';
$route['agenda-detil/(:num)/(:any)'] = 'web/agenda_detil/$1/$2';

$route['cari'] = 'web/cari';


$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;



