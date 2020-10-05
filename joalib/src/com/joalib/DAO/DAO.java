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
import com.joalib.DTO.Board_Small_CommentDTO;
import com.joalib.DTO.member_alarmDTO;
import com.joalib.DTO.memberinfoDTO;

import com.joalib.DTO.BoardDTO;

public class DAO {
	
	SqlSessionFactory sqlfactory;
	
	////////////////////// �뜝�룞�삕�겢�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 //////////////////////
	
	private static DAO instance;
	
	//static�뜝�룞�삕 �뜝�뙠�벝�삕�뜝占�! �뜝�뙐�뼲�삕�뜝�룞�삕髥��뜝占�. �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public static DAO getinstance() {
		if (instance == null) {	// >DAO �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙇�뼲�삕?
			synchronized (DAO.class) {
				instance = new DAO();
			}
		}
		return instance;
	}
	
	public DAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml �뜝�룞�삕�뜝�룞�삕
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�룞�삕.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	//board
	public List<BoardDTO> select_board_all() {	//�뜝�룞�삕泥닷뜝�룞�삕 �뜝�떛�븘�슱�삕�뜝�룞�삕
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List <BoardDTO> list = sqlsession.selectList("board_all");
		sqlsession.commit();
		sqlsession.close();
		return list;
	}
	
	public int select_board_total() {	//�뜝�떬寃뚯떆諭꾩삕 �뜝�룞�삕�뜝�룞�삕
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int total = sqlsession.selectOne("board_count");
		sqlsession.commit();
		sqlsession.close();
		return total;
	}
	
	public int hitUp(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("board_hitUp", board_no);
		sqlsession.commit();
		sqlsession.close();	
		return i;
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

	
	public int board_del(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("board_del3", board_no);	//답글삭제
		sqlsession.delete("board_del2", board_no);	//댓글삭제
		int i = sqlsession.delete("board_del", board_no);	//게시글 삭제
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	public int board_update(BoardDTO article) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("board_update", article);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//�뜝�룞�삕�뜝�룞�삕�뜝�뙃�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�뙥怨ㅼ삕
	public int boardCommnetAdd(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i  = sqlsession.insert("boardComment_add", dto) ;
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//�뜝�룞�삕�뜝�룞�삕�뜝�뙃�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�듃
	public List<Board_CommentDTO> boardCommentList(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board_CommentDTO> list  = sqlsession.selectList("boardComment_list", board_no) ;
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//댓글 삭제 함수
	public int boardCommentDel(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("boardComment_delete2", dto);	//답글 삭제
		int i = sqlsession.delete("boardComment_delete1", dto);	//댓글 삭제
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//�뜝�룞�삕�뜝�룞�삕�뜝�뙃�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕
	public int boardCommentUpdate(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("boardComment_update", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public List<BoardDTO> myBoardView (String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<BoardDTO> list = sqlsession.selectList("myBoardView",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//�뜝�뙃�떆諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕
	public int CommnetCount(int board_no){
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		int count = sqlsession.selectOne("boardCommentCount",board_no);
		sqlsession.commit();
		sqlsession.close();
		
		return count;
	}
	
///
	public int boardSmallCommentAdd(Board_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("boardSmallCommentAdd", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public List<Board_Small_CommentDTO> boardSmallCommentList(int donate_comment_no){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board_Small_CommentDTO> dto = sqlsession.selectList("boardSmallCommentList", donate_comment_no);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	public int boardSmallCommentDelete(Board_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.delete("boardSmallCommentDelete", dto);
		if(i > 0) {
			sqlsession.delete("boardSmallCommentAlarmDelete", dto);
		}
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public int boardSmallCommentChange(Board_Small_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("boardSmallCommentChange", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i ;
	}
	
	public int commentAlarmAdd(member_alarmDTO dto, String sort) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = 0;
		//
		if(sort.equals("boardComment")) {
			i = sqlsession.insert("boardCommentAlarmAdd", dto);
		}else if(sort.equals("boardSmallComment")) {
			i = sqlsession.insert("boardSmallCommentAlarmAdd", dto);
		}
		sqlsession.commit();
		sqlsession.close();
		return i;
	}

	
	




	
	
	
	
}




