package com.joalib.member.svc;

import com.joalib.DAO.memberinfoDAO;

public class MemberDeleteService {
	
	public boolean memberDelete (String member_id) {
		boolean isSuccess = false;
		
		memberinfoDAO dao = memberinfoDAO.getinstance();
		int i = dao.memberDel(member_id);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
