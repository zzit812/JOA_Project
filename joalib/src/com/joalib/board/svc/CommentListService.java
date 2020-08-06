package com.joalib.board.svc;

import java.util.List;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_CommentDTO;

public class CommentListService {
	
	public List<Board_CommentDTO> commentList(int board_no) {
		DAO dao = DAO.getinstance();
		List<Board_CommentDTO> list = dao.boardCommentList(board_no);
		
		return list;
	}

}
