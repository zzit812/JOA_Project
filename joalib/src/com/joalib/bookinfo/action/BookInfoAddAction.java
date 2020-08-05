package com.joalib.bookinfo.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.DTO.BookInfoDTO;
import com.joalib.board.action.dbAction;
import com.joalib.bookinfo.svc.BookInfoAddService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BookInfoAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//여기까지는 옴
		ActionForward forward= new ActionForward();
		BookInfoDTO bookBean = new BookInfoDTO();
		
		String realFolder="";
		String saveFolder="/abc";
		int fileSize=5*1024*1024; //5메가?
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);

		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		//화긴
		bookBean.setIsbn(multi.getParameter("isbn"));
		bookBean.setIsbn_pluscode(multi.getParameter("isbn_plus"));
		bookBean.setAuthor(multi.getParameter("author"));
		bookBean.setPublisher(multi.getParameter("publisher"));
		bookBean.setBook_title(multi.getParameter("book_title"));
		bookBean.setPub_date(multi.getParameter("pub_date"));
		bookBean.setBook_story(multi.getParameter("book_story"));
		
		bookBean.setBook_img(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));

		
//		System.out.println(bookBean.getAuthor());
//		System.out.println(bookBean.getBook_img()); 확인
		
		BookInfoAddService bookInfoAddService = new BookInfoAddService();

		bookInfoAddService.registArticle(bookBean);
		

		
		forward.setRedirect(true);
		forward.setPath("board.jsp");

		return forward;
	}
}
