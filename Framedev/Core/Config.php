<?php
define('DEVELOPMENT', true, true);
define('DIR_FILES','/var/www/framedev',true);

define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'framework');
define('DB_USER', 'root');
define('DB_PASS', 'kls2qr824');

//define('DB_TYPE', 'sqlsrv');
//define('DB_HOST', 'localhost');
//define('DB_NAME', 'framedev');
//define('DB_USER', 'sa');
//define('DB_PASS', 'M3dpr3v@');

define('DOMAIN','framedev.server');
define('URL_APP','http://'.DOMAIN.'/',true);
define('SITE_NAME',' FRAMEDEV ',true);
define('SLOGAN_NAME','Framework Sinergético',true);


/*Configuracion para envio de correo via perl mail*/
define('MAIL_HOST','smtp.gmail.com');
define('MAIL_USERNAME','XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
define('MAIL_PASSWORD','XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
define('MAIL_FROM','XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

/*SOCKET_PROVIDER: PUSHER*/
define('PUSHER_APP_ID','414020',false);
define('PUSHER_KEY','6187333c14701db03748',false);
define('PUSHER_SECRET','e63de62ed7ffc48a11e2',false);
define('PUSHER_COUSTER','mt1',false);
define('PUSHER_PRESENCE','presence-activos',false);


/*Zona horaria*/
date_default_timezone_set('America/Mexico_City');

/*Variables*/
define('URL_MAIN','../',true);
define('URL_CONTROLADOR','../Framedev/Controladores/',true);
define('URL_MODELO','../Framedev/Modelos/',true);
define('URL_MIDDLEWARE','../Framedev/Middleware/',true);
define('URL_VISTA','../vistas/',true);
define('URL_TEMPLATE','../vistas/plantilla/',true);
define('SITE','../vistas/site/',true);
define('URL_PUBLIC',URL_APP.'',true);


/*Móvil*/
define('URL_TEMPLATE_FW7','../vistas/framework7/',true);
define('FW7',URL_PUBLIC.'fw7/',true);
define('MATERIAL',URL_PUBLIC.'material/',true);

//API DE GOOGLE MAPS
define('GOOGLE_MAPS','AIzaSyCLDNq5LCDnXW8-EdG9aUZIpAmi7uKcnKk',false);
?>
