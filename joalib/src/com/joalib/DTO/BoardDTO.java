package com.joalib.DTO;

public class BoardDTO {
	static int board_num;	//db에 들어있는 값이 아닌 계속 바뀌는 변수입니다.
	
	int board_no;
	String board_title;
	String board_text;
	String board_date;
	String member_id;
	int board_hit;
	
	
	public static int getBoard_num() {
		return board_num;
	}
	public static void setBoard_num(int board_num) {
		BoardDTO.board_num = board_num;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
