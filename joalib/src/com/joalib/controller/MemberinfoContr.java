package com.joalib.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.member.action.*;

@WebServlet("*.mem")
public class MemberinfoContr extends javax.servlet.http.HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action = null;
		
		if(command.equals("/memberInsert.mem")) {
			//ȸ������
			action = new MemberInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/IDCheck.mem")) {
			//�α���
			action = new MemberIDCheck();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/memberLogout.mem")) {
			//�α׾ƿ�
			HttpSession session = request.getSession(false);
			session.invalidate();
			//
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("home.jsp");
		}else if (command.equals("/newMemberPointInsert.mem")) {
			action = new NewMemberPointAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if (command.equals("/memberDelete.mem")) {
			action = new MemberDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if (command.equals("/memberinfoChange.mem")) {
			action = new MeberinfoChangeAction();	//��������
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace(); }
		}
		else if (command.equals("/memberAlram.mem")) {
			action = new AlarmMemberAction();	//��������
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace(); }
		}
		
	
	
		if(forward != null){		
				if(forward.isRedirect()){
					response.sendRedirect(forward.getPath());	//��ȯ�ϴ� forward���� ������, 'forward.getPath()'���� �̵��Ѵ�.
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