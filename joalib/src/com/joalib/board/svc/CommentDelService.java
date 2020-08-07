package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_CommentDTO;

public class CommentDelService {
	
	public boolean boardCommentdel(Board_CommentDTO dto) {
		
		boolean isSuccess = false;
		
		DAO dao = DAO.getinstance();
				
		if(dao.boardCommentDel(dto) > 0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
