package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import domain.Quiz;

public class QuizDao extends AbstractDao {

	public List<Quiz> findAll() {
		EntityManager em = getEntityManager();
		Query q = em.createQuery("SELECT q FROM Quiz q");
		List<Quiz> resultList = q.getResultList();
		em.close();
		return resultList;
	}
	
	public Quiz findById(Integer id) {
		EntityManager em = getEntityManager();
		try {
			Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.id = :id").setParameter("id", id);
			Quiz quiz = (Quiz) q.getSingleResult();
			return quiz;
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return null;
	}

	public List<Quiz> findByTitleAndDescription(String searchParam) {
		EntityManager em = getEntityManager();
		Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.active = TRUE "
				+ "AND (LOWER(q.title) LIKE LOWER(concat('%', :searchParam,'%')) "
				+ "OR LOWER(q.description) LIKE "
				+ "LOWER(concat('%', :searchParam,'%')))").setParameter("searchParam", searchParam);
		List<Quiz> resultList = q.getResultList();
		em.close();
		return resultList;
	}
	
	public List<Quiz> findAllActive() {
		EntityManager em = getEntityManager();
		Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.active = TRUE");
		List<Quiz> resultList = q.getResultList();
		em.close();
		return resultList;
	}
	
	public List<Quiz> findByUser(String username) {
		EntityManager em = getEntityManager();
		try {
			Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.createdBy.username = :username")
					.setParameter("username", username);
			List<Quiz> quizes = q.getResultList();
			return quizes;
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return null;
	}

	public Quiz findByTitle(String title) {
		EntityManager em = getEntityManager();
		try {
			Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.title = :title").setParameter("title", title);
			Quiz quiz = (Quiz) q.getSingleResult();
			return quiz;
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return null;
	}

	public void save(Quiz quiz) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(quiz);
		em.getTransaction().commit();
		em.close();
	}

	public void removeByTitle(String title) {
		EntityManager em = getEntityManager();
		try {
			Quiz quizToRemove = findByTitle(title);
			if (quizToRemove != null) {
				em.getTransaction().begin();
				Quiz mergedQuiz = em.merge(quizToRemove);
				em.remove(mergedQuiz);
				em.getTransaction().commit();
			}
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
	}

}
