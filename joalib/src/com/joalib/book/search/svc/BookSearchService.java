package com.joalib.book.search.svc;

import java.util.List;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.SearchDTO;

public class BookSearchService {  //�˻�â �̿뼭��

	public List<BookInfoDTO> getdto(SearchDTO sdto) {
		// TODO Auto-generated method stub
		System.out.println();
		BookSearchDAO dao = new BookSearchDAO();
		
		System.out.println(sdto.getOption());
		System.out.println(sdto.getText());
		
		List<BookInfoDTO> searchbook = dao.BookSearch(sdto);

		
		return searchbook;
	}

}
