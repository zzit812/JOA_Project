package com.joalib.board.svc;


import java.sql.Connection;

import com.joalib.DAO.DAO;
import com.joalib.DTO.BoardDTO;

public class BoardModifyFormService {

	public BoardDTO modifyFormArticle(int board_no) {
		
		DAO dao = new DAO();
		DAO.getinstance();
		
		BoardDTO dto = dao.read_details(board_no);
		
		return dto;
	}





}
