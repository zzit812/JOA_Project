package com.joalib.donate.svc;

import java.util.List;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.Donate_Small_CommentDTO;

public class SmallCommentListService {
	public List<Donate_Small_CommentDTO> donateSmallCommentList(int donate_comment_no) {
		
		DonateDAO dao = DonateDAO.getinstance();
		List<Donate_Small_CommentDTO> dto = dao.donateSmallCommentList(donate_comment_no);
		
		return dto;		
	}

}
