package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_Small_CommentDTO;
import com.joalib.board.svc.SmallCommentChangeService;

public class SmallCommentChangeAction implements dbAction{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,
		
		String member_id = request.getParameter("member_id");
		String bc_s_date = request.getParameter("bc_s_date");
		String bc_s_text = request.getParameter("bc_s_text");
		
		Board_Small_CommentDTO dto = new Board_Small_CommentDTO();
		dto.setMember_id(member_id);
		dto.setBc_s_text(bc_s_text);
		dto.setBc_s_date(bc_s_date);
		
		SmallCommentChangeService svc = new SmallCommentChangeService();
		boolean isSuccess = svc.SmallCommentChange(dto);	
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("home.jsp");

		
		return forward;
	}

}
