package com.joalib.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.point.action.*;

@WebServlet("*.mem")
public class PointContr {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action = null;
		
		if(command.equals("/memberPointNowSelect.mem")) {
			//point select
			action = new MemberNowPointSelectAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
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
	
	//doProcess END
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	} 

}
