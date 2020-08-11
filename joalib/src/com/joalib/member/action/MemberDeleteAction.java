package com.joalib.member.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.member.svc.MemberDeleteService;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		HttpSession session = request.getSession(false);
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("탈퇴: "+ member_id );
		MemberDeleteService svc = new MemberDeleteService();
		boolean isSuccess = svc.memberDelete(member_id);
		if(isSuccess) {
			session.invalidate();
			System.out.println("success: "+isSuccess);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("home.jsp");
		}else {
			System.out.println("fail: "+isSuccess);
		}
		
		
		
		
		return forward;
	}

}
