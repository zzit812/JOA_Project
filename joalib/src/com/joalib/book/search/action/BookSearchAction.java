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
		
		String text= request.getParameter("q"); //�Է¶�
		String option = request.getParameter("select_search"); //�ɼǶ�
		String [] check = request.getParameterValues("sksk"); //üũ�ڽ�
		
		//System.out.println(option); Ȯ��
		//System.out.println(text); Ȯ��
		for(String ch: check) {
			System.out.println(ch);
		} //ON�� ���,,,,

		
		forward.setRedirect(true);
		forward.setPath("book_serch.jsp");
		

		return forward;
	}

}
