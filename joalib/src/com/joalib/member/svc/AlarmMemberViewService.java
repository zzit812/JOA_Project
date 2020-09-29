package com.joalib.member.svc;

import java.util.List;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.member_alarmDTO;

public class AlarmMemberViewService {
	
	public List<member_alarmDTO> memberAlarmView(String member_id) {
		
		memberinfoDAO dao = memberinfoDAO.getinstance();
		List<member_alarmDTO> list = dao.memberAlarmView(member_id);
		
		return list;
	}

}
