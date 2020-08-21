package com.joalib.DTO;

public class Donate_CommentDTO {
	
	int donate_no;	//게시글 넘버
	int donate_comment_no;	//댓글 넘버
	String member_id;
	String dc_text;
	String dc_date;
	
	
	public int getDonate_no() {
		return donate_no;
	}
	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}
	public int getDonate_comment_no() {
		return donate_comment_no;
	}
	public void setDonate_comment_no(int donate_comment_no) {
		this.donate_comment_no = donate_comment_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDc_text() {
		return dc_text;
	}
	public void setDc_text(String dc_text) {
		this.dc_text = dc_text;
	}
	public String getDc_date() {
		return dc_date;
	}
	public void setDc_date(String dc_date) {
		this.dc_date = dc_date;
	}
	
	

}
