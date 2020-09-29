package com.joalib.DTO;

public class DonateDTO {
	
	int donate_no;
	String donate_title;
	String donate_text;
	String donate_date;
	String donate_attach;
	String member_id;
	String donate_condition;
	String donate_buyer;
	
	
	public String getDonate_buyer() {
		return donate_buyer;
	}
	public void setDonate_buyer(String donate_buyer) {
		this.donate_buyer = donate_buyer;
	}
	public int getDonate_no() {
		return donate_no;
	}
	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}
	public String getDonate_title() {
		return donate_title;
	}
	public void setDonate_title(String donate_title) {
		this.donate_title = donate_title;
	}
	public String getDonate_text() {
		return donate_text;
	}
	public void setDonate_text(String donate_text) {
		this.donate_text = donate_text;
	}
	public String getDonate_date() {
		return donate_date;
	}
	public void setDonate_date(String donate_date) {
		this.donate_date = donate_date;
	}
	public String getDonate_attach() {
		return donate_attach;
	}
	public void setDonate_attach(String donate_attach) {
		this.donate_attach = donate_attach;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDonate_condition() {
		return donate_condition;
	}
	public void setDonate_condition(String donate_condition) {
		this.donate_condition = donate_condition;
	}
	

}
