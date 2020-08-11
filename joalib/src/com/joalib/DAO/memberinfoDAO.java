package com.joalib.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.Board_CommentDTO;
import com.joalib.DTO.memberinfoDTO;

public class memberinfoDAO {
	
	SqlSessionFactory sqlfactory;
	
	//싱글톤 패턴
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (memberinfoDAO.class) {
				instance = new memberinfoDAO();		}
		}
		return instance;
	}	
	
	public memberinfoDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	//	
	
	//insert
	public int memberInsert (memberinfoDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();		
		int i = sqlsession.insert("memberInsert", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//id 체크하고 pw,name값은 받아옴
	public memberinfoDTO memberIDCheck(String checkID) {
		SqlSession sqlsession = sqlfactory.openSession();		
		memberinfoDTO memberinfo = sqlsession.selectOne("memberLoginCheck", checkID);
		sqlsession.commit();
		sqlsession.close();
		
		return memberinfo;
	}
	
	//회원가입시 point추가
	public int pointInsert(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();		
		int i = sqlsession.insert("newMemberPointInsert", member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	//회원탈퇴
	public int memberDel (String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		//회원 정보가 남겨져 있는 모든것들을 지우세요
		sqlsession.delete("memberDeleteBoardcomment", member_id);
		System.out.println("댓글 완료");
		sqlsession.delete("memberDeleteBoard", member_id);
		System.out.println("자유게시판 완료");
		sqlsession.delete("memberDeletePoint", member_id);
		System.out.println("포인트 완료");
		int i = sqlsession.delete("memberDelete", member_id);
		System.out.println("dao: "+i);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	
	
	
}
