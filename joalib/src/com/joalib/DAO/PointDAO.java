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
	
	//�̱��� ����
	private static memberinfoDAO instance;	
	
	public static memberinfoDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DAO.class) {
				instance = new memberinfoDAO();		}
		}
		return instance;
	}	
	
	public PointDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}
	//
	
	//���� ����Ʈ ��ȸ
	public int memberPointNow(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		int total_point = sqlsession.selectOne("pointNowSelect",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return total_point;
	}
	//����Ʈ ���� ��ȸ
	public List<PointDTO> memberPointList(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<PointDTO> dto = sqlsession.selectList("pointListSelect",member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return dto;
	}
	//����Ʈ ����(�ӽ�)
		public int PointChargeTemp(String member_id) {
			
			SqlSession sqlsession = sqlfactory.openSession();
			int i = sqlsession.insert("pointChargeTemp",member_id);
			sqlsession.commit();
			sqlsession.close();
			
			return i;
		} 
		
	//����Ʈ ����(�����Խ��� ����Ʈ)
			public int boardPointCharge(String member_id) {				
				SqlSession sqlsession = sqlfactory.openSession();
				int i = sqlsession.insert("boardPointCharge",member_id);
				sqlsession.commit();
				sqlsession.close();
				
				return i;
			} 
	
	
	//totalPoint�� �����ͼ� ����Ʈ �������ִ� ����
	////insert into joalib.point values ('test5', 1000, now(), 'test2', ((select total_point from joalib.point as temp where member_id = 'test5'  order by update_date desc limit 1)+1000));
	

}
