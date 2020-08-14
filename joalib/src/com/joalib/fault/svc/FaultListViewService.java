package com.joalib.fault.svc;

import java.util.ArrayList;
import java.util.List;

import com.joalib.DAO.FaultDAO;
import com.joalib.DTO.BoardDTO;
import com.joalib.DTO.FaultDTO;

public class FaultListViewService {
	
	public ArrayList<FaultDTO>[] faultList() {
		
		FaultDAO dao = FaultDAO.getinstance();
		List<FaultDTO> list = dao.faultListView();
		
		int postCount = 10;
        int count = 0;
        int pageTotalCount = list.size() / postCount;		
        
        if(list.size() % postCount != 0) {
            pageTotalCount++;	}
        
		 ArrayList[] totalPage = new ArrayList[pageTotalCount];
		        
		 	for(int i = 0; i < pageTotalCount; i++)  {
	            ArrayList<FaultDTO> page = new ArrayList<FaultDTO>();
	            
	            for(int j = 0; j < postCount; j++) {            	
	                page.add((FaultDTO)list.get(count));
	                if(count == (list.size()-1)) {
	                    break;}
	                count++;
	            }
	            if(page == null) {
	                System.out.println("NULL error");
	            }else {
	                totalPage[i] = page;
	            }
		   }
		 	//나온건 모든 페이지(안의 게시글들)가 담겨있는 배열 totalPage;
		 	
        
        return totalPage;
	}

}
