function deleteQuiz(quizTitle) {
	window.location.href = "<%=request.getContextPath()%>/admin/delete-quiz?quiz-title="+ quizTitle;
};