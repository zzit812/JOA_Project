package com.joalib.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.fault.action.*;

@WebServlet("*.fa")
public class FaultContr extends javax.servlet.http.HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		
		if(command.equals("/faultWrite.fa")) {
			action = new FaultWriteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/faultDelete.fa")) {
			action = new FaultDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/faultUpdate.fa")) {
			action = new FaultUpdateAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}	
		
		if(forward != null){		
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	//반환하는 forward값이 있으면, 'forward.getPath()'으로 이동한다.
			}else{
				RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}

//doProcess END
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
