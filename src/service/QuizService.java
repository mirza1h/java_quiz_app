package service;

import java.util.List;
import java.util.Random;

import database.QuizDao;
import domain.Quiz;

public class QuizService {

	private QuizDao quizDao;

	public QuizService(QuizDao quizDao) {
		this.quizDao = quizDao;
	}

	public void create(Quiz quiz) {
		quizDao.create(quiz);
	}

	public List<Quiz> findAll() {
		return quizDao.getAll();
	}
	
	public List<Quiz> findActive() {
		return quizDao.findActive();
	}
	
	public Quiz findById(Integer id) {
		return quizDao.findById(id);
	}

	public Quiz findByTitle(String title) {
		return quizDao.findByTitle(title);
	}
	
	public Quiz getRandom(){
		List<Quiz> allQuizzes = findAll();
		int newRand = new Random().nextInt(allQuizzes.size());
		return allQuizzes.get(newRand);
	}

	public void removeByTitle(String title) {
		quizDao.removeByTitle(title);
	}
}
