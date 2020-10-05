<%@page import="roles.Role"%>
<%@page import="database.PlayerDao"%>
<%@page import="domain.Player"%>
<%@page import="service.PlayerService"%>
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
          <a class="navbar-brand" href="/rwa-z2-mirza-hasanovic/">
            <img src="../resources/quiz_icon.png" width="45" height="30" alt="">
          </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="/rwa-z2-mirza-hasanovic/">Home <span class="sr-only">(current)</span></a>
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
              <a class="nav-link" href="/rwa-z2-mirza-hasanovic/quiz/admin/login?logout=true">Logout</a>
            </li>
          </ul>
        </div>
      </nav>

        <h1 class="display-4">Add user</h1>
        <hr/>
        <div class="container" align="left">

          <form method="post">
            <div class="form-group">
              <label for="first_name" name="first_name">First name</label>
              <input type="text" class="form-control" id="first_name" placeholder="First name">
            </div>
            <div class="form-group">
              <label for="last_name" name="last_name">Last name</label>
              <input type="text" class="form-control" id="last_name" placeholder="Last name">
            </div>
            <div class="form-group">
              <label for="username" name="username" >Username</label>
              <input type="text" class="form-control" id="username" placeholder="Username">
            </div>
            <div class="form-group">
              <label for="password" name="password">Password</label>
              <input type="password" class="form-control" id="password" placeholder="Password">
            </div>
            <label for="role">Role</label>
            <select name="role" class="form-control" id="role" required>
              <option value="admin">Admin</option>
              <option value="editor">Editor</option>
            </select>
            <button class="btn btn-primary" onClick="addUser()">Save</button>
          </form>
        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/adm_add_user.js"></script>
  </body>
</html>