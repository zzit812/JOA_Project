package com.joalib.fault.svc;

import com.joalib.DAO.FaultDAO;
import com.joalib.DTO.FaultDTO;

public class FaultPageReadService {
	
	public FaultDTO faultPageRead(int fault_no) {
		FaultDAO dao = FaultDAO.getinstance();
		FaultDTO dto = dao.faultPageRead(fault_no);
		
		return dto;
	}

}
