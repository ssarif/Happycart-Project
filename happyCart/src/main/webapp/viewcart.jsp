<%@page import="com.happycart.entity.CartItem"%>
<%@page import="com.happycart.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view cart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	
	<!-- navbar -->
	<%@include file="components/navbar.jsp"%>
	
	
	<%
					
		List<CartItem> cart_list = (List<CartItem>) session.getAttribute("cart-list");
		int productId = 0;
		
		// session.removeAttribute("cart-list");
	
	%>
	
	
	<!-- content -->
	<div class="container">
		<% if(cart_list == null || cart_list.size() == 0) { %>
			<div class="container-fluid mt-100">
			    <div class="row">
			        <div class="col-md-12">
			            <div class="card" style="margin-top: 38px;">
			                <div class="card-body cart">
			                    <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
			                        <h3><strong>Your Cart is Empty</strong></h3>
			                        <h4>Add something to make me happy :)</h4> 
			                        <a href="index.jsp" class="btn btn-primary cart-btn-transform m-3" data-abc="true">continue shopping</a>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		<%} else { %>
		<div class="row mt-3 mx-2">
			<div class="col-md-8">
					<div class="card">
						<div class="card-header" style="font-size: 20px;font-weight: bolder;"> 
						    Selected Items
						 </div>
						<div class="card-body">
						<% for(CartItem c : cart_list) { %>
							<div class="row m-2">
								<div class="col-md-2" style="padding-left: 0px;">
									<div>
										<img style="height: 112px; width: 112px;"
										src="img/products/<%=c.getProduct().getpPhoto()%>">
									</div>
								</div>
								<div class="col-md-7">
									<h5 style="font-size:20px;"><%= c.getProduct().getpName() %></h5>
									
									<div style="font-size:14px;min-height:46px;color:#878787;"><%= Helper.get10Words(c.getProduct().getpDesc()) %></div>
									<div style="font-weight:bolder;font-size: 16px;">
										₹<%= Helper.getIndianNumberFormat(c.getProduct().getpPrice() * c.getQuantity()) %>
										<span class="original-price-label">₹<%= Helper.getIndianNumberFormat(Helper.getOriginalPrice(c.getProduct().getpPrice(), c.getProduct().getpDiscount()) * c.getQuantity()) %></span>
										<span class="discount-label">&nbsp;<%= c.getProduct().getpDiscount() %>% off</span>
									</div>
								</div>
								<div class="col-md-3">
									<p style="font-size:14px; margin-bottom: 3px;">delivery in 7 days</p>
									<span style="font-size:12px; color:#878787;">15 days return policy</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									
								</div>
								<div class="col-md-10" style="display:flex; justify-content:space-between; padding: 0 56px 0 35px;">
									<span>Quantity: <%= c.getQuantity()  %></span>
									<a class="btn text-white cart-item-remove"  href="RemoveItemServlet?id=<%= c.getProduct().getpId() %>">REMOVE</a>
									
								</div>
							</div>
							<hr>
							<% } %>
						</div>
					</div>
					
				
			</div>
			

			<div class="col-md-4">

				<div class="card" style="position: fixed;min-width: 30%;">
					<div class="card-header" style="font-size: 20px;font-weight: bolder;">
						Price Details
					</div>
					<div class="card-body price-details">
						<ul style="list-style-type:none;padding-left:0px">
							<li>Total Price (<%= cart_list.size() %> items )<span">₹<%= Helper.getIndianNumberFormat(Helper.getTotalOriginalPrice(cart_list))  %></span></li>
							<li>Discount <span style="color: green;">-₹<%= Helper.getIndianNumberFormat(Helper.getTotalOriginalPrice(cart_list) - Helper.getAmountPayableForAllCartItems(cart_list)) %></span></li>
							<li>Delivery <span style="color: green;">FREE</span></li>
							<hr style="border: 1px dashed #878787;" />	
							<li style="font-weight: bolder; font-size:16px;">Payable Amount <span>₹<%= Helper.getIndianNumberFormat(Helper.getAmountPayableForAllCartItems(cart_list)) %></span></li>
						</ul>
						<button class="btn btn-lg" style="background-color: #e40046;color:white;font-size:20px;margin-left:93px;"><a href="CheckoutServlet" style="color:white;text-decoration: none;">PLACE ORDER</a></button>
					</div>
				</div>

			</div>
			
		<% } %>

		</div>
	</div>



    
	<!-- footer -->
	<%@include file="components/footer.jsp"%>
	
	
	
</body>
</html>