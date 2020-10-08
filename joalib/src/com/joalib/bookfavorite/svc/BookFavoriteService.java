package com.joalib.bookfavorite.svc;

import com.joalib.DAO.BookFavoriteDAO;
import com.joalib.DTO.LoanDTO;

public class BookFavoriteService {

	public void favorite(LoanDTO loanDTO) {
		
		BookFavoriteDAO dao = new BookFavoriteDAO();
		dao.favorite(loanDTO);
		
		
	}

}
