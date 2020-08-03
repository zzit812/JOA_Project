package com.joalib.point.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.point.svc.PointChargeService;

public class PointChargeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("2");
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,
		
		HttpSession session = request.getSession(false);
		String member_id = (String) session.getAttribute("member_id");
		
		String referer = (String)request.getHeader("REFERER");	//���������� url
		
		
		PointChargeService svc = new PointChargeService();
		
		if(referer.contains("board_write.jsp")) {
			//���� url�߿��� board_wite.jsp�� ���ԵǾ� �ִٸ�,
			if(svc.chargeBoardWrite(member_id)) {
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("board.jsp");
			}else {
				System.out.println("board_fail");
			}			
		}else if(referer.contains("mypage_main.jsp")) {
			//���� url�߿��� �� ���ԵǾ� �ִٸ�,
			if(svc.chargeTemp(member_id)) {
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("mypage_main.jsp");
			}else {
				System.out.println("fail");
			}
		}
		
		
		
		
		return forward;
	}

}
