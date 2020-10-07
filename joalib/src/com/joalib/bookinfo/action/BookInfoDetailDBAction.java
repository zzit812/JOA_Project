package com.joalib.bookinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.bookinfo.svc.BookInfoDetailDBService;


public class BookInfoDetailDBAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		String isbn = request.getParameter("isbn");
		String message = request.getParameter("message");
	
		
		BookInfoDetailDBService bookInfoDetailDBService = new BookInfoDetailDBService();
		BookInfoDTO bookDB = bookInfoDetailDBService.bookDB(isbn);
		
		request.setAttribute("bookDB", bookDB);
		request.setAttribute("message", message);
		
		forward = new ActionForward();
		forward.setPath("BookInfoDetailDB.jsp");
		
		return forward;
	}

}
