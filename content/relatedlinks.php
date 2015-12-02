<?
if (!empty($links))
{
?>
    <div style="clear:both;"><!--content--></div>
    <div class="relatedlinks">
        <h3>Related Pages</h3>
<?
		foreach($links as $link) {
?>
    		<a href="<?=$link['url']?>" target="<?=$link['frame']?>" title="<?=$link['title']?>"><?=$link['title']?></a>
<?
		} 
?>
    <div style="clear:both"><!--closing relatedlinks--></div>
    </div>
<?
}
?>