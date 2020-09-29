package com.joalib.bookinfo.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.SearchDTO;
import com.joalib.bookinfo.svc.BookInfoDetailService;
import com.joalib.booksearch.svc.BookSearchService;

public class BookInfoDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		SearchDTO sdto = new SearchDTO();
		
		JSONArray parse_listArr = null;
		JSONObject book = null;
		
		ServletContext context = request.getServletContext();
		
		String text = request.getParameter("isbn"); 
	
		BookInfoDetailService bookInfoDetailService = new BookInfoDetailService();
		parse_listArr = bookInfoDetailService.detail(text);
		
		
		
		request.setAttribute("searchBook", parse_listArr );

		
		forward = new ActionForward();
		forward.setPath("BookInfoDetail.jsp"); 
		
		return forward;
		
	
	}
	


}
