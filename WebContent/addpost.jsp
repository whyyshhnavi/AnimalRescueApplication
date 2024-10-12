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
					<span>A</span>dd <span>P</span>ost
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
			
				<form name="form" action="AddPostServlet" method="post" name="appform" enctype="multipart/form-data">
				
					<input type="hidden" name="type" value="com.voidmain.pojo.Post">
					<input type="hidden" name="operation" value="add"> 
					<input type="hidden" name="redirect" value="addpost.jsp">
					
                    <div class="">
						<p>Select DateTime</p>
						<input type="datetime" class="name" name="datetime" required="required" style="width: 580px;height: 45px;"/>
					</div>
					
					<br/>
					
					<div class="">
						<p>Select Image</p>
						<input type="file" class="name" name="image" required="required"/>
					</div>
					
					<br/>
					
					<div class="">
						<p>Title</p>
						<input type="text" class="name" name="title" required="required"/>
					</div>
					
                    <div class="">
						<p>Description</p>
                        <textarea class="name" name="description" required="required" rows="4" cols="70"></textarea>
					</div>
					
					<br />
					<input type="submit" value="Add Post">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>