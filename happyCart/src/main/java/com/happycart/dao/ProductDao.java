package com.happycart.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.happycart.entity.Product;

import net.bytebuddy.asm.Advice.This;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(Product theProduct) {

		boolean flag = false;

		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.save(theProduct);

			tx.commit();
			session.close();

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;

	}

	public List<Product> getAllProducts() {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("from Product");

		List<Product> products = query.getResultList();

		tx.commit();
		session.close();

		return products;
	}

	public List<Product> getRecords(int start, int total) {
		List<Product> list = null;
		try {
			
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			Query query = session.createQuery("from Product");
			query.setFirstResult(start - 1);
			query.setMaxResults(total);
			list = query.getResultList();
			
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public long getTotalRecords() {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("select count(p.pId) from Product as p");

		Long countResult = (Long) query.getSingleResult();

		tx.commit();
		session.close();

		return countResult;
	}
	
	public long getTotalRecordsByCategory(int catId) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("select count(p.pId) from Product as p where p.category.categoryId=:id");
		query.setParameter("id", catId);

		Long countResult = (Long) query.getSingleResult();

		tx.commit();
		session.close();

		return countResult;
	}


	public List<Product> getProductsByCategory(int catId, int start, int total) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("from Product as p where p.category.categoryId=:id");

		query.setParameter("id", catId);
		
		query.setFirstResult(start - 1);
		query.setMaxResults(total);

		List<Product> products = query.getResultList();

		tx.commit();
		session.close();

		return products;
	}
	
	

	public Product getProductById(int pid) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("from Product as p where p.pId=:id");

		query.setParameter("id", pid);

		Product theProduct = (Product) query.getSingleResult();

		tx.commit();
		session.close();

		return theProduct;
	}

}
