package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.donate.svc.CommentDeleteService;

public class CommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,
		
		int donate_comment_no = Integer.parseInt(request.getParameter("donate_comment_no"));
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		
		CommentDeleteService svc = new CommentDeleteService();
		boolean isSuccess = svc.commentdelete(donate_comment_no);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}
		
		
		
		return forward;
	}

}
