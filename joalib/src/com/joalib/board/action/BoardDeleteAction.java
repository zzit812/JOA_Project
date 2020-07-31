package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.board.svc.BoardDeleteService;

public class BoardDeleteAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		ServletContext context = request.getServletContext();
		int board_no=Integer.parseInt(request.getParameter("board_num"));
		BoardDeleteService boardDetailService = new BoardDeleteService();
		boardDetailService.removeArticle(board_no);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("board.jsp"); 
		
		return forward;
	}

}
