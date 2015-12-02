<? include 'controller/_contact.php'; ?>
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
		<form name="frm1" id="frm1" method="post" action="../contact/send" style="clear:both;">
        <table cellpadding="0" cellspacing="0" border="0" class="enquiries">
          <tr>
            <th>Name<span>*</span></th>
            <td><input name="fname" id="fname" type="text" class="textbox" /></td>
          </tr>
          <tr>
            <th>Phone<span>*</span></th>
            <td><input name="tel" id="tel" type="text" class="textbox"  /></td>
          </tr>
          <tr>
            <th>E-mail<span>*</span></th>
            <td><input name="email" id="email" type="text" class="textbox" /></td>
          </tr>
          <tr>
            <th>Message</th>
            <td><textarea name="comment" id="comment" class="textbox" rows="8" ></textarea></td>
          </tr>
          
            <th>Security Check</th>
            <td><a name="Captcha"></a>
              <div id="CaptchaError" style="display:none;">Not Verified. Please Retry.</div>
              <div id="reCaptcha_block"></div></td>
          </tr>
          <tr >
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <a href="javascript:;" class="button" onClick="testRecaptcha()">Submit</a>
      </form>     
      <div id="summary" class="notificationError"></div>
<?
    include('../includes/recaptcha/recaptchalib.php');
    $publickey = "6Le-pMcSAAAAANAnKf0hmdNvxwHoLcaw3quWbNaz"; // you got this from the signup page
?>
	<script type="text/javascript" src="../js/recaptcha.js"></script>
	<script type="text/javascript" src="../js/jquery/plugins/jquery.validate.min.js"></script>
	<!-- General -->
    <script type="text/javascript">
	$(document).ready(function()
    {

		showRecaptcha("reCaptcha_block","white");
		
		//creates fancybox for thumbnails for WYSIWYG editor
		$('img').filter(function() {
	       return (/_CMSthumbclick/i).test($(this).attr('src'));
		}).wrap(function() {
   			return "<a href='" + this.src.replace(/_CMSthumbclick/i, "") + "' class='fancybox'/>";
		})
	
		$("a[class^='fancybox']").fancybox({'titlePosition'	: 'inside'});
        $("a[rel^='OIPhotos']").fancybox({'titlePosition':'inside'});	
        
		//creates anchor tags for WYSIWYG editor		
		var pathname = window.location.href.split('#')[0];
		$('a[href^="#"]').each(function() {
			var $this = $(this),
				link = $this.attr('href');
			$this.attr('href', pathname + link);
		});	
    });	
    </script>

	<script language="javascript">
        function showRecaptcha(element, themeName) 
        {
            Recaptcha.create("<?=$publickey?>", element, {
                theme: themeName,
                tabindex: 0
            });
        }
    
        function testRecaptcha() {
            var challenge  = $("#recaptcha_challenge_field").val();
            var response   = $("#recaptcha_response_field").val();
            var remoteAddr = "<?=$_SERVER["REMOTE_ADDR"]?>";
    
    
            if(validate())
            {
                $.ajax({
                   type     : "POST",
                   url      : "../includes/recaptcha/captcha.php",
                   data     : "challenge="+challenge+"&response="+response+"&remoteAddr="+remoteAddr,
                   success  : function(data) {
                            if(data == 'Fail')
                            {
                                $("#CaptchaError").css('display','inline');
                                $("#CaptchaError").css('visibility','visible');
                                Recaptcha.reload();
                                setLocation();
                            }
                            else
                            {
                                $("#CaptchaError").css('display','none');
                                $("#CaptchaError").css('visibility','hidden');
                                if(validate())
                                {
                                     $("#frm1").submit();
                                }
                                ;
    
                            }
                   }
                });
            
            }
            else
            {
                $("#CaptchaError").css('display','none');
                $("#CaptchaError").css('visibility','hidden');
                if(validate())
                {
                     $("#frm1").submit();
                }
                ;
    
            }		
        }
    
        function validate()
        {
             var valid = $("#frm1").validate({ 
                highlight: function(element, errorClass) { $(element).css('background-color' , '#C3112F'); },
                unhighlight: function(element, errorClass) { $(element).css('background-color' , '#F6F6F6'); },
                showErrors: function(errorMap, errorList) {
                    $("#summary").html("Please complete all the information requested.");
                    this.defaultShowErrors();
                    $(".notificationError").show();
                    $(".error").hide();
                },
                rules: {
                  fname: {
                    required: true
                  },
                  email: {
                    required : true,
                    email    : true
                  },
                  tel: {
                    required : true
                  }
                }
            }).form(); 
            
            return valid;		
        }
        
        function setLocation()
        {
            window.location.hash = "#top";
        }
    </script>
      
<? include 'footer.php'; ?>