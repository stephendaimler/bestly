// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	$('a.up_arrow').mouseenter(function(){
		$(this).toggleClass('selected');
	});
	$('a.up_arrow').mouseleave(function(){
		$(this).toggleClass('selected');
	});
	$('a.down_arrow').mouseenter(function(){
		$(this).toggleClass('selected');
	});
	$('a.down_arrow').mouseleave(function(){
		$(this).toggleClass('selected');
	});
});

