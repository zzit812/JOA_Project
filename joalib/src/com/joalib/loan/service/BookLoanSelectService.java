package com.joalib.loan.service;

import com.joalib.DAO.LoanDAO;
import com.joalib.DTO.LoanDTO;

public class BookLoanSelectService {

	public int loan_select(LoanDTO loanDTO) {
		LoanDAO dao = new LoanDAO();
		int i = dao.loan_select(loanDTO);
		
		
		return i;
		
	}

}
