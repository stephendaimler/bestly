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

	/* Max Length */
	/*$('.maxlength')
		.after("<span></span>")
		.next()
		.hide()
		.end()
		.keypress(function(event) {
			var current = $(this).val().length;
			if (current >= 125) {
				if (event.which != 0 && event.which !== 8) {
					event.preventDefault();
				}
			}
		$(this).next().show().text(125 - current);
	});*/
	
	$('#link_description').live('keyup keydown', function(e) {
	  var maxLen = 100;
	  var left = maxLen - $(this).val().length;
	  $('#char-count').html(left);
	});
	
	/* Validation */
		
	$('#user_new.validate-user').validate ({
		rules: {
			"user[username]": {
				required: true,
				maxlength: 15,
				remote: "/users/check_username"
			},
			"user[email]": {
				required: true,
				email: true,
				remote: "/users/check_email"
			},
			"user[password]": {
				required: true,
				minlength: 6
			},
			"user[password_confirmation]": {
				required: true,
				minlength: 6,
				equalTo: "#user_password"
			}
		},
		messages: {
			"user[username]": {
				required: "Enter a username",
				maxlength: jQuery.format("Enter no more than {0} characters"),
				remote: jQuery.format("{0} is already in use")
			},
			"user[email]": {
				required: "Please enter a valid email address",
				email: "Please enter a valid email address",
				remote: jQuery.format("{0} is already in use") 
			},
			"user[password]": {
				required: "Provide a password",
				rangelength: jQuery.format("Enter at least {0} characters") 
			},
			"user[password_confirmation]": {
				required: "Repeat your password",
				minlength: jQuery.format("Enter at least {0} characters"), 
				equalTo: "Enter the same password as above"
			}
		},	
		success: function(label) {
			label.text('OK!').addClass('valid');
		}
	});
	
	/*$('#new_link').validate ({
		rules: {
			"link[description]": {
				required: true,
				maxlength: 100
			},
			"link[url]": {
				required: true
			}	
		},
		success: function(label) {
			label.text('OK!').addClass('valid');
		}
	});*/

	/* Notification Fade Out */	
	$('.notification').delay(3000).fadeOut(); 
});