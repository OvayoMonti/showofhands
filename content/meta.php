<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>    
    <base href="<?=$baseurl?>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><?=$metadata['title']?></title>
    <meta name="keywords" content="<?=$metadata['keywords']?>"/>
    <meta name="description" content="<?=$metadata['description']?>"/>
    <link rel="icon" href="../images/favicon.png" type="../images/x-icon" />

    <!-- General -->
    <link href="../css/stylesheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery/jquery-1.7.1.min.js" language="javascript"></script>
        
	<script type="text/javascript" src="../js/jquery/jquery.easing.1.3.js" language="javascript"></script>
    <script type="text/javascript" src="../js/jquery/liteaccordion.jquery.js" language="javascript"></script>        
	<script type="text/javascript" src="../js/main.js" language="javascript"></script>        
       
    <!-- Fancybox -->
	<script type="text/javascript" src="../js/fancybox2/source/jquery.fancybox.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="../js/fancybox2/source/jquery.fancybox.css?v=2.1.5" media="screen" />
    
    <!-- General -->
    <script type="text/javascript">
    $(document).ready(function()
    {
        //creates fancybox for thumbnails for WYSIWYG editor
        $('img').filter(function() {
           return (/_CMSthumbclick/i).test($(this).attr('src'));
        }).wrap(function() {
            return "<a href='" + this.src.replace(/_CMSthumbclick/i, "") + "' class='fancybox'/>";
        })
    
        $("a[class^='fancybox']").fancybox({
		helpers     : {
        title: {
            type: 'inside'
        }
    	}});
        
        $("a[rel^='OIPhotos']").fancybox({
		helpers     : {
        title: {
            type: 'inside'
        }
    	}});	
        
        //creates anchor tags for WYSIWYG editor		
        var pathname = window.location.href.split('#')[0];
        $('a[href^="#"]').each(function() {
            var $this = $(this),
                link = $this.attr('href');
            $this.attr('href', pathname + link);
        });	
    });	
    </script>  
<?
	// Google Analytics
	if(!empty($page->googleProID))
		echo $page->googleProID;

	if(!empty($page->metaIncl))
		echo $page->metaIncl;
?>    
</head>