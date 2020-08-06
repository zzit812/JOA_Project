package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_CommentDTO;

public class CommentWriteService {
	
	public boolean commentAdd(Board_CommentDTO dto) {
		
		boolean isSuccess = false;
		
		DAO dao = DAO.getinstance();
		int i = dao.boardCommnetAdd(dto);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}

}
