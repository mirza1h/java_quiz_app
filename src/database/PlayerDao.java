package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import domain.Player;

final public class PlayerDao extends AbstractDao {

	public void UserDao() {

	}

	public List<Player> findAll() {
		EntityManager em = getEntityManager();
		Query q = em.createQuery("SELECT u FROM Player u");
		List<Player> resultList = q.getResultList();
		em.close();
		return resultList;
	}

	public Player findByUsername(String username) {
		EntityManager em = getEntityManager();
		try {
			Query q = em.createQuery("SELECT u FROM Player u WHERE u.username = :username").setParameter("username",
					username);
			Player user = (Player) q.getSingleResult();
			return user;
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return null;
	}

	public void save(Player user) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		em.close();
	}

	public void update(Player user) {
		Player currentUser = findByUsername(user.getUsername());
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		currentUser.setFirstName(user.getFirstName());
		em.getTransaction().commit();
		em.close();
		System.out.println(findByUsername(user.getUsername()).getFirstName());
	}

	public void removeByUsername(String username) {
		EntityManager em = getEntityManager();
		try {
			Player userToRemove = findByUsername(username);
			if (userToRemove != null) {
				em.getTransaction().begin();
				Player mergedUser = em.merge(userToRemove);
				em.remove(mergedUser);
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