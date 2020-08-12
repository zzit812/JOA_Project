package com.joalib.member.svc;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.memberinfoDTO;

public class MemberinfoChangeService {
	
	public boolean memberinfoChange(memberinfoDTO dto) {
		
		boolean isSuccess = false;
		
		memberinfoDAO dao = memberinfoDAO.getinstance();
		int i = dao.memberinfoChange(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
