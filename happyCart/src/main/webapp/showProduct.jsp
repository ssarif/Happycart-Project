<%@page import="com.happycart.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	
	<%
		Product product = (Product)session.getAttribute("product");
	%>
	
	<!-- navbar -->
	<%@include file="components/navbar.jsp"%>
	
	<div class="container" style="margin-top:42px;">
		<div class="row">
			<div class="card" style="min-width:100%; min-height:100%; height:75vh;padding-top:10px;">
				<div class="card-body">
					<div class="row">
						<div class="col-md-5 text-center">
						<div>
							<img style="padding-left:10px;"
							src="img/products/<%=product.getpPhoto()%>">
						</div>
						</div>
						<div class="col-md-7" style="display:grid;grid-row-gap:15px;">
							<h5 style="font-size:22px;"><%= product.getpName() %></h5>
							
							<div style="font-size:19px;min-height:46px;color:#878787;"><%= product.getpDesc() %></div>
							<div style="font-weight:bolder;font-size: 19px;">
								₹<%= Helper.getIndianNumberFormat(product.getpPrice()) %>
								<span class="original-price-label">&nbsp;₹<%= Helper.getIndianNumberFormat(Helper.getOriginalPrice(product.getpPrice(), product.getpDiscount())) %></span>
								<span class="discount-label">&nbsp;<%= product.getpDiscount() %>% off</span>
							</div>
							<div class="bank-offers">
								<p style="font-weight:bolder;margin-bottom:3px;">Available offers</p>
								<ul class="bank-offers-list" style="padding-left:5px;">
									<li><img style="width:18px;height:18px;" src="https://rukminim1.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90" alt="" />
									Bank Offer 15% Instant discount on first order of 500 and above<span style="color:blue;">T&C</span></li>
									<li><img style="width:18px;height:18px;" src="https://rukminim1.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90" alt="" />Bank Offer 5% Unlimited Cashback on Axis Bank Credit Card<span style="color:blue;">T&C</span></li>
									<li><img style="width:18px;height:18px;" src="https://rukminim1.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90" alt="" />Special PriceExtra ₹1751 off(price inclusive of discount)<span style="color:blue;">T&C</span></li>
									<li><img style="width:18px;height:18px;" src="https://rukminim1.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90" alt="" />Freebie Hotstar Freebie<span style="color:blue;">T&C</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<%@include file="components/footer.jsp"%>	

</body>
</html>