package com.joalib.donate.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Donate_ApplicationDTO;

public class DonateApplicationDelAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int donate_no = Integer.parseInt(request.getParameter("donate_no"));
		String donate_application_member = request.getParameter("donateApplicationMember");
		
		Donate_ApplicationDTO dto = new Donate_ApplicationDTO();
		dto.setDonate_no(donate_no);
		dto.setDonate_application_member(donate_application_member);

		
		DonateDAO dao = DonateDAO.getinstance();
		int i =  dao.DonateApplicationDel(dto);
		
		
		
		return null;
	}

}
