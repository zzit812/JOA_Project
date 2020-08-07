package com.joalib.point.svc;

import com.joalib.DAO.PointDAO;

public class PointChargeService {
	
	
	//자유게시판 포인트
	public boolean chargeBoardWrite(String member_id) {
		boolean isSuccess = false;
		
		PointDAO dao = PointDAO.getinstance();
		int i = dao.boardPointCharge(member_id);
		
		if(i > 0) {
			isSuccess = true;		}
	
		return isSuccess;
	}
	
	//자유게시판 댓글
	public boolean chargeBoardCommnetWrite(String member_id) {
		boolean isSuccess = false;
		
		PointDAO dao = PointDAO.getinstance();	
		int i = dao.boardCommentPointCharge(member_id);
		
		if(i > 0) {
			isSuccess = true;		}		
		
		return isSuccess;
	}
	
	
	//테스트용 메서드 //이후에 삭제할거임
	public boolean chargeTemp(String member_id) {
		
		boolean isSuccess = false;
		PointDAO dao = PointDAO.getinstance();		
		int i = dao.PointChargeTemp(member_id);		
		
		if(i > 0) {
			isSuccess = true;		}
		
		return isSuccess;
	}

}
