<?
$globalconfig = array(
	'dbsettings' => array(
		'hostname'=>'localhost',
		'username'=>'root',
		'password'=>'',
		'database'=>'showofhands',
		'port'=>'3306'
	),
	'issubsite' => FALSE,
	'live' => TRUE,
	'libraries' => array(
		'db'=>array('db','dbi.php'),
		'ses'=>array('sessionWorks','sessionworks.php'),
		'site'=>array('siteWorks','siteworks.php'),
		'excp'=>array('myException','exception.php')
	),
	'session' => array(
		'prefix'=>'plain_'
	),
	'cookie' => array(
		'prefixC'=>'plainC_',
		'idletime'=>7200,
		'expire'=>172800
	),
	'images' => array(
		'big_image_width'=>600,
		'big_image_height'=>0,
		'big_image_type'=>'biggest',
		'cms_thumb_width'=>200,
		'cms_thumb_height'=>0,
		'cms_thumb_type'=>'width',
		'cmseditor_thumb_width'=>645,
		'cmseditor_thumb_height'=>185,
		'cmseditor_thumb_type'=>'centerCrop',
		'news_thumb_width'=>164,
		'news_thumb_height'=>164,
		'news_thumb_type'=>'centerCrop',
		'news_listing_width'=>106,
		'news_listing_height'=>106,
		'news_listing_type'=>'centerCrop',
		'feature_listing_width'=>90,
		'feature_listing_height'=>67,
		'feature_listing_type'=>'centerCrop',
		'feature_thumb_width'=>309,
		'feature_thumb_height'=>164,
		'feature_thumb_type'=>'centerCrop',
		'header_image_width'=>1920,
		'header_image_height'=>600,
		'header_image_type'=>'header',
		'social_image_width'=>1024,
		'social_image_height'=>0,
		'social_image_type'=>'biggest'
			
	),
	'staticcontent' => array(
		'admin_email'=>'info!@', 
		'contactus' => 2,
		'meta_gallery' => 4
		
	),	
	'contenttables' => array(
		'0'=>'cmspage',
		'1'=>'news'
	),
	'bitly' => array(
		'username'=>'onlineinnovations',
		'apiKey'=>'R_ac15e9d58debfab3d5f7248f6bf61088'
	),
	'email' => array(
		'smtp_host'=>'127.0.0.1',
		'_headers'=>array('info@showofhands.co.za'),
		'smtp_user'=>'',
		'smtp_pass'=>''
	)
);

define("OI_IMAGES_WIDTH",$globalconfig['images']['cmseditor_thumb_width']);
define("OI_IMAGES_HEIGHT",$globalconfig['images']['cmseditor_thumb_height']);
define("OI_IMAGES",$globalconfig['images']['cms_thumb_width']);
define("OI_LIVE",$globalconfig['live']);

define('DIR_EFP', '/secure/tinymce/plugins/filemanager/');
define('DIR_EP', '/secure/tinymce/plugins/filemanager/plugin.min.js');

$editer_base_url="http://localhost/showofhands"; 
$editer_upload_dir = '/assets/'; // path from base_url to upload base dir
$editer_current_path = '../../../../assets/'; // relative path from filemanager folder to upload files folder
$editor_thumbs_base_path = '../../../../thumbs/';

$globalthumbwidth = $images['cms_thumb_width'];
?>