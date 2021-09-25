<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">

					<%@include file="components/message.jsp"%>

					<div class="card-body px-3">
						<div  style="background-color:#e40046;">
							<div class="container text-center" style="padding-top: 9px;">
								<img src="img/sign-up.png" class="img-fluid"
									alt="Responsive image" style="max-width: 100px;height: 70px;">
							</div>
							<h1 class="text-center" style="color:white;">Sign Up Here</h1	>
						</div>
						<hr>
						<form action="RegisterServlet" method="post">
							<div class="form-group row">
							    <label for="name" class="col-sm-3 col-form-label text-center">User Name:</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" name="user_name" id="name" placeholder="Enter name">
							    </div>
							</div>
							<div class="form-group row">
							    <label for="email" class="col-sm-3 col-form-label text-center">User Email:</label>
							    <div class="col-sm-9">
							      <input type="email" class="form-control" name="user_email" id="email" placeholder="Enter email">
							    </div>
							</div>
							<div class="form-group row">
							    <label for="password" class="col-sm-3 col-form-label text-center">User Password:</label>
							    <div class="col-sm-9">
							      <input type="password" class="form-control" name="user_password" id="password" placeholder="Enter password">
							    </div>
							</div>
							<div class="form-group row">
							    <label for="phone" class="col-sm-3 col-form-label text-center">User Phone:</label>
							    <div class="col-sm-9">
							      <input type="number" class="form-control" name="user_phone" id="phone" placeholder="Enter mobile number">
							    </div>
							</div>
							
							<div class="form-group row">
							    <label for="address" class="col-sm-3 col-form-label text-center">User Address:</label>
							    <div class="col-sm-9">
							      <textarea style="height: 80px" class="form-control" name="user_address" placeholder="Enter your address"></textarea>
							    </div>
							</div>

							<div class="container text-center">
								<button class="btn btn-block" style="background-color:#e40046;color:white;font-weight:bold;">Register</button>
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