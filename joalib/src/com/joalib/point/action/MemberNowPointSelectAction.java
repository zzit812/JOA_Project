package com.joalib.point.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.point.svc.MemberNowPointSelectService;

public class MemberNowPointSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,
		
		String referer = (String)request.getHeader("REFERER");	//���������� url
		System.out.println(referer);
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		MemberNowPointSelectService svc = new MemberNowPointSelectService();
		int total_point = svc.memberPointNowSelect(member_id);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("home.jsp");
		
		return forward;
	}

}
