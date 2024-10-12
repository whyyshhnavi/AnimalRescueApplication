package com.voidmain.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.voidmain.dao.HibernateTemplate;
import com.voidmain.pojo.Post;

@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);

			if(isMultipart) 
			{
				Object obj=new Post();
				
				Map<Object,List<String>> map=HttpRequestParser.parseMultiPartRequest(request,obj);
				
				List<String> list=map.get(obj);
				
				Post post=(Post)obj;
				post.setImage(list.get(0));
				
				if(HibernateTemplate.addObject(post)==1)
				{
					response.sendRedirect("addpost.jsp?status=success");
				}
				else
				{
					response.sendRedirect("addpost.jsp?status=failed");
				}
			}
			else
			{
				response.sendRedirect("addpost.jsp?status=invalid request");
			}
			
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
