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
		var role = $('#role').val();
	    var mode = "add";
		        	
	    if((firstName == "" || lastName=="" || username=="" || role==null || password=="")){
	        alert("Fill out all fields!");
	    }        	

	    $.ajax({
	        url: 'all_users',
	        type: 'POST',
	        data: {'username':username, 'method': mode, 'firstName':firstName,'lastName':lastName, 'password':password, 'role':role},
	        success: function(result) {
	         	window.location.replace("all_users");
	        }
	    });

	};

	init();

});