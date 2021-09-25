package com.happycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.happycart.entity.User;
import com.happycart.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			PrintWriter out = response.getWriter();
			HttpSession httpSession = request.getSession();
			
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			
			// validations
			
			if(userName.isEmpty() || userEmail.isEmpty() || userPassword.isEmpty() || userAddress.isEmpty() || userPhone.isEmpty()) {
//				out.println("Name is blank");
				httpSession.setAttribute("message", "Please fill all fields");
				response.sendRedirect("register.jsp");
				return;
			}
			
			User user = new User(userName, userEmail, userPassword, userPhone, userAddress, "normal");
			
			Session hibernateSession = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			
			int userId = (int)hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			
			httpSession.setAttribute("message", "Registration Successful!!");
			
			response.sendRedirect("login.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
