<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.ServiceRequest"%>
<%@page import="com.voidmain.pojo.DonationRequest"%>
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

	<!-- about -->
	<div class="about-sec" id="about">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>R</span>escue Request's
				</h3>
			</div>
			
			<%			
				if(role.equals("user"))
				{
			%>
					<%
						for (ServiceRequest serviceRequest : HibernateDAO.getServiceRequests()) {
		
							if (serviceRequest.getUserid().equals(username) && serviceRequest.getRequesttype().equals("rescue")) 
							{
					%>
								<div class="about-sub">
									<div class="col-md-6 about_bottom_left">
										<font size="4"><br /><%=serviceRequest.getLocation()%></font>
										<h4>
											<span> <%=serviceRequest.getDatetime()%></span>
										</h4>
										<p> <%=serviceRequest.getDescription()%></p>
										<p> Status :<%=serviceRequest.getStatus()%></p>
										<a class="button-style" href="viewrescuerequests.jsp?did=<%=serviceRequest.getId()%>">delete</a>
										<a class="button-style" href="viewrescuerequests.jsp?did=<%=serviceRequest.getId()%>">is completed?</a>
									</div>
									<!-- Stats-->
									<div class="col-md-6 about2-info">
										<img src="./appimages/<%=serviceRequest.getImage()%>" alt="" height="250" width="500"/>
									</div>
									<!-- //Stats -->
									<div class="clearfix"></div>
								</div>
								<br /> <br />
					<%
							}	
						}
					%>
			<%		
				}
			%>
			
			<%			
				if(!role.equals("user"))
				{
			%>
					<%
						for (ServiceRequest serviceRequest : HibernateDAO.getServiceRequests()) {
		
							if (serviceRequest.getStatus().equals("inprocess") && serviceRequest.getRequesttype().equals("rescue")) 
							{
								User user=HibernateDAO.getUserById(serviceRequest.getUserid());
					%>
								<div class="about-sub">
									<div class="col-md-6 about_bottom_left">
										<font size="4"><br /><%=serviceRequest.getLocation()%></font>
										<h4>
											<span> <%=serviceRequest.getDatetime()%></span>
										</h4>
										<p> <%=serviceRequest.getDescription()%></p>
										<p> Status :<%=serviceRequest.getStatus()%></p>
										<p> Contact :<%=user.getMobile()%></p>
									</div>
									<!-- Stats-->
									<div class="col-md-6 about2-info">
										<img src="./appimages/<%=serviceRequest.getImage()%>" alt="" height="250" width="500"/>
									</div>
									<!-- //Stats -->
									<div class="clearfix"></div>
								</div>
								<br /> <br />
					<%
							}	
						}
					%>
			<%		
				}
			%>
			
		</div>
	</div>


	<%
		String uid = request.getParameter("uid");

		if (uid != null) {

			ServiceRequest serviceRequest = HibernateDAO.getServiceRequestById(Integer.parseInt(uid));
			serviceRequest.setStatus("Completed");

			if (HibernateTemplate.updateObject(serviceRequest) == 1) {
				response.sendRedirect("viewrescuerequests.jsp?status=success");
			} else {
				response.sendRedirect("viewrescuerequests.jsp?status=failed");
			}
		}
	%>

	<%
		String did = request.getParameter("did");

		if (did != null) {

			if (HibernateTemplate.deleteObject(ServiceRequest.class,Integer.parseInt(did)) == 1) {
				response.sendRedirect("viewrescuerequests.jsp?status=success");
			} else {
				response.sendRedirect("viewrescuerequests.jsp?status=failed");
			}
		}
	%>
	
	<%@include file="footer.html"%>
	
</body>
</html>