<%@page import="roles.Role"%>
<%@page import="service.PlayerService"%>
<%@page import="database.PlayerDao"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/adm_all_quizzes.css" />

    <title>Quiz App</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="container" id="quiz">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/">
              <img src="../resources/quiz_icon.png" width="45" height="30" alt="">
            </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="add_quiz">Add quiz</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="all_quizzes">All quizzes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="all_users">All users</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="add_user">Add user</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/quiz/admin/login?logout=true">Logout</a>
              </li>
            </ul>
          </div>
        </nav>

        <h1 class="display-4">All users</h1>
        <hr/>
        <div class="container" align="left">

          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Username</th>
                <th scope="col">First name</th>
                <th scope="col">Last name</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
            <%
            	PlayerService userService = new PlayerService(new PlayerDao());
                java.util.List<Player> users = userService.getAll();
                  for(Player user:users) {
                	  if(user.getUsername() != null){
            %>     
              <tr id="<%=user.getUsername() %>">
                <th scope="row"><%=user.getUsername() %></th>
                <td><%=user.getFirstName() %></td>
                <td><%=user.getLastName() %></td>
                <td><Button onClick="deleteUser('<%=user.getUsername() %>')" class="btn btn-primary">Delete</Button></td>
              </tr>
              <% 
                   }
              	}
              %>
            </tbody>
          </table>

        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/adm_all_users.js"></script>
  </body>
</html>