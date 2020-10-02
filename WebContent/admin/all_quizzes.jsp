<%@page import="roles.Role"%>
<%@page import="service.QuizService"%>
<%@page import="database.QuizDao"%>
<%@page import="domain.Quiz"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html PUBLIC>

<html lang="en">

<head>
<meta charset="utf-8">

<title>Admin - Quiz List</title>
<meta name="description" content="Admin - quiz list">
<meta name="author" content="Mirza">

<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Material icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>

<body>
	<a href="/rwa-z2-mirza-hasanovic/quiz/admin/login?logout=true" class="btn white black-text btn-flat right log-out-button">Log out</a>
	<a href="all_users" class="btn white black-text btn-flat right log-out-button">All users</a>
	<a href="add_user" class="btn white black-text btn-flat right log-out-button">Add user</a>
	<a href="all_quizzes" class="btn white black-text btn-flat right log-out-button">All quizzes</a>
	<a href="add_quiz" class="btn white black-text btn-flat right log-out-button">Add quiz</a>
	<div class="divider"></div>

	<!-- Table -->
	<div class="row container">
		<h3>All quizzes</h3>
		<table class="highlight striped centered responsive-table">
			<thead>
				<tr>
					<th>Image</th>
					<th>Quiz Title</th>
					<th>Created By</th>
					<th>Active</th>
					<th>Questions</th>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>


				<%!String printAllQuizzesList() {

		QuizService quizService = new QuizService(new QuizDao());
		java.util.List<Quiz> quizzes = quizService.findAll();

		String returnString = new String();

		for (Quiz q : quizzes) {

			returnString += "<tr>" + "<td> <img class=\"responsive-img circle\" src=\"" + q.getImageUrl() + "\"></td>"
					+ "<td>" + q.getTitle() + "</td>" + "<td>" + q.getCreatedBy().getUsername() + "</td>" + "<td>"
					+ q.isActive() + "</td>" + "<td>" + q.getQuestions().size() + "</td>"
					+ "<td><a class=\"btn red\" onclick=\"deleteQuiz('" + q.getTitle() + "')\">Delete</a></td>" + "</tr>";
		}

		return returnString;
	}%>

				<%=printAllQuizzesList()%>


			</tbody>
		</table>
	</div>


	<!-- Jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<script>
		$(document).ready(function() {
			$('select').formSelect();
		});

		function deleteQuiz(quizTitle) {
			window.location.href = "/rwa-z2-mirza-hasanovic/admin/delete-quiz?quiz-title="+ quizTitle;
		};

		$(document).ready(function() {
			$('.modal').modal();
		});

	</script>

</body>

</html>