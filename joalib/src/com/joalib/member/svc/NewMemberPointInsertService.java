package com.joalib.member.svc;

import com.joalib.DAO.memberinfoDAO;

public class NewMemberPointInsertService {
	
	public boolean newMemberPoint(String member_id) {
		
		boolean memberPointInsertSuccess = false;
		memberinfoDAO dao = memberinfoDAO.getinstance();
		int i = dao.pointInsert(member_id);
		
		if(i > 0) {
			memberPointInsertSuccess = true;
		}
		
		return memberPointInsertSuccess;
	}

}
