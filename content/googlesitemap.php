<? include 'controller/_sitemap.php'; ?>
<?
	$result = $page->common->generateSitemap("xml",true);
	if (!empty($result)) echo $result;
?>
