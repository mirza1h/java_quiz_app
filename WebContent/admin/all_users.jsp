<%@page import="roles.Role"%>
<%@page import="service.PlayerService"%>
<%@page import="database.PlayerDao"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html PUBLIC>

<html lang="en">

<head>
    <meta charset="utf-8">

    <title>Admin - Users</title>
    <meta name="description" content="Admin - Users">



    <link rel="stylesheet" type="text/css" href="css/style.css">


    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


</head>

<body>
	<a href="/rwa-z2-mirza-hasanovic/quiz/admin/login?logout=true" class="btn white black-text btn-flat right log-out-button">Log out</a>
	<a href="all_users" class="btn white black-text btn-flat right log-out-button">All users</a>
	<a href="add_user" class="btn white black-text btn-flat right log-out-button">Add user</a>
	<a href="all_quizzes" class="btn white black-text btn-flat right log-out-button">All quizzes</a>
	<a href="add_quiz" class="btn white black-text btn-flat right log-out-button">Add quiz</a>
	
    <div class="divider"></div>

    <div class="row container">
        <!-- Table -->
            <h3>All Users</h3>
            <table class="highlight striped centered responsive-table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

                        <%!String printAllUsers(){
            	
                            PlayerService userService = new PlayerService(new PlayerDao());
                            java.util.List<Player> users = userService.findAll();
                            
                            String returnString = new String();
                            
                            for(Player u:users) {
                                
                                returnString += "<tr>" + 
                                    "<td>" + u.getUsername() + "</td>" +
                                    "<td>" + u.getFirstName() + "</td>" +
                                    "<td>" + u.getLastName() + "</td>" +
                                    "<td>" + u.getRole() + "</td>" +
                                    "<td><a class=\"btn red\" onclick=\"deleteUser(this)\">Delete</a></td>" +
                                    "</tr>";
                            }
                    
                            return returnString;
                        }%>
                    
                    <%= printAllUsers() %>

                </tbody>
            </table>
        </div>


    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
        
        function deleteUser(user){
            var row = user.parentElement.parentElement;
            var username = $(row).children()[0].innerHTML;
            $.ajax({
                url: 'all_users',  
                type: 'POST',    
                data: {'username':username, 'method': 'delete'},
                success: function(result) {
                    $(row).remove();
                }
            });
                       
        }
    </script>

</body>

</html>