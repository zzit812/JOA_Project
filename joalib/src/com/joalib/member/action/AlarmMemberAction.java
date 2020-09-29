package com.joalib.member.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DAO.memberinfoDAO;
import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;

public class AlarmMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();
		
		member_alarmDTO dto = new member_alarmDTO();
		
		forward = new ActionForward();
		forward.setRedirect(true);
		
		memberinfoDAO dao = memberinfoDAO.getinstance();
		
		
		//변수 지정
		String alarm_etc;
		
		//파라미터 값 받기
		String alarm_date = request.getParameter("alarm_date");
		dto.setAlarm_date(alarm_date);
		
		if(request.getParameter("board_no") != null) {	//자유게시판 댓글 알림
			alarm_etc = request.getParameter("board_no");
			dto.setAlarm_etc(alarm_etc);
			dto.setAlarm_category("board_comment");
			int i = dao.AlarmCheck(dto);
			if (i > 0) {
				String board_no = alarm_etc.split("/")[0];
				System.out.println(board_no);
				forward.setPath("boardHitUp.bo?board_no="+board_no);
			}
		}else if(request.getParameter("boardComment_no") != null) {	//자유게시판 댓글 알림
			alarm_etc = request.getParameter("boardComment_no");
			dto.setAlarm_etc(alarm_etc);
			dto.setAlarm_category("board_smallcomment");
			int i = dao.AlarmCheck(dto);
			if (i > 0) {
				String board_no = alarm_etc.split("/")[2];
				System.out.println("AlarmAction: "+board_no);
				forward.setPath("boardHitUp.bo?board_no="+board_no);
			}
		}else if(request.getParameter("donate_no") != null) {
			alarm_etc = request.getParameter("donate_no");
			dto.setAlarm_etc(alarm_etc);
			dto.setAlarm_category("donate_application");
			int i = dao.AlarmCheck(dto);
			if (i > 0) {
				String donate_no = alarm_etc.split("/")[0];
				forward.setPath("Donate_read.jsp?donate_no="+donate_no+"&page_num=1");
			}
		}
		
		
		
		
		
		
		return forward;
	}

}
