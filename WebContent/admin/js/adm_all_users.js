function deleteUser(username){
    $.ajax({
        url: 'all_users',  
        type: 'POST',    
        data: {'username':username, 'method': 'delete'},
        success: function(result) {
            $(row).remove();
        }
    });
}