package com.joalib.book.search.svc;

import java.util.List;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.SearchDTO;

public class BookSearchService {

	public List<BookInfoDTO> getdto(SearchDTO sdto) {
		// TODO Auto-generated method stub
		System.out.println();
		BookSearchDAO dao = new BookSearchDAO();
		dao.getinstance();
		System.out.println(sdto.getOption());
		System.out.println(sdto.getText());
		
		List<BookInfoDTO> searchbook = dao.BookSearch(sdto);
		System.out.println("¼­ºñ½º2");
		
		return searchbook;
	}

}
