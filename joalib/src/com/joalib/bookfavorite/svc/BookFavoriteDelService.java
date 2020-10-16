package com.joalib.bookfavorite.svc;

import com.joalib.DAO.FavoriteDAO;
import com.joalib.DTO.FavoriteDTO;

public class BookFavoriteDelService {

	public void favDel(FavoriteDTO dto) {
		FavoriteDAO favDao = FavoriteDAO.getinstance();
		favDao.favDel(dto);
	}

}
