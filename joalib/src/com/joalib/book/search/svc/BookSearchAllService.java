package com.joalib.book.search.svc;

import java.util.List;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.BookSearchDAO;
import com.joalib.DTO.BookInfoDTO;

public class BookSearchAllService {

	public List<BookInfoDTO> getdto() {
		BookSearchDAO dao = new BookSearchDAO();
		List<BookInfoDTO> list = dao.select_book_all();
		
		return list;
		
	}

}
