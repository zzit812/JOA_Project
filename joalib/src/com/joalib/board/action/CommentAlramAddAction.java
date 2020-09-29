package com.joalib.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DAO.DAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;

public class CommentAlramAddAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();
		String sort = "boardComment";
		
		String member_id = (String)session.getAttribute("member_id");
		String board_no = request.getParameter("board_no");
		String boardWriter = request.getParameter("boardWriter");
		
		member_alarmDTO dto = new member_alarmDTO();
		dto.setMember_id(boardWriter);
		dto.setAlarm_etc(board_no+"/"+member_id);
		
		DAO dao = DAO.getinstance();
		int i = dao.commentAlarmAdd(dto, sort);
		
		if(i > 0) {
			forward = new ActionForward();
			forward.setRedirect(true);			
			forward.setPath("boardPointCharge.po?member_id="+member_id+"&board_no="+board_no);
		}
		
		
		return forward;
	}

}
