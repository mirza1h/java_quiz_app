function addUser() {
	var firstName = $('#first_name').val();
	var lastName = $('#last_name').val();
	var username = $('#username').val();
	var password = $('#password').val();
	var role = $('#role').val();
    var mode = "add"; //$('#mode').val();
	        	
    if((firstName == "" || lastName=="" || username=="" || role==null || password=="")){
        //TODO: Generate message dialog
        return;

    }        	

    $.ajax({
        url: 'all_users',
        type: 'POST',
        data: {'username':username, 'method': mode, 'firstName':firstName,
                'lastName':lastName, 'password':password, 'role':role},
        success: function(result) {
         	window.location.replace("all_users");
        }
    });
};