package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.DonateDTO;
import com.joalib.donate.svc.DonatePostUpdateService;

public class DonatePostUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,	
		
		//정보 받고 set
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String donate_title =request.getParameter("donate_title");
		String donate_text =request.getParameter("donate_text");
		
		DonateDTO dto = new DonateDTO();
		dto.setDonate_no(donate_no);
		dto.setDonate_title(donate_title);
		dto.setDonate_text(donate_text);
		
		DonatePostUpdateService svc = new DonatePostUpdateService();
		boolean isSuccess = svc.donatePostUpdate(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}	
		
		return forward;
	}

}
