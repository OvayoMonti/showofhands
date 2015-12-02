<? include 'controller/_sitemap.php'; ?>
<? include 'meta.php'; ?>
<? include 'header.php'; ?>
      <h1 class="pagetitle">Sitemap</h1>
<?
	$result = $page->common->generateSitemap("html",true);
	if (!empty($result)) echo $result;
?>
<? include 'footer.php'; ?>