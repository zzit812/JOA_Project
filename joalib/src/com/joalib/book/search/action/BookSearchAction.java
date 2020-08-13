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
		
		String option = request.getParameter("select_search"); //옵션란
		if(option.equals("도서명")) {
			option = "book_title";
		}else if(option.equals("저자")){
			option = "author";
		}else if(option.equals("출판사")){
			option = "publisher";
		}
		
		String text= request.getParameter("q"); //입력란
		//보류,,,,String [] check = request.getParameterValues("check"); //체크박스
		//앞의 벨류에 값을 안줘서 'on'이 떴던 거였음. value값주는 거 잊지않기,,
		
		//System.out.println("액션1");

		sdto.setOption(option);
		sdto.setText(text);
		
		BookSearchService bookSearchService = new BookSearchService();
		List<BookInfoDTO> booksearch = bookSearchService.getdto(sdto);
		
		request.setAttribute("bookinfo", booksearch);
	
		//System.out.println(option); 확인
		//System.out.println(text); 확인
//		for(String ch: check) {
//			System.out.println(ch);
//		} 확인
		
		//System.out.println("액션2"); 확인
		
		
		forward.setRedirect(true);
		forward.setPath("book_serch.jsp");
		

		return forward;
	}

}
