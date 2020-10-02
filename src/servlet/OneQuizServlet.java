package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.QuizDao;
import domain.Quiz;
import service.QuizService;

@WebServlet(urlPatterns = { "/quiz/single_quiz" })
public class OneQuizServlet extends HttpServlet {
	public OneQuizServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/all_quizzes").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Gson gson = new Gson();
		QuizService quizService = new QuizService(new QuizDao());
		
		String quizId = request.getParameter("quizId");
		Quiz quiz = quizService.findById(Integer.parseInt(quizId));
		
		response.setContentType("application/json");
		PrintWriter pw = response.getWriter();
		pw.println("{\"numberOfQuestions\":" + quiz.getQuestions().size() + ", \"questions\":" + gson.toJson(quiz.getQuestions()) + "}");

	}
}