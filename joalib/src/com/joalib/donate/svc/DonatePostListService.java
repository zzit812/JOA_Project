package com.joalib.donate.svc;

import java.util.ArrayList;
import java.util.List;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.DonateDTO;

public class DonatePostListService {
	public ArrayList<DonateDTO>[] donatePostListPaging() {
		DonateDAO dao = DonateDAO.getinstance();
		List<DonateDTO> list = dao.donatePostList();
		
		int postCount = 10;
        int count = 0;
        int pageTotalCount = list.size() / postCount;	
        
        if(list.size() % postCount != 0) {
            pageTotalCount++;	}
        
		 ArrayList[] totalPage = new ArrayList[pageTotalCount];
		        
		 	for(int i = 0; i < pageTotalCount; i++)  {
	            ArrayList<DonateDTO> page = new ArrayList<DonateDTO>();	            
	            for(int j = 0; j < postCount; j++) {            	
	                page.add((DonateDTO)list.get(count));
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
		 	
        //System.out.println(totalPage[0].get(0));
        return totalPage;
		
	}
}
