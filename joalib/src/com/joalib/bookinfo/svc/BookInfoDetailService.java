package com.joalib.bookinfo.svc;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoDetailService {

	public BookInfoDTO getArticle(int isbn) {
		// TODO Auto-generated method stub
		
		//확인. 값도 잘 가져옴
		
		BookInfoDAO dao = new BookInfoDAO();
		DAO.getinstance();
		
		BookInfoDTO article = dao.book_info_detail(isbn);
		
		
		
		
		
		return article;
	}

}
