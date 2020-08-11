package com.joalib.board.svc;


import java.sql.Connection;

import com.joalib.DAO.DAO;
import com.joalib.DTO.BoardDTO;

public class BoardModifyProService {

	public boolean modifyArticle(BoardDTO article) {
		boolean suc = false;
		
		DAO dao = new DAO();
		DAO.getinstance();
		int i = dao.board_update(article);
		if(i > 0 ) {
			suc = true;
		}
		
		return suc;
	}





}
