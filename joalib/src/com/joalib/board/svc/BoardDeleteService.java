package com.joalib.board.svc;


import java.sql.Connection;

import com.joalib.DAO.DAO;

public class BoardDeleteService {

	public boolean removeArticle(int board_no) {
		
		boolean isSuccess = false;
		
		DAO dao = DAO.getinstance();
		int i = dao.board_del(board_no);
		
		if(i >  0) {
			isSuccess = true;
		}
		
		return isSuccess;
	}

}
