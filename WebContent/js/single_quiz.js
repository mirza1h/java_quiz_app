document.addEventListener("DOMContentLoaded", function () {
	'use strict';
	
	// Set often-needed elements global
	var playQuizBtn = document.getElementById("idPlayQuizBtn");
	var questionText = document.getElementById("idQuestionText");
	var questionAnswerDiv = document.getElementById("idQuestionAnswer");
	var nextQuestionBtn = document.getElementById("idNextQuestion");
	var mainQuestionsDiv = document.getElementById("idMainQuestionsDiv");
	var answersDiv = document.getElementById("idAnswersDiv");
	var submitBtn = document.getElementById("idSubmitBtn");
	var resultText = document.getElementById("idResultText");
	var questions;
	var currentQuestion = 0;
	var currentTimer;
	var interval = 0.5;
	var skippedQuestions = [];

	var init = function () {
		// Register 'click' callbacks for buttons
		playQuizBtn.addEventListener("click", playQuiz);
		nextQuestionBtn.addEventListener("click", nextQuestion);
		submitBtn.addEventListener("click", submitResults);
	}

	function answerChecked(event) {
		if (questions[currentQuestion].timeLeft > 0) {
			event.target.children[0].checked = !event.target.children[0].checked;
		}
	}

	function playQuiz() {
		document.getElementById('data').innerHTML = '';
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
			goToResults();
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
		mainQuestionsDiv.style.display = "none";
		resultText.style.display = "block";
		resultText.innerHTML = 'Your score is: ' + result + '.'
	}


	init();

});