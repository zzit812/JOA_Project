package com.joalib.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BoardDTO;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.board.svc.CommentDelService;

public class CommentDelAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		BoardDTO boardBean = null;
		
		String board_no = request.getParameter("board_no");
		String member_id = request.getParameter("member_id");
		String bc_date = request.getParameter("bc_date");
		//System.out.println("board_no: "+board_no+"/ member_id: "+member_id+"/ bc_date: "+bc_date);
		
		Board_CommentDTO dto = new Board_CommentDTO();
		dto.setMember_id(member_id);
		dto.setBc_date(bc_date);
		
		CommentDelService svc = new CommentDelService();
		if(svc.boardCommentdel(dto)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다')");
			out.println("</script>");
			//
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardReadPage.bo?board_num="+board_no);
		}
		
		
		return forward;
	}
	
}
