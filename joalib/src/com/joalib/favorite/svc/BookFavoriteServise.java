package com.joalib.favorite.svc;

import com.joalib.DAO.BookInfoDAO;
import com.joalib.DAO.DAO;
import com.joalib.DAO.FavoriteDAO;
import com.joalib.DTO.FavoriteDTO;

public class BookFavoriteServise {
	
	public void favorite(FavoriteDTO dto) {
		
		FavoriteDAO dao = new FavoriteDAO();
		FavoriteDAO.getinstance();
		dao.favorite(dto);
		
	}

}
