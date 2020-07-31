package com.joalib.member.svc;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.memberinfoDTO;
import java.sql.Connection;

public class MemberInsertService {
	
	public boolean MemberInsert(memberinfoDTO dto) throws Exception {
		
		boolean memberInsertSuccess = false;
		memberinfoDAO dao = memberinfoDAO.getinstance();
		int i = dao.memberInsert(dto);
		
		if(i > 0) {
			memberInsertSuccess = true;
		}
	
		return memberInsertSuccess;
	}

}
