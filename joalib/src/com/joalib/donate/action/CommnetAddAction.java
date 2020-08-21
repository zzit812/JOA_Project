package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_CommentDTO;
import com.joalib.donate.svc.CommnetAddService;

public class CommnetAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,		
		
		//정보 받고 set DTO
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String member_id = request.getParameter("member_id");
		String dc_text = request.getParameter("dc_text");
		
		Donate_CommentDTO dto = new Donate_CommentDTO();
		dto.setDonate_no(donate_no);
		dto.setMember_id(member_id);
		dto.setDc_text(dc_text);
		
		CommnetAddService svc = new CommnetAddService();
		boolean isSuccess = svc.donateCommentAdd(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}
		
		
		return forward;
	}

}
