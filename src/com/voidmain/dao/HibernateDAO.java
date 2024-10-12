package com.voidmain.dao;

import java.util.List;

import com.voidmain.pojo.DonationRequest;
import com.voidmain.pojo.Login;
import com.voidmain.pojo.Post;
import com.voidmain.pojo.ServiceRequest;
import com.voidmain.pojo.User;

public class HibernateDAO {

	public static String isValidUser(String username,String password)
	{
		String result="0";

		Login login=getLoginById(username);

		if(login!=null && login.getPassword().equals(password))
		{
			result=login.getRole();
		}

		return result;
	}

	public static boolean isUserRegistred(String username)
	{
		boolean isRegistred=false;

		for(Login login : getLogins())
		{
			if(login.getUsername().toLowerCase().equals(username.toLowerCase()))
			{
				isRegistred=true;

				break;
			}
		}

		return isRegistred;
	}

	//================================================================================

	public static Login getLoginById(String username)
	{
		return (Login)HibernateTemplate.getObject(Login.class,username);
	}

	public static int deleteLogin(String username)
	{
		return HibernateTemplate.deleteObject(Login.class,username);
	}

	public static List<Login> getLogins()
	{
		List<Login> logins=(List)HibernateTemplate.getObjectListByQuery("From Login");

		return logins;
	}

	//============================================================================

	public static User getUserById(String id)
	{
		return (User)HibernateTemplate.getObject(User.class,id);
	}

	public static int deleteUser(int id)
	{
		return HibernateTemplate.deleteObject(User.class,id);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}

	//================================================================================

	public static ServiceRequest getServiceRequestById(int id)
	{
		return (ServiceRequest)HibernateTemplate.getObject(ServiceRequest.class,id);
	}

	public static int deleteServiceRequest(int id)
	{
		return HibernateTemplate.deleteObject(ServiceRequest.class,id);
	}

	public static List<ServiceRequest> getServiceRequests()
	{
		List<ServiceRequest> serviceRequests=(List)HibernateTemplate.getObjectListByQuery("From ServiceRequest");

		return serviceRequests;
	}

	//================================================================================

	public static DonationRequest getDonationRequestById(int donationRequestId)
	{
		return (DonationRequest)HibernateTemplate.getObject(DonationRequest.class,donationRequestId);
	}

	public static int deleteDonationRequest(int donationRequestId)
	{
		return HibernateTemplate.deleteObject(DonationRequest.class,donationRequestId);
	}

	public static List<DonationRequest> getDonationRequests()
	{
		List<DonationRequest> donationRequests=(List)HibernateTemplate.getObjectListByQuery("From DonationRequest");

		return donationRequests;
	}

	//================================================================================

	public static Post getPostById(int id)
	{
		return (Post)HibernateTemplate.getObject(Post.class,id);
	}

	public static int deletePost(int id)
	{
		return HibernateTemplate.deleteObject(Post.class,id);
	}

	public static List<Post> getPosts()
	{
		List<Post> posts=(List)HibernateTemplate.getObjectListByQuery("From Post");

		return posts;
	}
}
