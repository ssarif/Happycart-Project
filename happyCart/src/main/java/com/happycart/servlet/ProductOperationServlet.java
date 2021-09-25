package com.happycart.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.happycart.dao.CategoryDao;
import com.happycart.dao.ProductDao;
import com.happycart.entity.Category;
import com.happycart.entity.Product;
import com.happycart.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out = response.getWriter();
			
			String operation = request.getParameter("operationType");
			
			if(operation.trim().equals("addCategory")) {

				String categoryTitle = request.getParameter("categoryTitle");
				String categoryDesc = request.getParameter("categoryDesc");
				
				Category category = new Category();
				category.setCategoryTitle(categoryTitle);
				category.setCategorDescription(categoryDesc);
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
				categoryDao.saveCategory(category);
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", category.getCategoryTitle() + " category added successfully!!");
				
				response.sendRedirect("admin.jsp");
				return;
	
			} else if(operation.trim().equals("addProduct")) {
				
				
				String productName = request.getParameter("prodName");
				String productDescription = request.getParameter("prodDesc");
				int productPrice = Integer.parseInt(request.getParameter("prodPrice"));
				int productDiscount = Integer.parseInt(request.getParameter("prodDiscount"));
				int productQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));
				Part part = request.getPart("productPhoto");
				
				Product theProduct = new Product();
				theProduct.setpName(productName);
				theProduct.setpDesc(productDescription);
				theProduct.setpPrice(productPrice);
				theProduct.setpDiscount(productDiscount);
				theProduct.setpQuantity(productQuantity);
				theProduct.setpPhoto(part.getSubmittedFileName());
				
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
				
				Category theCategory = categoryDao.getCategoryById(categoryId);
				
				theProduct.setCategory(theCategory);
				
				// save product in db
				ProductDao productDao =new ProductDao(FactoryProvider.getSessionFactory());
				productDao.saveProduct(theProduct);
				
				
				try {
					// photo upload
					
					//get the path of img/product folder
					String path = request.getSession().getServletContext().getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
					System.out.println("path-----> " + path);
					
					// do the uploading
					
					FileOutputStream fileOutputStream = new FileOutputStream(path);
					
					InputStream inputStream = part.getInputStream();
					
					// reading data 
					
					byte[] data = new byte[inputStream.available()];
					
					inputStream.read(data);
					
					// writting data 
					
					fileOutputStream.write(data);
					
					fileOutputStream.close();
					
					inputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", theProduct.getpName() + " product added successfully!!");
				
				response.sendRedirect("admin.jsp");
				return;
				
				
			}
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
