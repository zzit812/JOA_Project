package com.joalib.loan.svc;

import com.joalib.DAO.LoanDAO;
import com.joalib.DTO.LoanDTO;

public class BookLoanService {


	public void loan(LoanDTO dto) {
	
		LoanDAO dao = new LoanDAO();
		LoanDAO.getinstance();
		dao.loan(dto);

	}

}
