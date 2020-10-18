package com.joalib.booksearch.svc;

import java.util.List;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.SearchDTO;

public class BookSearchDBService {

	public List<SearchDTO> dbsearch(SearchDTO sdto) {
		BookSearchDAO dao = BookSearchDAO.getinstance();
		if(sdto.getOption().equals("all")) {
			List<SearchDTO> book_search = dao.all_option_select(sdto);
			return book_search;
		}else {
			
			List<SearchDTO> book_search = dao.select_book(sdto);
			return book_search;
		}	
	}
}
