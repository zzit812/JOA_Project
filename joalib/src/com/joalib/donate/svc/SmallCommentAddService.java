package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.Donate_Small_CommentDTO;

public class SmallCommentAddService {
	public boolean smallCommentAdd(Donate_Small_CommentDTO dto) {		
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateSmallCommentAdd(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}
	
	 
}
