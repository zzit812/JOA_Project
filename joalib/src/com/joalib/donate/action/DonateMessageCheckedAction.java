package com.joalib.donate.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;

public class DonateMessageCheckedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;	
		
		String member_id = request.getParameter("member_id");
		String alarm_etc = request.getParameter("donate_no");
		String alarm_category = request.getParameter("donate_category");
		
		member_alarmDTO dto = new member_alarmDTO();
		dto.setAlarm_category(alarm_category);
		dto.setAlarm_etc(alarm_etc);
		dto.setMember_id(member_id);
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.DonataeMessageChecked(dto);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		//forward.setPath("");
		
		
		
		return forward;
	}
	

}
