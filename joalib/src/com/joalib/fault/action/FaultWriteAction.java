package com.joalib.fault.action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.FaultDTO;
import com.joalib.fault.svc.FaultWriteService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FaultWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;		
		ServletContext context = request.getServletContext();	//���� �������� servletContext�� �޾ƿ���,		
		
		String uploadPath = request.getRealPath("faultImage");		
		int size = 10*1024*1024;	//�뷮 ��û�� ��뷮�� ������ źź�ؾ��Ѵ�. 10*1024*1024 : 10�ް�
		String filename="";
		String origfilename="";		
		String fault_title="";
		String fault_text="";
		String member_id="";		
		
		try{
			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
			Enumeration files=multi.getFileNames();	//file�� �̸��� �����ðž�.
			
			//������ �޾ƿ���
			fault_title = multi.getParameter("fault_title");
			fault_text = multi.getParameter("fault_text");
			member_id = multi.getParameter("member_id");			
			
			String file1 =(String)files.nextElement();	
			filename=multi.getFilesystemName(file1);	//�̰��� DB�� �� ���� �̸�
			origfilename= multi.getOriginalFileName(file1);
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		
		//System.out.println("fault_title: "+fault_title+"/ fault_text: "+fault_text+"/ member_id: "+member_id+"/ filename: "+filename);
		
		//DTO ����
		FaultDTO dto = new FaultDTO();
		dto.setFault_title(fault_title);
		dto.setFault_text(fault_text);
		dto.setMember_id(member_id);
		dto.setFault_attach(filename);
		System.out.println("Action: "+uploadPath+filename);
		
		FaultWriteService svc = new FaultWriteService();
		if(svc.faultWrite(dto)) {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardPointCharge.po");
		}		
		
		return forward;
	}
	
}
