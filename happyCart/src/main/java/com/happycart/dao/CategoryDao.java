package com.happycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.happycart.entity.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int saveCategory(Category category) {

		int categoryId = -1;

		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			categoryId = (int) session.save(category);

			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return categoryId;

	}

	public List<Category> getCategories() {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		Query query = session.createQuery("from Category");

		List<Category> categories = query.getResultList();

		tx.commit();
		session.close();

		return categories;
	}

	
	public Category getCategoryById(int catId) {
		
		Category theCategory = null;
		
		try {
			
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			theCategory = session.get(Category.class, catId);
			
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return theCategory;
	}
	
	
}
