package com.joalib.notice.action;

import javax.servlet.http.*;

import com.joalib.DTO.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
}