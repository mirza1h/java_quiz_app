package database;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class AbstractDao {

	private static final String PERSISTENCE_UNIT = "rwa";
	private static EntityManagerFactory emf;
	private static EntityManagerFactory getInstance() {
		if (emf == null) {
			synchronized (EntityManagerFactory.class) {
				if (emf == null) {
					emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
				}
			}
		}
		return emf;
	}

	public static EntityManager getEntityManager() {
		return getInstance().createEntityManager();
	}
}