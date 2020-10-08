package com.joalib.board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.board.svc.CommentWriteService;

public class CommentWriteAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 servletContext占쏙옙 占쌨아울옙占쏙옙,
		
		HttpSession session = request.getSession();
		Board_CommentDTO dto = new Board_CommentDTO();
		
		String board_no = request.getParameter("board_no");
		dto.setBoard_no(board_no);
		String member_id = (String)session.getAttribute("member_id");
		String boardWriter = request.getParameter("boardWriter");
		
		
		if(member_id != null) {
			dto.setMember_id(member_id);
			dto.setBc_text(request.getParameter("boardComment"));
			
			CommentWriteService svc = new CommentWriteService();
			
			if(svc.commentAdd(dto)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("commentAlarmAdd.bo?member_id="+member_id+"&board_no="+board_no+"&boardWriter="+boardWriter);
				//forward.setPath("boardPointCharge.po?member_id="+member_id+"&board_no="+board_no);				
			}
			else {
				System.out.println("fail");
			}
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('濡쒓렇�씤 �썑 �씠�슜�빐二쇱꽭�슂')");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		
		
		return forward;
	}
	
}
