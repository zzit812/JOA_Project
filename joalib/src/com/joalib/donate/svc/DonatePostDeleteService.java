package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;

public class DonatePostDeleteService {
	
	public boolean donatePostDel(int donate_no) {
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateDel(donate_no);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}
}
