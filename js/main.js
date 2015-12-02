$(document).ready(function(){

	$(".menu").mouseenter(function(){
		
		$(this).find('.dropdown').slideDown();

	});
	$(".menu").mouseleave(function(){
		
		$(this).find('.dropdown').stop(true, true).slideUp();
	});



})