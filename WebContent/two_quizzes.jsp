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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


    <style>
        .bg-image {
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            filter: blur(3px);
            z-index: -1;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: 50% 50%;
        }

        .image {
            position: static;
            max-height: 300px;
            max-width: 100%;
            object-fit: contain;
            min-height: 300px;
            background-repeat: no-repeat;
            z-index: 1;
            margin: auto;
        }

        .image img {
            position: relative;
            position: relative;
            left: 50%;
            transform: translateX(-50%);

        }





        .background-sky {
            background-color: #1976d2;
            background: linear-gradient(145deg, #508eeb, #c7def1);
            /* background: linear-gradient(145deg, #04347c, #1475c5); */
            color: #fff;
            z-index: -1;
        }

        .hero {
            display: -webkit-flex;
            display: flex;
            -webkit-flex-direction: column;
            flex-direction: column;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-align-items: center;
            align-items: center;
            position: absolute;
            width: 100%;
            min-height: 480px;
            height: 80vh;
            max-height: 560px;
            box-sizing: border-box;
            padding: 48px 48px 32px;
            overflow: hidden;
            -webkit-transform: skewY(8deg);
            transform: skewY(8deg);
            -webkit-transform-origin: 100%;
            transform-origin: 100%;
        }

        .navigation-div {
            max-height: 100px;
        }

        .navigation-logo {
            max-height: 60px;
            margin: 20px;
        }

        .navigation-button {
            margin: 15px;
        }

        .container h2 {
            color: white;
            margin-bottom: 30px;
        }

        .begin-button {
            margin-top: 80px;
            margin-right: 20px;
        }

          .container h2 {
            color: white;
            margin-bottom: 30px;
        }

        .quiz-question {
            background: rgb(255, 255, 255);
            margin: 2em;
        }

        .question-box {
            background: red;
            padding: 20px;
            margin: 20px;
            font-size: 150%;
            border-radius: 4px;
            /* box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); */

        }

        .answer-box {
            width: 80%;
            margin: 2em;
            display: block;
            border-radius: 4px;
            padding: 1em;
            cursor: pointer;
        }

        .text {
            color: black;
        }

        .progress {
            margin: 20px;
        }

        .question-container {
            /* margin-top: 50px; */
        }

        .progress {
            margin-top: 80px;
        }
    </style>
</head>

<%!

		Quiz getQuiz() {
	
			QuizService quizService = new QuizService(new QuizDao());
		
			Quiz quiz = quizService.findRandom();
		
			return quiz;
		
		}

%>

<body>

<% 
	Quiz quiz1 = getQuiz();
    Quiz quiz = getQuiz();

//     while(quiz1.getId() == quiz.getId()){
//         quiz = getQuiz();
//     }

%>

    <div class="background-sky hero"></div>

    <div class="row">
        <a href="/rwa-z2-mirza-hasanovic/quiz/admin/login" class="btn black-text btn-flat right navigation-button white-text">Log in</a>
        <a href="/rwa-z2-mirza-hasanovic/" class="btn black-text btn-flat right navigation-button white-text">Home</a>
    </div>

    <input type="hidden" value="<%= quiz1.getId() %>" id="quizId1">
        
    <div class="row">
        <div id="data1" class="col l6 m12 s12">
            <div class="container transparent row">
                    <div class="container col l8 offset-l2 m10 offset-m1 s12">
                            <div style="position:relative;">
                                <div id="background" class="bg-image" style="background-image: url(<%= quiz1.getImageUrl() %>);">
                                </div>
                    
                                <div class="image"> <img class="image" src="<%= quiz1.getImageUrl() %>"
                                        alt=""></div>
                    
                            </div>
                    
                            <h3><%= quiz1.getTitle() %></h3>
                            <span><%= quiz1.getDescription() %></span>
                    
                            <div class="begin-button right" onclick="playQuiz1()">
                                <a class="btn">Begin</a>
                            </div>
                        </div>
                        
            </div>
        </div>

        <input type="hidden" value="<%= quiz.getId() %>" id="quizId">

        <div id="data" class="col l6 m12 s12">
            <div class="container transparent row">
                    <div class="container col l8 offset-l2 m10 offset-m1 s12">
                            <div style="position:relative;">
                                <div id="background" class="bg-image" style="background-image: url(<%= quiz.getImageUrl() %>);">
                                </div>
                    
                                <div class="image"> <img class="image" src="<%= quiz.getImageUrl() %>"
                                        alt=""></div>
                    
                            </div>
                    
                            <h3><%= quiz.getTitle() %></h3>
                            <span><%= quiz.getDescription() %></span>
                    
                            <div class="begin-button right" onclick="playQuiz()">
                                <a class="btn">Begin</a>
                            </div>
                        </div>
                        
            </div>
        </div>

    </div>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>

        var questions;
        var currentQuestion = 0;
        var currentTimer;
        var interval = 0.5;
        var skippedQuestions = [];

        function buttonClicked(answer) {
            //document.getElementById("chck").checked = !document.getElementById("chck").checked;
            if(questions[currentQuestion].timeLeft > 0){
                $(answer).children()[0].checked = !$(answer).children()[0].checked;
            }
        }

        function playQuiz(){
            var quizId = $("#quizId").val();

            $.ajax({
                url: 'single_quiz',  
                type: 'POST',    
                data: {'quizId': quizId },
                success: function(result) {
                    questions = result.questions;

                    for(q in questions){
                        questions[q].timeLeft = questions[q].time;
                        questions[q].checkedAnswers = [];
                    }

                    goToQuestion(currentQuestion);

                }
            });

        }

        function goToQuestion(questionNumber) {
        
            var questionString = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12">' + 
            ' <div class="quiz-question transparent" id="wholeQuestion"> <div class="question-box teal lighten-3 z-depth-3">' + 
            ' <span class="text">' + questions[questionNumber].text + '</span> </div>';

            for(var a in questions[questionNumber].answers) {
                questionString +='<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="buttonClicked(this)">' + 
                ' <input type="checkbox"> <span class="text">' + questions[questionNumber].answers[a].text + '</span> </div> ';
            }

            questionString += ' <div class="progress teal lighten-4" id="timer-outline">' +
                ' <div class="determinate light-blue darken-2" id="timer" style="width: 100%"></div>' + 
                ' </div> <div> <a href="#" class="btn" onclick="skipQuestion()"><i class="material-icons right">skip_next</i>Skip</a>' + 
                ' <a href="#" class="btn right" onclick="nextQuestion()"><i class="material-icons right">keyboard_arrow_right</i>Next question</a>' + 
                ' </div> </div> </div> </div> ';

            document.getElementById('data').innerHTML = questionString;

            setUpTimer();
        }

        function nextQuestion(){
            clearTimer();
            getCheckedAnswers();
            if(currentQuestion == questions.length - 1){
                goToUnansweredList();
            } else {
                goToQuestion(++currentQuestion);
            }
        }

        function skipQuestion(){
            clearTimer();
            skippedQuestions.push(currentQuestion);

            if(currentQuestion == questions.length - 1){
                goToUnansweredList();   
            } else {
                goToQuestion(++currentQuestion);
            }
        }


        function setUpTimer(){
            currentTimer =  setInterval(function () {
                var timer = document.getElementById("timer");

                questions[currentQuestion].timeLeft = questions[currentQuestion].timeLeft - interval;
                timer.style.width = ((questions[currentQuestion].timeLeft/questions[currentQuestion].time)*100).toString() + "%";

                if (questions[currentQuestion].timeLeft < 11) {
                    timer.classList.remove("light-blue");
                    timer.classList.add("red");
                    document.getElementById("timer-outline").classList.remove("teal");
                    document.getElementById("timer-outline").classList.add("red");
                }

                if(questions[currentQuestion].timeLeft <= 0) {
                    clearTimer();
                    for(var i = 0; i<questions[currentQuestion].answers.length; i++){
                        $($('#wholeQuestion').children()[i+1]).children()[0].checked = false;
                    }
                }

            }, interval*1000);
        }

        function clearTimer(){
            if(currentTimer != undefined) {
                clearInterval(currentTimer);
            }
        }

        function getCheckedAnswers() {

            questions[currentQuestion].checkedAnswers = [];
            for(var i = 0; i<questions[currentQuestion].answers.length; i++){

                if($($('#wholeQuestion').children()[i+1]).children()[0].checked) {
                    questions[currentQuestion].checkedAnswers.push(i+1);
                }

            }
        }


        function goToUnansweredList(){

            getCheckedAnswers();

            clearTimer();

            if(skippedQuestions.length == 0) {
                goToResults();
                return;
            }

            var unansweredList = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12"> ' + 
            '<div class="quiz-question transparent"> <div class="question-box teal lighten-3 z-depth-3"> ' + 
            '<span class="text">You are finished, but you have skipped a few questions. Click them if you want to do them again.' + 
            '</span> </div> ';

            for(var i in skippedQuestions) {
                unansweredList += '<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="goToSkippedQuestion(' + skippedQuestions[i] + ')"> ' + 
                '<span class="text">Question ' + (skippedQuestions[i] + 1)+ '</span> </div> ';
            }

            unansweredList += '<div> <button href="#" class="btn black-text btn-flat teal lighten-3 right" onclick="goToResults()">Finish</button> </div>'+
            '</div> </div> </div> ';

            document.getElementById('data').innerHTML = unansweredList;
        }

        function goToSkippedQuestion(questionNumber){
            
            for(var i=0; i<skippedQuestions.length; i++){
                if(skippedQuestions[i]==questionNumber){
                    skippedQuestions.splice(i, 1);
                }
            }


            var questionString = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12">' + 
            ' <div class="quiz-question transparent" id="wholeQuestion"> <div class="question-box teal lighten-3 z-depth-3">' + 
            ' <span class="text">' + questions[questionNumber].text + '</span> </div>';

            for(var a in questions[questionNumber].answers) {
                questionString +='<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="buttonClicked(this)">' + 
                ' <input type="checkbox"> <span class="text">' + questions[questionNumber].answers[a].text + '</span> </div> ';
            }

            questionString += ' <div class="progress teal lighten-4" id="timer-outline">' +
                ' <div class="determinate light-blue darken-2" id="timer" style="width: 100%"></div>' + 
                ' </div> <div>' + 
                ' <a href="#" class="btn right" onclick="goToUnansweredList()"><i class="material-icons right">keyboard_arrow_right</i>List</a>' + 
                ' </div> </div> </div> </div> ';

            document.getElementById('data').innerHTML = questionString;

            currentQuestion = questionNumber;

            setUpTimer();
        }

        function goToResults(){

            var quizId = $("#quizId").val();

            var quizResults = {};
            quizResults.questions = questions;

            $.ajax({
                url: 'quiz-results',  
                type: 'POST',    
                data: {'quizId': quizId, 'quizResults': JSON.stringify(quizResults)},
                success: function(result) {
                    
                    console.log(result);
                    printResults(result);

                }
            });
        }

        function printResults(result){
            
            var resultsString = '<div class="row transparent question-container"> ' + 
            '<div class="container transparent col l8 offset-l2 m12 s12"> ' + 
            '<div class="question-box white lighten-3 z-depth-3"> <div class="quiz-question white"> ' + 
            '<div class="text">Congratulations, your score is '+result+'%. Please submit your results. </div> </div> ' + 
            '<div class="input-field"> <input id="first_name" type="text" class="validate"> <label for="first_name">First Name</label>' + 
            ' </div> <div class="input-field"> <input id="last_name" type="text" class="validate"> <label for="last_name">Last Name</label>' + 
            ' </div> <div class="input-field"> <input id="email" type="email" class="validate"> <label for="email">Email</label> ' + 
            '</div> <div> <button href="#" class="btn black-text btn-flat teal lighten-3 right" onclick="submitResults('+result+')">Send</button> ' + 
            '</div> </div> </div> </div> ';

            console.log(questions);
            document.getElementById('data').innerHTML = resultsString;
        }

        function submitResults(){
            var quizId = $("#quizId").val();
            var firstName = $('#first_name').val();
            var lastName = $('#last_name').val();
            var email = $('#email').val();

            var quizResults = {};
            quizResults.questions = questions;

            $.ajax({
                url: 'score-servlet',  
                type: 'POST',    
                data: {'quizId': quizId, 'firstName':firstName, 'lastName':lastName, 'email':email, 'result':result},
                success: function(result) {
                }
            });
        }
    </script>
    <script>

        var questions1;
        var currentQuestion1 = 0;
        var currentTimer1;
        var interval1 = 0.5;
        var skippedQuestions1 = [];

        function buttonClicked1(answer) {
            //document.getElementById("chck").checked = !document.getElementById("chck").checked;
            if(questions1[currentQuestion1].timeLeft > 0){
                $(answer).children()[0].checked = !$(answer).children()[0].checked;
            }
        }

        function playQuiz1(){
            var quizId1 = $("#quizId1").val();

            $.ajax({
                url: 'single_quiz',  
                type: 'POST',    
                data: {'quizId': quizId1 },
                success: function(result) {
                    questions1 = result.questions;

                    for(q in questions1){
                        questions1[q].timeLeft = questions1[q].time;
                        questions1[q].checkedAnswers = [];
                    }

                    goToQuestion1(currentQuestion1);

                }
            });

        }

        function goToQuestion1(questionNumber) {
        
            var questionString = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12">' + 
            ' <div class="quiz-question transparent" id="wholeQuestion1"> <div class="question-box teal lighten-3 z-depth-3">' + 
            ' <span class="text">' + questions1[questionNumber].text + '</span> </div>';

            for(var a in questions1[questionNumber].answers) {
                questionString +='<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="buttonClicked1(this)">' + 
                ' <input type="checkbox"> <span class="text">' + questions1[questionNumber].answers[a].text + '</span> </div> ';
            }

            questionString += ' <div class="progress teal lighten-4" id="timer-outline1">' +
                ' <div class="determinate light-blue darken-2" id="timer1" style="width: 100%"></div>' + 
                ' </div> <div> <a href="#" class="btn" onclick="skipQuestion1()"><i class="material-icons right">skip_next</i>Skip</a>' + 
                ' <a href="#" class="btn right" onclick="nextQuestion1()"><i class="material-icons right">keyboard_arrow_right</i>Next question</a>' + 
                ' </div> </div> </div> </div> ';

            document.getElementById('data1').innerHTML = questionString;

            setUpTimer1();
        }

        function nextQuestion1(){
            clearTimer1();
            getCheckedAnswers1();
            if(currentQuestion1 == questions1.length - 1){
                goToUnansweredList1();
            } else {
                goToQuestion1(++currentQuestion1);
            }
        }

        function skipQuestion1(){
            clearTimer1();
            skippedQuestions1.push(currentQuestion1);

            if(currentQuestion1 == questions1.length - 1){
                goToUnansweredList1();   
            } else {
                goToQuestion1(++currentQuestion1);
            }
        }


        function setUpTimer1(){
            currentTimer1 =  setInterval(function () {
                var timer = document.getElementById("timer1");

                questions1[currentQuestion1].timeLeft = questions1[currentQuestion1].timeLeft - interval;
                timer.style.width = ((questions1[currentQuestion1].timeLeft/questions1[currentQuestion1].time)*100).toString() + "%";

                if (questions1[currentQuestion1].timeLeft < 11) {
                    timer.classList.remove("light-blue");
                    timer.classList.add("red");
                    document.getElementById("timer-outline1").classList.remove("teal");
                    document.getElementById("timer-outline1").classList.add("red");
                }

                if(questions1[currentQuestion1].timeLeft <= 0) {
                    clearTimer1();
                    for(var i = 0; i<questions1[currentQuestion1].answers.length; i++){
                        $($('#wholeQuestion1').children()[i+1]).children()[0].checked = false;
                    }
                }

            }, interval1*1000);
        }

        function clearTimer1(){
            if(currentTimer1 != undefined) {
                clearInterval(currentTimer1);
            }
        }

        function getCheckedAnswers1() {

            questions1[currentQuestion1].checkedAnswers = [];
            for(var i = 0; i<questions1[currentQuestion1].answers.length; i++){

                if($($('#wholeQuestion1').children()[i+1]).children()[0].checked) {
                    questions1[currentQuestion1].checkedAnswers.push(i+1);
                }

            }
        }


        function goToUnansweredList1(){

            getCheckedAnswers1();

            clearTimer1();

            if(skippedQuestions1.length == 0) {
                goToResults1();
                return;
            }

            var unansweredList = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12"> ' + 
            '<div class="quiz-question transparent"> <div class="question-box teal lighten-3 z-depth-3"> ' + 
            '<span class="text">You are finished, but you have skipped a few questions. Click them if you want to do them again.' + 
            '</span> </div> ';

            for(var i in skippedQuestions1) {
                unansweredList += '<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="goToSkippedQuestion1(' + skippedQuestions1[i] + ')"> ' + 
                '<span class="text">Question ' + (skippedQuestions1[i] + 1)+ '</span> </div> ';
            }

            unansweredList += '<div> <button href="#" class="btn black-text btn-flat teal lighten-3 right" onclick="goToResults1()">Finish</button> </div>'+
            '</div> </div> </div> ';

            document.getElementById('data1').innerHTML = unansweredList;
        }

        function goToSkippedQuestion1(questionNumber){
            
            for(var i=0; i<skippedQuestions1.length; i++){
                if(skippedQuestions1[i]==questionNumber){
                    skippedQuestions1.splice(i, 1);
                }
            }


            var questionString = '<div class="row transparent question-container">' + 
            '<div class="container transparent col l8 offset-l2 m12 s12">' + 
            ' <div class="quiz-question transparent" id="wholeQuestion1"> <div class="question-box teal lighten-3 z-depth-3">' + 
            ' <span class="text">' + questions1[questionNumber].text + '</span> </div>';

            for(var a in questions1[questionNumber].answers) {
                questionString +='<div class="answer-box  teal lighten-4 waves-effect waves-teal" onClick="buttonClicked1(this)">' + 
                ' <input type="checkbox"> <span class="text">' + questions1[questionNumber].answers[a].text + '</span> </div> ';
            }

            questionString += ' <div class="progress teal lighten-4" id="timer-outline1">' +
                ' <div class="determinate light-blue darken-2" id="timer1" style="width: 100%"></div>' + 
                ' </div> <div>' + 
                ' <a href="#" class="btn right" onclick="goToUnansweredList1()"><i class="material-icons right">keyboard_arrow_right</i>List</a>' + 
                ' </div> </div> </div> </div> ';

            document.getElementById('data1').innerHTML = questionString;

            currentQuestion1 = questionNumber;

            setUpTimer1();
        }

        function goToResults1(){

            var quizId = $("#quizId1").val();

            var quizResults = {};
            quizResults.questions = questions1;

            $.ajax({
                url: 'quiz-results',  
                type: 'POST',    
                data: {'quizId': quizId, 'quizResults': JSON.stringify(quizResults)},
                success: function(result) {
                    
                    console.log(result);
                    printResults1(result);

                }
            });
        }

        function printResults1(result){
            
            var resultsString = '<div class="row transparent question-container"> ' + 
            '<div class="container transparent col l8 offset-l2 m12 s12"> ' + 
            '<div class="question-box white lighten-3 z-depth-3"> <div class="quiz-question white"> ' + 
            '<div class="text">Congratulations, your score is '+result+'%. Please submit your results. </div> </div> ' + 
            '<div class="input-field"> <input id="first_name1" type="text" class="validate"> <label for="first_name">First Name</label>' + 
            ' </div> <div class="input-field"> <input id="last_name1" type="text" class="validate"> <label for="last_name">Last Name</label>' + 
            ' </div> <div class="input-field"> <input id="email1" type="email" class="validate"> <label for="email">Email</label> ' + 
            '</div> <div> <button href="#" class="btn black-text btn-flat teal lighten-3 right" onclick="submitResults1('+result+')">Send</button> ' + 
            '</div> </div> </div> </div> ';

            document.getElementById('data1').innerHTML = resultsString;
        }

        function submitResults1(result){
             var quizId = $("#quizId1").val();
            var firstName = $('#first_name1').val();
            var lastName = $('#last_name1').val();
            var email = $('#email1').val();

            var quizResults = {};
            quizResults.questions = questions;

            $.ajax({
                url: 'score-servlet',  
                type: 'POST',    
                data: {'quizId': quizId, 'firstName':firstName, 'lastName':lastName, 'email':email, 'result':result},
                success: function(result) {
                }
            });
        }
    </script>
</body>

</html>