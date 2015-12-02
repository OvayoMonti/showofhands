<? include 'controller/_content.php'; ?>
<? include 'meta.php'; ?>
<? include 'header.php'; ?>
      <h1 class="pagetitle"><?=$heading?></h1>
<?
		foreach($images as $picture) 
		{
?>
        <div class="contentimg">
            <a href="../images/cmsimages/big/<?=$picture['filename']?>" rel="OIPhotos"  title="<?=$picture['description']?>"><img  src="<?=str_replace("content/","",$baseurl)?>/images/cmsimages/thumb/<?=$picture['filename']?>" alt="<?=$picture['description']?>" /></a>
            <?= (empty($picture['description']) ? '' : '<p>'.$picture['description'].'</p>');?>
        </div>
<?
		}
?>      
      <?=$content?>
<? include 'relatedlinks.php'; ?>
<? include 'footer.php'; ?>