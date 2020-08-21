package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_CommentDTO;
import com.joalib.donate.svc.CommentUpdateService;

public class CommnetUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,		
		
		int donate_commnet_no = Integer.parseInt(request.getParameter("donate_commnet_no"));
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String dc_text = request.getParameter("dc_text");
		System.out.println("1."+donate_commnet_no+" 2."+donate_no+" 3."+dc_text);
		
		Donate_CommentDTO dto = new Donate_CommentDTO();
		dto.setDonate_comment_no(donate_commnet_no);
		dto.setDonate_no(donate_no);
		dto.setDc_text(dc_text);
		
		CommentUpdateService svc = new CommentUpdateService();
		boolean isSuccess = svc.commentUpdate(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}
		
		
		
		return forward;
	}
	
}
