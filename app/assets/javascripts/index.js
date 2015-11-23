$(document).ready(function(){
	console.log("sanity");
	$('.glyphicon').on('click', function (e) {
		e.preventDefault();
    $('html, body').animate({
    	scrollTop: $('.text-section').offset().top + 'px'}, 'fast');
	});
});