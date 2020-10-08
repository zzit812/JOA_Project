package com.joalib.booksearch.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.SearchDTO;
import com.joalib.booksearch.svc.BookSearchDBService;
import com.joalib.booksearch.svc.BookSearchService;

public class BookSearchAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		JSONArray parse_listArr = null;
		JSONObject book = null;
		
		ServletContext context = request.getServletContext();
		SearchDTO sdto = new SearchDTO();
		
		String option = request.getParameter("select_search");
		String text= request.getParameter("what");
		//String page = request.getParameter("page");
		String check = request.getParameter("check");
		
		
//		System.out.println("�샃�뀡: " + option);
//		System.out.println("寃��깋�떒�뼱: "+text);
//		System.out.println("check: "+check);
//		
		if(option.equals("도서명")) {
			option = "book_title";
		}else if(option.equals("저자")){
			option = "author";
		}else if(option.equals("출판사")){
			option = "publisher";
		}else if(option.equals("전체")){
			option = "all";
		}
		
		if(check==null) {
			check="100";
		}
			
		sdto.setOption(option);
		sdto.setText(text);
		//sdto.setPage(page);
		sdto.setCheck(check);
		
		
		BookSearchService bookSearchService = new BookSearchService();
		parse_listArr = bookSearchService.search(sdto);
		
		BookSearchDBService bookSearchDBService = new BookSearchDBService();
		List<SearchDTO> book_search = bookSearchDBService.dbsearch(sdto);
	
		
		request.setAttribute("searchBook", parse_listArr );
		request.setAttribute("searchBookDB", book_search);
		

		
		forward = new ActionForward();
		forward.setPath("book_search_result.jsp"); 
		
		return forward;
		
	
	}
	


}
