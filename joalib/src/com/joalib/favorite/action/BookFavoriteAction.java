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
		//자바에서 세션값가져오기,,
		//false해줘서 재생성 ㄴㄴ 원래있던 값 가져올 수 ㅇㅇ
		
		String member_id = (String)session.getAttribute("member_id");

		if(member_id==null) {
			//로그인 후 이용 가능 합니다.
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
