package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import database.ProductDAO;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO my = new ProductDAO();
		String name = request.getParameter("name");
		ArrayList<Product> list = my.listByName(name);
		if (list != null) {
			request.setAttribute("item", list);
			RequestDispatcher rd = request.getRequestDispatcher("/MainPage/search.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("about_us.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO my = new ProductDAO();
		String action = request.getParameter("action");
		String referer = request.getHeader("Referer");
		String update ="";
		String delete ="";
		String idthis ="";
		for (String string : my.idList()) {
			if (string.equals(action.substring(0,action.length()-1))) {
				idthis = string;
				update = string+"U";
				delete = string+"D";
			}
		}
		if (action.equalsIgnoreCase("Add")) {
			String id = request.getParameter("Nid");
			String name = request.getParameter("Nname");
			double gia = Double.parseDouble(request.getParameter("Ngia")); // Combobox
			String loai = request.getParameter("Nloai");
			int sluong = Integer.parseInt(request.getParameter("Nsluong"));
			String filename1 = request.getParameter("Nfilename1");
			String description = request.getParameter("Ndescription");
			Product p = new Product(id, name, gia, loai, sluong, filename1, description);
			try {
				boolean b = my.addProduct(p);
				// boolean INSERT personal
				if (b) {
					ArrayList<Product> list = my.showProduct();
					request.setAttribute("item", list);
					RequestDispatcher rd = request.getRequestDispatcher("/Admin/index.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect("Help.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			// Update Perosnal
		} else if (action.equalsIgnoreCase(update)) {
			String id = request.getParameter(idthis+"id");
			String name = request.getParameter(idthis+"name");
			double gia = Double.parseDouble(request.getParameter(idthis+"gia"));//Combobox
			String loai = request.getParameter(idthis+"loai");
			int sluong = Integer.parseInt(request.getParameter(idthis+"sluong"));
			String filename1 = request.getParameter(idthis+"filename1");
			String description = "";
			Product p = new Product(id, name, gia, loai, sluong, filename1, description);
			boolean b = my.updateProduct(id, p); // Boolean UPDATE
			// personal
			if (b) {
				ArrayList<Product> list = my.showProduct();
				request.setAttribute("item", list);
				response.sendRedirect(referer);
			} else {
				response.sendRedirect("Help.jsp");
			}
			// Delete Personal
		} else if (action.equalsIgnoreCase(delete)) {
			String id = request.getParameter(idthis+"id");
			boolean b = my.deleteProduct(id);
			if (b) {
				   response.sendRedirect(referer);
			} else {
				response.sendRedirect("Help.jsp");
			}
		} else {
			// Back Search.jsp
			response.sendRedirect(request.getContextPath() + "/Search.jsp");
		}

	}

	public void read() {

	}

}