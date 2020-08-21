package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_Small_CommentDTO;
import com.joalib.donate.svc.SmallCommentChangeService;

public class SmallCommentChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		String member_id = request.getParameter("member_id");
		String dc_s_date = request.getParameter("dc_s_date");
		String dc_s_text = request.getParameter("dc_s_text");
		
		Donate_Small_CommentDTO dto = new Donate_Small_CommentDTO();
		dto.setMember_id(member_id);
		dto.setDc_s_text(dc_s_text);
		dto.setDc_s_date(dc_s_date);
		
		SmallCommentChangeService svc = new SmallCommentChangeService();
		boolean isSuccess = svc.SmallCommentChange(dto);	
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("home.jsp");

		return forward;
	}

}
