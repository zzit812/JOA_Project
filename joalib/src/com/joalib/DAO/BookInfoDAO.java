package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.BoardDTO;
import com.joalib.DTO.BookInfoDTO;

public class BookInfoDAO {

	SqlSessionFactory sqlfactory;
	
	private static BookInfoDAO instance;
	
	public static BookInfoDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (DAO.class) {
				instance = new BookInfoDAO();		}
	}
		return instance;
	}
	
	public BookInfoDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	

	public int bookinfoadd(BookInfoDTO bookBean) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i =sqlsession.insert("book_info_add", bookBean);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public int select_book_count() {  //검색결과 전체 자료수
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int total = sqlsession.selectOne("book_search_count");
		sqlsession.commit();
		sqlsession.close();
		return total;
	}
	public List<BookInfoDTO> select_book_info() {	//
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List <BoardDTO> list = sqlsession.selectList("board_all");
		sqlsession.commit();
		sqlsession.close();
		return list;
	}
	
	
	
	
	
}


