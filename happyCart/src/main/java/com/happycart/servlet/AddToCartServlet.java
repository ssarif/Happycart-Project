package com.happycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happycart.dao.ProductDao;
import com.happycart.entity.CartItem;
import com.happycart.entity.Product;
import com.happycart.entity.User;
import com.happycart.helper.FactoryProvider;
import com.happycart.helper.Helper;

public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			
			HttpSession session = request.getSession();
			
			User user = (User) session.getAttribute("current-user");
			if(user == null) {
				response.sendRedirect("login.jsp");
				return;
			}
			
			List<CartItem> cartList = new ArrayList<CartItem>();
			int productId = Integer.parseInt(request.getParameter("id"));
			
			ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
			
			Product theProduct = productDao.getProductById(productId);
			
			
			List<CartItem> cart_list = (List<CartItem>) session.getAttribute("cart-list");
			
			CartItem cartItem = new CartItem(theProduct, 1);
			
			
			if(cart_list==null) {
			
				cartList.add(cartItem);
				session.setAttribute("cart-list", cartList);
					
			} else {
				
				cartList = cart_list;
				
				if(Helper.checkIfProductExistInCart(productId, cartList)) {
					Helper.incrementCartItemQuantity(productId, cartList);		 
				}
				
				else {
					cartList.add(cartItem);
					session.setAttribute("cart-list", cartList);
				}
			}
			
			response.sendRedirect("index.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
