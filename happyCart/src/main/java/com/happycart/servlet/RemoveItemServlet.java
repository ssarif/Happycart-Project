package com.happycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happycart.entity.CartItem;

public class RemoveItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			HttpSession session = request.getSession();
			
			List<CartItem> cart_list = (List<CartItem>) session.getAttribute("cart-list");
			
			String removedProductName = null;
			
			for(CartItem c : cart_list) {
				if(c.getProduct().getpId() == id) {
					removedProductName = c.getProduct().getpName();
					cart_list.remove(c);
					break;
				}
			}

			System.out.println(removedProductName + " is successfully removed from cart");
			response.sendRedirect("viewcart.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
