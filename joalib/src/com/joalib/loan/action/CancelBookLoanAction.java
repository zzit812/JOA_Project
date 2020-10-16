package com.joalib.loan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.LoanDTO;

import com.joalib.loan.service.BookLoanService;


public class CancelBookLoanAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		LoanDTO loanDTO = new LoanDTO();

		String member_id = request.getParameter("member_id");
		String isbn = request.getParameter("isbn");
		
		loanDTO.setLoan_book(isbn);
		loanDTO.setMember_id(member_id);
		
		BookLoanService bookLoanService = new BookLoanService();
		boolean flag = bookLoanService.cancelLoan(loanDTO);
		
		String message = "";
		if(flag)
			message = "대출이 취소되었습니다.";
		
		forward = new ActionForward();
		forward.setPath("bookInfoDetailDB.bk?isbn="+isbn+"&message="+message);
			
		return forward;
	}

}
