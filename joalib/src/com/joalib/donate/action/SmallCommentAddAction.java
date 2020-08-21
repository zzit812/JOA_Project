package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_Small_CommentDTO;
import com.joalib.donate.svc.SmallCommentAddService;

public class SmallCommentAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,		
		
		int donate_comment_no = Integer.parseInt(request.getParameter("donate_comment_no"));
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String member_id = request.getParameter("member_id");
		String dc_s_text = request.getParameter("dc_s_text");
		
		Donate_Small_CommentDTO dto = new Donate_Small_CommentDTO();
		dto.setDonate_comment_no(donate_comment_no);
		dto.setDc_s_text(dc_s_text);
		dto.setMember_id(member_id);
		
		SmallCommentAddService svc = new SmallCommentAddService();
		boolean isSuccess = svc.smallCommentAdd(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}
		
		
		return forward;
	}
	
}
