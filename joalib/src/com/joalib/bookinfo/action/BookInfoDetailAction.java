package com.joalib.bookinfo.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.bookinfo.svc.BookInfoDetailService;

public class BookInfoDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,
		
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		
		//Ȯ��.���� �߰�����
		
		BookInfoDetailService bookInfoDetailService = new BookInfoDetailService();
		BookInfoDTO article = bookInfoDetailService.getArticle(isbn);
				
		request.setAttribute("bookinfo", article);
		
		//Ȯ��. article.get��¼�� ���� 
		//System.out.println("*article* : "+ article.getBook_img());
		//System.out.println((BookInfoDTO)request.getAttribute("article"));
		
		
		forward = new ActionForward();
		//forward.setRedirect(true);
		forward.setPath("BookInfoDetail.jsp");
		
		return forward;
	}

}
