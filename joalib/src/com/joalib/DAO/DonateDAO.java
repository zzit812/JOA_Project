package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.DonateDTO;
import com.joalib.DTO.Donate_CommentDTO;
import com.joalib.DTO.Donate_Small_CommentDTO;

public class DonateDAO {
	
SqlSessionFactory sqlfactory;
	
	////////////////////// 싱클톤패턴 //////////////////////
	
	private static DonateDAO instance;
	
	//static이 반드시! 붙어야한다. 정적 변수
	public static DonateDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (DonateDAO.class) {
				instance = new DonateDAO();
			}
		}
		return instance;
	}
	
	public DonateDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	
	
	public int donatePostwrite(DonateDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("donatePostInsert", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	public List<DonateDTO> donatePostList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<DonateDTO> list = sqlsession.selectList("donatePostList");
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	public DonateDTO donatePostOneRead(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		DonateDTO dto = sqlsession.selectOne("donatePostOneList", donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	
	public int donateDel(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("donatePostDelete1", donate_no);
		sqlsession.delete("donatePostDelete2", donate_no);
		int i = sqlsession.delete("donatePostDelete3", donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return i ;
	}
	public int donateUpdate(DonateDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i =sqlsession.update("donatePostUpdate", dto);
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	
	public int donateCommentAdd(Donate_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("donateCommentAdd", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}	
	public List<Donate_CommentDTO> donateCommentList(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Donate_CommentDTO> list = sqlsession.selectList("donateCommentList",donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}	
	public int donateCommentUpdate(Donate_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("donateCommnetUpdate", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public int doanteCommentDel(int donate_comment_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i =sqlsession.delete("donateCommentDelete", donate_comment_no);		
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public int donateSmallCommentAdd(Donate_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("donateSmallCommentAdd", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public List<Donate_Small_CommentDTO> donateSmallCommentList(int donate_comment_no){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Donate_Small_CommentDTO> dto = sqlsession.selectList("donateSmallCommentList", donate_comment_no);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	public int donateSmallCommentDelete(Donate_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.delete("donateSmallCommentDelete", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public int donateSmallCommentChange(Donate_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("donateSmallCommentChange", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i ;
	}
	

}
