package com.joalib.board.svc;

import com.joalib.DAO.DAO;

public class BoardPostHitupService {
	
	public boolean boardHitup(int board_no) {
		boolean isSuccess = false;
		DAO dao = DAO.getinstance();
		int i = dao.hitUp(board_no);
		
		if(i > 0) {
			isSuccess = true;
		}
		return isSuccess;
	}
}
