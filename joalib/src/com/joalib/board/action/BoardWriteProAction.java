package com.joalib.board.action;

import java.awt.event.ActionEvent;
import java.beans.PropertyChangeListener;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Action;

import org.apache.ibatis.session.SqlSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BoardDTO;
import com.joalib.board.svc.BoardWriteProService;

import java.util.Calendar;
import java.util.Date;



public class BoardWriteProAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Date date= new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String board_date = simpleDate.format(date);
		
		ActionForward forward=null;
		BoardDTO boardBean = null;
		
		ServletContext context = request.getServletContext();
		
		boardBean = new BoardDTO();
		
	
		
		boardBean.setBoard_title(request.getParameter("board_title"));
		boardBean.setBoard_text(request.getParameter("board_write"));
		boardBean.setMember_id(request.getParameter("member_id"));
		boardBean.setBoard_date(board_date);
		
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
//		System.out.println(isWriteSuccess);
		
		if(!isWriteSuccess){
			//게시물 추가 실패
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardPointCharge.po");
			
		}
		
		return forward;
	}
	


}
