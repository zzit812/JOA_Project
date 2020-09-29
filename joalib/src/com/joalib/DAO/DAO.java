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
	
	////////////////////// ��Ŭ������ //////////////////////
	
	private static DAO instance;
	
	//static�� �ݵ��! �پ���Ѵ�. ���� ����
	public static DAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DAO.class) {
				instance = new DAO();
			}
		}
		return instance;
	}
	
	public DAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	//board
	public List<BoardDTO> select_board_all() {	//��ü�� �̾ƿ���
		getinstance();
		SqlSession sqlsession = sqlfactory.openSession();
		List <BoardDTO> list = sqlsession.selectList("board_all");
		sqlsession.commit();
		sqlsession.close();
		return list;
	}
	
	public int select_board_total() {	//�ѰԽù� ����
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
		System.out.println("조회수 증가 :DAO");
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
		sqlsession.delete("board_del2", board_no);
		int i = sqlsession.delete("board_del", board_no);
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
	
	//�����Խ��� ��� �߰�
	public int boardCommnetAdd(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i  = sqlsession.insert("boardComment_add", dto) ;
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//�����Խ��� ��� ����Ʈ
	public List<Board_CommentDTO> boardCommentList(int board_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board_CommentDTO> list  = sqlsession.selectList("boardComment_list", board_no) ;
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//�����Խ��� ��� ����
	public int boardCommentDel(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("boardComment_delete2", dto);
		int i = sqlsession.delete("boardComment_delete1", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	//�����Խ��� ��� ����
	public int boardCommentUpdate(Board_CommentDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("boardComment_update", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	
	
	//���� �� �� ����
	public List<BoardDTO> myBoardView (String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<BoardDTO> list = sqlsession.selectList("myBoardView",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	//�Խù��� ��� ����
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
		System.out.println("접근 성공");
		int i = sqlsession.delete("boardSmallCommentDelete", dto);
		System.out.println("연결 성공");
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




