package com.joalib.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DAO.DAO;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.DTO.member_alarmDTO;
import com.joalib.DTO.memberinfoDTO;

public class memberinfoDAO {
	
	SqlSessionFactory sqlfactory;
	
	//�̱��� ����
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (memberinfoDAO.class) {
				instance = new memberinfoDAO();		}
		}
		return instance;
	}	
	
	public memberinfoDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
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
	
	//id üũ�ϰ� pw,name���� �޾ƿ�
	public memberinfoDTO memberIDCheck(String checkID) {
		SqlSession sqlsession = sqlfactory.openSession();		
		memberinfoDTO memberinfo = sqlsession.selectOne("memberLoginCheck", checkID);
		sqlsession.commit();
		sqlsession.close();
		
		return memberinfo;
	}
	
	//ȸ�����Խ� point�߰�
	public int pointInsert(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();		
		int i = sqlsession.insert("newMemberPointInsert", member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	//ȸ��Ż��
	public int memberDel (String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		//ȸ�� ������ ������ �ִ� ���͵��� ���켼��
		sqlsession.delete("memberDeleteFault", member_id);
		sqlsession.delete("memberDeleteBoardcomment", member_id);
		sqlsession.delete("memberDeleteBoard", member_id);
		sqlsession.delete("memberDeletePoint", member_id);
		
		System.out.println("dao1");
		int i = sqlsession.delete("memberDelete", member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//ȸ�� ���� ����
	public memberinfoDTO memberinfoSelectAll(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		memberinfoDTO dto = sqlsession.selectOne("memberinfoSelectAll", member_id);		
		sqlsession.commit();
		sqlsession.close();
	
		return dto;
	}
	
	//ȸ������ ����
	public int memberinfoChange(memberinfoDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("memberinfoChange", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	////////////////////// 알림 ///////////////////////
	
	public List<member_alarmDTO> memberAlarmView(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<member_alarmDTO> list = sqlsession.selectList("memberAlarmView", member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	public int boardCommentAlarmCheck(member_alarmDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("alarmCheckChange", dto );
		//System.out.println("DAO 실행 완료");
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	
	
	
	
}
