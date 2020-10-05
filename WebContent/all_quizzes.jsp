<%@page import="service.QuizService"%>
<%@page import="database.QuizDao"%>
<%@page import="domain.Quiz"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/all_quizzes.css" />

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
                <a class="nav-link" href="<%=request.getContextPath()%>/quiz/admin/login">Login</a>
              </li>
            </ul>
          </div>
        </nav>

        <h1 class="display-4">All quizzes1</h1>
        <hr/>
        <div class="container" align="left">
	        <%
		        QuizService quizService = new QuizService(new QuizDao());
				java.util.List<Quiz> quizzes;
				if(request.getParameter("q") == null) {
					quizzes = quizService.findAllActive();
				} else {
					quizzes = quizService.findByTitleOrDescription(request.getParameter("q"));
				}
				String returnString = new String();
				
				for(Quiz q : quizzes) {
	        %>
		          <div class="card" style="width: 18rem;">
		            <img class="card-img-top" width="300px" src="<%=q.getImageUrl()%>" alt="Card image cap">
		            <div class="card-body">
		              <h5 class="card-title"><%=q.getTitle()%></h5>
		              <p class="card-text"><%=q.getDescription()%></p>
		              <Button onClick="play(<%=q.getId()%>)" class="btn btn-primary">Play</Button>
		            </div>
		          </div>
	          <%
				}
	          %>
        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="../js/all_quizes.js"></script>
  </body>
</html>