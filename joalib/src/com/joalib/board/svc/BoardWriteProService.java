package com.joalib.board.svc;

import java.sql.Connection;

import com.joalib.DAO.DAO;
import com.joalib.DTO.BoardDTO;

public class BoardWriteProService {

	public boolean registArticle(BoardDTO boardBean) throws Exception{
	
		boolean isWriteSuccess = false;
		DAO dao = DAO.getinstance();
		int insertCount = dao.myinsert(boardBean);
		
		if(insertCount > 0){
			isWriteSuccess = true;
		}
		
		 
		return isWriteSuccess;

	}
}
