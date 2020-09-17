package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.NoticeDTO;

public class NoticeDAO {
	
	SqlSessionFactory sqlfactory;
	
	private static NoticeDAO instance;	
	
	public static NoticeDAO getinstance() {
		if (instance == null) {	
			synchronized (NoticeDAO.class) {
				instance = new NoticeDAO();		}
		}
		return instance;
	}
	
	public NoticeDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	
	//공지게시글 전체 목록
	public List<NoticeDTO> noticePostList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<NoticeDTO> list = sqlsession.selectList("noticeListSelect");
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//공지게시글 디테일
	public NoticeDTO noticePostDetail(int notice_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		NoticeDTO dto = new NoticeDTO();
		dto = sqlsession.selectOne("noticePostDetail", notice_no);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	
	

}
