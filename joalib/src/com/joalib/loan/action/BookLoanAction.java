package com.joalib.loan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.LoanDTO;
import com.joalib.loan.service.BookLoanSelectService;
import com.joalib.loan.service.BookLoanService;


public class BookLoanAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		LoanDTO loanDTO = new LoanDTO();
		
		
		
		String member_id = request.getParameter("member_id");
		String isbn = request.getParameter("isbn");
		
		loanDTO.setLoan_book(isbn);
		loanDTO.setMember_id(member_id);
		
		//System.out.println("이곳은 액션 ");
		BookLoanSelectService bookLoanSelectService = new BookLoanSelectService();
		int i = bookLoanSelectService.loan_select(loanDTO);
		
		//System.out.println(i+": i");
		if (i==1) {
			forward = new ActionForward();
			forward.setPath("bookInfoDetailDB.bk?isbn="+isbn);
			
			
		}else {
			BookLoanService bookLoanService = new BookLoanService();
			bookLoanService.loan(loanDTO);
		}
		
		forward = new ActionForward();
		forward.setPath("bookInfoDetailDB.bk?isbn="+isbn);
		
		
		return forward;
	}

}
