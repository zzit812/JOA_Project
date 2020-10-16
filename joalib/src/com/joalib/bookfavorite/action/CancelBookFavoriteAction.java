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
		
		BookFavoriteService bookFavoriteService = new BookFavoriteService(); //���ɵ����� �߰��� ��. �߰��Ǹ� ture �ȵǸ� false
		boolean flag =  bookFavoriteService.cancelFavorite(dto);
		String message = "";
		
		if(flag)
			message = "��� ��� �Ǿ����ϴ�.";
		else {
			message = "����";
		}
		
		forward = new ActionForward();
		forward.setPath("bookInfoDetailDB.bk?isbn="+isbn+"&message="+message); 
		
		return forward;
	}

}