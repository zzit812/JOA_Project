
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
		//���� �� ������ true �ߺ����� �߻��Ͽ� ������ ������ false�� ����
	}
}
