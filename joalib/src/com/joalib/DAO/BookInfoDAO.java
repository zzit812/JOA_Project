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
import com.joalib.DTO.LoanDTO;

public class BookInfoDAO {

	SqlSessionFactory sqlfactory;
	
	private static BookInfoDAO instance;
	
	public static BookInfoDAO getinstance() {
		if (instance == null) {	// >DAO 占쏙옙체 占쏙옙占쏙옙占쏙옙 占쌍억옙?
			synchronized (DAO.class) {
				instance = new BookInfoDAO();		}
	}
		return instance;
	}
	
	public BookInfoDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 占쏙옙占쏙옙
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쏙옙.				
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
	public int select_book_count() {  //占싯삼옙占쏙옙占� 占쏙옙체 占쌘뤄옙占�
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		//占쏙옙占승곤옙 화占쏙옙
		int total = sqlsession.selectOne("book_search_count");
		//화占쏙옙
		sqlsession.commit();
		sqlsession.close();
		return total;
	}
	

//	public BookInfoDTO book_info_detail(int isbn) {
//	
//		// TODO Auto-generated method stub
//		getinstance();
//		SqlSession sqlsession = sqlfactory.openSession();
//		BookInfoDTO dto = new BookInfoDTO();
//		dto = sqlsession.selectOne("book_info_detail", isbn);
//		sqlsession.commit();
//		sqlsession.close();
//		
//		return dto;
//	}

	public List<BookInfoDTO> book_info() {
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BookInfoDTO> book = sqlsession.selectList("book_info");
		sqlsession.commit();
		sqlsession.close();
		
		return book;
		
	}

	public BookInfoDTO book_infoDB(String isbn) {
		getinstance();

		SqlSession sqlsession = sqlfactory.openSession();
		BookInfoDTO bookDB = (BookInfoDTO) sqlsession.selectOne("book_infoDB", isbn);
		sqlsession.commit();
		sqlsession.close();
		
		return bookDB;
		
	}
	
	public BookInfoDTO getBook(BookInfoDTO dto) throws Exception{
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		BookInfoDTO bookInfoDTO = sqlsession.selectOne("getBook",dto);
		sqlsession.commit();
		sqlsession.close();
		
		return bookInfoDTO;
	}
}


