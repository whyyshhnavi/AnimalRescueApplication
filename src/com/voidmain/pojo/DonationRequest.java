package com.voidmain.pojo;

public class DonationRequest {

	private int id;
	private String purpose;
	private String amount;
	private String accountdetails;
	private String description;
	private String status;
	
	public int getId() {
		return id;
	}
	public String getAmount() {
		return amount;
	}
	public String getAccountdetails() {
		return accountdetails;
	}
	public String getDescription() {
		return description;
	}
	public String getStatus() {
		return status;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public void setAccountdetails(String accountdetails) {
		this.accountdetails = accountdetails;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
}
