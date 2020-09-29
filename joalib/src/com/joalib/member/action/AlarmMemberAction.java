package com.joalib.member.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.member_alarmDTO;
import com.joalib.member.svc.AlarmMemberService;

public class AlarmMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();
		
		member_alarmDTO dto = new member_alarmDTO();
		AlarmMemberService svc = new AlarmMemberService();
		
		forward = new ActionForward();
		forward.setRedirect(true);
		
		//변수 지정
		String alarm_etc;
		boolean isSuccess = false;
		
		//파라미터 값 받기
		String alarm_date = request.getParameter("alarm_date");
		dto.setAlarm_date(alarm_date);
		
		if(request.getParameter("board_no") != null) {	//자유게시판 댓글 알림
			alarm_etc = request.getParameter("board_no");
			dto.setAlarm_etc(alarm_etc);
			dto.setAlarm_category("board_comment");
			//System.out.println("1. "+dto.getAlarm_category()+", "+dto.getAlarm_date()+", "+dto.getAlarm_etc());
			isSuccess = svc.alarmCheckChange(dto);
			//System.out.println(isSuccess);
			if (isSuccess) {
				String board_no = alarm_etc.split("/")[0];
				System.out.println(board_no);
				forward.setPath("boardHitUp.bo?board_no="+board_no);
			}
		}if(request.getParameter("donate_no") != null) {
			alarm_etc = request.getParameter("donate_no");
			dto.setAlarm_etc(alarm_etc);
			dto.setAlarm_category("donate_application");
			isSuccess = svc.alarmCheckChange(dto);
			if (isSuccess) {
				String donate_no = alarm_etc.split("/")[0];
				//System.out.println(donate_no);
				forward.setPath("Donate_read.jsp?donate_no="+donate_no+"&page_num=1");
			}
		}
		
		
		
		
		
		
		return forward;
	}

}
