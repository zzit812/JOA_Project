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

		if (request.getParameter("message") != null) { // BookFavoriteAction ���� �޾ƿ� ����. ���ɵ����� ������ ����!

			message = request.getParameter("message");
			request.setAttribute("message", message);
		}

		FavoriteDTO favDTO = new FavoriteDTO();
		favDTO.setIsbn(isbn);
		favDTO.setMember_id(member_id);

		// DB���� ���� ��������
		BookInfoDetailDBService bookInfoDetailDBService = new BookInfoDetailDBService();
		BookInfoDTO bookDB = bookInfoDetailDBService.bookDB(isbn);

		// �̹� ���ɵ�����ϵ� �������� ��ȸ�ϱ�
		FavoriteSearchService favoriteSearchService = new FavoriteSearchService();
		int i = favoriteSearchService.favoriteSearch(favDTO);
		String st = Integer.toString(i);

		request.setAttribute("bookDB", bookDB);
		request.setAttribute("exist", st); // ��ϵ� �������� �ƴ��� ���� ������ ��

		System.out.println("BookInfoDetailDBAction exist(st): " + st);
		
		//���ξ��̵�, ISBN���� ��ȸ�ϱ�. ����� �̷��� �ִ��� 
		request.setAttribute("book", bookInfoDetailDBService.getBook(favDTO));
		forward = new ActionForward();
		forward.setPath("BookInfoDetailDB.jsp");

		return forward;
	}

}
