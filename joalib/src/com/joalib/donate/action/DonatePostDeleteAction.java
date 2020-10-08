package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.donate.svc.DonatePostDeleteService;

public class DonatePostDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,		
		
		
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		 
		
		DonatePostDeleteService svc = new DonatePostDeleteService();
		boolean isSuccess = svc.donatePostDel(donate_no);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_list.jsp");
		}
		
		
		
		return forward;
	}

}
