package com.joalib.bookfavorite.svc;

import com.joalib.DAO.BookFavoriteDAO;
import com.joalib.DTO.FavoriteDTO;

public class FavoriteSearchService {

	public int favoriteSearch(FavoriteDTO favDTO) {
		BookFavoriteDAO favDao =  BookFavoriteDAO.getinstance();
		int i = favDao.favoriteSearch(favDTO);
		
		return i;
	}

}
