package com.joalib.bookinfo.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.bookinfo.svc.BookInfoDetailService;

public class BookInfoDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		
		//확인.값도 잘가져옴
		
		BookInfoDetailService bookInfoDetailService = new BookInfoDetailService();
		BookInfoDTO article = bookInfoDetailService.getArticle(isbn);
		
		request.setAttribute("article", article);
		
		//확인. article.get어쩌구 가능 
		System.out.print(article.getBook_img());
		System.out.println((BookInfoDTO)request.getAttribute("article"));
		
		forward.setRedirect(true);
		forward.setPath("BookInfoDetail.jsp");
		
		return forward;
	}

}
