package com.joalib.member.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.memberinfoDTO;
import com.joalib.member.svc.MemberinfoChangeService;

public class MeberinfoChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		
		//정보 받아오기
		HttpSession session = request.getSession(false);
		memberinfoDTO mDTO = new memberinfoDTO();
		mDTO.setMember_id((String)session.getAttribute("member_id"));
		//
        mDTO.setMember_name(request.getParameter("member_name"));    
        mDTO.setMember_tel(
        		request.getParameter("member_tel1")+"-"+request.getParameter("member_tel2")+"-"+request.getParameter("member_tel3")
        		);
        mDTO.setMember_birth(request.getParameter("member_birth"));
        mDTO.setMember_email(
        		request.getParameter("member_email_id")+"@"+request.getParameter("member_email_adress")
        		);
        mDTO.setMember_adress(
        		request.getParameter("address") +"/" + request.getParameter("detailAddress")
        		);
        
        //svc 연결
        MemberinfoChangeService svc = new MemberinfoChangeService();
        boolean isSuccess = svc.memberinfoChange(mDTO);
        
        if(isSuccess) {
        	session.setAttribute("member_name", mDTO.getMember_name());
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage_main.jsp?changed=true");
        }
		
		
        
        
		
		return forward;
	}

}
