<%@page import="database.QuizDao"%>
<%@page import="domain.Quiz"%>
<%@page import="service.QuizService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html PUBLIC>
<html lang="en">

<head>
<meta charset="utf-8">

<title>Quiz - Play Quiz</title>
<meta name="description" content="Quiz - Play Quiz">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    <link rel="stylesheet" href="../css/all_quizzes.css" />

<style>
.quiz-question {
	background: rgb(255, 255, 255);
	margin: 2em;
}

.question-box {
	background: gray;
	padding: 20px;
	margin: 20px;
	font-size: 150%;
	border-radius: 4px;
}

</style>
</head>
<body>

	<%
		QuizService quizService = new QuizService(new QuizDao());
		Quiz quiz = quizService.findById(Integer.parseInt(request.getParameter("quiz-id")));
	%>


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/"> <img
			src="../resources/quiz_icon.png" width="45" height="30" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="<%=request.getContextPath()%>/">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/quiz/admin/login">Login</a></li>
			</ul>
		</div>
	</nav>

	<input type="hidden" value="<%=quiz.getId()%>" id="idQuiz">

	<div id="data">
		<div class="container transparent row">
			<div class="container col l8 offset-l2 m10 offset-m1 s12">
				<div style="position: relative;">
					<div class="image">
						<img class="image" src="<%=quiz.getImageUrl()%>" alt="">
					</div>
				</div>
				<h3><%=quiz.getTitle()%></h3>
				<span><%=quiz.getDescription()%></span>
				<div id="idPlayQuizBtn" class="begin-button right ">
					<a class="btn black-text lighten-2">Begin</a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="idMainQuestionsDiv" class="row transparent question-container" style="display:none">
		<div class="container">
			<div class="quiz-question transparent">
				<div class="question-box">
					<span id="idQuestionText" class="text"> </span>
				</div>
				
				<div id="idAnswersDiv">
					<div id="idQuestionAnswer" class="btn btn-primary" style="display:none">
						<input id="idCheckbox" type="checkbox"/>
						<label for="idCheckbox" class="text"> </label>
					</div>
				</div>

				<div class="progress lighten-4" id="timer-outline">
					<div class="determinate light-blue darken-2" id="timer"
						style="width: 100%">
					</div>
				</div>
				<div>
					<a id="idNextQuestion" href="#" class="btn right lighten-2 black-text"> 
						Next question
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="idResultText" class="question-box" style="display:none">
		<span class="text"> </span>
	</div>
	<!-- Compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<script type="text/javascript" src="../js/single_quiz.js"></script>
</body>

</html>