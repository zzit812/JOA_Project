package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.FaultDTO;
import com.joalib.DTO.memberinfoDTO;

public class FaultDAO {
	
	SqlSessionFactory sqlfactory;
	
	////////////////////// ��Ŭ������ //////////////////////
	
	private static FaultDAO instance;
	
	//static�� �ݵ��! �پ���Ѵ�. ���� ����
	public static FaultDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (FaultDAO.class) {
				instance = new FaultDAO();
			}
		}
		return instance;
	}
	
	public FaultDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
		} catch (IOException e) {
			e.printStackTrace();		
			}		
	}	
	
	////////////////////////////////////////////////////////////////
	
	public int faultWrite(FaultDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("faultPostInsert", dto);		
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	
	public FaultDTO faultPageRead(int fault_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		FaultDTO dto = sqlsession.selectOne("faultPostRead", fault_no);
		sqlsession.commit();
		sqlsession.close();	
		
		return dto;
	}
	public List<FaultDTO> faultListView() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<FaultDTO> dto = sqlsession.selectList("faultListView");
		sqlsession.commit();
		sqlsession.close();	
		
		return dto;
	}
	
	public int faultDelete(String fault_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.delete("faultPostDelete", fault_no);
		sqlsession.commit();
		sqlsession.close();	
		return i;
	}
	
	public int faultUpdate(FaultDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("faultChange", dto);
		sqlsession.commit();
		sqlsession.close();	
		return i;
	}

}
