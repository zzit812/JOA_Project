package com.joalib.bookinfo.svc;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoDetailService {

	public BookInfoDTO getArticle(int isbn) {
		// TODO Auto-generated method stub
		
		//Ȯ��. ���� �� ������
		
		BookInfoDAO dao = new BookInfoDAO();
		DAO.getinstance();
		
		BookInfoDTO article = dao.book_info_detail(isbn);
		
		
		
		
		
		return article;
	}

}
