package com.joalib.fault.svc;

import java.util.ArrayList;
import java.util.List;

import com.joalib.DAO.FaultDAO;
import com.joalib.DTO.FaultDTO;

public class myFaultPostViewService {
	
	public ArrayList<FaultDTO>[] myFaultPostView(String member_id) {
		
		FaultDAO dao = FaultDAO.getinstance();
		
		List<FaultDTO> myFaultList = dao.myFaultPostViewSelect(member_id);
		
		//
		int postCount = 10;	//최대 게시물 갯수
        int count = 0;
        int pageTotalCount = myFaultList.size() / postCount;	
        
        if(myFaultList.size() % postCount != 0) {
            pageTotalCount++;	}
        
        ArrayList<FaultDTO>[] totalPage = new ArrayList[pageTotalCount];
        
        for(int i = 0; i < pageTotalCount; i++)  {
            ArrayList<FaultDTO> page = new ArrayList<FaultDTO>();
            
            for(int j = 0; j < postCount; j++) {            	
                page.add((FaultDTO)myFaultList.get(count));
                if(count == (myFaultList.size()-1)) {
                    break;}
                count++;
            }
            if(page == null) {
                System.out.println("NULL error");
            }else {
                totalPage[i] = page;
            }
	   }
        return totalPage;
        
		
	}

}
