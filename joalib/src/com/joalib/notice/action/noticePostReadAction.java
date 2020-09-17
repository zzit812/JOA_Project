package com.joalib.notice.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;

public class noticePostReadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;		
		ServletContext context = request.getServletContext();
		
		int notice_no = Integer.parseInt(request.getParameter("noticeNo"));
		
		
		
		
		return null;
	}
	
	
}
