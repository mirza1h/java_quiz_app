document.addEventListener("DOMContentLoaded", function () {
	'use strict';
	
	// Set often needed elements global
	var questions;
	var currentQuestion = 0;
	var currentTimer;
	var interval = 0.5;
	var skippedQuestions = [];
	var playQuizBtn = document.getElementById("idPlayQuizBtn");
	var questionText = document.getElementById("idQuestionText");
	var questionAnswerDiv = document.getElementById("idQuestionAnswer");
	var skipQuestionBtn = document.getElementById("idSkipQuestion");
	var nextQuestionBtn = document.getElementById("idNextQuestion");
	var mainQuestionsDiv = document.getElementById("idMainQuestionsDiv");
	var answersDiv = document.getElementById("idAnswersDiv");

	var init = function () {
		// Register 'click' callbacks for buttons
		playQuizBtn.addEventListener("click", playQuiz);
		skipQuestionBtn.addEventListener("click", skipQuestion);
		nextQuestionBtn.addEventListener("click", nextQuestion);
	}

	function answerChecked(event) {
		if (questions[currentQuestion].timeLeft > 0) {
			event.target.children[0].checked = !event.target.children[0].checked;
		}
	}

	function playQuiz() {
		var quizId = document.getElementById("idQuiz").value;

		$.ajax({
			url : 'single_quiz',
			type : 'POST',
			data : {
				'quizId' : quizId
			},
			success : function(result) {
				questions = result.questions;

				for (var i=0; i<questions.length; ++i) {
					questions[i].timeLeft = questions[i].time;
					questions[i].checkedAnswers = [];
				}

				goToQuestion(currentQuestion);

			}
		});

	}

	function goToQuestion(questionNumber) {
		mainQuestionsDiv.style.display = "block";
		var question = questions[questionNumber];
		questionText.innerText = question.text;
		for (var i=0; i<question.answers.length; ++i) {
			var answerDiv = questionAnswerDiv.cloneNode(true);
			answerDiv.style.display = "block";
			answerDiv.addEventListener("click", answerChecked);
			answerDiv.children[1].innerText = question.answers[i].text;
			answersDiv.appendChild(answerDiv);
		}
		setUpTimer();
	}

	function nextQuestion() {
		clearTimer();
		getCheckedAnswers();
		if (currentQuestion == questions.length - 1) {
			goToUnansweredList();
		} else {
			goToQuestion(++currentQuestion);
		}
	}

	function skipQuestion() {
		clearTimer();
		skippedQuestions.push(currentQuestion);

		if (currentQuestion == questions.length - 1) {
			goToUnansweredList();
		} else {
			goToQuestion(++currentQuestion);
		}
	}

	function setUpTimer() {
		currentTimer = setInterval(
				function() {
					var timer = document.getElementById("timer");

					questions[currentQuestion].timeLeft = questions[currentQuestion].timeLeft
							- interval;
					timer.style.width = ((questions[currentQuestion].timeLeft / questions[currentQuestion].time) * 100)
							.toString()
							+ "%";

					if (questions[currentQuestion].timeLeft < 11) {
						timer.classList.remove("light-blue");
						timer.classList.add("red");
						document.getElementById("timer-outline").classList
								.remove("teal");
						document.getElementById("timer-outline").classList
								.add("red");
					}

					if (questions[currentQuestion].timeLeft <= 0) {
						clearTimer();
						for (var i = 0; i < questions[currentQuestion].answers.length; i++) {
							$($('#wholeQuestion').children()[i + 1]).children()[0].checked = false;
						}
					}

				}, interval * 1000);
	}

	function clearTimer() {
		if (currentTimer != undefined) {
			clearInterval(currentTimer);
		}
	}

	function getCheckedAnswers() {

		questions[currentQuestion].checkedAnswers = [];
		for (var i = 0; i < questions[currentQuestion].answers.length; i++) {

			if ($($('#wholeQuestion').children()[i + 1]).children()[0].checked) {
				questions[currentQuestion].checkedAnswers.push(i + 1);
			}

		}
	}

	function goToUnansweredList() {

		getCheckedAnswers();

		clearTimer();

		if (skippedQuestions.length == 0) {
			goToResults();
			return;
		}

		var unansweredList = '<div class="row transparent question-container">'
				+ '<div class="container transparent col l8 offset-l2 m12 s12"> '
				+ '<div class="quiz-question transparent"> <div class="question-box '
				+ ' lighten-3 z-depth-3"> '
				+ '<span class="text">You are finished, but you have skipped a few questions. Click them if you want to do them again.'
				+ '</span> </div> ';

		for ( var i in skippedQuestions) {
			unansweredList += '<div class="answer-box  '
					+ ' lighten-4 waves-effect waves-teal" onClick="goToSkippedQuestion('
					+ skippedQuestions[i] + ')"> ' + '<span class="text">Question '
					+ (skippedQuestions[i] + 1) + '</span> </div> ';
		}

		unansweredList += '<div> <button href="#" class="btn black-text btn-flat '
				+ ' lighten-3 right" onclick="goToResults()">Finish</button> </div>'
				+ '</div> </div> </div> ';

		document.getElementById('data').innerHTML = unansweredList;
	}

	function goToSkippedQuestion(questionNumber) {

		for (var i = 0; i < skippedQuestions.length; i++) {
			if (skippedQuestions[i] == questionNumber) {
				skippedQuestions.splice(i, 1);
			}
		}

		var questionString = '<div class="row transparent question-container">'
				+ '<div class="container transparent col l8 offset-l2 m12 s12">'
				+ ' <div class="quiz-question transparent" id="wholeQuestion"> <div class="question-box '
				+ ' lighten-3 z-depth-3">' + ' <span class="text">'
				+ questions[questionNumber].text + '</span> </div>';

		for ( var a in questions[questionNumber].answers) {
			questionString += '<div class="answer-box  '
					+ ' lighten-4 waves-effect waves-teal" onClick="answerChecked(this)">'
					+ ' <input type="checkbox"> <span class="text">'
					+ questions[questionNumber].answers[a].text + '</span> </div> ';
		}

		questionString += ' <div class="progress teal lighten-4" id="timer-outline">'
				+ ' <div class="determinate light-blue darken-2" id="timer" style="width: 100%"></div>'
				+ ' </div> <div>'
				+ ' <a href="#" class="btn right '
				+ ' lighten-2 black-text" onclick="goToUnansweredList()"><i class="material-icons right">keyboard_arrow_right</i>List</a>'
				+ ' </div> </div> </div> </div> ';

		document.getElementById('data').innerHTML = questionString;

		currentQuestion = questionNumber;

		setUpTimer();
	}

	function goToResults() {
		var quizId = document.getElementById("idQuiz").value;

		var quizResults = {};
		quizResults.questions = questions;

		$.ajax({
			url : 'quiz-results',
			type : 'POST',
			data : {
				'quizId' : quizId,
				'quizResults' : JSON.stringify(quizResults)
			},
			success : function(result) {
				printResults(result);

			}
		});
	}

	function printResults(result) {

		var resultsString = '<div class="row transparent question-container"> '
				+ '<div class="container transparent col l8 offset-l2 m12 s12"> '
				+ '<div class="question-box white lighten-3 z-depth-3"> <div class="quiz-question white"> '
				+ '<div class="text">Congratulations, your score is '
				+ result
				+ '%. Please submit your results. </div> </div> '
				+ '<div class="input-field"> <input id="first_name" type="text" class="validate"> <label for="first_name">First Name</label>'
				+ ' </div> <div class="input-field"> <input id="last_name" type="text" class="validate"> <label for="last_name">Last Name</label>'
				+ ' </div> <div class="input-field"> <input id="email" type="email" class="validate"> <label for="email">Email</label> '
				+ '</div> <div> <button href="#" class="btn black-text btn-flat teal lighten-3 right" onclick="submitResults('
				+ result + ')">Send</button> ' + '</div> </div> </div> </div> ';

		console.log(questions);
		document.getElementById('data').innerHTML = resultsString;
	}

	function submitResults(result) {
		var quizId = document.getElementById("idQuiz").value;
		var firstName = $('#first_name').val();
		var lastName = $('#last_name').val();
		var email = $('#email').val();

		var quizResults = {};
		quizResults.questions = questions;

		$.ajax({
			url : 'score-servlet',
			type : 'POST',
			data : {
				'quizId' : quizId,
				'firstName' : firstName,
				'lastName' : lastName,
				'email' : email,
				'result' : result
			},
			success : function(result) {
				window.location.href = "<%=request.getContextPath()%>/";
			}
		});
	}


	init();

});