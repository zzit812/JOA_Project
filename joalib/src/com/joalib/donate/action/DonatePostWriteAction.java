package com.joalib.donate.action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.DonateDTO;
import com.joalib.donate.svc.DonatePostWriteService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DonatePostWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,		
		
		String uploadPath = request.getRealPath("donateImage");		
		int size = 10*1024*1024;	//�뷮 ��û�� ��뷮�� ������ źź�ؾ��Ѵ�. 10*1024*1024 : 10�ް�
		String filename="";
		String origfilename="";		
		String donate_title="";
		String donate_text="";
		String member_id="";		
		
		try{
			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
			Enumeration files=multi.getFileNames();	//file�� �̸��� �����ðž�.
			
			//������ �޾ƿ���
			donate_title = multi.getParameter("donate_title");
			donate_text = multi.getParameter("donate_text");
			member_id = multi.getParameter("member_id");			
			
			String file1 =(String)files.nextElement();	
			filename=multi.getFilesystemName(file1);	//�̰��� DB�� �� ���� �̸�
			origfilename= multi.getOriginalFileName(file1);
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		DonateDTO dto = new DonateDTO();
		dto.setDonate_title(donate_title);
		dto.setDonate_text(donate_text);
		dto.setMember_id(member_id);
		dto.setDonate_attach(filename);
		
		DonatePostWriteService svc = new DonatePostWriteService();
		boolean isSuccess = svc.postWrite(dto);
		
		if(isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Donate_list.jsp");
		}		
		
		return forward;
	}
	
	

}
