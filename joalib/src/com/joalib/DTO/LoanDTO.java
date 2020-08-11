package com.joalib.DTO;

import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class LoanDTO {
	
	String member_id, loan_book,loan_condition,return_duedate;



	public String getReturn_duedate() {
		return return_duedate;
	}

	public void setReturn_duedate(String return_duedate) {
		this.return_duedate = return_duedate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getLoan_book() {
		return loan_book;
	}

	public void setLoan_book(String loan_book) {
		this.loan_book = loan_book;
	}

	public String getLoan_condition() {
		return loan_condition;
	}

	public void setLoan_condition(String loan_condition) {
		this.loan_condition = loan_condition;
	}
}
