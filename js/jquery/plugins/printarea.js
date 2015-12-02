// Compacted by ScriptingMagic.com
/**
 *  Version 2.1
 *      -Contributors: "mindinquiring" : filter to exclude any stylesheet other than print.
 *  Tested ONLY in IE 8 and FF 3.6. No official support for other browsers, but will
 *      TRY to accomodate challenges in other browsers.
 *  Example:
 *      Print Button: <div id="print_button">Print</div>
 *      Print Area  : <div class="PrintArea"> ... html ... </div>
 *      Javascript  : <script>
 *                       $("div#print_button").click(function(){
 *                           $("div.PrintArea").printArea( [OPTIONS] );
 *                       });
 *                     </script>
 *  options are passed as json (json example: {mode: "popup", popClose: false})
 *
 *  {OPTIONS} | [type]    | (default), values      | Explanation
 *  --------- | --------- | ---------------------- | -----------
 *  @mode     | [string]  | ("iframe"),"popup"     | printable window is either iframe or browser popup
 *  @popHt    | [number]  | (500)                  | popup window height
 *  @popWd    | [number]  | (400)                  | popup window width
 *  @popX     | [number]  | (500)                  | popup window screen X position
 *  @popY     | [number]  | (500)                  | popup window screen Y position
 *  @popTitle | [string]  | ('')                   | popup window title element
 *  @popClose | [boolean] | (false),true           | popup window close after printing
 *  @strict   | [boolean] | (undefined),true,false | strict or loose(Transitional) html 4.01 document standard or undefined to not include at all (only for popup option)
 */
(function($){var a=0;var b={iframe:"iframe",popup:"popup"};var c={mode:b.iframe,popHt:500,popWd:400,popX:200,popY:200,popTitle:"",popClose:false};var d={};$.fn.printArea=function(f){$.extend(d,c,f);a++;var g="printArea_";$("[id^="+g+"]").remove();var h=getFormData($(this));d.id=g+a;var i;var j;switch(d.mode){case b.iframe:var k=new Iframe();i=k.doc;j=k.contentWindow||k;break;case b.popup:j=new Popup();i=j.doc}i.open();i.write(docType()+"<html>"+getHead()+getBody(h)+"</html>");i.close();j.focus();j.print();if(d.mode==b.popup&&d.popClose){j.close()}};function docType(){if(d.mode==b.iframe||!d.strict){return ""}var f=d.strict==false?" Trasitional":"";var g=d.strict==false?"loose":"strict";return '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01'+f+'//EN" "http://www.w3.org/TR/html4/'+g+'.dtd">'}function getHead(){var f="<head><title>"+d.popTitle+"</title>";$(document).find("link").filter(function(){return $(this).attr("rel").toLowerCase()=="stylesheet"}).filter(function(){var g=$(this).attr("media");return (g.toLowerCase()==""||g.toLowerCase()=="print")}).each(function(){f+='<link type="text/css" rel="stylesheet" href="'+$(this).attr("href")+'" >'});f+="</head>";return f}function getBody(f){return '<body><div class="'+$(f).attr("class")+'">'+$(f).html()+"</div></body>"}function getFormData(f){$("input,select,textarea",f).each(function(){var g=$(this).attr("type");if(g=="radio"||g=="checkbox"){if($(this).is(":not(:checked)")){this.removeAttribute("checked")}else{this.setAttribute("checked",true)}}else{if(g=="text"){this.setAttribute("value",$(this).val())}else{if(g=="select-multiple"||g=="select-one"){$(this).find("option").each(function(){if($(this).is(":not(:selected)")){this.removeAttribute("selected")}else{this.setAttribute("selected",true)}})}else{if(g=="textarea"){var v=$(this).attr("value");if($.browser.mozilla){if(this.firstChild){this.firstChild.textContent=v}else{this.textContent=v}}else{this.innerHTML=v}}}}}});return f}function Iframe(){var f=d.id;var g="border:0;position:absolute;width:0px;height:0px;left:0px;top:0px;";var h;try{h=document.createElement("iframe");document.body.appendChild(h);$(h).attr({style:g,id:f,src:""});h.doc=null;h.doc=h.contentDocument?h.contentDocument:(h.contentWindow?h.contentWindow.document:h.document)}catch(e){throw e+". iframes may not be supported in this browser."}if(h.doc==null){throw "Cannot find document."}return h}function Popup(){var f="location=yes,statusbar=no,directories=no,menubar=no,titlebar=no,toolbar=no,dependent=no";f+=",width="+d.popWd+",height="+d.popHt;f+=",resizable=yes,screenX="+d.popX+",screenY="+d.popY+",personalbar=no,scrollbars=no";var g=window.open("","_blank",f);g.doc=g.document;return g}})(jQuery)