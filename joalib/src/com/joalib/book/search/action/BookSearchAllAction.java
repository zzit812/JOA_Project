package com.joalib.book.search.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.book.search.svc.BookSearchAllService;

public class BookSearchAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		forward = new ActionForward();
		BookInfoDTO dto = new BookInfoDTO();
		
		
		BookSearchAllService bookSearchAllService = new BookSearchAllService();
		List<BookInfoDTO> list = bookSearchAllService.getdto();
	
		
		for(int i=0; i<10; i++) {
			System.out.println(list.get(i).getAuthor());
		}
		

		forward.setPath("book_search.jsp");
		
		return forward;
	}

}
