package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import domain.Player;
import domain.Quiz;

public class QuizDao extends AbstractDao {

	public List<Quiz> getAll() {
		EntityManager em = getEntityManager();
		Query query = em.createQuery("SELECT q FROM Quiz q");
		List<Quiz> resultList = query.getResultList();
		em.close();
		return resultList;
	}
	
	public Quiz findById(Integer id) {
		EntityManager em = getEntityManager();
		Query query = em.createQuery("SELECT q FROM Quiz q WHERE q.id = :id").setParameter("id", id);
        List<Quiz> results = query.getResultList();
        if (results.size() == 1) 
        	return results.get(0);
        else
        	return null;
	}

	public Quiz findByTitle(String title) {
		EntityManager em = getEntityManager();
		Query query = em.createQuery("SELECT q FROM Quiz q WHERE q.title = :title").setParameter("title", title);
        List<Quiz> results = query.getResultList();
        if (results.size() == 1) 
        	return results.get(0);
        else
        	return null;
	}

	public void create(Quiz quiz) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(quiz);
		em.getTransaction().commit();
		em.close();
	}

	public void removeByTitle(String title) {
		EntityManager em = getEntityManager();
		Quiz quiz = findByTitle(title);
		if (quiz != null) {
			em.getTransaction().begin();
			Quiz mergedQuiz = em.merge(quiz);
			em.remove(mergedQuiz);
			em.getTransaction().commit();
		}
	}

}
