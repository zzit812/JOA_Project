package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BoardDTO;
import com.joalib.board.svc.BoardModifyFormService;

public class BoardModifyFormAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ServletContext context = request.getServletContext();
		
		int board_no= Integer.parseInt(request.getParameter("board_num"));	
		BoardModifyFormService mdifyForm = new BoardModifyFormService();
		
		BoardDTO article = mdifyForm.modifyFormArticle(board_no);
		//넘버로 조회한 게시물데이터 article에 넣었음
				
		request.setAttribute("article", article);
		
		forward = new ActionForward();
//		forward.setRedirect(true);
		forward.setPath("board_update_page.jsp");
		return forward;
	}

}
