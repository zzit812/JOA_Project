package com.joalib.notice.svc;

import com.joalib.DAO.NoticeDAO;
import com.joalib.DTO.NoticeDTO;

public class noticePostReadService {

	
	public NoticeDTO noticePostDetail(int notice_no) {
		NoticeDAO dao = NoticeDAO.getinstance();
		NoticeDTO dto = dao.noticePostDetail(notice_no);
		
		return dto;
	}
}
