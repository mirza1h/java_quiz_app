function deleteQuiz(quizTitle) {
	var pathSpan = document.getElementById("pathSpan");		
	window.location.href = pathSpan.textContent + "/admin/delete-quiz?quiz-title="+ quizTitle;
};