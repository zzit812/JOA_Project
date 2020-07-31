package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PointDAO {
	
SqlSessionFactory sqlfactory;
	
	//싱글톤 패턴
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (DAO.class) {
				instance = new memberinfoDAO();		}
		}
		return instance;
	}	
	
	public PointDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	//
	
	public int memberPointNow(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		int total_point = sqlsession.selectOne("pointNowSelect",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return total_point;
	}

}
