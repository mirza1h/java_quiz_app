function deleteUser(username){
    $.ajax({
        url: 'delete_user',  
        type: 'POST',    
        data: {
        	'username':username
        },
        success: function() {
            document.getElementById(username).remove();
        },
        error: function(error) {
        	console.log(error);
        }
    });
}