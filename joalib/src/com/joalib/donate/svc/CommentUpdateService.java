package com.joalib.donate.svc;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.Donate_CommentDTO;

public class CommentUpdateService {
	public boolean commentUpdate(Donate_CommentDTO dto) {
		boolean isSuccess = false;
		
		DonateDAO dao = DonateDAO.getinstance();
		int i = dao.donateCommentUpdate(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
