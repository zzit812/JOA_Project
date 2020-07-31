package com.joalib.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.memberinfoDTO;

public class memberinfoDAO {
	
	SqlSessionFactory sqlfactory;
	
	//�̱��� ����
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DAO.class) {
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
		System.out.println("a123456789");
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//id üũ�ϰ� pw,name���� �޾ƿ�
	public List<memberinfoDTO> memberIDCheck(String checkID) {
		SqlSession sqlsession = sqlfactory.openSession();		
		List<memberinfoDTO> memberinfo = sqlsession.selectList("memberLoginCheck", checkID);
		sqlsession.commit();
		sqlsession.close();
		
		return memberinfo;
	}
	
	//ȸ�����Խ� point�߰�
	public int pointInsert(String member_id) {
		System.out.println("1: "+member_id);
		SqlSession sqlsession = sqlfactory.openSession();		
		int i = sqlsession.insert("newMemberPointInsert", member_id);
		sqlsession.commit();
		sqlsession.close();
		System.out.println("2: "+member_id);
		
		return i;
	}	
}
