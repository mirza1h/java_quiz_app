package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Initialize;
import database.PlayerDao;
import domain.Player;
import service.PlayerService;

@WebServlet(urlPatterns = { "/quiz/admin/login" })
public class AdminLoginServlet extends HttpServlet {
	private PlayerService playerService;

	public AdminLoginServlet() {
		super();
		playerService = new PlayerService(new PlayerDao());
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("logout") != null) {
			request.getSession().invalidate();
		}

		request.getRequestDispatcher("/login.html").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Map<String, String> messages = new HashMap<String, String>();

		if (username == null || username.isEmpty()) {
			messages.put("username", "Enter a username");
		}

		if (password == null || password.isEmpty()) {
			messages.put("password", "Enter a password");
		}

		if (messages.isEmpty()) {

			Player player = playerService.authenticate(username, password);

			if (player != null) {
				Cookie usernameCookie = new Cookie("username", player.getUsername());
				usernameCookie.setMaxAge(2 * 24 * 60 * 60);

				Cookie roleCookie = new Cookie("role", player.getRole().toString());
				roleCookie.setMaxAge(2 * 24 * 60 * 60);

				request.getSession().setAttribute("user", player);

				response.addCookie(usernameCookie);
				response.addCookie(roleCookie);
				response.sendRedirect(request.getContextPath() + "/admin/all_quizzes");
				return;
			} else {
				messages.put("login", "Wrong username or password");
			}
		}

		request.setAttribute("messages", messages);
		request.getRequestDispatcher("/login.html").forward(request, response);
	}

}
