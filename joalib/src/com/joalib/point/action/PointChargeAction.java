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
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		HttpSession session = request.getSession(false);
		String member_id = (String) session.getAttribute("member_id");
		
		
		String referer = (String)request.getHeader("REFERER");	//이전페이지 url
		System.out.println("PointAction: "+referer);
		
		PointChargeService svc = new PointChargeService();
		
		if(referer.contains("board_write.jsp")) {	//자유게시판
			//이전 url중에서 board_wite.jsp가 포함되어 있다면,
			if(svc.chargeBoardWrite(member_id)) {
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("board.jsp");
			}else {
				System.out.println("board_fail");
			}			
		}else if(referer.contains("mypage_main.jsp")) {	//테스트
			//이전 url중에서 가 포함되어 있다면,
			if(svc.chargeTemp(member_id)) {
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("mypage_main.jsp");
			}else {
				System.out.println("fail");
			}
		}else if(referer.contains("boardReadPage.bo")) {		//자유게시판 댓글		
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			if(svc.chargeBoardCommnetWrite(member_id)) {	
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				System.out.println("url: "+referer);
				forward.setPath("boardReadPage.bo?board_num="+board_no);
			}else {
				System.out.println("fail");
			}			
		}else if(referer.contains("Fault_write.jsp")) {	//불량도서 신고
			if(svc.chargeFaultWrite(member_id)) {	
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("Fault_list.jsp");
			}else {
				System.out.println("fail");
			}			
		}else if(referer.contains("Donate_read.jsp")) {	//중고도서 나눔 게시판 : 거래 완료시 지급
			if(svc.chargeDonate(member_id)) {	
				//success
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("Fault_list.jsp");
			}else {
				System.out.println("fail");
			}			
		}
		
		
		
		
		return forward;
	}

}
