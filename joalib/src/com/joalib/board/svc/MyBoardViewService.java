package com.joalib.board.svc;

import com.joalib.DAO.DAO;
import com.joalib.DTO.BoardDTO;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class MyBoardViewService{
    public ArrayList[] myBoardPost(String member_id) {
        DAO dao = new DAO();
        DAO.getinstance();
        List list = dao.myBoardView(member_id);
        int postCount = 10;
        int count = 0;
        int pageTotalCount = list.size() / postCount;
        
        
        if(list.size() % postCount != 0)
            pageTotalCount++;
        
        ArrayList totalPage[] = new ArrayList[pageTotalCount];
        
        for(int i = 0; i < pageTotalCount; i++)  {
            ArrayList page = new ArrayList();
            for(int j = 0; j < postCount; j++) {
                page.add((BoardDTO)list.get(count));
                if(count == list.size() - 1)
                    break;
                count++;
            }

            if(page == null)
                System.out.println("NULL error");
            else
                totalPage[i] = page;
        }

        return totalPage;
    }
}
