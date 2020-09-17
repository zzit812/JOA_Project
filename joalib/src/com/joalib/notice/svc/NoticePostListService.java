package com.joalib.notice.svc;

import java.util.List;

import com.joalib.DAO.NoticeDAO;
import com.joalib.DTO.NoticeDTO;

public class NoticePostListService {
	
	public List<NoticeDTO> noticePostList() {
		
		NoticeDAO dao = NoticeDAO.getinstance();
		List<NoticeDTO> list = dao.noticePostList();
		
		
		
		return list;
	}
}
