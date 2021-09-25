<%@page import="com.happycart.dao.UserDao"%>
<%@page import="com.happycart.entity.Product"%>
<%@page import="com.happycart.dao.ProductDao"%>
<%@page import="com.happycart.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.happycart.helper.FactoryProvider"%>
<%@page import="com.happycart.dao.CategoryDao"%>
<%@page import="com.happycart.entity.User"%>
<%
	User user = (User) session.getAttribute("current-user");

	if (user == null) {
	
		session.setAttribute("message", "You are not logged in! Login first");
		response.sendRedirect("login.jsp");
		return;
	
	} else {
	
		if (user.getUserType().equals("normal")) {
	
			session.setAttribute("message", "You are not Admin! You are not permitted to access admin page");
			response.sendRedirect("login.jsp");
			return;
		}
	
	}
%>

<!-- product category -->
						
<%

	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
	List<Category> categories = categoryDao.getCategories();
	
	ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
	List<Product> products = productDao.getAllProducts();
	
	UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
	List<User> users = userDao.getAllUsers();

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
 
	<div class="container admin">
		<div class="container-fluid mt-2">
			<%@include file="components/message.jsp"%>
		</div>
		<div class="row mt-3">

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="" src="img/users.png">
						</div>
						<h1><%= users.size() %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="" src="img/category1.png">
						</div>
						<h1><%= categories.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="" src="img/products.png">
						</div>
						<h1><%= products.size() %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>
		<div class="row mt-3">

			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="" src="img/product1.png">
						</div>
						<p class=" text-muted mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="" src="img/addProduct.png">
						</div>
						<p class=" text-muted mt-2">Click here to add new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- start add category modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title text-white" id="exampleModalLabel">Fill
						Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operationType" value="addCategory">

						<div class="form-group">
							<input type="text" class="form-control" name="categoryTitle"
								placeholder="Enter category title" required />
						</div>
						<div class="form-group">
							<textArea style="height: 150px" class="form-control"
								name="categoryDesc" placeholder="Enter category description"
								required></textArea>
						</div>
						<div class="container text-center">
							<button class="btn btn-primary btn-lg">Add Category</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end add category modal -->

	<!-- start add product modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title text-white" id="exampleModalLabel">Fill
						Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="operationType" value="addProduct" />
						<div class="form-group">
							<input type="text" class="form-control" name="prodName"
								placeholder="Enter product name" required />
						</div>
						<div class="form-group">
							<textArea style="height: 110px" class="form-control"
								name="prodDesc" placeholder="Enter product description" required></textArea>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="prodPrice"
								placeholder="Enter product price" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="prodDiscount"
								placeholder="Enter product discount" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="prodQuantity"
								placeholder="Enter product quantity" required />
						</div>


						

						<div class="form-group">
							<select name="categoryId" class="form-control">
							
								<% for(Category category: categories) { %>
						
								<option value="<%= category.getCategoryId() %>"><%= category.getCategoryTitle() %></option>	
								
								<% } %>
								
							</select>
						</div>

						<div class="form-group">
							<label for="productPhoto">Select product image</label> 
							<input	type="file" name="productPhoto" class="form-control-file" id="productPhoto">
						</div>


						<div class="container text-center">
							<button class="btn btn-primary btn-lg">Add Product</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end add product modal -->


	<!-- footer -->
	<%@include file="components/footer.jsp"%>



</body>
</html>