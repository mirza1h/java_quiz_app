<%@page import="service.QuizService"%>
<%@page import="database.QuizDao"%>
<%@page import="domain.Quiz"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html PUBLIC>

<html lang="en">

<head>
    <meta charset="utf-8">

    <title>All quizzes</title>
    <meta name="description" content="All quizzes">


    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="css/style.css">


</head>

<body>

    <div class="background-sky hero"></div>

    <div class="row">
        <a href="/rwa-z2-mirza-hasanovic/quiz/admin/login" class="btn black-text btn-flat right navigation-button" >Log in</a>
        <a href="/rwa-z2-mirza-hasanovic/" class="btn black-text btn-flat right navigation-button" >Home</a>
    </div>

    <div class="container">
        <h2>All quizzes</h2>
        <div class="row">
        
        <%! String showAllQuizCards(HttpServletRequest request){
        	
        		QuizService quizService = new QuizService(new QuizDao());
        		java.util.List<Quiz> quizzes;
        		if(request.getParameter("q") == null) {
        			quizzes = quizService.findAllActive();
        		} else {
        			quizzes = quizService.findByTitleOrDescription(request.getParameter("q"));
        		}
        		String returnString = new String();
        		
        		for(Quiz q : quizzes) {
        			
        			returnString += "<div class=\"col s12 m6 l4\">" + 
        				"<div class=\"card medium sticky-action hoverable\">" +
        				"<div class=\"card-image waves-effect waves-block waves-light\">" +
        				"<img class=\"activator\"" + 
        				"src=\"" + q.getImageUrl() + "\">" +
        				"</div>" +
        				"<div class=\"card-content\">" +
        				"<span class=\"card-title activator grey-text text-darken-4\">" + 
        				q.getTitle() +
        				"<i class=\"material-icons right cyan-text text-lighen-3\">info_outline</i></span>" +
        				"</div>" +
        				"<div class=\"card-reveal\">" +
        				"<span class=\"card-title grey-text text-darken-4\">" +
        				q.getTitle() +
        				"<i class=\"material-icons right\">close</i></span>" +
        				"<p>" + q.getDescription() + "</p>" +
        				"</div>" +
        				"<div class=\"card-action\">" +
                        "<input type=\"hidden\" value=\"" + q.getId() +"\">" +
        				"<a class=\"btn right\" href=\"#\" onclick=\"play(this)\">Play<i class=\"material-icons right\">play_arrow</i></a>" +
        				"</div></div></div>";
        		}
        		
        		return returnString;
        	
        	}
        %>
       
        <%= showAllQuizCards(request) %>
        
        
        
        

        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
        function play(button) {
            var quizId = $($(button.parentElement).children()[0]).val();
          	    
            window.location.replace("single_quiz.jsp?quiz-id=" + quizId);
        }
    </script>

</body>

</html>