package com.happycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happycart.dao.ProductDao;
import com.happycart.entity.Product;
import com.happycart.helper.FactoryProvider;

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			
			int productId = Integer.parseInt(request.getParameter("id"));
			
			ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
			Product product = productDao.getProductById(productId);
			HttpSession session = request.getSession();
			session.setAttribute("product", product);
			response.sendRedirect("showProduct.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
