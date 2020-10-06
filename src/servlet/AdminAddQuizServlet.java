package servlet;

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
		Gson gson = new Gson();
		Quiz currentQuiz = gson.fromJson(request.getParameter("quiz"), Quiz.class);
		for(int i=0; i<currentQuiz.getQuestions().size(); i++){
			for(int j=0; j<currentQuiz.getQuestions().get(i).getAnswers().size(); j++) {
				if(currentQuiz.getQuestions().get(i).getAnswers().get(j).getText().equals("")) {
					currentQuiz.getQuestions().get(i).getAnswers().remove(j);
					j--;
				}
			}
		}
		
		currentQuiz.setCreatedBy(((Player)request.getSession().getAttribute("user")));
		QuizService quizService = new QuizService(new QuizDao());
		quizService.create(currentQuiz);
	}
	
}
