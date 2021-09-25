package com.happycart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happycart.dao.CategoryDao;
import com.happycart.entity.Category;
import com.happycart.helper.FactoryProvider;

public class SearchProductByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		
		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
		List<Category> categories = categoryDao.getCategories();
		int categoryId = 0;
		
		boolean flag = false;
		for(Category theCategory : categories) {
			if(theCategory.getCategoryTitle().equalsIgnoreCase(category)) {
				flag = true;
				categoryId = theCategory.getCategoryId();
				break;
			}
		} 
		
		if(flag == false) {
			response.sendRedirect("index.jsp");
			return;
		}
		
		String categoryIdString = String.valueOf(categoryId);
		
		request.setAttribute("category", categoryIdString);
		System.out.println(categoryIdString);
		
		RequestDispatcher rd = request.getRequestDispatcher("indexShowProduct.jsp");
		rd.forward(request, response);
		
		
	}

}
