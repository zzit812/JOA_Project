package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.donate.svc.DonateDealChageService;

public class DonateDealChangeAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();
		
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		//System.out.println(donate_no);
		
		DonateDealChageService svc = new DonateDealChageService();
		boolean isSuccess = svc.donateDealChangeService(donate_no);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_list.jsp");
		}
		
		return forward;
	}

}
