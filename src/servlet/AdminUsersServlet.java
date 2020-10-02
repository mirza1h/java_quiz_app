package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.PlayerDao;
import domain.Player;
import roles.Role;
import service.PlayerService;

@WebServlet(urlPatterns = { "/admin/all_users" })
public class AdminUsersServlet extends HttpServlet {
	public AdminUsersServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/admin/all_users.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		PlayerService playerService = new PlayerService(new PlayerDao());
		String method = request.getParameter("method");
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
				
		if(method.equals("delete")) {
			playerService.removeByUsername(request.getParameter("username"));
		}
		
		if(method.equals("add")) {
			if(playerService.findByUsername(username) == null){
				Player newUser = new Player();
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setPassword(password);
				newUser.setUsername(username);
				
				Role userRole = null;
				
				if(role.equals("admin")){
					userRole = Role.ADMIN;
				} else if (role.equals("editor")){
					userRole = Role.EDITOR;
				}
				
				newUser.setRole(userRole);
				playerService.create(newUser);
			}
		}
	}
	
	
	
}
