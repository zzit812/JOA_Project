
package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.FavoriteDTO;
import com.joalib.DTO.LoanDTO;

public class BookFavoriteDAO {

	SqlSessionFactory sqlfactory;

	private static BookFavoriteDAO instance;

	public static BookFavoriteDAO getinstance() {
		if (instance == null) {
			synchronized (BookFavoriteDAO.class) {
				instance = new BookFavoriteDAO();
			}
		}
		return instance;
	}

	public BookFavoriteDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void favorite(FavoriteDTO dto) {

		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("favorite_book", dto);
		sqlsession.commit();
		sqlsession.close();

	}
	
	public void cancelFavorite(FavoriteDTO dto) {

		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("favorite_delete", dto);
		sqlsession.commit();
		sqlsession.close();

	}

	public int favoriteSearch(FavoriteDTO favDTO) {
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int i = sqlsession.selectOne("favorite_Search", favDTO);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
		
	}

}


	


	
	
	
	