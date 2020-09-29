package com.joalib.bookwish.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookWishDTO;
import com.joalib.bookwish.svc.BookWishService;


public class BookWishAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookWishDTO dto = new BookWishDTO();
		ActionForward forward=null;
		
		dto.setMember_id(request.getParameter("member_id"));
		dto.setWish_title(request.getParameter("title"));
		dto.setWish_publisher(request.getParameter("publisher"));
		dto.setWish_author(request.getParameter("author"));
		dto.setWish_isbn(request.getParameter("isbn"));
		
		BookWishService bookWishService = new BookWishService();
		bookWishService.wish(dto);
		
		forward = new ActionForward();
		forward.setPath("book_wish.jsp"); 
		
		
		
		
		return forward;
	}

}
