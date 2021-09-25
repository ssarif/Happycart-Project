package com.happycart.dao;

import java.awt.desktop.UserSessionEvent;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.happycart.entity.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {

		User user = null;
		try {

			String queryString = "from User where userEmail =: e and userPassword =: p";
			Session session = this.factory.openSession();

			Query q = session.createQuery(queryString);
			q.setParameter("e", email);
			q.setParameter("p", password);

			user = (User) q.uniqueResult();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User getUserById(int id) {

		User user = null;
		try {

			String queryString = "from User where userId =: id";
			Session session = this.factory.openSession();

			Query q = session.createQuery(queryString);
			q.setParameter("id", id);

			user = (User) q.uniqueResult();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	

	public List<User> getAllUsers() {

		List<User> users = null;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			String queryString = "from User";

			Query q = session.createQuery(queryString);

			users = q.getResultList();

			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

}
