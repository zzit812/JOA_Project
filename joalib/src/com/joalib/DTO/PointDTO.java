package com.joalib.DTO;

public class PointDTO {
	
	String member_id;
	int point;
	String update_date;
	String point_reason;
	int total_point;
	String UPandDown;
	
	
	
	
	public String getUPandDown() {
		return UPandDown;
	}
	public void setUPandDown(String uPandDown) {
		UPandDown = uPandDown;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getPoint_reason() {
		return point_reason;
	}
	public void setPoint_reason(String point_reason) {
		this.point_reason = point_reason;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
		

}
