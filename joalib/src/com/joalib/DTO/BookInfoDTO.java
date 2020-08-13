package com.joalib.DTO;

public class BookInfoDTO {
	
	String isbn,author,publisher,book_title,
	pub_date,isbn_pluscode,book_img,book_story,category;
	int pageTotalCount;



	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getPub_date() {
		return pub_date;
	}
 
	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}

	public String getIsbn_pluscode() {
		return isbn_pluscode;
	}

	public void setIsbn_pluscode(String isbn_pluscode) {
		this.isbn_pluscode = isbn_pluscode;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_story() {
		return book_story;
	}

	public void setBook_story(String book_story) {
		this.book_story = book_story;
	}

	 void setBook_title(Object evaluate) {
		// TODO Auto-generated method stub
		
	}
}
