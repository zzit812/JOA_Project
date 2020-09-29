package com.joalib.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joalib.DTO.DonateDTO;
import com.joalib.DTO.Donate_ApplicationDTO;
import com.joalib.DTO.member_alarmDTO;

public class DonateDAO {
	
SqlSessionFactory sqlfactory;
	
	////////////////////// ��Ŭ������ //////////////////////
	
	private static DonateDAO instance;
	
	//static�� �ݵ��! �پ���Ѵ�. ���� ����
	public static DonateDAO getinstance() {
		if (instance == null) {	// >DAO ��ü ������ �־�?
			synchronized (DonateDAO.class) {
				instance = new DonateDAO();
			}
		}
		return instance;
	}
	
	public DonateDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml ����
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis�� �����ϴ� ����.				
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
	
	public int donateDealChange(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("donateDealChange", donate_no);
		sqlsession.commit();
		sqlsession.close();
		
		return i;
	}
	public List<DonateDTO> myDonatePostSelect(String member_id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<DonateDTO> list = sqlsession.selectList("myDonatePost", member_id);
		sqlsession.commit();
		sqlsession.close();
		
		return list;
	}
	
	public int DonateApllcationSelect (String member_id, int donate_no) {
		//해당게시물에 member_id가 신청/미신청 판단
		Donate_ApplicationDTO dto = new Donate_ApplicationDTO();
		dto.setDonate_application_member(member_id);
		dto.setDonate_no(donate_no);
		SqlSession sqlsession = sqlfactory.openSession();
		int count = sqlsession.selectOne("donateApplicationSelect", dto);
		sqlsession.commit();
		sqlsession.close();	
		return count;
	}
	public int DonateApplicationAdd(Donate_ApplicationDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("donateApplicationAlarm",dto);	//게시글 작성자에게 알람 추가
		int i = sqlsession.insert("donateApplicationAdd", dto);	//Add
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	public int DonateApplicationDel(Donate_ApplicationDTO dto) {
		//나눔 신청 취소
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("donateApplicationAlarmDel", dto);	//쪽지를 보냈을때 취소하면, 쪽지까지 삭제
		sqlsession.delete("donateApplicationAlarmDel2", dto);	//글쓴이에게 간 알람까지 취소
		int i = sqlsession.delete("donateApplicationDel", dto);	//del
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	public int DonateApplicationCount(int donate_no) {
		//해당 게시물에 거래 신청한 회원의 수
		SqlSession sqlsession = sqlfactory.openSession();
		int count = sqlsession.selectOne("DonateApplicationCount", donate_no);
		sqlsession.commit();
		sqlsession.close();
		return count;	
	}
	public List<String> DonateApplicationMemberList(int donate_no) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<String> memberList = sqlsession.selectList("DonateApplicationMemberList", donate_no);
		sqlsession.commit();
		sqlsession.close();
		return memberList;
	}
	public int DonateMessageAlarm(member_alarmDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.insert("donateMessageAlarm", dto);
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	public int DonataeMessageChecked(member_alarmDTO dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		int i = sqlsession.update("donateMessageChecked", dto);	//쪽지를 보냈던 모든 회원들에게서 알림을 끔
		if(i > 0) {
			i = sqlsession.update("donateConditionChange", dto);	//거래중 > 거래완료 로 변경하고 donate_buyer에 member_id를 기입
		}
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	

}
