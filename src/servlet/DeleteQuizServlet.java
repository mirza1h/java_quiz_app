package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.QuizDao;
import service.QuizService;

@WebServlet(urlPatterns = { "/admin/delete-quiz" })
public class DeleteQuizServlet extends HttpServlet {
	public DeleteQuizServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QuizService quizService = new QuizService(new QuizDao());
		quizService.removeByTitle(request.getParameter("quiz-title"));
		request.getRequestDispatcher("/admin/all_quizzes").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
}
