package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import domain.Result;

public class ResultDao extends AbstractDao{
	
	public List<Result> findAll() {
		EntityManager em = getEntityManager();
		Query q = em.createQuery("SELECT r FROM Result r");
		List<Result> resultList = q.getResultList();
		em.close();
		return resultList;
	}
	
	public List<Result> findByUsername(String username) {
		EntityManager em = getEntityManager();
		try {
			Query q = em.createQuery("SELECT r FROM Result r WHERE r.createdBy = :username").setParameter("username", username);
			List<Result> resultList = q.getResultList();
			return resultList;
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return null;
	}
	

	public void save(Result result) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(result);
		em.getTransaction().commit();
		em.close();
	}

}
