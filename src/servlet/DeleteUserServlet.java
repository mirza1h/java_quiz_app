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

@WebServlet(urlPatterns = { "/admin/delete_user" })
public class DeleteUserServlet extends HttpServlet {
	public DeleteUserServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		PlayerService playerService = new PlayerService(new PlayerDao());
		playerService.removeByUsername(request.getParameter("username"));
	}
	
	
	
}
