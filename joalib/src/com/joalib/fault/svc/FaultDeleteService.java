package com.joalib.fault.svc;

import com.joalib.DAO.FaultDAO;

public class FaultDeleteService {
	public boolean faultDelete(String fault_no) {
		boolean isSuccess = false;
		
		FaultDAO dao = FaultDAO.getinstance();
		int i = dao.faultDelete(fault_no);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
