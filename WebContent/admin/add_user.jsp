<%@page import="roles.Role"%>
<%@page import="database.PlayerDao"%>
<%@page import="domain.Player"%>
<%@page import="service.PlayerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html PUBLIC>

<html lang="en">

<head>
    <meta charset="utf-8">

    <title>Admin - Add new user</title>
    <meta name="description" content="Admin - Add new user">



    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<%!

		Player getUser(String username) {
	
			PlayerService userService = new PlayerService(new PlayerDao());
		
			Player user = userService.findByUsername(username);
		
			return user;
		
		}

%>

<body>
<% 
Player user = getUser(request.getParameter("username"));	

%>
	<a href="/rwa-z2-mirza-hasanovic/quiz/admin/login?logout=true" class="btn white black-text btn-flat right log-out-button">Log out</a>
	<a href="all_users" class="btn white black-text btn-flat right log-out-button">All users</a>
	<a href="add_user" class="btn white black-text btn-flat right log-out-button">Add user</a>
	<a href="all_quizzes" class="btn white black-text btn-flat right log-out-button">All quizzes</a>
	<a href="add_quiz" class="btn white black-text btn-flat right log-out-button">Add quiz</a>

    <div class="divider"></div>
    
    <div class="row container">
        <h3><%= user == null ? "Add new user" : "" %></h3>
        <input type="hidden" id="mode" value="<%= user==null ? "add":""%>">
        <form class="col s12" method="post">
            <div class="row">
                <div class="input-field col s12 ">
                    <input id="first_name" name="first_name" type="text" class="validate" required value="<%= user==null ? "" :user.getFirstName()%>">
                    <label for="first_name">First Name</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <input id="last_name" name="last_name" type="text" class="validate" required value="<%= user==null ? "" :user.getLastName()%>">
                    <label for="last_name">Last Name</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <input id="username" name="username" type="text" class="validate" required value="<%= user==null ? "" :user.getUsername()%>" <%= user==null ? "":"disabled" %>>
                    <label for="username">Username</label>
                </div>
            </div>


            <div class="row">
                <div class="input-field col s12">
                    <input id="password" name="password" type="text" class="validate" required>
                    <label for="password">Password</label>
                </div>
            </div>
            
            <div class="row">
                <div class="input-field col s12">
                    <select name="role" id="role" required>
                        <option value="" disabled selected>Choose role</option>
                        <option value="admin" <%= user!=null && user.getRole()==Role.ADMIN ? "selected" : "" %>>Admin</option>
                        <option value="editor" <%= user!=null && user.getRole()==Role.EDITOR ? "selected" : "" %>>Editor</option>
                    </select>
                    <label>Role</label>
                </div>
            </div>

            <a class="btn waves-effect waves-light right" onclick="submit()">
                <i class="material-icons right">save</i>Save
            </a>

        </form>
    </div>


   <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!-- Material dialog-->
    <script src="material-dialog/material-dialog.min.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
        
        function submit() {
        	var firstName = $('#first_name').val();
        	var lastName = $('#last_name').val();
        	var username = $('#username').val();
        	var password = $('#password').val();
        	var role = $('#role').val();
            var mode = $('#mode').val();
        	        	
            if((firstName == "" || lastName=="" || username=="" || role==null || password=="")){
                
                MaterialDialog.alert(
                        "Please fill all fields correctly.",
                        {
                            title: "Error",
                            buttons: {
                                close: {
                                    className: "transparent black-text",
                                    text: "close",
                                    callback: function () {
                                    }
                                
                                }
                            }
                        }
                    );
				
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
        }
    </script>

</body>

</html>