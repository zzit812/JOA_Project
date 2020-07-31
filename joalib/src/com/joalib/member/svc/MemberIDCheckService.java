package com.joalib.member.svc;

import java.util.List;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.memberinfoDTO;

public class MemberIDCheckService {
	
	public List<memberinfoDTO> IDCheck (String checkID) throws Exception {
		
		//boolean IDCheckSuccess = false;
		memberinfoDAO dao = new memberinfoDAO();
		List<memberinfoDTO> memberinfo = dao.memberIDCheck(checkID);
		
//		System.out.println(memberinfo.get(0).getMember_pw());
//		System.out.println(memberinfo.get(0).getMember_name());
		
		
		
		
		if(memberinfo.get(0).getMember_pw() == null) {			
			//IDCheckSuccess = true;
			
		}
		
		return memberinfo;
	}

}