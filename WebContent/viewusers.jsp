<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.User"%>
<html>
<head>
	<%@include file="header.html"%>
</head>
<body>
	<%@include file="menu2.jsp"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>V</span>eterinary Hospital's
				</h3>
				<div class="tittle-style" align="center">
					<%
						String status = request.getParameter("status");

						if (status != null) {
					%>
							<h1></h1>
							<p style="color: red; size: 50px;"><%=status%></p>
					<%
						}
					%>
				</div>
			</div>

            <div class="login-form">
				<form name="form" action="viewusers.jsp">

                    <div class="">
						<p>Enter Location</p>
						<input type="text" class="name" name="location" required="required"/>
					</div>

					<br />
					<input type="submit" value="Search Vetenirary Hospital's">
				</form>
			</div>

            <br/><br/><br/>
            
            <%
				String location=request.getParameter("location");
			
				if(location!=null)
				{
			%>
					<table id="customers">
						<tr>
							<th>User ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Address</th>
							
							<%			
								if(role.equals("admin"))
								{
							%>
									<th>Delete</th>
							<%
								}
							%>
							
						</tr>
						<%
							for (User user : HibernateDAO.getUsers()) {
									
								Login login=HibernateDAO.getLoginById(user.getUsername());
								
								if(login.getRole().equals("veterinaryhospital") && user.getAddress().contains(location))
								{
						%>
									<tr>
										<td><%=user.getUsername()%></td>
										<td><%=user.getName()%></td>
										<td><%=user.getEmail()%></td>
										<td><%=user.getMobile()%></td>
										<td><%=user.getAddress()%></td>
										
										<%			
											if(role.equals("admin"))
											{
										%>
												<td><a href="viewusers.jsp?id=<%=user.getUsername()%>">delete</a></td>
										<%
											}
										%>
										
									</tr>
						<%
								}
							}
						%>
					</table>
			<%		
				}
			%>
			
			<%
				String id = request.getParameter("id");
	
				if (id != null) {
					
					if (HibernateTemplate.deleteObject(User.class,id) == 1) {
						HibernateTemplate.deleteObject(Login.class,id);
						response.sendRedirect("viewusers.jsp?status=success");
					} else {
						response.sendRedirect("viewusers.jsp?status=failed");
					}
				}
			%>
			
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>