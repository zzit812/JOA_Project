package com.joalib.fault.svc;

import com.joalib.DAO.FaultDAO;
import com.joalib.DTO.FaultDTO;

public class FaultWriteService {
	
	public boolean faultWrite(FaultDTO dto) {
		
		boolean isSuccess = false;
		FaultDAO dao = FaultDAO.getinstance();
		int i = dao.faultWrite(dto);
		
		if(i > 0) {
			isSuccess = true;
		}	
		
		return isSuccess;
	}

}
