package com.joalib.favorite.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.catalina.Session;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.FavoriteDTO;

import com.joalib.favorite.svc.BookFavoriteServise;
import com.joalib.loan.action.Action;

public class BookFavoriteAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FavoriteDTO dto= new FavoriteDTO();
		ActionForward forward= new ActionForward();
		
		String isbn = request.getParameter("isbn");
		
		HttpSession session = request.getSession(false);
		//�ڹٿ��� ���ǰ���������,,
		//false���༭ ����� ���� �����ִ� �� ������ �� ����
		
		String member_id = (String)session.getAttribute("member_id");

		if(member_id==null) {
			//�α��� �� �̿� ���� �մϴ�.
			forward.setPath("userLogin.html");
		}else {
			dto.setIsbn(isbn);
			dto.setMember_id(member_id);
			
			BookFavoriteServise bookFavoriteServise = new BookFavoriteServise();
			bookFavoriteServise.favorite(dto);

			forward.setPath("book_search.jsp");
		}
		
		
		return forward;
	}

}
