<?
	$HeaderImages = '';
    if($headers != false) {
        foreach($headers as $picture) {
			$HeaderImages .= "[\"images/cmsheaders/".$picture['filename']."\", \"\", \"\", \"\"] ,";
        }
    }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style>
body {
	background-color: #4a4a4a;
	margin: 0px;
	padding: 0px;
}
.descpanelfg
{
	text-align:center;
}
.FlashMovie{
	position:absolute;
	left:0px;
	top:0px;
	z-index:1;
}
.Grey{
	position:absolute;
	background-color: #343434;
	filter:alpha(opacity=80);
	-moz-opacity:.80;
	opacity:.80;
	width:275px;
	height:300px;
	left:0px;
	top:0px;
	z-index:2;
}
.Logo{
	position:absolute;
	left:0px;
	top:0px;
	z-index:3;
}
</style>
<script type="text/javascript" src="jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="jquery/fadeslideshow.js"></script>
<script type="text/javascript">
var mygallery=new fadeSlideShow({
	wrapperid: "fadeshow1", //ID of blank DIV on page to house Slideshow
	dimensions: [920, 300], //width/height of gallery in pixels. Should reflect dimensions of largest image
	imagearray: [<?=$HeaderImages?>],
	
/*
		["headers/1.jpg", "", "", ""],
		["headers/2.jpg", "", "", ""],
		["headers/3.jpg", "", "", ""],
		["headers/4.jpg", "", "", ""],
		["headers/5.jpg", "", "", ""],
		["headers/6.jpg", "", "", ""],
		["headers/7.jpg", "", "", ""],
		["headers/8.jpg", "", "", ""],
		["headers/9.jpg", "", "", ""],
		["headers/10.jpg", "", "", ""],
		["headers/11.jpg", "", "", ""],
		["headers/12.jpg", "", "", ""]
*/		
	
	displaymode: {type:'auto', pause:4000, cycles:0, wraparound:false},
	persist: false, //remember last viewed slide and recall within same session?
	fadeduration: 1000, //transition duration (milliseconds)
	descreveal: "always",
	togglerid: ""
})
</script>
</head>
<body>
    <div class="FlashMovie" id="fadeshow1"></div><div class="Grey"></div><div class="Logo"><img src="../images/BK_TransLogo.gif" /></div>
</body>
</html>
