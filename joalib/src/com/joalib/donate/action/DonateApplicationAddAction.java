package com.joalib.donate.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_ApplicationDTO;

public class DonateApplicationAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();
		
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String donate_application_member = request.getParameter("donateApplicationMember");
		String donate_writer = request.getParameter("donateWriter");
		
		Donate_ApplicationDTO dto = new Donate_ApplicationDTO();
		dto.setDonate_no(donate_no);
		dto.setDonate_application_member(donate_application_member);
		dto.setDonate_writer(donate_writer);
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.DonateApplicationAdd(dto);
		
		if(i > 0) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_read.jsp?donate_no="+donate_no);
		}
		
		
		return forward;
	}
	
	

}
