package servlet;

import database.CartDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lonely
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String iAction = request.getParameter("action");
        
        if (iAction != null && !iAction.equals("")) {
            if (iAction.equals("Add To Cart")) {
                addToCart(request);
            } else if (iAction.equals("Update")) {
                updateCart(request);
            } else if (iAction.equals("Delete")) {
                deleteCart(request);
            }else if (iAction.equals("Pay")) {
				pay(request);
			}
        }
        String referer = request.getHeader("Referer");

        response.sendRedirect(referer);
    }

    private void pay(HttpServletRequest request) {
    	 HttpSession session = request.getSession();
    	 CartDAO cartBean = null;
    	 String idU = request.getParameter("idU");
         Object objCartBean = session.getAttribute("cart");
         if (objCartBean != null) {
             cartBean = (CartDAO) objCartBean;
         } else {
             cartBean = new CartDAO();
         }
         if (cartBean.payCheck(idU)) {
		}else {
		}
         
	}

	protected void deleteCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        String idU = request.getParameter("idU");
        String idP = request.getParameter("idP");
        CartDAO cartBean = null;

        Object iObject = session.getAttribute("cart");
        if (iObject != null) {
            cartBean = (CartDAO) iObject;
        } else {
            cartBean = new CartDAO();
        }
        cartBean.deleteCartI(idU,idP);
    }

    protected void updateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String quantity = request.getParameter("quantity");
        String idU = request.getParameter("idU");
        String idP = request.getParameter("idP");
        CartDAO cartBean = null;
        Object objCartBean = session.getAttribute("cart");
        if (objCartBean != null) {
            cartBean = (CartDAO) objCartBean;
        } else {
            cartBean = new CartDAO();
        }
        cartBean.updateCartI(idU, idP,quantity);
    }

    protected void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String idU = request.getParameter("idU");
        String idP = request.getParameter("idP");
        String quantity = request.getParameter("quantity");
        CartDAO cartBean = null;
        Object objCartBean = session.getAttribute("cart");

        if (objCartBean != null) {
            cartBean = (CartDAO) objCartBean;
        } else {
            cartBean = new CartDAO();
            session.setAttribute("cart", cartBean);
        }

        cartBean.addCartI(idU, idP,quantity);
    }

}