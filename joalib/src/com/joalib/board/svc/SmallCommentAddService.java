package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_Small_CommentDTO;

public class SmallCommentAddService {
	public boolean smallCommentAdd(Board_Small_CommentDTO dto) {		
		boolean isSuccess = false;
		
		DAO dao = DAO.getinstance();
		int i = dao.boardSmallCommentAdd(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}
	
	 
}
