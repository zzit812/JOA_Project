package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.board.svc.CommentWriteService;

public class CommentWriteAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		//정보 가져오기
		HttpSession session = request.getSession();
		Board_CommentDTO dto = new Board_CommentDTO();
		String board_no = request.getParameter("board_no");
		dto.setBoard_no(board_no);
		dto.setMember_id((String)session.getAttribute("member_id"));
		dto.setBc_text(request.getParameter("boardComment"));
		
		CommentWriteService svc = new CommentWriteService();
		
		if(svc.commentAdd(dto)) {
			//request.setAttribute("board_num", board_no);
			forward = new ActionForward();
			forward.setRedirect(true);			
			forward.setPath("boardReadPage.bo?board_num="+board_no);
			//System.out.println(forward.getPath());
			
		}
		else {
			System.out.println("fail");
		}
		
		
		return forward;
	}
	
}
