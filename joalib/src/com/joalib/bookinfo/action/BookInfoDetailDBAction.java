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
		String message = null;
		
		if(request.getParameter("message") != null) {
			message = request.getParameter("message");
			request.setAttribute("message", message);
		}
		
		BookInfoDetailDBService bookInfoDetailDBService = new BookInfoDetailDBService();
		BookInfoDTO bookDB = bookInfoDetailDBService.bookDB(isbn);
		
		request.setAttribute("bookDB", bookDB);
		
		
		forward = new ActionForward();
		forward.setPath("BookInfoDetailDB.jsp");
		
		return forward;
	}

}
