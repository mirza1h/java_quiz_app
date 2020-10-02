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
		quizDao.save(quiz);
	}

	public List<Quiz> findAll() {
		return quizDao.findAll();
	}
	
	public List<Quiz> findByTitleOrDescription(String searchParam) {
		return quizDao.findByTitleAndDescription(searchParam);
	}
	
	public List<Quiz> findAllActive() {
		return quizDao.findAllActive();
	}

	public List<Quiz> findByUser(String username) {
		return quizDao.findByUser(username);
	}
	
	public Quiz findById(Integer id) {
		return quizDao.findById(id);
	}

	public Quiz findByTitle(String title) {
		return quizDao.findByTitle(title);
	}
	
	public Quiz findRandom(){
		List<Quiz> allQuizzes = findAll();
		Random rand = new Random();
		
		int newRand = rand.nextInt(allQuizzes.size());
		return allQuizzes.get(newRand);

	}

	public void removeByTitle(String title) {
		quizDao.removeByTitle(title);
	}
}
