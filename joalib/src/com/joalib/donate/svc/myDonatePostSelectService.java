package com.joalib.donate.svc;

import java.util.ArrayList;
import java.util.List;

import com.joalib.DAO.DonateDAO;
import com.joalib.DTO.DonateDTO;
import com.joalib.DTO.FaultDTO;

public class myDonatePostSelectService {

	public ArrayList<DonateDTO>[] myDonatePostSvc(String member_id) {
		DonateDAO dao = DonateDAO.getinstance();
		List<DonateDTO> list = dao.myDonatePostSelect(member_id);
		
		//
		int postCount = 10;	//최대 게시물 갯수
        int count = 0;
        int pageTotalCount = list.size() / postCount;	
        
        if(list.size() % postCount != 0) {
            pageTotalCount++;	}
        
        ArrayList<DonateDTO>[] totalPage = new ArrayList[pageTotalCount];
        
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
        return totalPage;
		
		
		
	}
}
