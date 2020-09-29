package com.joalib.member.svc;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.member_alarmDTO;

public class AlarmMemberService {
	
	public boolean alarmCheckChange(member_alarmDTO dto) {
		boolean isSuccess = false;
		memberinfoDAO dao = memberinfoDAO.getinstance();
		int i = dao.boardCommentAlarmCheck(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
