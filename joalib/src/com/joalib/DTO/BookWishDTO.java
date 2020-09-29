package com.joalib.DTO;

public class BookWishDTO {
	int wish_no;
	String member_id, wish_title, wish_publisher, wish_author, wish_isbn;
	
	
	public int getWish_no() {
		return wish_no;
	}
	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getWish_title() {
		return wish_title;
	}
	public void setWish_title(String wish_title) {
		this.wish_title = wish_title;
	}
	public String getWish_publisher() {
		return wish_publisher;
	}
	public void setWish_publisher(String wish_publisher) {
		this.wish_publisher = wish_publisher;
	}
	public String getWish_author() {
		return wish_author;
	}
	public void setWish_author(String wish_author) {
		this.wish_author = wish_author;
	}
	public String getWish_isbn() {
		return wish_isbn;
	}
	public void setWish_isbn(String wish_isbn) {
		this.wish_isbn = wish_isbn;
	}
}
