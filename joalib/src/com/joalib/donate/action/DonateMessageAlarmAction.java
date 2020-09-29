package com.joalib.donate.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;

public class DonateMessageAlarmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//정보받기 : 받는이(:신청자), 게시글번호
		String receiver = request.getParameter("receiver");
		String donate_no = request.getParameter("donate_no");
		
		member_alarmDTO dto = new member_alarmDTO();
		dto.setMember_id(receiver);
		dto.setAlarm_etc(donate_no);
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.DonateMessageAlarm(dto);
		if(i > 0) {
			//System.out.println("Success");
		}
		
		
		return null;
	}

}
