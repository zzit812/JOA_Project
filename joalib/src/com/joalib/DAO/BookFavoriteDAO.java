package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class BookFavoriteDAO {

	SqlSessionFactory sqlfactory;
	
	private static BookFavoriteDAO instance;
	
	public static BookFavoriteDAO getinstance() {
		if (instance == null) {	
			synchronized (DAO.class) {
				instance = new BookFavoriteDAO();		}
	}
		return instance;
	}
	
	public BookFavoriteDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");	
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	


	public int select_book_count() {  
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int total = sqlsession.selectOne("book_search_count");
		sqlsession.commit();
		sqlsession.close();
		return total;
	}

	public void favorite() {
		// TODO Auto-generated method stub
		
	}
	


	
	
	
	
}


