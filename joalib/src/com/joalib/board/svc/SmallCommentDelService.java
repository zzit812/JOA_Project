package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_Small_CommentDTO;

public class SmallCommentDelService {
	
	public boolean donateSmallCommentDel(Board_Small_CommentDTO dto) {
		boolean isSuccess = false;
		
		DAO dao =DAO.getinstance();
		int i = dao.boardSmallCommentDelete(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
