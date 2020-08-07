package com.joalib.point.svc;

import com.joalib.DAO.PointDAO;

public class PointChargeService {
	
	
	//�����Խ��� ����Ʈ
	public boolean chargeBoardWrite(String member_id) {
		boolean isSuccess = false;
		
		PointDAO dao = PointDAO.getinstance();
		int i = dao.boardPointCharge(member_id);
		
		if(i > 0) {
			isSuccess = true;		}
	
		return isSuccess;
	}
	
	//�����Խ��� ���
	public boolean chargeBoardCommnetWrite(String member_id) {
		boolean isSuccess = false;
		
		PointDAO dao = PointDAO.getinstance();	
		int i = dao.boardCommentPointCharge(member_id);
		
		if(i > 0) {
			isSuccess = true;		}		
		
		return isSuccess;
	}
	
	
	//�׽�Ʈ�� �޼��� //���Ŀ� �����Ұ���
	public boolean chargeTemp(String member_id) {
		
		boolean isSuccess = false;
		PointDAO dao = PointDAO.getinstance();		
		int i = dao.PointChargeTemp(member_id);		
		
		if(i > 0) {
			isSuccess = true;		}
		
		return isSuccess;
	}

}
