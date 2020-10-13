package com.joalib.bookinfo.svc;

import java.util.List;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoDetailDBService {

	public BookInfoDTO bookDB(String isbn) {
		
		BookInfoDAO dao = new BookInfoDAO();
		BookInfoDTO bookDB =  dao.book_infoDB(isbn);
		

		return bookDB;
	}

}
