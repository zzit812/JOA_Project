package com.joalib.board.action;

import javax.servlet.http.*;

import com.joalib.DTO.ActionForward;

public interface dbAction {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}

