package com.joalib.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.board.action.dbAction;

import com.joalib.board.action.BoardWriteProAction;
import com.joalib.board.action.BoardDeleteAction;
import com.joalib.board.action.BoardDetailAction;
import com.joalib.board.action.BoardModifyFormAction;
import com.joalib.board.action.BoardModifyProAction;



@WebServlet("*.bo") 
public class BoardContr extends javax.servlet.http.HttpServlet
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		dbAction action=null;
		
		if(command.equals("/boardWritePro.bo")){ //글쓰기 데이터입력 후 완료버튼 눌렀을 때,
			action  = new BoardWriteProAction();
			try {
				forward=action.execute(request, response );
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/boardReadPage.bo")){
			action = new BoardDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyForm.bo")){			
			action = new BoardModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.bo")){
			action = new BoardModifyProAction();	
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardDelete.bo")){
			action = new BoardDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
		if(forward != null){		
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	//반환하는 forward값이 있으면, 'forward.getPath()'으로 이동한다.
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
