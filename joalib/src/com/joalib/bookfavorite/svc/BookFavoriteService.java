
package com.joalib.bookfavorite.svc;

import com.joalib.DAO.BookFavoriteDAO;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class BookFavoriteService {

	public boolean favorite(FavoriteDTO dto) {
		
		BookFavoriteDAO dao = BookFavoriteDAO.getinstance();
		
		try {
			dao.favorite(dto); //관심도서에 잘 추가된 경우
		}catch(Exception e){
			
			return false;
		}
		return true;
		//값이 잘 들어갔으면 true 중복값이 발생하여 오류가 났으면 false로 리턴
	}
	
	public boolean cancelFavorite(FavoriteDTO dto) {
		
		BookFavoriteDAO dao = BookFavoriteDAO.getinstance();
		
		try {
			dao.cancelFavorite(dto); //관심도서에 잘 추가된 경우
		}catch(Exception e){
			
			return false;
		}
		return true;
		//값이 잘 들어갔으면 true 중복값이 발생하여 오류가 났으면 false로 리턴
	}
}
