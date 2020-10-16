package com.joalib.bookfavorite.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.http2.Flags;

import com.joalib.DAO.FavoriteDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;
import com.joalib.bookfavorite.svc.BookFavoriteDelService;
import com.joalib.bookfavorite.svc.BookFavoriteService;

public class CancelBookFavoriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		FavoriteDTO dto =  new FavoriteDTO();
		
		String isbn = request.getParameter("isbn");
		String member_id = request.getParameter("member_id");
		
		dto.setIsbn(isbn);
		dto.setMember_id(member_id);
		
		BookFavoriteService bookFavoriteService = new BookFavoriteService(); //관심도서에 추가를 함. 추가되면 ture 안되면 false
		boolean flag =  bookFavoriteService.cancelFavorite(dto);
		String message = "";
		
		if(flag)
			message = "등록 취소 되었습니다.";
		else {
			message = "에러";
		}
		
		forward = new ActionForward();
		forward.setPath("bookInfoDetailDB.bk?isbn="+isbn+"&message="+message); 
		
		return forward;
	}

}
