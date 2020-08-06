package com.joalib.bookinfo.svc;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoAddService {

	public boolean registArticle(BookInfoDTO bookBean) throws Exception{
		
		boolean isWriteSuccess = false;
		BookInfoDAO dao = BookInfoDAO.getinstance();
		//int insertCount =
		int insertCount = dao.bookinfoadd(bookBean);
		
		if(insertCount > 0){
		
			isWriteSuccess = true;
		}
		
		 
		return isWriteSuccess;
		
	}
}
