package com.joalib.bookinfo.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoAddService {
	
	public boolean registArticle(BookInfoDTO bookBean) throws Exception{
		
		boolean isWriteSuccess = false;
		DAO dao = DAO.getinstance();
		dao.(bookBean);
		
		
		
		return isWriteSuccess;
	}

}
