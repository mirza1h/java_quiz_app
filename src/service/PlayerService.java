package service;

import java.util.List;

import database.QuizDao;
import database.PlayerDao;
import domain.Quiz;
import domain.Player;

public class PlayerService {

	private PlayerDao playerDao;

	public PlayerService(PlayerDao playerDao) {
		this.playerDao = playerDao;
	}

	public void create(Player user) {
		user.setPassword(user.getPassword());
		playerDao.save(user);
	}

	public List<Player> findAll() {
		return playerDao.findAll();
	}

	public Player findByUsername(String username) {
		return playerDao.findByUsername(username);
	}

	public Player authenticate(String username, String password) {
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

	public void removeByUsername(String username) {
		playerDao.removeByUsername(username);
	}
}
