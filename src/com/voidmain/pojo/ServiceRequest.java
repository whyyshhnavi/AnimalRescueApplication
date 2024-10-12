package com.voidmain.pojo;

public class ServiceRequest {

	private int id;
	private String userid;
	private String datetime;
	private String status;
	private String image;
	private String description;
	private String location;
	private String requesttype;
	
	public int getId() {
		return id;
	}
	public String getUserid() {
		return userid;
	}
	public String getStatus() {
		return status;
	}
	public String getImage() {
		return image;
	}
	public String getDescription() {
		return description;
	}
	public String getLocation() {
		return location;
	}
	public String getRequesttype() {
		return requesttype;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setRequesttype(String requesttype) {
		this.requesttype = requesttype;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
}
