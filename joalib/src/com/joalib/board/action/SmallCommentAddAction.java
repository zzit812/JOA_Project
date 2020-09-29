package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_Small_CommentDTO;
import com.joalib.board.svc.SmallCommentAddService;

public class SmallCommentAddAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,		
		
		int board_comment_no = Integer.parseInt(request.getParameter("board_comment_no"));
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String member_id = request.getParameter("member_id");
		String bc_s_text = request.getParameter("bc_s_text");
		String boardCommentWriter = request.getParameter("boardCommentWriter");
		//System.out.println("댓쓴이: "+boardCommentWriter+", 대댓쓴이: "+member_id);
		
		Board_Small_CommentDTO dto = new Board_Small_CommentDTO();
		dto.setBoard_comment_no(board_comment_no);
		dto.setBc_s_text(bc_s_text);
		dto.setMember_id(member_id);
		
		SmallCommentAddService svc = new SmallCommentAddService();
		boolean isSuccess = svc.smallCommentAdd(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("smallCommentAlarmAdd.bo?commentWriter="+boardCommentWriter+"&smallCommentWriter="+member_id+"&boardCommentNo="+board_comment_no);
		}
		
		
		return forward;
	}
	
}
