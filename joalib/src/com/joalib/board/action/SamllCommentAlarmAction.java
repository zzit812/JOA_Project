package com.joalib.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.DAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;

public class SamllCommentAlarmAction implements dbAction{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		String sort = "boardSmallComment";
		
		//정보 받기: 알림 받는이(:댓글 글쓴사람), 보내는사람(답글쓴사람),댓글번호
		String member_id = request.getParameter("commentWriter");
		String sc_writer = request.getParameter("smallCommentWriter");
		String board_no = request.getParameter("board_no");
		int commentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		
		member_alarmDTO dto = new member_alarmDTO();
		dto.setMember_id(member_id);
		dto.setAlarm_etc(commentNo+"/"+sc_writer);
		System.out.println("Action: "+dto.getAlarm_etc());
		
		DAO dao = DAO.getinstance();
		int i = dao.commentAlarmAdd(dto, sort);
		
		if(i > 0) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardReadPage.bo?board_num="+board_no);
		}
		
		
		return forward;
	}

}
