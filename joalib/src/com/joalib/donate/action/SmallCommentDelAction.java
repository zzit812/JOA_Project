package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_Small_CommentDTO;
import com.joalib.donate.svc.SmallCommentDelService;

public class SmallCommentDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,		
		
		String member_id = request.getParameter("member_id");
		String dc_s_date = request.getParameter("dc_s_date");
		String donate_no = request.getParameter("donate_no");
		
		Donate_Small_CommentDTO dto = new Donate_Small_CommentDTO();
		dto.setMember_id(member_id);
		dto.setDc_s_date(dc_s_date);
		
		SmallCommentDelService svc = new SmallCommentDelService();
		boolean isSuccess = svc.donateSmallCommentDel(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}	
		
		return forward;
	}

}
