package com.joalib.fault.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.fault.svc.FaultDeleteService;

public class FaultDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		
		String fault_no = request.getParameter("fault_no");
		
		FaultDeleteService svc = new FaultDeleteService();
		boolean isSuccess = svc.faultDelete(fault_no);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Fault_list.jsp");
		}
		
		
		
		return forward;
	}

}
