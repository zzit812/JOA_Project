package com.joalib.booksearch.svc;

import java.util.List;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DTO.SearchDTO;

public class BookSearchDBService {

	public List<SearchDTO> dbsearch(SearchDTO sdto) {
		
		BookSearchDAO dao = new BookSearchDAO();
		List<SearchDTO> book_search = dao.select_book(sdto);
		
		

		return book_search;
	}

}
