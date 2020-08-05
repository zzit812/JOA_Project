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

public class BookInfoAddAction implements dbAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//여기까지는 옴
		ActionForward forward=null;
		BookInfoDTO bookBean = null;
		
		String realFolder="";
		String saveFolder="/abc";
		int fileSize=5*1024*1024; //5메가
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);

		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());

		bookBean.setIsbn(request.getParameter("isbn"));
		bookBean.setIsbn(request.getParameter("isbn_plus"));
		bookBean.setIsbn(request.getParameter("author"));
		bookBean.setIsbn(request.getParameter("publisher"));
		bookBean.setIsbn(request.getParameter("book_title"));
		bookBean.setIsbn(request.getParameter("pub_date"));
		bookBean.setIsbn(request.getParameter("book_story"));
		
		bookBean.setBook_img(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		BookInfoAddService bookInfoAddService = new BookInfoAddService();
		boolean isWriteSuccess = bookInfoAddService.registArticle(bookBean);
		
		

		return forward;
	}
}
