if (typeof jQuery === 'undefined') {
  throw new Error('Bootstrap\'s JavaScript requires jQuery');
}
//popups
$(document).ready(function(){ 
	$(".sos").css({"display" : "block"});
	$(".cerrar").click(function(){ 
		 $(".sos").fadeOut(300); 
		 });
});