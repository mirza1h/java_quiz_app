package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.QuizDao;
import domain.Quiz;
import service.QuizService;

@WebServlet(urlPatterns = { "/quiz/random-quiz" })
public class RandomQuizServlet extends HttpServlet {
	public RandomQuizServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Quiz randomQuiz = new QuizService(new QuizDao()).findRandom();
		request.getRequestDispatcher("/single_quiz.jsp?quiz-id=" + randomQuiz.getId()).forward(request, response);
	}

	
}