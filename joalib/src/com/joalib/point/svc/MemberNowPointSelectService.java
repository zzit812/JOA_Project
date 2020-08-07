package com.joalib.point.svc;

import com.joalib.DAO.PointDAO;

public class MemberNowPointSelectService {
	
	public int memberPointNowSelect(String member_id) {
		
		PointDAO dao = PointDAO.getinstance();
		
		int total_point = dao.memberPointNow(member_id);
		
		return total_point;
	}

}
