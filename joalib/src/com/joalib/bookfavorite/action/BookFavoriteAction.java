package com.joalib.bookfavorite.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.bookfavorite.svc.BookFavoriteService;

public class BookFavoriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		String isbn = request.getParameter("isbn");
		String member_id = request.getParameter("member_id");
		
		if (member_id==null) {
		
		}else {
			BookFavoriteService bookFavoriteService = new BookFavoriteService();
		}
		
		
		//bookFavoriteService.favorite(isbn);
		
		forward = new ActionForward();
		forward.setPath("book_wish.jsp"); 
		
		return null;
	}

}
