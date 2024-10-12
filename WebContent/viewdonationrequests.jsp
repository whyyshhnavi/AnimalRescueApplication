<!DOCTYPE HTML>
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
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>V</span>iew Donation Request's
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

			<table id="customers">
			
				<tr>
					<th>ID</th>
					<th>Purpose</th>
					<th>Amount</th>
					<th>Bank Account</th>
					<th>Description</th>
					<th>Status</th>
					
					<%			
						if(role.equals("admin"))
						{
					%>
							<th>Update Status</th>
							<th>Delete</th>
					<%
						}
					%>
					
				</tr>
				<%
					for (DonationRequest donationRequest : HibernateDAO.getDonationRequests()) {
				%>
							<tr>
								<td><%=donationRequest.getId()%></td>
								<td><%=donationRequest.getPurpose()%></td>
								<td><%=donationRequest.getAmount()%></td>
								<td><%=donationRequest.getAccountdetails()%></td>
								<td><%=donationRequest.getDescription()%></td>
								<td><%=donationRequest.getStatus()%></td>
								
								<%			
									if(role.equals("admin"))
									{
										if(donationRequest.getStatus().equals("inprocess"))
										{
								%>
											<td><a href="viewdonationrequests.jsp?uid=<%=donationRequest.getId()%>">is completed?</a></td>
								<%		
										}
										else
										{
								%>
											<td>Completed</td>
								<%		
										}
										
								%>
										<td><a href="viewdonationrequests.jsp?did=<%=donationRequest.getId()%>">delete</a></td>
								<%	
									}
								%>
								
							</tr>
				<%
						}
				%>
				
			</table>

			<%
				String uid = request.getParameter("uid");

				if (uid != null) {
					
					DonationRequest donationRequest=HibernateDAO.getDonationRequestById(Integer.parseInt(uid));
					donationRequest.setStatus("Completed");
					
					if(HibernateTemplate.updateObject(donationRequest)==1)
					{
						response.sendRedirect("viewdonationrequests.jsp?status=success");
					} else {
						response.sendRedirect("viewdonationrequests.jsp?status=failed");
					}
				}
			%>
			
			<%
				String did = request.getParameter("did");

				if (did != null) {
					
					if (HibernateTemplate.deleteObject(DonationRequest.class,Integer.parseInt(did)) == 1) {
						response.sendRedirect("viewdonationrequests.jsp?status=success");
					} else {
						response.sendRedirect("viewdonationrequests.jsp?status=failed");
					}
				}
			%>

		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>