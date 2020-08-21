package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.DonateDTO;

public class DonatePostUpdateService {
	
	public boolean donatePostUpdate(DonateDTO dto) {		
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateUpdate(dto);
		
		if(i>0) {
			isSuccess = true;
		}
		return isSuccess;
	}
}
