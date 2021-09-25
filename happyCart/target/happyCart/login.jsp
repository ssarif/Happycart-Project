<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class="card mt-3">

					<div class="card-header custom-bg text-white">
						<h3 class="">Login Here</h3>
					</div>

					<div class="card-body">
						
						<%@include file="components/message.jsp"%>
					
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="container text-center">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block mt-4"
									style="background: #e40046; border:1px solid #e40046;">Login</button>
							</div>

							<a href="register.jsp" class="text-center d-block mt-5 mb-2"
								style="color: #2874f0; font-size:larger;">New to Happycart? Create an account</a>

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