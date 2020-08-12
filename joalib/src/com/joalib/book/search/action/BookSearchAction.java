package com.joalib.book.search.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;

public class BookSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ServletContext context = request.getServletContext();
		
		String text= request.getParameter("q"); //입력란
		String option = request.getParameter("select_search"); //옵션란
		String [] check = request.getParameterValues("sksk"); //체크박스
		
		//System.out.println(option); 확인
		//System.out.println(text); 확인
		for(String ch: check) {
			System.out.println(ch);
		} //ON이 뜬다,,,,

		
		forward.setRedirect(true);
		forward.setPath("book_serch.jsp");
		

		return forward;
	}

}
