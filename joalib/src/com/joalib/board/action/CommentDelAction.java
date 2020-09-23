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

	
		String member_id = request.getParameter("member_id");
		String bc_date = request.getParameter("bc_date");
		int board_comment_no = Integer.parseInt(request.getParameter("board_comment_no"));
		//System.out.println("board_no: "+board_no+"/ member_id: "+member_id+"/ bc_date: "+bc_date);
		
		Board_CommentDTO dto = new Board_CommentDTO();
		dto.setMember_id(member_id);
		dto.setBc_date(bc_date);
		dto.setBoard_comment_no(board_comment_no);
		
		CommentDelService svc = new CommentDelService();
		if(svc.boardCommentdel(dto)) {
			
			
		}
		
		
		return null;
	}
	
}
