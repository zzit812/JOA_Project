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
import com.joalib.bookinfo.action.Action;
import com.joalib.bookinfo.action.BookInfoDetailAction;

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

		 if(command.equals("/bookInfoAdd.bk")){  //책占쏙옙占쏙옙占쌩곤옙占싹깍옙
			 //화占쏙옙
			// action = new BookInfoAddAction(); ///////////////////북정보 관리자 페이지
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if(command.equals("/bookInfoDetail.bk")){   //책占쏙옙占쏙옙占쏙옙占쏙옙
				 //화占쏙옙
			action = new BookInfoDetailAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }

				
		 if(forward != null) {
				if(forward.isRedirect()) {
					//boolean占쏙옙占쏙옙 트占쏙옙占싸곤옙荑� 占쏙옙占쏙옙
					response.sendRedirect(forward.getPath());
				}else{
					RequestDispatcher dispatcher=
							request.getRequestDispatcher(forward.getPath());
					//RequestDispatcher占쏙옙占� 클占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 request占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹곤옙 占쌍다곤옙
					//占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌔댐옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙 占쌍곤옙 占쏙옙占� 占쏙옙占쏙옙占싹댐옙 占쏙옙
					//占싼몌옙占쏙옙占� 占식띰옙占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙磯占�.
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

