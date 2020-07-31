package com.joalib.board.svc;


import java.sql.Connection;

import com.joalib.DAO.DAO;

public class BoardDeleteService {

	public void removeArticle(int board_no) {
		DAO dao = new DAO();
		dao.getinstance();
		dao.board_del(board_no);
		
	}

}
