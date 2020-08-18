package com.joalib.fault.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.FaultDTO;
import com.joalib.fault.svc.FaultUpdatetService;
import com.joalib.fault.action.Action;

public class FaultUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		int fault_no= Integer.parseInt(request.getParameter("fault_no"));
		String fault_title=  request.getParameter("fault_title");
		String fault_text = request.getParameter("fault_text");
		
		FaultDTO dto = new FaultDTO();
		dto.setFault_no(fault_no);
		dto.setFault_title(fault_title);
		dto.setFault_text(fault_text);
		
		FaultUpdatetService svc = new FaultUpdatetService();
		boolean isSuccess = svc.faultChange(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Fault_list.jsp");
		}
		
		return forward;
	}

}
