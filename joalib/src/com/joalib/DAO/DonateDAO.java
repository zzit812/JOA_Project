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
	
	////////////////////// 占쏙옙클占쏙옙占쏙옙占쏙옙 //////////////////////
	
	private static DonateDAO instance;
	
	//static占쏙옙 占쌥듸옙占�! 占쌕억옙占쏙옙磯占�. 占쏙옙占쏙옙 占쏙옙占쏙옙
	public static DonateDAO getinstance() {
		if (instance == null) {	// >DAO 占쏙옙체 占쏙옙占쏙옙占쏙옙 占쌍억옙?
			synchronized (DonateDAO.class) {
				instance = new DonateDAO();
			}
		}
		return instance;
	}
	
	public DonateDAO(){	
		try {
			Reader reader = Resources.getResourceAsReader("com/joalib/DAO/mybatis_test-config.xml");		//xml 占쏙옙占쏙옙
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);	//batis占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쏙옙.				
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
		int i = sqlsession.delete("donatePostDelete3", donate_no);
		i = sqlsession.delete("donatePostDelete2", donate_no);
		i = sqlsession.delete("donatePostDelete", donate_no);
		System.out.println("중고도서 나눔 삭제 : "+donate_no);
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
		//�빐�떦寃뚯떆臾쇱뿉 member_id媛� �떊泥�/誘몄떊泥� �뙋�떒
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
		sqlsession.insert("donateApplicationAlarm",dto);	//寃뚯떆湲� �옉�꽦�옄�뿉寃� �븣�엺 異붽�
		int i = sqlsession.insert("donateApplicationAdd", dto);	//Add
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	public int DonateApplicationDel(Donate_ApplicationDTO dto) {
		//�굹�닎 �떊泥� 痍⑥냼
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("donateApplicationAlarmDel", dto);	//履쎌�瑜� 蹂대깉�쓣�븣 痍⑥냼�븯硫�, 履쎌�源뚯� �궘�젣
		sqlsession.delete("donateApplicationAlarmDel2", dto);	//湲��벖�씠�뿉寃� 媛� �븣�엺源뚯� 痍⑥냼
		int i = sqlsession.delete("donateApplicationDel", dto);	//del
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	public int DonateApplicationCount(int donate_no) {
		//�빐�떦 寃뚯떆臾쇱뿉 嫄곕옒 �떊泥��븳 �쉶�썝�쓽 �닔
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
		int i =0;
		int donate_no = Integer.parseInt(dto.getAlarm_etc());
		//
		SqlSession sqlsession = sqlfactory.openSession();
		i = sqlsession.update("donateMessageChecked", dto);	//(도서 나눔 받는 쪽 사람의)알림을 1로 바꿈
		i = sqlsession.update("donateConditionChange", dto);	//게시글의 상태를 '거래완료'로 변경
		i = sqlsession.insert("donateCompletePoint", donate_no);	//(도서 나눔을 하는 회원의)포인트 지급
		sqlsession.commit();
		sqlsession.close();
		return i;
	}
	

}
