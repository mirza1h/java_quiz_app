document.addEventListener("DOMContentLoaded", function () {
	'use strict';

	var init = function () {
		// Register 'click' callbacks for buttons
		document.getElementById("idAddUser").addEventListener("click", addUser);
	}


	function addUser() {
		var firstName = $('#first_name').val();
		var lastName = $('#last_name').val();
		var username = $('#username').val();
		var password = $('#password').val();
		        	
	    if((firstName == "" || lastName=="" || username=="" || password=="")){
	        alert("Fill out all fields!");
	    }        	

	    $.ajax({
	        url: 'add_user',
	        type: 'POST',
	        data: {'username':username, 'firstName':firstName,'lastName':lastName, 'password':password},
	        success: function(result) {
	         	window.location.replace("all_users");
	        }
	    });

	};

	init();

});