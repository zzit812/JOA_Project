package com.joalib.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DAO;
import com.joalib.DTO.ActionForward;
import com.joalib.board.action.*;



@WebServlet("*.bo") 
public class BoardContr extends javax.servlet.http.HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		dbAction action=null;
		
		if(command.equals("/boardWritePro.bo")){ //�۾��� �������Է� �� �Ϸ��ư ������ ��,
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
		}else if(command.equals("/commentWrite.bo")){
			action = new CommentWriteAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/commentDelete.bo")){
			action = new CommentDelAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/commentUpdate.bo")) {
			action = new CommentUpdateAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardHitUp.bo")) {
			action = new BoardPostHitupAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/smallCommentChange.bo")) {
			action = new SmallCommentChangeAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/smallCommentAdd.bo")) {
			action = new SmallCommentAddAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/smallCommentDel.bo")) {
			action = new SmallCommentDelAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/commentAlarmAdd.bo")) {
			action = new CommentAlramAddAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/smallCommentAlarmAdd.bo")) {
			action = new SamllCommentAlarmAction();
			try{
				forward=action.execute(request, response);				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){		
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	//��ȯ�ϴ� forward���� ������, 'forward.getPath()'���� �̵��Ѵ�.
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
