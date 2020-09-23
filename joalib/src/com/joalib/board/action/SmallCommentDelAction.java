package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_Small_CommentDTO;
import com.joalib.board.svc.SmallCommentDelService;

public class SmallCommentDelAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,		
		
		String member_id = request.getParameter("member_id");
		String bc_s_date = request.getParameter("bc_s_date");
		System.out.println(member_id+", "+bc_s_date);
		
		Board_Small_CommentDTO dto = new Board_Small_CommentDTO();
		dto.setMember_id(member_id);
		dto.setBc_s_date(bc_s_date);
		
		SmallCommentDelService svc = new SmallCommentDelService();
		boolean isSuccess = svc.donateSmallCommentDel(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			System.out.println("대댓 삭제 성공");
			//forward.setPath("boardReadPage.bo?board_num=1"+1043);
		}	
		
		return forward;
	}

}
