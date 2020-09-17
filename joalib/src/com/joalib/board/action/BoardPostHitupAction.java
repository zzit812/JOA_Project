package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.board.svc.BoardPostHitupService;

public class BoardPostHitupAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		ServletContext context = request.getServletContext();
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		BoardPostHitupService svc = new BoardPostHitupService();
		boolean isSuccess = svc.boardHitup(board_no);
		
		if(isSuccess) {
			System.out.println("조회수 증가");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardReadPage.bo?board_num="+board_no); 
		}
		
		
		return forward;
	}

}
