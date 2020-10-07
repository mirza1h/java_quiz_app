package service;

import java.util.List;

import database.PlayerDao;
import domain.Player;

public class PlayerService {

	private PlayerDao playerDao;

	public PlayerService(PlayerDao playerDao) {
		this.playerDao = playerDao;
	}

	public void create(Player user) {
		user.setPassword(user.getPassword());
		playerDao.create(user);
	}

	public List<Player> getAll() {
		return playerDao.getAll();
	}

	public Player findByUsername(String username) {
		return playerDao.findByUsername(username);
	}
	
	public void removeByUsername(String username) {
		playerDao.removeByUsername(username);
	}

	public Player verify(String username, String password) {
		Player user = findByUsername(username);
		if (user == null) {
			return null;
		}

		if (user.getPassword() != null) {
			user.setPassword("");
			return user;
		}
		return null;
	}
}
