package com.joalib.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DAO.*;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.memberinfoDTO;
import com.joalib.member.svc.MemberIDCheckService;

public class MemberIDCheck implements Action{
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		String checkID = request.getParameter("member_id");
		String checkPW = request.getParameter("member_pw");
		
				
		MemberIDCheckService svc = new MemberIDCheckService();
		List<memberinfoDTO> memberinfo = svc.IDCheck(checkID);
		String member_pw = memberinfo.get(0).getMember_pw();
		String member_name = memberinfo.get(0).getMember_name();
				
		if(checkPW.equals(member_pw) && member_pw != null) {
			//있는 아이디 && 동일한 비밀번호
			//세션에 저장
			HttpSession session = request.getSession();
	        session.setAttribute("member_id",checkID);
	        session.setAttribute("member_name", member_name);
	        //
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("home.jsp");
		}else {
			//없는 아이디 && 동일하지 않은 비밀번호
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();	//왜 굳이 Writer을 부를까?
			out.println("<script>");
			out.println("alert('존재하지 않은 회원이거나, 잘못된 비밀번호 입니다.')");
			out.println("history.back();"); //local.href=""
			out.println("</script>");
		}
		
		return forward;
	}
	
	
//	public String IDCheck(String checkID) throws Exception {
//		
//		String message = null;
////		response.setContentType("text/html;charset=UTF-8");
////		PrintWriter out = response.getWriter();	//왜 굳이 Writer을 부를까?
//		MemberIDCheckService svc = new MemberIDCheckService();
//		if(svc.IDCheck(checkID) != null) {
//			//있는 아이디
//			message = "사용중인 아이디입니다";
//		}else {
//			//없는 아이디
//			message = "사용할 수 있는 아이디입니다";
//		}
//		
//		
//		return message;
//	}
	

}
