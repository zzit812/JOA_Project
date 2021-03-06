package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.BookInfoDTO;
import com.joalib.DTO.SearchDTO;

public class BookSearchDAO {

	
SqlSessionFactory sqlfactory;
	
	private static BookSearchDAO instance;
	
	public static BookSearchDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (BookSearchDAO.class) {
				instance = new BookSearchDAO();		}
	}
		return instance;
	}
	
	public BookSearchDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	

	public List<SearchDTO> select_book(SearchDTO sdto) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<SearchDTO> book_search = sqlsession.selectList("book_search", sdto);
		sqlsession.commit();
		sqlsession.close();
		
		return book_search;
	}

	public List<SearchDTO> all_option_select(SearchDTO sdto) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<SearchDTO> book_search = sqlsession.selectList("all_option_select", sdto);
		sqlsession.commit();
		sqlsession.close();
		
		return book_search;
	}
	
}
