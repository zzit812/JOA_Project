package com.joalib.bookinfo.svc;

import java.util.List;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.LoanDAO;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class BookInfoDetailDBService {

	public BookInfoDTO bookDB(String isbn) {
		
		BookInfoDAO dao = new BookInfoDAO();
		BookInfoDTO bookDB =  dao.book_infoDB(isbn);
		

		return bookDB;
	}

	public FavoriteDTO getBook(FavoriteDTO favDto) {
		BookInfoDAO dao = new BookInfoDAO();
		
		try {
			favDto =  dao.getBook(favDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return favDto;
	}
}
