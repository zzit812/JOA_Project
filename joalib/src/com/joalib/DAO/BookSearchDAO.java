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
	
	private static BookInfoDAO instance;
	
	public static BookInfoDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DAO.class) {
				instance = new BookInfoDAO();		}
	}
		return instance;
	}
	
	public BookSearchDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	public List<BookInfoDTO> select_book_all() {   //��ü ���
		getinstance();
		//ȭ��
		SqlSession sqlsession = sqlfactory.openSession();
		List <BookInfoDTO> list = sqlsession.selectList("book_info");

		sqlsession.commit();
		sqlsession.close();
		return list;
	}


	public List<BookInfoDTO> BookSearch(SearchDTO sdto) {
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		//System.out.println("DAO  1");
		
		List <BookInfoDTO> list = sqlsession.selectList("book_search",sdto);
		
		sqlsession.commit();
		sqlsession.close();
		
		
		
		
		//System.out.println("DAO  2");Ȯ��
		
		return list;
	}
	
}
