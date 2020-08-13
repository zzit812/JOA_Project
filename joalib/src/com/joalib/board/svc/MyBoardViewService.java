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
        List list = dao.myBoardView(member_id); //내가 쓴 글정보
        int postCount = 10; //글 10개씩 보이기
        int count = 0;
        int pageTotalCount = list.size() / postCount; //보여지는 페이지 수
        
        
        if(list.size() % postCount != 0)  //10개씩 나워서 나머지가 남으면,페이지수 한 장 추가
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
