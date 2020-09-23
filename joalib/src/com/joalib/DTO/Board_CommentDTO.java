package com.joalib.DTO;

public class Board_CommentDTO {
	String board_no;
	String member_id;
	String bc_text;
	String bc_date;
	int board_comment_no;
	
	
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBc_text() {
		return bc_text;
	}
	public void setBc_text(String bc_text) {
		this.bc_text = bc_text;
	}
	public String getBc_date() {
		return bc_date;
	}
	public void setBc_date(String bc_date) {
		this.bc_date = bc_date;
	}
	public int getBoard_comment_no() {
		return board_comment_no;
	}
	public void setBoard_comment_no(int board_comment_no) {
		this.board_comment_no = board_comment_no;
	}
	
	
}
