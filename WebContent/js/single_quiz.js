document.addEventListener("DOMContentLoaded", function () {
	'use strict';
	
	// Set often-needed elements global
	var playQuizBtn = document.getElementById("idPlayQuizBtn");
	var questionText = document.getElementById("idQuestionText");
	var questionAnswerDiv = document.getElementById("idQuestionAnswer");
	var nextQuestionBtn = document.getElementById("idNextQuestion");
	var mainQuestionsDiv = document.getElementById("idMainQuestionsDiv");
	var answersDiv = document.getElementById("idAnswersDiv");
	var resultText = document.getElementById("idResultText");
	var result = 0;
	var answers = [];
	var questions;
	var currentQuestion = 0;
	var currentTimer;
	var interval = 0.5;
	var skippedQuestions = [];

	var init = function () {
		// Register 'click' callbacks for buttons
		playQuizBtn.addEventListener("click", playQuiz);
		nextQuestionBtn.addEventListener("click", nextQuestion);
	}

	function answerChecked(event) {
		if (questions[currentQuestion].timeLeft > 0 && event.target.hasChildNodes()) {
			event.target.children[0].checked = !event.target.children[0].checked;
		}
	}

	function playQuiz() {
		document.getElementById('data').innerHTML = '';
		var quizId = document.getElementById("idQuiz").value;
		var httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				questions = JSON.parse(httpRequest.response).questions;

				for (var i=0; i<questions.length; ++i) {
					questions[i].timeLeft = questions[i].time;
					questions[i].checkedAnswers = [];
				}
				goToQuestion(currentQuestion);
			}
		};
		httpRequest.open("POST", "single_quiz", true);
		httpRequest.send(quizId);
	}

	function goToQuestion(questionNumber) {
		mainQuestionsDiv.style.display = "block";
		var question = questions[questionNumber];
		questionText.innerText = question.text + "(" + question.points + "p)";
		for (var i=0; i<question.answers.length; ++i) {
			var answerDiv = questionAnswerDiv.cloneNode(true);
			answerDiv.style.display = "block";
			answerDiv.addEventListener("click", answerChecked);
			answerDiv.children[0].checked = false;
			answerDiv.children[1].innerText = question.answers[i].text;
			answers.push(answerDiv.children[0]);
			answersDiv.appendChild(answerDiv);
		}
		setUpTimer();
	}

	function nextQuestion() {
		clearTimer();
		getCheckedAnswers();
		if (currentQuestion == questions.length - 1) {
			printResults();
		} else {
			answersDiv.innerHTML = '';
			for (var i = 0; i < questions[currentQuestion].answers.length; i++) {
				answers.pop();
			}
			goToQuestion(++currentQuestion);
		}
	}

	function setUpTimer() {
		currentTimer = setInterval(
				function() {
					var timer = document.getElementById("timer");

					questions[currentQuestion].timeLeft = questions[currentQuestion].timeLeft - interval;
					timer.style.width = ((questions[currentQuestion].timeLeft / questions[currentQuestion].time) * 100).toString() + "%";

				}, interval * 1000);
	}

	function clearTimer() {
		if (currentTimer != undefined) {
			clearInterval(currentTimer);
		}
	}

	function getCheckedAnswers() {
		var answersChecked = 0;
		var answersCorrect = 0;
		questions[currentQuestion].checkedAnswers = [];
		for (var i = 0; i < questions[currentQuestion].answers.length; i++) {

			if (answers[i].checked) {
				++answersChecked;
				questions[currentQuestion].checkedAnswers.push(i);
				if (questions[currentQuestion].answers[i].isCorrect){
					++answersCorrect;
					result += questions[currentQuestion].points;
				}
			}

		}
		if (answersChecked == 0 || answersChecked != answersCorrect) {
			result -= questions[currentQuestion].points;
		}
	}


	function printResults() {
		mainQuestionsDiv.style.display = "none";
		resultText.style.display = "block";
		resultText.innerHTML = 'Your score is: ' + result + '.'
	}


	init();

});