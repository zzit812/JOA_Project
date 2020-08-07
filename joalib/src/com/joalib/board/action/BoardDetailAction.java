package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BoardDTO;
import com.joalib.board.svc.BoardDetailService;

public class BoardDetailAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ServletContext context = request.getServletContext();
		
		int board_no =Integer.parseInt(request.getParameter("board_num"));
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardDTO article = boardDetailService.getArticle(board_no);
		//하나의 게시물에 대한 내용들이 담겨있음
		
		
		request.setAttribute("article", article);		
		
		//forward.setRedirect(true);
		forward.setPath("board_read_page.jsp");	

		return forward;
	}

}
