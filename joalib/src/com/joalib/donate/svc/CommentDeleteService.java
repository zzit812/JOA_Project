package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;

public class CommentDeleteService {
	
	public boolean commentdelete(int donate_comment_no) {
		
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.doanteCommentDel(donate_comment_no);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}
}
