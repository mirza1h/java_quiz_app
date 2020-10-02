package database;

import domain.Player;
import roles.Role;
import service.PlayerService;

public class Initialize {
	public static void init() {

		Player user = new Player();

		user.setFirstName("Admin");
		user.setLastName("Admin");
		user.setUsername("mirza");
		user.setPassword("admin");
		user.setRole(Role.ADMIN);
		PlayerService playerService = new PlayerService(new PlayerDao());
		playerService.create(user);

		user = playerService.findByUsername("mirza");

	}
}
