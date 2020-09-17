package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;

public class DonateDealChageService {
	
	public boolean donateDealChangeService(int donate_no) {
		
		boolean isSuccess = false;
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateDealChange(donate_no);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}
	
	
}
