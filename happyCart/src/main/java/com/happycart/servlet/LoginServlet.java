package com.happycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happycart.dao.UserDao;
import com.happycart.entity.User;
import com.happycart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
//			System.out.println(user);
			
			HttpSession httpSession = request.getSession();
			
			if(email.isEmpty() || password.isEmpty()) {
				httpSession.setAttribute("message", "Please, fill all fields!");
				response.sendRedirect("login.jsp");
				return;
			} else if(user == null) {
				httpSession.setAttribute("message", "Invalid details! Try something else");
				response.sendRedirect("login.jsp");
				return;
			} else {
				 System.out.println("<h1>Welcome " + user.getUserName() + "</h1>");
				 
			}
			
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equalsIgnoreCase("admin")) {
				response.sendRedirect("index.jsp");
			} else if(user.getUserType().equalsIgnoreCase("normal")) {
				response.sendRedirect("index.jsp");
			} else {
				out.println("We have not identified user type");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
