<html>
<!-- header -->
<div class="header-top">
	<div class="container">
		<div class="bottom_header_right">
			<div class="header-top-righ">
				<a href="logout.jsp"> <span class="fa fa-sign-out"
					aria-hidden="true"></span>Logout
				</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="header">
	<div class="content white">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#" target="_blank">
						<h1>Animal Rescue</h1>
					</a>
				</div>
				<!--/.navbar-header-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1" align="right">
					<nav class="link-effect-2" id="link-effect-2" align="right">
						<ul class="nav navbar-nav">

							<%
								String role = (String) request.getSession().getAttribute("role");
								String username = (String) request.getSession().getAttribute( "username");
		
								if (role.equals("admin")) {
							%>
									<li><a href="adduser.jsp">Add Veterinary Hospital</a></li>
									<li><a href="viewusers.jsp">View Veterinary Hospital's</a></li>
									
									<li><a href="senddonationrequest.jsp">Send Donation Request</a></li>
									<li><a href="viewdonationrequests.jsp">View Donation Request's</a></li>
									
									<li><a href="addpost.jsp">Add Post</a></li>
									<li><a href="viewposts.jsp">View Post's</a></li>
							<%
								}
							%>
		
							<%
								if (role.equals("ngo")) {
							%>
									<li><a href="viewusers.jsp">View Veterinary Hospital's</a></li>
									<li><a href="viewadoptionrequests.jsp">Adoption Requests</a></li>
							<%
								}
							%>
		
							<%
								if (role.equals("rescuers")) {
							%>
									<li><a href="viewusers.jsp">View Veterinary Hospital's</a></li>
									<li><a href="viewrescuerequests.jsp">Rescue Requests</a></li>
							<%
								}
							%>
							
							<%
								if (role.equals("user")) {
							%>
									<li><a href="sendrequests.jsp">Send Requests</a></li>
									<li><a href="viewrescuerequests.jsp">Rescue Requests</a></li>
									<li><a href="viewadoptionrequests.jsp">Adoption Requests</a></li>
									<li><a href="viewdonationrequests.jsp">View Donation Request's</a></li>
									<li><a href="viewusers.jsp">View Veterinary Hospital's</a></li>
									<li><a href="viewposts.jsp">View Post's</a></li>
							<%
								}
							%>

						</ul>
					</nav>
				</div>
				<!--/.navbar-collapse-->
				<!--/.navbar-->
			</div>
		</nav>
	</div>
</div>