package com.joalib.bookfavorite.svc;

import com.joalib.DAO.BookFavoriteDAO;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class BookFavoriteService {

	public boolean favorite(FavoriteDTO dto) {
		
		BookFavoriteDAO dao = new BookFavoriteDAO();
		
		try {
			dao.favorite(dto);
		}catch(Exception e){
			return false;
		}
		return true;
	}
}
