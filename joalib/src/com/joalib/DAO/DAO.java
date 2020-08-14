package com.joalib.DAO;


import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.BoardDTO;
import com.joalib.DTO.Board_CommentDTO;
import com.joalib.DTO.memberinfoDTO;

import com.joalib.DTO.BoardDTO;

public class DAO {
	
	SqlSessionFactory sqlfactory;
	
	////////////////////// 싱클톤패턴 //////////////////////
	
	private static DAO instance;
	
	//static이 반드시! 붙어야한다. 정적 변수
	public static DAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (DAO.class) {
				instance = new DAO();
			}
		}
		return instance;
	}
	
	public DAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	//board
	public List<BoardDTO> select_board_all() {	//전체를 뽑아오자
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List <BoardDTO> list = sqlsession.selectList("board_all");
		sqlsession.commit();
		sqlsession.close();
		return list;
	}
	
	public int select_board_total() {	//총게시물 갯수
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int total = sqlsession.selectOne("board_count");
		sqlsession.commit();
		sqlsession.close();
		return total;
	}
	
	public void hitUp(int board_no) {		//조회수 증가
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("board_hitUp", board_no);
		sqlsession.commit();
		sqlsession.close();		
	}	
	public BoardDTO read_details(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		BoardDTO dto = new BoardDTO();
		dto = sqlsession.selectOne("read_details", board_no);
		sqlsession.commit();
		sqlsession.close();
		return dto;		
	}
	
	public int myinsert(BoardDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("board_add", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}

	
	public void board_del(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		BoardDTO board_dto = new BoardDTO();
		sqlsession.delete("board_del", board_no);
		sqlsession.commit();
		sqlsession.close();
	}
	
	public int board_update(BoardDTO article) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("board_update", article);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//자유게시판 댓글 추가
	public int boardCommnetAdd(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i  = sqlsession.insert("boardComment_add", dto) ;
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//자유게시판 댓글 리스트
	public List<Board_CommentDTO> boardCommentList(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board_CommentDTO> list  = sqlsession.selectList("boardComment_list", board_no) ;
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//자유게시판 댓글 삭제
	public int boardCommentDel(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.delete("boardComment_delete", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//자유게시판 댓글 수정
	public int boardCommentUpdate(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("boardComment_update", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	
	
	//내가 쓴 글 보기
	public List<BoardDTO> myBoardView (String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<BoardDTO> list = sqlsession.selectList("myBoardView",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//게시물당 댓글 갯수
	public int CommnetCount(int board_no){
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int count = sqlsession.selectOne("boardCommentCount",board_no);
		sqlsession.commit();
		sqlsession.close();
		
		return count;
	}




	
	
	
	
}




