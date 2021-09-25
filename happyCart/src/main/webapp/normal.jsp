<%@page import="java.util.ArrayList"%>
<%@page import="com.happycart.helper.Helper"%>
<%@page import="com.happycart.entity.Category"%>
<%@page import="com.happycart.dao.CategoryDao"%>
<%@page import="com.happycart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.happycart.dao.ProductDao"%>
<%@page import="com.happycart.helper.FactoryProvider"%>
<%@page import="com.happycart.entity.User"%>
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("message", "You are not logged in! Login first");
	response.sendRedirect("login.jsp");
	return;

}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>normal user page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


<!-- content -->
	<div class="container-fluid">
		<div class="row mt-3 mx-2">

			<div class="col-md-6 offset-md-3">
				<div class="card">

					<%@include file="components/message.jsp"%>

					<div class="card-body px-3">
						<div>
							<h1 class="text-center">Profile Page</h1>
							<div class="text-center" style="color:#8f8c83;">You can Update your profile details here</div>
						</div>
						<hr>
						<form action="UpdateProfileServlet" method="post">
							<input type="hidden" name="user_id" value="<%= user.getUserId()%>">
							<div class="form-group row">
							    <label for="name" class="col-sm-3 col-form-label text-center">User Name:</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" name="user_name" id="name" value="<%= user.getUserName() %>" disabled>
							    </div>
							</div>
							<div class="form-group row">
							    <label for="email" class="col-sm-3 col-form-label text-center">User Email:</label>
							    <div class="col-sm-9">
							      <input type="email" class="form-control" name="user_email" id="email" value="<%= user.getUserEmail() %>" disabled>
							    </div>
							</div>
							<div class="form-group row">
							    <label for="password" class="col-sm-3 col-form-label text-center">User Password:</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" name="user_password" id="password" value="<%= user.getUserPassword() %>">
							    </div>
							</div>
							<div class="form-group row">
							    <label for="phone" class="col-sm-3 col-form-label text-center">User Phone:</label>
							    <div class="col-sm-9">
							      <input type="number" class="form-control" name="user_phone" id="phone" value="<%= user.getUserPhone() %>">
							    </div>
							</div>
							
							<div class="form-group row">
							    <label for="address" class="col-sm-3 col-form-label text-center">User Address:</label>
							    <div class="col-sm-9">
							      <textarea style="height: 80px" class="form-control" name="user_address"><%= user.getUserAddress() %></textarea>
							    </div>
							</div>

							<div class="container text-center">
								<button class="btn btn-block" style="background-color:#e40046;color:white;font-weight:bold;">Update Profile</button>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>



	<!-- footer -->
	<%@include file="components/footer.jsp"%>


</body>
</html>