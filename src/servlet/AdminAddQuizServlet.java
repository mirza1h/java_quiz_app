package servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.QuizDao;
import domain.Quiz;
import domain.Player;
import service.QuizService;

@WebServlet(urlPatterns = { "/admin/add_quiz" })
public class AdminAddQuizServlet extends HttpServlet {	

	public AdminAddQuizServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/admin/admin_add_quiz.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		String line = reader.readLine();
		Quiz currentQuiz = new Gson().fromJson(line, Quiz.class);

		Player user = (Player) request.getSession().getAttribute("user");
		currentQuiz.setCreatedBy(user.getUsername());
		QuizService quizService = new QuizService(new QuizDao());
		quizService.create(currentQuiz);
	}
	
}
