	//var $ = jQuery.noConflict();

	function formIsDirty(form)
	{
		for (var i = 0; i < form.elements.length; i++)
		{
			var element = form.elements[i];
			var type = element.type;
			if (type == "checkbox" || type == "radio")
			{
				if (element.checked != element.defaultChecked)
				{
					return true;
				}
			}
			else if (type == "hidden" || type == "password" || type == "text" ||
					 type == "textarea")
			{
				if (element.value != element.defaultValue)
				{
					return true;
				}
			}
			else if (type == "select-one" || type == "select-multiple")
			{
				for (var j = 0; j < element.options.length; j++)
				{
					if (element.options[j].selected !=
						element.options[j].defaultSelected)
					{
						return true;
					}
				}
			}
		}
		return false;
	}
	
	function openDialog(varMessage,varTitle,varHeight)
	{
		$("#dialog-confirm").dialog('destroy');
		$("#error-message").html(varMessage);
		$("#dialog-confirm").dialog({
			autoOpen: false,
			title: varTitle,
			resizable: false,
			draggable:false,
			height:varHeight,
			modal: true,
			buttons: {
				'Ok': function() {
					$(this).dialog('close');
				}
			},
                        close: function() {
                            $(this).dialog("destroy");
                        }
		});	
		$('#dialog-confirm').dialog('open');
	}

    function openDialogLoader(msg, title)
    {
        $("#dialog-loading").dialog('destroy');
		document.getElementById('error-message3').innerHTML = msg;
		$("#dialog-loading").dialog({
			autoOpen: false,
			title: title,
			resizable: false,
			draggable:false,
			width: 140,
			height:105,
			modal: true
		});
        $("#dialog-loading").dialog().parent('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
		$('#dialog-loading').dialog('open');

        return $("#dialog-loading");
    }
	
	function switchTab(varTab,varTabURL,varForm,varValidate)
	{
     if (typeof varValidate === 'undefined') varValidate = true;

            objForm = MM_findObj(varForm);

            if(!varValidate) {
                window.open(varTabURL,'_self');
            } else {
                var validForm = formValidate(false);
            }

            if (validForm)
            {
                if(varValidate) {
                    var bChanged = formIsDirty(objForm);
                } else {
                    var bChanged = false;
                }

                if (bChanged)
                {
                        document.getElementById('error-message').innerHTML = '<b>You have unsaved changes!</b><br/>What would you like to do before continuing?';
                        $("#dialog-confirm").dialog({
                                title: 'Continue?',
                                resizable: false,
                                draggable:false,
                                height:200,
                                modal: true,
                                buttons: {
                                        'Discard': function() {
                                                $(this).dialog('close');
                                                window.open(varTabURL,'_self','');
                                        },
                                        'Save': function() {
                                                        $(this).dialog('close');
                                                        document.getElementById('tab').value = varTab;
                                                        objForm.onsubmit();
                                                        objForm.submit();
                                        }

                                }
                        });
                        $('#dialog-confirm').dialog('open');
                }
                else
                {
                    window.open(varTabURL,'_self','');
                }
            }
	}	
	
	function MM_findObj(n, d) 
	{ //v4.01
	  var p,i,x;  
	  if(!d) d=document; 
		if((p=n.indexOf("?"))>0&&parent.frames.length) 
		{
			d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
		}
		if(!(x=d[n])&&d.all) x=d.all[n]; 
			for (i=0;!x&&i<d.forms.length;i++) 
				x=d.forms[i][n];
				for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
					x=MM_findObj(n,d.layers[i].document);
					if(!x && d.getElementById) x=d.getElementById(n); 
						return x;
	}
	
	function pageSaved(varError) 
	{
		
		if (varError=="false")
		{
			varError = 'Updated successfully!';	
			varTitle = 'Success!';
		}else if (varError!=""){
			varError = varError;	
			varTitle = 'Oooops!';			
		}
		
		if (varError!="")
		{
			openDialog(varError,varTitle);
		}

	}	
	
	function confirmDialog(varEmptyTitle,varEmptyMessage,varEmptyHeight,varTitle,varMessage,varHeight,varFormName,varHiddenName,varCheckBoxName)
	{
		var doDelete = false;
		var arrList = document.getElementById(varHiddenName).value;
		var mypage_array = arrList.split(",");
		for(i=0;i<mypage_array.length;i++)
		{
			//alert(document.getElementById(varCheckBoxName+mypage_array[12]));
			
			if(document.getElementById(varCheckBoxName+mypage_array[i]) !=null)
			{
				if(document.getElementById(varCheckBoxName+mypage_array[i]).checked)
				{
					doDelete = true;
					break;
				}
			}
		}
		  
        if(!doDelete) 
		{
			$(".PageInPage").errorFade({
				noticeID: 'errorFade',
				iconPath: '../../images/icons/attention.png',
				message: '<b>Warning:</b> '+varEmptyMessage,
				backColor: 'ffffdd',
				borderColor: 'eeeecc',
				textColor: 'aaaa55',
				closeText: 'X',
				placement: 'before'
			});			
			return false;
        } 
		
		document.getElementById('error-message').innerHTML = varMessage;				
		$("#dialog-confirm").dialog({
			title: varTitle,	
			resizable: false,
			draggable:false,
			height:varHeight,
			modal: true,
			buttons: {
				Cancel: function() {
					$(this).dialog('close');
				},
				'OK': function() {
					$(this).dialog('close');
					document.getElementById(varFormName).submit();
				}
			}
		});

        return true;
	}

    function updateHeader(textBox) 
	{
        //alert(textBox.value);
    }
	
	function checkPermaLink(strURL,strPath,strOldLink)
	{
		if(strURL.length<1)
		{
			$("#validlink").css("color","red");
			$("#validlink").text("mypage");
			$("#validlinkmessage").text('');
		}		
		if (strURL!=strOldLink)
		{
			if(strURL.length<3)
			{
				$("#validlink").css("color","red");
				$("#validlink").text(strURL);
				$("#validlinkmessage").css("color","red");
				$("#validlinkmessage").text(' Minimum of 3 characters are required!');
			}
			else
			{
				$.ajax({
					url: strPath+'&newURL='+strURL,
					success: function(data)
					{
						if(data==1)
						{
							$("#validlink").css("color","red");
							$("#validlink").text(strURL);
							$("#validlinkmessage").css("color","red");
							$("#validlinkmessage").text(' is not available');
							//var hiddenval	= mm_findObj("validlinkhidden");
							//hiddenval	 	= 'is not available';
						}
						else
						{
							$("#validlink").css("color","green");
							$("#validlink").addClass("available");
							$("#validlink").text(strURL);
							$("#validlinkmessage").css("color","green");
							$("#validlinkmessage").text(' is available');
							//var hiddenval	= mm_findObj("validlinkhidden");
							//hiddenval	 	= 'is available';
						}
					} 
				});					
			}			
		}
		else
		{
			$("#validlink").css("color","green");
			$("#validlink").addClass("available");
			$("#validlink").text(strURL);
			$("#validlinkmessage").css("color","green");
			$("#validlinkmessage").text(' is available');
			//var hiddenval	= mm_findObj("validlinkhidden");
			//hiddenval	 	= 'is available';
		}

	}	