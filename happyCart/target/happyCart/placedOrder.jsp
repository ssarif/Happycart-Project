<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Placed Order page</title>
<%@include file="components/common_css_js.jsp"%>
<style>
.placedOrder-body {
    min-height: 80vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.po-item {
	position: absolute;
    top: 128px;
    left: 152px;
}
.po-text {
	font-size:20px;
	font-style:Italic;
	color: white;
	font-weight:bolder;
}
</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	<%
					
		List<CartItem> cart_list = (List<CartItem>) session.getAttribute("cart-list");
		
		session.removeAttribute("cart-list");
	%>
	
	<script>
		window.onload = function() {
			if(!window.location.hash) {
				window.location = window.location + '#loaded';
				window.location.reload();
			}
		}
	</script>
	
	<div class="container placedOrder-body">
		<div class="row">
			<div class="card" style="width:550px;height:400px;">
	             <div class="card-body text-center"> 
	             <img src="https://img.icons8.com/bubbles/200/000000/trophy.png">
	                 <h4>CONGRATULATIONS!</h4>
	                 <p>Your Order is Placed Successfully.</p> 
	                 <a href="index.jsp"><button class="btn btn-out btn-square" style="background-color:#e40046;color:white;font-weight:bold;">CONTINUE SHOPPING</button></a>
	             </div>
	         </div>
		</div>
	</div>
	
	
	
	
	<!-- footer -->
	<%@include file="components/footer.jsp"%>	
	
	
</body>
</html>