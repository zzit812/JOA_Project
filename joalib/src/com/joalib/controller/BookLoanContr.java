package com.joalib.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;

import com.joalib.loan.action.Action;
import com.joalib.loan.action.BookLoanAction;



@WebServlet("*.loa") 
public class BookLoanContr extends javax.servlet.http.HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		System.out.println(command);
		
		if(command.equals("/bookLoan.loa")){ 
			//System.out.println("이곳은 콘드롤요 ");
			action  = new BookLoanAction();
			
			try {
				forward=action.execute(request, response );				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){		
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	
			}else{
				RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
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
