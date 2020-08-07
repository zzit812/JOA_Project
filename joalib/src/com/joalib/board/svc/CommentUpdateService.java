package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_CommentDTO;

public class CommentUpdateService {
	
	public boolean commentUpdate(Board_CommentDTO dto) {
		
		boolean isSuccess = false;
		
		DAO dao = DAO.getinstance();
		int i = dao.boardCommentUpdate(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
