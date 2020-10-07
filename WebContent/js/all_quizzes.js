function play(quizId) {
	var pathSpan = document.getElementById("pathSpan");		
	window.location.replace(pathSpan.textContent + "/quiz/random-quiz?quiz-id=" + quizId);
}