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
import com.joalib.DTO.BookWishDTO;

public class BookInfoDAO {

	SqlSessionFactory sqlfactory;
	
	private static BookInfoDAO instance;
	
	public static BookInfoDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DAO.class) {
				instance = new BookInfoDAO();		}
	}
		return instance;
	}
	
	public BookInfoDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
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
	public int select_book_count() {  //�˻���� ��ü �ڷ��
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		//���°� ȭ��
		int total = sqlsession.selectOne("book_search_count");
		//ȭ��
		sqlsession.commit();
		sqlsession.close();
		return total;
	}
	

	public BookInfoDTO book_info_detail(int isbn) {
	
		// TODO Auto-generated method stub
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		BookInfoDTO dto = new BookInfoDTO();
		dto = sqlsession.selectOne("book_info_detail", isbn);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}

	public List<BookInfoDTO> book_info() {
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BookInfoDTO> book = sqlsession.selectList("book_info");
		sqlsession.commit();
		sqlsession.close();
		
		return book;
		
	}

	
	
	
	
	
}


