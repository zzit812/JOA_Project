package com.joalib.loan.service;

import com.joalib.DAO.LoanDAO;
import com.joalib.DTO.LoanDTO;

public class BookLoanService {

	public boolean loan(LoanDTO loanDTO) {
		LoanDAO dao = new LoanDAO();
		
		try {
			dao.loan(loanDTO);  //아이디와 	ISBN 동일할 시 넣음
		}catch(Exception e) { 
			return false;	
		}
		
		return true;
	}

}
