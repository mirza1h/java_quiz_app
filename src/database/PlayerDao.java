package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import domain.Player;

final public class PlayerDao extends AbstractDao {

	public void UserDao() {

	}

	public List<Player> getAll() {
		EntityManager em = getEntityManager();
		Query query = em.createQuery("SELECT u FROM Player u");
		List<Player> resultList = query.getResultList();
		em.close();
		return resultList;
	}

	public Player findByUsername(String username) {
		EntityManager em = getEntityManager();
		Query query = em.createQuery("SELECT u FROM Player u WHERE u.username = :username").setParameter("username", username);
        List<Player> results = query.getResultList();
        if (results.size() == 1) 
        	return results.get(0);
        else
        	return null;
	}
	
	public void removeByUsername(String username) {
		EntityManager em = getEntityManager();
		Player user = findByUsername(username);
		if (user != null) {
			em.getTransaction().begin();
			Player mergedUser = em.merge(user);
			em.remove(mergedUser);
			em.getTransaction().commit();
		}
	}

	public void create(Player user) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		em.close();
	}
}