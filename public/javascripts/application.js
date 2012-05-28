// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	
	/* Vote mouseover*/
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
	
	/* TIME PICKER */
	
	$('#link_post_link_at').datetimepicker({
		ampm: true
	});
	
	/* MOBILE MENU */
	$('.mobile-menu-button').click(function(e){
    	e.preventDefault();
    	var $menu = $($(this).attr('href'));
    	$menu.toggleClass('menu-open'); //toggle()
    	
    	if(typeof $navClose !== 'undefined' && !$menu.hasClass('menu-open') ){
    		console.log('hide');
    		$navClose.hide();
    	}
    });
});