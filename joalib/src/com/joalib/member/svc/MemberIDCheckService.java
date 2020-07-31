package com.joalib.member.svc;

import java.util.List;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.memberinfoDTO;

public class MemberIDCheckService {
	
	public List<memberinfoDTO> IDCheck (String checkID) throws Exception {
		
		memberinfoDAO dao = new memberinfoDAO();
		List<memberinfoDTO> memberinfo = dao.memberIDCheck(checkID);
		
		return memberinfo;
	}

}