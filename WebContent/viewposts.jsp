<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Post"%>
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
					<span>P</span>ost's
				</h3>
			</div>
			
			<%			
				if(role.equals("admin"))
				{
			%>
					<%
						for (Post post : HibernateDAO.getPosts()) {
							
					%>
								<div class="about-sub">
									<div class="col-md-6 about_bottom_left">
										<font size="4"><br /><%=post.getTitle()%></font>
										<h4>
											<span> <%=post.getDatetime()%></span>
										</h4>
										<p> <%=post.getDescription()%></p>
										<a class="button-style" href="viewposts.jsp?did=<%=post.getId()%>">delete</a>
									</div>
									<!-- Stats-->
									<div class="col-md-6 about2-info">
										<img src="./appimages/<%=post.getImage()%>" alt="" height="250" width="500"/>
									</div>
									<!-- //Stats -->
									<div class="clearfix"></div>
								</div>
								<br /> <br />
					<%
						}
					%>
			<%		
				}
			%>
			
			
			<%			
				if(!role.equals("admin"))
				{
			%>
					<%
						for (Post post : HibernateDAO.getPosts()) {
		
					%>
								<div class="about-sub">
									<div class="col-md-6 about_bottom_left">
										<font size="4"><br /><%=post.getTitle()%></font>
										<h4>
											<span> <%=post.getDatetime()%></span>
										</h4>
										<p> <%=post.getDescription()%></p>
									</div>
									<!-- Stats-->
									<div class="col-md-6 about2-info">
										<img src="./appimages/<%=post.getImage()%>" alt="" height="250" width="500"/>
									</div>
									<!-- //Stats -->
									<div class="clearfix"></div>
								</div>
								<br /> <br />
					<%
							
						}
					%>
			<%		
				}
			%>
			
		</div>
	</div>

	<%
		String did = request.getParameter("did");

		if (did != null) {

			if (HibernateTemplate.deleteObject(Post.class,Integer.parseInt(did)) == 1) {
				response.sendRedirect("viewposts.jsp?status=success");
			} else {
				response.sendRedirect("viewposts.jsp?status=failed");
			}
		}
	%>
	
	<%@include file="footer.html"%>
	
</body>
</html>