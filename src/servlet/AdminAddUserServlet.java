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

@WebServlet(urlPatterns = { "/admin/add_user" })
public class AdminAddUserServlet extends HttpServlet{
	private PlayerService playerService;

	public AdminAddUserServlet() {
		super();
		playerService = new PlayerService(new PlayerDao());
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.getRequestDispatcher("/admin/add_user.jsp").forward(request, response);
			return;
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		if(firstName == null || lastName == null || username == null || password == null || role == null){
			request.getRequestDispatcher("/admin/add_user.jsp").forward(request, response);
			return;
		}
		
		Role userRole;
		
		if(role.equals("admin")){
			userRole = Role.ADMIN;
		} else if (role.equals("editor")){
			userRole = Role.EDITOR;
		} else {
			request.getRequestDispatcher("/admin/add_user.jsp").forward(request, response);
			return;
		}
		
		if(playerService.findByUsername(username) == null){
			Player user = new Player(username, firstName, lastName, password, userRole);
			playerService.create(user);
			request.getRequestDispatcher("/admin/add_user.jsp").forward(request, response);
			return;
		}
			

	}
}
