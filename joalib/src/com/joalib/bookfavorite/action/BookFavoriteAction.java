package com.joalib.bookfavorite.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.LoanDTO;
import com.joalib.bookfavorite.svc.BookFavoriteService;

public class BookFavoriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		LoanDTO loanDTO = new LoanDTO();
		
		String isbn = request.getParameter("isbn");
		String member_id = request.getParameter("member_id");
		
		loanDTO.setLoan_book(isbn);
		loanDTO.setMember_id(member_id);
		
		if (member_id==null) {
		
		}else {
			BookFavoriteService bookFavoriteService = new BookFavoriteService();
			bookFavoriteService.favorite(loanDTO);
		}
		
		
		//bookFavoriteService.favorite(isbn);
		
		forward = new ActionForward();
		forward.setPath("book_wish.jsp"); 
		
		return null;
	}

}
