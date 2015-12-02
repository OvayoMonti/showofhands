(function($) {

    $.fn.oiValidation = function(settings) {

        var config = {
            'errContainer'    : 'container',
            'errDisplayType'  : 'icon',
            'errIconPath'     : 'errIcon.png',
            'errMessage'      : 'There are invalid form entries'
        },
        errContainer = '',
        errDisplayType = '',
        errIconPath = '',
        errMessage = '',
		errColor = 'edaaaa',
		normColor = 'ffffff',
        groups = new Array(),
        groupNum = 0,
        min = 0,
        max = 0,
        allValid = true;

        // get custom config values and combine with the defaults
        if (settings) $.extend(config, settings);

        // loop through the combined config item list and fire the corresponding functions
        $.each(config, function(index, value) {
            if(index == 'rule') {

                $.each(value, function(element, rule) {
                    var eleValue = $("#"+element);                    
                    if(rule == "[object Object]") {
                        ValidateInput(eleValue,rule);
                    }                    
                });
                
            } else if(index == 'errContainer') {
                errContainer = value;
            } else if(index == 'errDisplayType') {
                errDisplayType = value;
            } else if(index == 'errIconPath') {
                errIconPath = value;
            } else if(index == 'errMessage') {
                errMessage = value;
            } else if(index == 'errColor') {
                errColor = value;
            } else if(index == 'normColor') {
                normColor = value;
            } else if(index == 'groups') {                

                $.each(value, function (key, val){
                    var name = key,
                        ids = new Array(),
                        min = 0,
                        max = 0;

                    var i = 0;
                    $.each(val, function (id,type){
                        if(id=='min') {
                            min = type;
                        } else if(id=='max') {
                            max = type;
                        } else {
                            ids[i]           = new Array();
                            ids[i]['id']     = id;
                            ids[i]['type']   = type;
                            i++;
                        }
                    });

                    if(name != '') {
                        groups[groupNum]         = new Array();
                        groups[groupNum]['name'] = name;
                        groups[groupNum]['ids']  = ids;
                        groups[groupNum]['min']  = min;
                        groups[groupNum]['max']  = max;
                        groupNum++;
                    }
                    
                });
               
            }
        });           

        // check if any of the groups have something filled in
        if(groups.length > 0) {

            for(var a = 0; a < groups.length; a++) {
                var groupValid = false,
                    idLen     = groups[a]['ids'].length,
                    groupName = groups[a]['name'],
                    groupMin  = groups[a]['min'],
                    groupMax  = groups[a]['max'],
                    checkNum  = true;

                if(groupMin == groupMax && groupMin == 0) checkNum = false;

                var count = 0;

                for(var b = 0; b < idLen; b++) {
                    var groupCountValid = false;
                    var eleObj   = getJQueryObj_ID(groups[a]['ids'][b]['id']);
                    var eleType = groups[a]['ids'][b]['type'];

                    switch(eleType) {
                        case 'checkbox':
                            if(eleObj.attr('checked')) {
                                groupValid = true;
                                groupCountValid = true;
                            }
                            break;
                        case 'text':
                            if(eleObj.val() != '') {
                                groupValid = true;
                                groupCountValid = true;
                            }
                            break;
                        case 'select':
                            var eleOne = document.getElementById(eleObj.attr('id'))[0].selected;
                            if(!eleOne) {
                                groupValid = true;
                                groupCountValid = true;
                            }
                            break;
                        default:
                            
                    }

                    if(groupCountValid) count++;
                }                

                if(count>groupMax||count<groupMin) groupValid = false;

                $("#"+groupName).html('');
                if(groupValid==false) $("#"+groupName).html('<img src="'+errIconPath+'"/>');

                allValid = allValid && groupValid;
            }
        }

		if($("#"+errContainer).length > 0) {
			//hide error container
			$("#"+errContainer).css('display','none');
			$("#"+errContainer).css('visibility','hidden');
	
			// if there are any errors show the error container
			if(!allValid) {			
				$("#"+errContainer).css('display','inline');
				$("#"+errContainer).css('visibility','visible');
				$("#"+errContainer).html(''+errMessage);			
			}
		}

        // private Methods
        function ValidateInput($obj,$rules) {
            var valid = true;
            
            $.each($rules, function(key,val) {
                switch(key)
                {
                    case "required":
                        if(val) {
                            valid = valid && doRequired($obj);
                        }
                        break;
                    case "email":
                        if($obj.val() != '')
                            if(val) valid = valid && doEmail($obj);
                        break;
                    case "url":
                        if($obj.val() != '')
                            if(val) valid = valid && doUrl($obj);
                        break;
                    case "decimal":
                        if($obj.val() != '')
                            if(val) valid = valid && doDecimal($obj);
                        break;
                    case "number":
                        if($obj.val() != '')
                            if(val) valid = valid && doNumber($obj);
                        break;
                    case "date":
                        if($obj.val() != '')
                            if(val) valid = valid && doDate($obj);
                         break;
                    case "equalto":
                        if(val!='') {
                            var $obj2 = null;
                            $obj2 = getJQueryObj_ID(val);
                            valid = valid && doEqualTo($obj,$obj2);
                        }
                        break;
					case "notEqualto":
                        if(val!='') {
                            notEqual = (val!=$obj.val()) ? true : false;
                            valid = valid && notEqual;
                        }
                        break;
                    case "min":
                        if($obj.val() != '') {
                            if(val!='') valid = valid && doMin($obj,val);
                        }
                        break;
                    case "max":
                        if($obj.val() != '') {
                            if(val!='') valid = valid && doMax($obj,val);
                        }
                        break;
                    case "minLen":
                        if($obj.val() != '') {
                            if(val!='') valid = valid && doMinLen($obj,val);
                        }
                        break;
                    case "maxLen":
                        if($obj.val() != '') {
                            if(val!='') valid = valid && doMaxLen($obj,val);
                        }
                        break;
                    case "notEmpty":
                        if(val!='') 
						{
							valid = valid && doNotEmpty($obj,val);
						}
						
                        break;						

                    default:

                }
            });

            var name = $obj.attr('name');

            if(errDisplayType == 'text') {
                $("#"+name+"error").css('color','#000000');
                if(!valid) $("#"+name+"error").css('color','red');
            } else if(errDisplayType == 'icon') {
                $("#"+name+"icon").html('');
                if(!valid) $("#"+name+"icon").html('<img src="'+errIconPath+'"/>');
            } else if(errDisplayType == 'highlight') {
                $("#"+name).css('background-color','#'+normColor);
				$("#"+name).css('border-color','#'+normColor);
                if(!valid)
				{
					$("#"+name).css('background-color','#'+errColor);
					$("#"+name).css('border-color','#'+errColor);
				}
            }

            allValid = allValid && valid;
        }

        function doRequired($obj) {
            //var node = $obj.attr('nodeName').toLowerCase();
            var node = $obj.attr('type').toLowerCase();
			var name = '';
            var $obj2 = '';
            switch(node) {
                case 'select':
                    var eleOne = document.getElementById($obj.attr('id'))[0].selected;
                    if(eleOne) return false;
                case 'input':
                    var type = $obj.attr('type');
                     if ( type == "checkbox" ) {
                        return $obj.attr('checked');
                     }
                     if ( type == "radio" ) {
                         name = $obj.attr('name');
                         $obj2 = $("input[name='"+name+"']:checked");
                         if(typeof($obj2.val()) == "undefined") return false;
                         else return true;
                     }
                default:
                    return $.trim($obj.val()).length > 0;
            }
        }

        function doEmail($obj) {
            return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test($obj.val());
        }

        function doUrl($obj) {
            return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test($obj.val());
        }

        function doDecimal($obj) {
            return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test($obj.val());
        }

        function doNumber($obj) {
            return /^\d+$/.test($obj.val());
        }

        function doEqualTo($obj, $obj2) {
            if($obj2.val()!=$obj.val()) return false;
            else return true;
        }

        function doDate($obj) {
            return !/Invalid Date|NaN|invalid/.test(new Date($obj.val()));
        }

        function getJQueryObj_ID($id) {
            if($id.indexOf('#',0)>=0) {
                return $($id);
            } else {
                return $("#"+$id);
            }
        }

        function doMin($obj,$min) {
            if($obj.val() >= $min) return true;
            else return false;
        }

        function doMax($obj,$max) {
            if($obj.val() <= $max) return true;
            else return false;
        }

        function doMinLen($obj,$min) {
            if($obj.val().length >= $min) return true;
            else return false;
        }

        function doMaxLen($obj,$max) {
            if($obj.val().length <= $max) return true;
            else return false;
        }

        function doNotEmpty($obj,$new) {

            if (($("#"+$new).val() != '') && ($obj.val()=='')) return false;
			else return true;
        }		

        return allValid;
    };

})(jQuery);