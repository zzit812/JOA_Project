package com.joalib.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.jaolib.book.manager.action.BookInfoAddAction;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.LoanDTO;
import com.joalib.bookinfo.action.Action;
import com.joalib.bookinfo.action.BookInfoDetailAction;
import com.joalib.bookinfo.action.BookInfoDetailDBAction;
import com.joalib.bookinfo.svc.BookInfoDetailDBService;
import com.joalib.loan.service.BookLoanService;

@WebServlet("*.bk") 
public class BookInfoContr extends javax.servlet.http.HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		 if(command.equals("/bookInfoAdd.bk")){  
			// action = new BookInfoAddAction(); ///////////////////북정보 관리자 페이지
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if(command.equals("/bookInfoDetail.bk")){   
			action = new BookInfoDetailAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if(command.equals("/bookInfoDetailDB.bk")){ 
			action = new BookInfoDetailDBAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }

//		 	BookInfoDetailDBService bookInfoDetailDBService = new BookInfoDetailDBService();
//		 	BookInfoDTO bookInfoDTO = new BookInfoDTO();
//
//			String member_id = request.getParameter("member_id");
//			String isbn = request.getParameter("isbn");
//			
//			bookInfoDTO.setIsbn(isbn);
//			bookInfoDTO.setMember_id(member_id);
//			
//			request.setAttribute("book", bookInfoDetailDBService.getBook(bookInfoDTO));
			
			
				
		 if(forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				}else{
					RequestDispatcher dispatcher=
							request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				
				}
			}
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}
	
	
}

