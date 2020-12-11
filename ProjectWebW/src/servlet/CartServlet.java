package servlet;

import beans.Cart;
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
         Cart cartBean = null;
         Object objCartBean = session.getAttribute("cart");
         if (objCartBean != null) {
             cartBean = (Cart) objCartBean;
         } else {
             cartBean = new Cart();
         }
         if (cartBean.payCheck()) {
		}else {
		}
         
	}

	protected void deleteCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        String iSTT = request.getParameter("stt");
        Cart cartBean = null;

        Object iObject = session.getAttribute("cart");
        if (iObject != null) {
            cartBean = (Cart) iObject;
        } else {
            cartBean = new Cart();
        }
        cartBean.deleteCart(iSTT);
    }

    protected void updateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String iQuantity = request.getParameter("quantity");
        String iSTT = request.getParameter("stt");
        Cart cartBean = null;
        Object objCartBean = session.getAttribute("cart");
        if (objCartBean != null) {
            cartBean = (Cart) objCartBean;
        } else {
            cartBean = new Cart();
        }
        cartBean.updateCart(iSTT, iQuantity);
    }

    protected void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String iName = request.getParameter("name");
        String iDescription = request.getParameter("description");
        String iPrice = request.getParameter("price");
        String iQuantity = request.getParameter("quantity");
        String loai = request.getParameter("loai");
        String filename1 = request.getParameter("filename1");
        Cart cartBean = null;
        Object objCartBean = session.getAttribute("cart");

        if (objCartBean != null) {
            cartBean = (Cart) objCartBean;
        } else {
            cartBean = new Cart();
            session.setAttribute("cart", cartBean);
        }

        cartBean.addCart(id,iDescription, iPrice, iQuantity,iName,loai,filename1);
    }

}