package com.joalib.member.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.memberinfoDTO;
import com.joalib.member.svc.MemberInsertService;

public class MemberInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//이전 페이지의 servletContext를 받아오고,
		
		//정보 저장
		memberinfoDTO mDTO = new memberinfoDTO();
        
        mDTO.setMember_id(request.getParameter("member_id"));
        mDTO.setMember_pw(request.getParameter("member_pw"));
        mDTO.setMember_name(request.getParameter("member_name"));    
        mDTO.setMember_tel(
        		request.getParameter("member_tel1")+request.getParameter("member_tel2")+request.getParameter("member_tel3")
        		);
        mDTO.setMember_birth(request.getParameter("member_birth"));
        mDTO.setMember_email(
        		request.getParameter("member_email_id")+"@"+request.getParameter("member_email_adress")
        		);
        mDTO.setMember_adress(
        		request.getParameter("address") + request.getParameter("detailAddress")
        		);
        mDTO.setMember_character(Integer.parseInt(request.getParameter("member_character")));
        mDTO.setMember_level("1");   
        
     	//세션에 저장
        HttpSession session = request.getSession(false);
        String member_name = request.getParameter("member_name");        
        session.setAttribute("member_name",member_name);
        
        
        //svc 연결
        MemberInsertService svc = new MemberInsertService();
        
		if(svc.MemberInsert(mDTO)) {
			//정보저장
	        request.setAttribute("NewMemberID", mDTO.getMember_id());
	        
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("newMemberPointInsert.mem");
		}else {
			System.out.println("실패");
		}
		
				
		return forward;
	}

}
