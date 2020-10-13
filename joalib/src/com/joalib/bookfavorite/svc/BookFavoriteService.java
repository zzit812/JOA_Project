
package com.joalib.bookfavorite.svc;

import com.joalib.DAO.BookFavoriteDAO;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class BookFavoriteService {

	public boolean favorite(FavoriteDTO dto) {
		
		BookFavoriteDAO dao = BookFavoriteDAO.getinstance();
		
		try {
			dao.favorite(dto);
		}catch(Exception e){
			return false;
		}
		return true;
		//값이 잘 들어갔으면 true 중복값이 발생하여 오류가 났으면 false로 리턴
	}
}
