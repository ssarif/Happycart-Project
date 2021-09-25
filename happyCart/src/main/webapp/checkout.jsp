
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("message", "You are not logged in! Login first to access to checkout page");
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
<title>Checkout Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<!-- navbar -->
	<%@include file="components/navbar.jsp"%>


	<div class="container">
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mt-2">Payment Details</h3>
						<div id="accordion">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5 class="mb-0">
										<button class="btn btn-link btn-block collapsed"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne">
											<h5 style="font-weight: bolder; text-decoration: none;">Card
												Details</h5>
										</button>
									</h5>
								</div>

								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										<div class="cart-body">
											<div class="radio-card" style="margin: 12px 0 12px 0;">
												<div>
													<input type="radio" name="exampleRadios"
														id="exampleRadios1" value="option1" checked> <label
														class="form-check-label"> Credit Card </label>
												</div>
												<div>
													<input type="radio" name="exampleRadios"
														id="exampleRadios1" value="option2" checked> <label
														class="form-check-label"> Debit Card </label>
												</div>
											</div>

											<div class="form-group">
												<label for="card-name">Name on Card</label> <input
													type="text" class="form-control" id="card-name"
													aria-describedby="card-name" placeholder="Card Owner Name">
												<small id="card-name" class="form-text text-muted">Full
													name as displayed on card</small>
											</div>

											<div class="form-group">
												<label for="card-number">Card number</label>
												<div class="input-group">
													<input type="text" name="cardNumber"
														placeholder="Valid card number" class="form-control "
														required>
													<div class="input-group-append">
														<span class="input-group-text text-muted"> <i
															class="fab fa-cc-visa mx-1"></i> <i
															class="fab fa-cc-mastercard mx-1"></i> <i
															class="fab fa-cc-amex mx-1"></i>
														</span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-8">
													<div class="form-group">
														<label><span class="hidden-xs">
																<h6>Expiration Date</h6>
														</span></label>
														<div class="input-group">
															<input type="number" placeholder="MM" name=""
																class="form-control" required> <input
																type="number" placeholder="YY" name=""
																class="form-control" required>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group mb-4">
														<label data-toggle="tooltip"
															title="Three digit CV code on the back of your card">
															<h6>
																CVV <i class="fa fa-question-circle d-inline"></i>
															</h6>
														</label> <input type="text" required class="form-control">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h5 class="mb-0">
										<button class="btn btn-link btn-block collapsed"
											data-toggle="collapse" data-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											<h5 style="font-weight: bolder; text-decoration: none;">Select
												UPI</h5>
										</button>
									</h5>
								</div>
								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="card-body">
										<div class="upi-title" style="font-size: 22px;">Choose
											an option</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault1"> <label
												class="form-check-label" for="flexRadioDefault1">
												Paytm </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault2" checked>
											<label class="form-check-label" for="flexRadioDefault2">
												PhonePe </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault2" checked>
											<label class="form-check-label" for="flexRadioDefault2">
												GPay </label>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingThree">
									<h5 class="mb-0">
										<button class="btn btn-link btn-block collapsed"
											data-toggle="collapse" data-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											<div class="upi-title" style="font-size: 22px;">Other
												Options</div>
										</button>
									</h5>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">
										<div class="form-check"
											style="display: flex; justify-content: space-between;">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault2" disabled>
											<label class="form-check-label" for="flexRadioDefault2">
												Cash on Delivery </label>
											<p class="fw-lighter">Currently Unavailable</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="mb-4">
	            		<a href="/happyCart/placedOrder.jsp" style="text-decoration:none;color:white;"><button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button></a>
					</div>
				</div>
			</div>


			<div class="col-md-6">

				<!-- User details -->
				<div class="card">
					<h3 class="text-center mt-3">Billing Address</h3>
					<div class="card-body">
						<form action="CheckoutServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value=<%=user.getUserEmail()%> type="email" name="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input type="text" name="name"
									value=<%=user.getUserName()%> class="form-control" id="name"
									aria-describedby="name" placeholder="Enter your name">
							</div>
							<div class="form-group">
								<label for="mobile">Contact Number</label> <input type="text"
									name="mobile" value=<%=user.getUserPhone()%>
									class="form-control" id="mobile" aria-describedby="mobile"
									placeholder="Enter your contact number">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your shipping
									address</label>
								<textarea name="address" class="form-control"
									id="exampleFormControlTextarea1" rows="3"
									placeholder="Enter your address"><%=user.getUserAddress()%> </textarea>
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