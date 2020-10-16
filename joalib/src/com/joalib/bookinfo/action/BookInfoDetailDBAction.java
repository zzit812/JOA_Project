package com.joalib.bookinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.FavoriteDTO;
import com.joalib.bookfavorite.action.BookFavoriteAction;
import com.joalib.bookfavorite.svc.FavoriteSearchService;
import com.joalib.bookinfo.svc.BookInfoDetailDBService;

public class BookInfoDetailDBAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String isbn = request.getParameter("isbn");
		String member_id = request.getParameter("member_id");
		String message = null;

		if (request.getParameter("message") != null) { // BookFavoriteAction 에서 받아온 값임. 관심도서를 눌렀을 때에!

			message = request.getParameter("message");
			request.setAttribute("message", message);
		}

		FavoriteDTO favDTO = new FavoriteDTO();
		favDTO.setIsbn(isbn);
		favDTO.setMember_id(member_id);

		// DB도서 정보 가져오기
		BookInfoDetailDBService bookInfoDetailDBService = new BookInfoDetailDBService();
		BookInfoDTO bookDB = bookInfoDetailDBService.bookDB(isbn);

		// 이미 관심도서등록된 도서인지 조회하기
		FavoriteSearchService favoriteSearchService = new FavoriteSearchService();
		int i = favoriteSearchService.favoriteSearch(favDTO);
		String st = Integer.toString(i);

		request.setAttribute("bookDB", bookDB);
		request.setAttribute("exist", st); // 등록된 도서인지 아닌지 값을 저장해 둠

		System.out.println("BookInfoDetailDBAction exist(st): " + st);
		
		//본인아이디, ISBN으로 조회하기. 대출된 이력이 있는지 
		request.setAttribute("book", bookInfoDetailDBService.getBook(favDTO));
		forward = new ActionForward();
		forward.setPath("BookInfoDetailDB.jsp");

		return forward;
	}

}
