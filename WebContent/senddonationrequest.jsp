<!DOCTYPE HTML>
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
					<span>S</span>end <span>D</span>onation Request
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
				<form name="form" action="VoidmainServlet" method="post" name="appform">
				
					<input type="hidden" name="type" value="com.voidmain.pojo.DonationRequest">
					<input type="hidden" name="operation" value="add"> 
					<input type="hidden" name="redirect" value="senddonationrequest.jsp">
					<input type="hidden" name="status" value="inprocess">
				
                    <div class="">
						<p>Purpose</p>
						<input type="text" class="name" name="purpose" required="required"/>
					</div>

					<div class="">
						<p>Target Amount</p>
						<input type="number" class="name" name="amount" required="required" min="0" style="width: 580px;height: 45px;"/>
					</div>
					
					<div class="">
						<p>Bank Account Details</p>
                        <textarea class="name" name="accountdetails" required="required" rows="4" cols="70"></textarea>
					</div>
					
                    <div class="">
						<p>Description</p>
                        <textarea class="name" name="description" required="required" rows="4" cols="70"></textarea>
					</div>
					<br />
					<input type="submit" value="Send Donation Request">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>