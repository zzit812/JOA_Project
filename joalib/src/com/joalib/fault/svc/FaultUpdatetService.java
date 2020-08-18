package com.joalib.fault.svc;

import com.joalib.DAO.FaultDAO;
import com.joalib.DTO.FaultDTO;

public class FaultUpdatetService {
	
	public boolean faultChange(FaultDTO dto) {
		boolean isSuccess = false;
		
		FaultDAO dao = FaultDAO.getinstance();
		int i = dao.faultUpdate(dto);
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
