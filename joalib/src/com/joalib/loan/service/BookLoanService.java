package com.joalib.loan.service;

import com.joalib.DAO.LoanDAO;
import com.joalib.DTO.LoanDTO;

public class BookLoanService {

	public void loan(LoanDTO loanDTO) {
		LoanDAO dao = new LoanDAO();
		dao.loan(loanDTO);
		
	}

}
