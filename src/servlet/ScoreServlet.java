package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.QuizDao;
import database.ResultDao;
import domain.Quiz;
import domain.Result;
import service.QuizService;
import service.ResultService;

@WebServlet(urlPatterns = { "/quiz/score-servlet" })
public class ScoreServlet extends HttpServlet {
	public ScoreServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String quizID = request.getParameter("quizId");
		String email = request.getParameter("email");
		String result = request.getParameter("result");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		QuizService quizService = new QuizService(new QuizDao());
		Quiz q = quizService.findById(Integer.parseInt(quizID));
	
		ResultService resultService = new ResultService(new ResultDao());
		Result userResult = new Result(firstName, lastName, email, q.getTitle(), q.getCreatedBy().getUsername(), Integer.parseInt(result));
		resultService.create(userResult);
	}
}