package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.DonateDTO;

public class DonatePostWriteService {
	
	public boolean postWrite(DonateDTO dto) {
		
		boolean isSucess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donatePostwrite(dto);
		
		if(i > 0) {
			isSucess = true;
		}
		return isSucess;
	}

}
