<!DOCTYPE HTML>
<html>
<head>
	<%@include file="header.html"%>
</head>
<body>
	<%@include file="menu1.html"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>R</span>egistration <span>F</span>orm
				</h3>
				<div class="tittle-style" align="center">	
					<%
						String status = request.getParameter("status");

						if (status != null) {
					%>
							<h1></h1>
							<p style="color: red; size: 50px;"><%=status%></p>
					<%
						} else {
					%>
							<p>If you have an account with us, please log in.</p>
					<%
						}
					%>
					
				</div>
			</div>
			<div class="login-form">
				<form name="form" action="VoidmainServlet" method="post" name="appform">
				
					<input type="hidden" name="type" value="com.voidmain.pojo.User">
					<input type="hidden" name="operation" value="add"> 
					<input type="hidden" name="redirect" value="registration.jsp">
				
                    <div class="">
						<p>User Name</p>
						<input type="text" class="name" name="username" required="required"/>
					</div>

					<div class="">
						<p>Password</p>
						<input type="password" class="name" name="password" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="Password Must Contain One Capital One Small and One Digit and Mininum 8 Characters"/>
					</div>

					<div class="">
						<p>Name</p>
						<input type="text" class="name" name="name" required="required"/>
					</div>

                    <div class="">
						<p>Email Address</p>
						<input type="email" class="name" name="email" required="required"/>
					</div>

					<div class="">
						<p>Mobile</p>
						<input type="text" class="name" name="mobile" required="required" pattern="[6789][0-9]{9}"/>
					</div>

                    <div class="">
						<p>Address</p>
                        <textarea class="name" name="address" required="required" rows="4" cols="70"></textarea>
					</div>

                    <div class="">
						<p>Select user Type</p>
                        <select name="usertype" required style="width: 580px;height: 45px;">
                            <option value="">--select--</option>
                            <option value="user">User</option>
                            <option value="ngo">NGO</option>
                            <option value="rescuers">Rescuers</option>
                        </select>
					</div>

					<br />
					<input type="submit" value="Register">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>