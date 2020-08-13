package com.joalib.loan.action;

import java.sql.Date;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.LoanDTO;
import com.joalib.loan.svc.BookLoanService;


public class BookLoanAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoanDTO dto = new LoanDTO();
		ActionForward forward= new ActionForward();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat return_ = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		cal.add(Calendar.DATE, 14);
		String return_duedate = return_.format(cal.getTime());
		
		String loan_book = request.getParameter("isbn");
	
		HttpSession session = request.getSession(false);
		String member_id = (String)session.getAttribute("member_id");
		String loan_condition = "����";
		
		
		if(member_id==null) {
			//�α��� �� �̿� ���� �մϴ�.
			forward.setPath("userLogin.html");
		}else {
			dto.setLoan_book(loan_book); //ISBN
			dto.setMember_id(member_id); //������̵�
			dto.setReturn_duedate(return_duedate); //�ݳ�������, ���ó�¥ + 14��
			dto.setLoan_condition(loan_condition); //�������
			
			BookLoanService bookLoanService = new BookLoanService();
			bookLoanService.loan(dto);
			
			
			
			forward.setPath("book_search.jsp");
		}
		
		return forward;
	}

}
