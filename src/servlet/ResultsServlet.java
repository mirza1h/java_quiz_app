package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.QuizDao;
import domain.Answer;
import domain.Question;
import domain.Quiz;
import service.QuizService;


class QuizQuestion{
	private List<Integer> checkedAnswers;

	public List<Integer> getCheckedAnswers() {
		return checkedAnswers;
	}

	public void setCheckedAnswers(List<Integer> checkedAnswers) {
		this.checkedAnswers = checkedAnswers;
	}

}

class QuizQuestions{
	private List<QuizQuestion> questions;

	public List<QuizQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(List<QuizQuestion> questions) {
		this.questions = questions;
	}
	
}


@WebServlet(urlPatterns = { "/quiz/quiz-results" })
public class ResultsServlet extends HttpServlet {
	public ResultsServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		QuizQuestions quizQuestions = gson.fromJson(request.getParameter("quizResults"), QuizQuestions.class);
				
		QuizService quizService = new QuizService(new QuizDao());
		
		Quiz quiz = quizService.findById(Integer.parseInt(request.getParameter("quizId")));
		
		int totalPoints = 0;
		int userPoints = 0;
		
		for(int i=0; i<quiz.getQuestions().size(); i++){
			Question currentQuestion = quiz.getQuestions().get(i);
			
			totalPoints += currentQuestion.getPoints();
			
			boolean correctAnswer = true;
			
			int numberOfCorrectAnswers = 0;

			for(int j=0; j<currentQuestion.getAnswers().size(); j++){
				
				Answer currentAnswer = currentQuestion.getAnswers().get(j);
				
				if(currentAnswer.isCorrect()){
					boolean containsAnswer = false;
					numberOfCorrectAnswers++;
					
					List<Integer> userAnswers = quizQuestions.getQuestions().get(i).getCheckedAnswers();
					
					for(int k=0; k<userAnswers.size(); k++){
						int currentUserAnswer = userAnswers.get(k);
						
						if(currentUserAnswer == j+1){
							containsAnswer = true;
							break;
						}
					}
					if(containsAnswer == false){
						correctAnswer = false;
					}
				}
			}
			if(quizQuestions.getQuestions().get(i).getCheckedAnswers().size()==numberOfCorrectAnswers && correctAnswer){
				userPoints += quiz.getQuestions().get(i).getPoints();
			}
			
		}
		
		double userPercentage = (((double)userPoints/totalPoints) * 100);		
		PrintWriter pw = response.getWriter();
		pw.println(new Double(userPercentage).intValue());
	}
}