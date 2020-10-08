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
	
	private static LoanDAO instance;
	
	public static LoanDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (LoanDAO.class) {
				instance = new LoanDAO();		}
		}
		return instance;
	}
	
	public LoanDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
		}		
	}
	

	
	public void loan(LoanDTO dto) throws Exception{
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("loan",dto);
		sqlsession.commit();
		sqlsession.close();
	}


	
	
}
