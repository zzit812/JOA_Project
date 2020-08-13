package com.joalib.book.search.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.SearchDTO;
import com.joalib.book.search.svc.BookSearchService;

public class BookSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ServletContext context = request.getServletContext();
		SearchDTO sdto = new SearchDTO();
		
		String option = request.getParameter("select_search"); //�ɼǶ�
		if(option.equals("������")) {
			option = "book_title";
		}else if(option.equals("����")){
			option = "author";
		}else if(option.equals("���ǻ�")){
			option = "publisher";
		}
		
		String text= request.getParameter("q"); //�Է¶�
		//����,,,,String [] check = request.getParameterValues("check"); //üũ�ڽ�
		//���� ������ ���� ���༭ 'on'�� ���� �ſ���. value���ִ� �� �����ʱ�,,
		
		//System.out.println("�׼�1");

		sdto.setOption(option);
		sdto.setText(text);
		
		BookSearchService bookSearchService = new BookSearchService();
		List<BookInfoDTO> booksearch = bookSearchService.getdto(sdto);
		
		request.setAttribute("bookinfo", booksearch);
	
		//System.out.println(option); Ȯ��
		//System.out.println(text); Ȯ��
//		for(String ch: check) {
//			System.out.println(ch);
//		} Ȯ��
		
		//System.out.println("�׼�2"); Ȯ��
		
		
		forward.setRedirect(true);
		forward.setPath("book_serch.jsp");
		

		return forward;
	}

}
