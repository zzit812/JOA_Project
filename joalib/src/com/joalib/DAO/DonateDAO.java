package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.DonateDTO;

public class DonateDAO {
	
SqlSessionFactory sqlfactory;
	
	////////////////////// ��Ŭ������ //////////////////////
	
	private static DonateDAO instance;
	
	//static�� �ݵ��! �پ���Ѵ�. ���� ����
	public static DonateDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DonateDAO.class) {
				instance = new DonateDAO();
			}
		}
		return instance;
	}
	
	public DonateDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	
	
	public int donatePostwrite(DonateDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("donatePostInsert", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	public List<DonateDTO> donatePostList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<DonateDTO> list = sqlsession.selectList("donatePostList");
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	public DonateDTO donatePostOneRead(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		DonateDTO dto = sqlsession.selectOne("donatePostOneList", donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	
	public int donateDel(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.delete("donatePostDelete", donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return i ;
	}
	

}
