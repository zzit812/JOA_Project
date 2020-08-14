package com.joalib.DTO;

public class FaultDTO {
	
	int fault_no;
	String fault_title;
	String fault_text;
	String fault_date;
	String fault_attach;
	String member_id;
	
	
	public int getFault_no() {
		return fault_no;
	}
	public void setFault_no(int fault_no) {
		this.fault_no = fault_no;
	}
	public String getFault_title() {
		return fault_title;
	}
	public void setFault_title(String fault_title) {
		this.fault_title = fault_title;
	}
	public String getFault_text() {
		return fault_text;
	}
	public void setFault_text(String fault_text) {
		this.fault_text = fault_text;
	}
	public String getFault_date() {
		return fault_date;
	}
	public void setFault_date(String fault_date) {
		this.fault_date = fault_date;
	}
	public String getFault_attach() {
		return fault_attach;
	}
	public void setFault_attach(String fault_attach) {
		this.fault_attach = fault_attach;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
