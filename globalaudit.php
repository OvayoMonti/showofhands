<?
//Audit Log Tables
$tables = array(
	"cmspage" => array(
		array(
			"idCol" => "pageid",
			"titleCol" => "heading",
			"module" => "Content Pages"
		)
	),
	
	"news" => array(
		array(
			"idCol" => "newsid",
			"titleCol" => "title",
			"module" => "News"
		)
	),
	
	"events" => array(
		array(
			"idCol" => "newsid",
			"titleCol" => "title",
			"module" => "Events"
		)
	),
	
	"cmsfeatures" => array(
		array(
			"idCol" => "featureid",
			"titleCol" => "title",
			"module" => "Front Page Features"
		)
	),
	
	"gallery" => array(
		array(
			"idCol" => "galleryid",
			"titleCol" => "galleryname",
			"module" => "Gallery Categories"
		)
	),
	
	"gallery_photos" => array(
		array(
			"idCol" => "photoid",
			"titleCol" => "filename",
			"module" => "Gallery Images"
		)
	),
	
	"cmsdocumentcategory" => array(
		array(
			"idCol" => "docid",
			"titleCol" => "doccatname",
			"module" => "Document Library Categories"
		)
	),
	
	"cmsdocuments" => array(
		array(
			"idCol" => "docid",
			"titleCol" => "title",
			"module" => "Document Library Files"
		)
	),
	
	"cmsheadercategory" => array(
		array(
			"idCol" => "id",
			"titleCol" => "categoryname",
			"module" => "Signature Image Categories"
		)
	),
	
	"cmsmenu" => array(
		array(
			"idCol" => "menuid",
			"titleCol" => "menuname",
			"module" => "Content Menus"
		)
	),
	
	"cmsimages" => array(
		array(
			"idCol" => "id",
			"titleCol" => "filename",
			"module" => "Content Images"
		)
	),
	
	// Custom Script
	"cmsrelated" => array(
		array(
			"idCol" => "id",
			"module" => "Related Pages"
		),
		array(
			array('type'=>'page','table'=>'cmspage'),
			array('type'=>'news','table'=>'news'),
			array('type'=>'gallery','table'=>'gallery'),
			array('type'=>'event','table'=>'cmsevent')
		)
	)
		
);

?>