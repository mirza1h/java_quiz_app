<%@page import="roles.Role"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Admin - Create a new quiz</title>
    <meta name="description" content="Create a new quiz">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
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
	
    <div class="container" align="center">
    	<h3>Create a new quiz</h3>
        <form method="post">
            <div class="form-group w-50" align="left">
                <div>
                    <label>Title</label>
                    <input id="title" type="text" class="form-control">
                </div>
            </div>

            <div class="form-group w-50" align="left">
                <div>
                    <label for="description">Description</label>
                    <textarea id="description" class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group w-50" align="left">
                <div>
                    <label for="image_url" >Image URL</label>
                    <input id="image_url" class="form-control" type="text" >
                </div>
            </div>

            <h4 id="questions-h4">Question list</h4>
            
            <ul id="questions">
                <li id="idQuestionList" class="border-1 bg-info p-1 m-1">
                    <div align="right">
                    	<Button id="idRemoveBtn" class="btn btn-danger">X</Button>
                    </div>
                    <div>
                        <div class="form-group w-25 form-check-inline">
                            <label>Question text</label>
                            <input type="text" class="form-control " required>
                        </div>

                        <div class="form-group w-15 form-check-inline"> 
                            <label>Time</label>
                            <input type="number" max="30" min="5" class="form-control" required>
                        </div>
                        <div class="form-group w-15 form-check-inline">
                            <label>Points</label>
                            <input type="number"  min="1" max="10" class="form-control" required>
                        </div>
                    </div>
                    <div>
                        <div class="form-group w-50">
                            <label>Answer 1</label>
                            <label><input type="checkbox" class="checkbox"/> Correct</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group w-50">
                            <label>Answer 2</label>
                            <label><input type="checkbox" class="checkbox"/> Correct</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group w-50">
                            <label>Answer 3</label>
                            <label><input type="checkbox" class="checkbox"/> Correct</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group w-50">
                            <label>Answer 4</label>
                            <label><input type="checkbox" class="checkbox"/> Correct</label>
                            <input type="text" class="form-control" required>
                        </div>
                    </div>                    
                </li>
            </ul>
            <div>
                <a id="idAddQuestionBtn" class="btn btn-primary left">Add question</a>
                <a id="idSubmitBtn" class="btn btn-primary right">Save quiz</a>
            </div>
        </form>
    </div>
   	<span id="pathSpan" style="display:none"><%=request.getContextPath()%></span>
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script type="text/javascript" src="js/adm_add_quiz.js"></script>
</body>

</html>