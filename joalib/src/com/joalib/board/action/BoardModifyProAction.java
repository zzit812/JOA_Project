package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BoardDTO;

import com.joalib.board.svc.BoardModifyProService;

public class BoardModifyProAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		ActionForward forward = null;
		ServletContext context = request.getServletContext();
		
		BoardDTO article= new BoardDTO();
		
		//정보를 받아옴
		int board_num = Integer.parseInt(request.getParameter("board_no"));
		String board_title = request.getParameter("board_title");
		String board_text = request.getParameter("board_write");		
		
		//정보를 set해줌
		article.setBoard_title(board_title);
		article.setBoard_text(board_text);
		article.setBoard_no(board_num);
		article.setBoard_num(board_num);
		
		//svc연결
		BoardModifyProService boardModifyProService = new BoardModifyProService();		
		boolean s = boardModifyProService.modifyArticle(article);
		if(s) {
			//성공
			forward = new ActionForward();
//			forward.setRedirect(true);
			forward.setPath("board.jsp"); 
		}else {
			System.out.println("실패");
		}			
		
		return forward;
	}

}
