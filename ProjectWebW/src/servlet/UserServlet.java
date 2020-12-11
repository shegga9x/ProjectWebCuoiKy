package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import database.UserDAO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		String action = request.getParameter("action");
		 PrintWriter out = response.getWriter();
		if (action.equalsIgnoreCase("Sign In")) {
			user.setUserName(request.getParameter("un"));
			user.setPassword(request.getParameter("pw"));
			user = UserDAO.login(user);
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				response.sendRedirect("MainPage/index.jsp");
				// logged-in page
			} else {
				
				out.println("<script type=\"text/javascript\">");
				out.println("window.location = 'MainPage/login.jsp';");
				out.println("alert('User or password incorrect, please try again');");
				out.println("</script>");
			}

		} else {
			if (request.getParameter("pw").equals(request.getParameter("pw1"))
					&& !request.getParameter("un").equals("")) {
				user.setUserName(request.getParameter("un"));
				user.setPassword(request.getParameter("pw"));
				user.setFirstName(request.getParameter("fn"));
				user.setLastName(request.getParameter("ln"));
				user = UserDAO.register(user);
				if (user.isValid() == false) {
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					response.sendRedirect("MainPage/index.jsp"); // logged-in page
				} else {
				       
					out.println("<script type=\"text/javascript\">");
					out.println("alert('User or password incorrect, please try again');");
					out.println("window.location = 'MainPage/register.jsp';");
					out.println("</script>");

				}
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='MainPage/register.jsp';");
				out.println("</script>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
