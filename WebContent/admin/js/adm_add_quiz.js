document.addEventListener("DOMContentLoaded", function () {
	'use strict';
	
	// Set often-needed elements global
	var submitBtn = document.getElementById("idSubmitBtn");
	var questionList = document.getElementById("idQuestionList");
	var addQuestionBtn = document.getElementById("idAddQuestionBtn");
	var removeBtn = document.getElementById("idRemoveBtn");
	var questionListClone;

	var init = function () {
		// Register 'click' callbacks for buttons
		submitBtn.addEventListener("click", submit);
		addQuestionBtn.addEventListener("click", addNewQuestion);
		removeBtn.addEventListener("click", removeQuestion);
		questionListClone = questionList;
	}
	
    function removeQuestion(event) {
    	event.target.parentElement.parentElement.parentElement.remove();
    }
	
    function addNewQuestion() {
    	var newQuestion = questionListClone.cloneNode(true);
    	newQuestion.children[1].firstElementChild.addEventListener("click", removeQuestion);
        document.getElementById("questions").append(newQuestion);
    }

	function submit() {
		var pathSpan = document.getElementById("pathSpan");		
        var quiz = {};
        quiz.title = document.getElementById("title").value;
        quiz.description = document.getElementById("description").value;
        quiz.imageUrl = document.getElementById("image_url").value;

        quiz.questions = getQuestions();

        if (quiz.title == "" || quiz.imageUrl == "" || quiz.questions.length == 0 || quiz.questions == null) {
            alert("Form not filled out")
        	return;
        }
		
		var httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
                window.location.href = pathSpan.textContent + "/admin/all_quizzes";
			}
		};
		httpRequest.open("POST", "add_quiz", true);
		httpRequest.send(JSON.stringify(quiz));
	}

    function getQuestions() {
        var questions = [];
        $('#questions li').each(function (index) {
            questions.push(getQuestionValues(this));
        });

        if (questions === undefined || questions.length == 0) {
            return null;
        }
        return questions;
    }

    function getQuestionValues(question) {
        var currentQuestion = {};
        var infoInputs = question.children[1].getElementsByTagName("input");
        currentQuestion.text = infoInputs[0].value;
        currentQuestion.points = infoInputs[1].value;
        currentQuestion.time = infoInputs[2].value;
        var answerInputs = question.children[2].getElementsByTagName("input");
        currentQuestion.answers = [];
        for(var i = 0; i < answerInputs.length; ++i) {
            var answer = {};
            if(answerInputs[i].type == "text" && answerInputs[i].value != ''){
            	answer.text = answerInputs[i].value;
                if(answerInputs[i+1].type == "checkbox")
                	answer.checked = answerInputs[i+1].checked;
                currentQuestion.answers.push(answer);
            }
        }
        return currentQuestion;
    }

	init();

});