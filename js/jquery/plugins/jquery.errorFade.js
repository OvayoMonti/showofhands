(function($) {

    $.fn.extend({ 
		errorFade: function(options) {
		
			var defaults = {
				noticeID: 'errorFade',
				iconPath: 'errIcon.png',
				message: '<b>Success:</b> Update complete!',
				backColor: 'ddffdd',
				borderColor: 'cceecc',
				textColor: '55aa55',
				closeText: 'X',
				placement: 'before'
			};
	
			// get custom config values and combine with the defaults
			var options = $.extend(defaults, options);
				
			// return this.each(function() {}); // multiple objs
			
			// Desctroy Previous Notices
			var old = $("#"+defaults.noticeID);
			if(old.length > 0)
			{
				old.fadeOut(600);
				old.remove();
			}
				
			// Build Message
			var obj = $(this),
				img = "<img src='"+defaults.iconPath+"' style='float:left;'/>",			
				spanStyle = "float:right;cursor:pointer;font-weight:bold;",
				span = "<span style='"+spanStyle+"'>"+defaults.closeText+"</span",
				divStyle = "display:none;padding:8px;margin:20px;border:1px solid #"+defaults.borderColor+";background-color:#"+defaults.backColor+";color:#"+defaults.textColor+";",
				div = "<div id='"+defaults.noticeID+"' style='"+divStyle+"'>"+img+"&nbsp;&nbsp;"+defaults.message+span+"</div>";
				
			// Were to place the message
			switch(defaults.placement) {
				case "before":
					obj.before(div);
					break;
				case "after":
					obj.after(div);
					break;
				case "append":
					obj.append(div);
					break;
				case "prepend":
					obj.prepend(div);
					break;
			}
			
			// Display&Closing of Message
			var notice = $("#"+defaults.noticeID);
			notice.find('span').bind('click',function(){notice.fadeOut(600);});
			notice.fadeIn(600);
			
			window.scrollTo(0,0);
		}
	});

})(jQuery);