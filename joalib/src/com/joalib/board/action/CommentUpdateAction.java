package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.board.svc.CommentUpdateService;

public class CommentUpdateAction implements dbAction{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		Board_CommentDTO dto = new Board_CommentDTO();		
		//정보받아오고, set
		String board_no = request.getParameter("board_no");
		String member_id = request.getParameter("member_id");
		String bc_date = request.getParameter("bc_date");
		String bc_text = request.getParameter("bc_text");
		
		//System.out.println(board_no+", "+member_id+", "+bc_date+", "+bc_text);
		
		dto.setMember_id(member_id);
		dto.setBc_date(bc_date);
		dto.setBc_text(bc_text);		
		
		CommentUpdateService svc = new CommentUpdateService();		
		
		if(svc.commentUpdate(dto)) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardReadPage.bo?board_num="+board_no); 
		}else {
			System.out.println("실패");
		}	
		
		return forward;
	}
	
	

}
