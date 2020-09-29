package com.joalib.booksearch.svc;

import java.util.List;

import com.joalib.DAO.DAO;
import com.joalib.DTO.SearchDTO;

public class BookSearchDBService {

	public List<String> dbsearch(SearchDTO sdto) {
		
		DAO dao = DAO.getinstance();
		List<String> book_search = dao.select_book(sdto);
		
		return book_search;
	}

}
