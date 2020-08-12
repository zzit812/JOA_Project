package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class LoanDAO {

	
	
SqlSessionFactory sqlfactory;
	
	private static FavoriteDAO instance;
	
	public static FavoriteDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (memberinfoDAO.class) {
				instance = new FavoriteDAO();		}
		}
		return instance;
	}
	
	public LoanDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
		}		
	}
	

	public void loan(LoanDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("loan",dto);
		sqlsession.commit();
		sqlsession.close();
	}
	
	
}
