<%@page import="java.util.ArrayList"%>
<%@page import="com.happycart.helper.Helper"%>
<%@page import="com.happycart.entity.Category"%>
<%@page import="com.happycart.dao.CategoryDao"%>
<%@page import="com.happycart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.happycart.dao.ProductDao"%>
<%@page import="com.happycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happycart</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>


<%
	User user = (User) session.getAttribute("current-user");
	
%>


	<!-- navbar -->
	<%@include file="components/navbar.jsp"%>

	<!-- content -->
	<div class="container">
		<div class="row mt-10 mx-2">

			<!-- get all categories using CategoryDao -->
			<%
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
				List<Category> categories = categoryDao.getCategories();
			%>

			<!-- categories -->
			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" style="background-color:#e40046;border:1px solid #e40046;">
						All Categories </a>


					<%
						for (Category theCategory : categories) {
					%>

					<a href="index.jsp?category=<%= theCategory.getCategoryId() %>" class="list-group-item list-group-item-action" ><%=theCategory.getCategoryTitle()%></a>

					<%
						}
					%>

				</div>
			</div>


			<!-- get all products from using ProductDao -->
			<%
				ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
				int pageSize=9; 	
				int totalRecords = 0;
				int lastPageNumber = 0;
				
				String spageid=request.getParameter("page");  
				int pageid= (spageid==null)?1:Integer.parseInt(spageid);
				int pageNo = pageid;
				
				 
				if(pageid==1){}  
				else{  
				    pageid=pageid-1;  
				    pageid=pageid*pageSize+1;  
				}  
			
				String categoryType = request.getParameter("category");
				
				List<Product> products = null;
				if(categoryType==null || categoryType.equalsIgnoreCase("all")) {
					products = productDao.getRecords(pageid,pageSize);
					int totalRecordsOfProducts = (int)productDao.getTotalRecords();
					totalRecords = totalRecordsOfProducts;
					lastPageNumber = (int)Math.ceil(totalRecords/pageSize);
				} else {
					int categoryId = Integer.parseInt(categoryType);
					int totalRecordsOfProductsByCategory = (int)productDao.getTotalRecordsByCategory(categoryId);
					products = productDao.getProductsByCategory(categoryId,pageid,pageSize);
					totalRecords = totalRecordsOfProductsByCategory;
					lastPageNumber = (int)Math.ceil(totalRecords/pageSize);
				}

			%>
			

			<!-- products -->
			<div class="col-md-10">
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">

							<%
								for (Product theProduct : products) {
							%>

							<div class="card mb-2 index-page-product" style="width:285px;">
								<a href="ProductServlet?id=<%= theProduct.getpId() %>" style="text-decoration:none;color:black;">
								<div class="img-fluid"
									style="display: flex; justify-content: center;">
									<img class="card-img-top product-img"
										src="img/products/<%=theProduct.getpPhoto()%>">
								</div>

								<div class="card-body">

									<h5 class="card-title product-name" style="font-size:18px;"><%= Helper.getProductName(theProduct.getpName()) %></h5>
									<p class="card-text product-name" style="font-size:13px;"><%=Helper.get10Words(theProduct.getpDesc())%></p>

									<div style="font-weight:bolder;">
										₹<%=Helper.getIndianNumberFormat(theProduct.getpPrice())%>
										<span class="original-price-label" style="margin-left: 4px;">₹<%= Helper.getIndianNumberFormat(Helper.getOriginalPrice(theProduct.getpPrice(), theProduct.getpDiscount())) %></span>
										<span class="discount-label">&nbsp;<%= theProduct.getpDiscount() %>% off</span>
									</div>
								</div>
								</a>

								<div class="card-footer ">
								
									<% if(user == null) {
										session.setAttribute("message-cart", "First login to start shopping!");
									%>
									
									<a class="btn custom-bg text-white" href="login.jsp">Add to cart</a>	
									
									<% } else { %>

									<a class="btn custom-bg text-white" href="AddToCartServlet?id=<%= theProduct.getpId() %>">Add to cart</a>
									
									<% } %>
									
								</div>
							</div>

							<%
								}
								if(products.size()==0) {
									//out.println("<h4>no item in this category!!!!</h4>");
							%>
							
								<div class="card" style="width:150vh;height:70vh;">
									<div class="card-body text-center">
										<p style="font-weight:bolder;">No Item in this category</p>
									</div>
								</div>
									
							<%
								}
							
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	
	
	<!-- page navigation -->
	
	<% if(categoryType==null || categoryType.equalsIgnoreCase("all")) { %>
		<nav aria-label="Page navigation example" style="padding: 8px 0 8px 0;">
		  <ul class="pagination justify-content-center">
		  <li class="page-item <%= (pageNo==1)?" disabled":"" %>" style="min-width:75px;text-align:center;">
		      <a class="page-link" href="index.jsp?page=<%= pageNo-1 %>" tabindex="-1">Previous</a>
		    </li>
		  <% for(int i=0; i<=lastPageNumber; i++) { %>
		    <li class="page-item" style="min-width:60px;text-align:center;"><a class="page-link <%= (pageNo==i+1)?"active":"" %>" href="index.jsp?page=<%= i+1 %>"><%= i+1 %></a></li>
		    <% } %>
		    <li class="page-item <%= (pageNo*pageSize>totalRecords)?" disabled":"" %>" style="min-width:75px;text-align:center;">
		      <a class="page-link" href="index.jsp?page=<%= pageNo+1 %>">Next</a>
		    </li>
		  </ul>
		</nav>
	<% } else { %>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  <li class="page-item <%= (pageNo==1)?" disabled":"" %>" style="min-width:75px;text-align:center;">
		      <a class="page-link" href="index.jsp?category=<%= categoryType %>&page=<%= pageNo-1 %>" tabindex="-1">Previous</a>
		    </li>
		  <% for(int i=0; i<=lastPageNumber; i++) { %>
		    <li class="page-item" style="min-width:60px;text-align:center;" ><a class="page-link <%= (pageNo==i+1)?"active":"" %>" href="index.jsp?category=<%= categoryType %>&page=<%= i+1 %>"><%= i+1 %></a></li>
		    <% } %>
		    <li class="page-item <%= (pageNo*pageSize>totalRecords)?" disabled":"" %>" style="min-width:75px;text-align:center;">
		      <a class="page-link" href="index.jsp?category=<%= categoryType %>&page=<%= pageNo+1 %>">Next</a>
		    </li>
		  </ul>
		</nav>
	<% } %>
	
	

	
	<!-- footer -->
	<%@include file="components/footer.jsp"%>
	
</body>
</html>