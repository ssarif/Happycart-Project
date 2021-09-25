
<%@page import="com.happycart.helper.Helper"%>
<%@page import="com.happycart.entity.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.happycart.entity.User"%>
<%
	User user1 = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-md navbar-dark custom-bg fixed-top">
	<div class="container">
		<a class="navbar-brand" href="index.jsp" style="font-weight: bolder;font-style: italic;"><div class="logo"><i class="fa fa-shopping-cart"></i>Happycart</div></a>
		<form class="form-inline" style="margin-left: 23px;" action="SearchProductByCategoryServlet" method="post">
		    <input name="category" class="form-control mr-sm-2" type="search" placeholder="Search for products by category" aria-label="Search" style="width: 621px;">
		    <button class="btn my-2 my-sm-0" type="submit" style="margin-left: -98px;">Search</button>
		  </form>
			<ul class="navbar-nav ml-auto">
			
				<li class="nav-item active" style="margin-right: 23px;">
					<a class="nav-link" href="viewcart.jsp">	
						<i class="fa fa-shopping-cart">
						<% 
							List<CartItem> cart_list1 = (List<CartItem>) session.getAttribute("cart-list");
							if(cart_list1 == null) {
						%>		
								<span class="cart-item-quantity">
									0
								</span>
						<% 
							} else {
						%>
								<span class="cart-item-quantity">
									<%= Helper.getTotalCartItemsQuantity(cart_list1) %>
								</span>
						<%
							}
						%>
						</i>
					</a>
				</li>

				<%
					if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register</a></li>
				<%
					} else if(user1.getUserType().equalsIgnoreCase("normal")) {
				%>
				
					<li class="nav-item dropdown" >
				        <a  class="nav-link dropdown-toggle" href="#"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">
				        	Welcome <%= user1.getUserName() %>
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="normal.jsp">My Profile</a>
				          <a class="dropdown-item" href="LogoutServlet">Logout</a>
				        </div>
				     </li>

				<%
					} else if(user1.getUserType().equalsIgnoreCase("admin")) {
				%>
				
					<li class="nav-item dropdown" >
				        <a class="nav-link dropdown-toggle" href="#"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">
				        	Welcome Admin
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="admin.jsp">Admin dashboard</a>
				          <a class="dropdown-item" href="LogoutServlet">Logout</a>
				        </div>
				     </li>
				
				<% } %>


			</ul>
		</div>
	</div>
</nav>






