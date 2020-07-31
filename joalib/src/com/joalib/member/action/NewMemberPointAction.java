package com.joalib.member.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.memberinfoDTO;
import com.joalib.member.svc.NewMemberPointInsertService;

public class NewMemberPointAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		//정보받기
		String member_id = (String) request.getParameter("member_id");
		
		//svc 연결
		NewMemberPointInsertService svc = new NewMemberPointInsertService();
		boolean isSuccess = svc.newMemberPoint(member_id);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("userJoinComplet.jsp");
		}else {
			System.out.println("실패");
		}
		
		
		
		
		return forward;
	}

}
