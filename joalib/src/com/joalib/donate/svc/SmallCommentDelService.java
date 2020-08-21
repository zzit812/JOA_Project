package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.Donate_Small_CommentDTO;

public class SmallCommentDelService {
	
	public boolean donateSmallCommentDel(Donate_Small_CommentDTO dto) {
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateSmallCommentDelete(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
