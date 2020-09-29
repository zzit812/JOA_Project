package com.joalib.DTO;

public class member_alarmDTO {
	String member_id;
	String alarm_date;
	String alarm_category;
	String alarm_etc;
	int alarm_check;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}
	public String getAlarm_category() {
		return alarm_category;
	}
	public void setAlarm_category(String alarm_category) {
		this.alarm_category = alarm_category;
	}
	public String getAlarm_etc() {
		return alarm_etc;
	}
	public void setAlarm_etc(String alarm_etc) {
		this.alarm_etc = alarm_etc;
	}
	public int getAlarm_check() {
		return alarm_check;
	}
	public void setAlarm_check(int alarm_check) {
		this.alarm_check = alarm_check;
	}
	
	

}
