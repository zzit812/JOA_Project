package com.joalib.bookwish.svc;

import com.joalib.DAO.BookWishDAO;
import com.joalib.DTO.BookWishDTO;

public class BookWishService {

	public void wish(BookWishDTO dto) {
		
		BookWishDAO dao = new BookWishDAO();
		dao.bookwish(dto);
		
	}

}
