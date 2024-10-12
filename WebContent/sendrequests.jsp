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
					<span>S</span>end <span>R</span>equest
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
				<form name="form" action="AddServiceRequestServlet" method="post" name="appform" enctype="multipart/form-data">
				
					<input type="hidden" name="type" value="com.voidmain.pojo.ServiceRequest">
					<input type="hidden" name="operation" value="add"> 
					<input type="hidden" name="redirect" value="sendrequest.jsp">
					<input type="hidden" name="userid" value="<%=username%>">
					<input type="hidden" name="status" value="inprocess">
					
                    <div class="">
						<p>Select DateTime</p>
						<input type="datetime" class="name" name="datetime" required="required" style="width: 580px;height: 45px;"/>
					</div>

					<div class="">
						<p>Select Image</p>
						<input type="file" class="name" name="image" required="required"/>
					</div>
					
					<div class="">
						<p>Location</p>
						<input type="text" class="name" name="location" required="required"/>
					</div>
					
                    <div class="">
						<p>Description</p>
                        <textarea class="name" name="description" required="required" rows="4" cols="70"></textarea>
					</div>
					
					<div class="">
						<p>Select Request Type</p>
                        <select name="requesttype" required style="width: 580px;height: 45px;">
                            <option value="">--select--</option>
                            <option value="rescue">Rescue</option>
                            <option value="adoption">Adoption</option>
                        </select>
					</div>
					
					<br />
					<input type="submit" value="Send Request">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>