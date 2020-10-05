package com.joalib.bookinfo.svc;

import java.util.List;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoDetailDBService {

	public BookInfoDTO bookDB(String isbn) {
		System.out.println("¼­ºñ½º"+isbn);
		BookInfoDAO dao = new BookInfoDAO();
		BookInfoDTO bookDB =  dao.book_infoDB(isbn);
		
		System.out.println(bookDB.getAuthor());
		
		
		
		return bookDB;
	}

}
