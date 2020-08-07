package com.joalib.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.bookinfo.action.Action;
import com.joalib.bookinfo.action.BookInfoAddAction;
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

		 if(command.equals("/bookInfoAdd.bk")){
			 //화긴
			 action = new BookInfoAddAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if(command.equals("/bookInfoDetail.bk")){
				 //화긴
			action = new BookInfoDetailAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		 
				
				
				System.out.println(forward.getPath());
				

				System.out.println((BookInfoDTO)request.getAttribute("article"));
				
				
		 if(forward != null) {
				if(forward.isRedirect()) {
					//boolean값임 트루인경우에 실행
					response.sendRedirect(forward.getPath());
				}else{
					RequestDispatcher dispatcher=
							request.getRequestDispatcher(forward.getPath());
					//RequestDispatcher라는 클래스는 현재 request에 담긴 정보를 저장하고 있다가
					//그 다음 페이지 그 다음페이지에도 해당 정보를 볼 수 있게 계속 저장하는 것
					//한마디로 파라미터정보 유지를 위해 사용한다.
					dispatcher.forward(request, response);
				
				}
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

