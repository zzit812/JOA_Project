package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.PointDTO;

public class PointDAO {
	
SqlSessionFactory sqlfactory;
	
	//싱글톤 패턴
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO 객체 만든적 있어?
			synchronized (DAO.class) {
				instance = new memberinfoDAO();		}
		}
		return instance;
	}	
	
	public PointDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 연결
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis를 증명하는 아이.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	//
	
	//현재 포인트 조회
	public int memberPointNow(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		int total_point = sqlsession.selectOne("pointNowSelect",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return total_point;
	}
	//포인트 내역 조회
	public List<PointDTO> memberPointList(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<PointDTO> dto = sqlsession.selectList("pointListSelect",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	//포인트 충전(임시)
		public int PointChargeTemp(String member_id) {
			
			SqlSession sqlsession = sqlfactory.openSession();
			int i = sqlsession.insert("pointChargeTemp",member_id);
			sqlsession.commit();
			sqlsession.close();
			
			return i;
		} 
		
	//포인트 충전(자유게시판 포인트)
			public int boardPointCharge(String member_id) {				
				SqlSession sqlsession = sqlfactory.openSession();
				int i = sqlsession.insert("boardPointCharge",member_id);
				sqlsession.commit();
				sqlsession.close();
				
				return i;
			} 
	
	
	//totalPoint를 가져와서 포인트 충전해주는 구문
	////insert into joalib.point values ('test5', 1000, now(), 'test2', ((select total_point from joalib.point as temp where member_id = 'test5'  order by update_date desc limit 1)+1000));
	

}
