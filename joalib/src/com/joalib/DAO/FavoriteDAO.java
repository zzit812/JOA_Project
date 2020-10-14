package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.FavoriteDTO;

public class FavoriteDAO {

	SqlSessionFactory sqlfactory;
	
	private static FavoriteDAO instance;
	
	public static FavoriteDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (FavoriteDAO.class) {
				instance = new FavoriteDAO();		}
		}
		return instance;
	}
	
	public FavoriteDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	
	public void favorite(FavoriteDTO dto) {

		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("favarite_book",dto);
		sqlsession.commit();
		sqlsession.close();
		
	}

	public void favDel(FavoriteDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		//System.out.println("FavoriteDAO입니다."); 확인 
		sqlsession.delete("favorite_delete", dto );
		sqlsession.commit();
		sqlsession.close();
		
	}

	
	
	
	
	
}
