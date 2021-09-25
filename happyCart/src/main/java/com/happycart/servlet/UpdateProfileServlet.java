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

import com.happycart.dao.UserDao;
import com.happycart.entity.User;
import com.happycart.helper.FactoryProvider;


public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			PrintWriter out = response.getWriter();
			
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			
			// validations
			

			
			Session hibernateSession = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			
			UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
			User theUser = userDao.getUserById(userId);
			
			theUser.setUserPassword(userPassword);
			theUser.setUserPhone(userPhone);
			theUser.setUserAddress(userAddress);
			
			hibernateSession.update(theUser);
			
			tx.commit();
			hibernateSession.close();
			
			
			
			System.out.println(theUser.getUserName() + "'s profile has been updated");
			
			HttpSession httpSession = request.getSession();
			
			httpSession.setAttribute("current-user", theUser);
			
			
//			httpSession.setAttribute("message", "Registration Successful!! || userId is: " + userId);
			
			response.sendRedirect("index.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
