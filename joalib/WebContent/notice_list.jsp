<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.joalib.notice.svc.NoticePostListService"%>
<%@ page import="com.joalib.DTO.NoticeDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	공지사항
	<%
	NoticePostListService svc = new NoticePostListService();
	List<NoticeDTO> list = svc.noticePostList();
	
	if(list.size() != 0){
		for(int i = 0 ; i < list.size(); i++){
	%>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<tr>
			<td><%= list.get(i).getNotice_no() %></td>
			<td><a
				href="noticeDetail.noti?noticeNo=<%= list.get(i).getNotice_no()%>"><%= list.get(i).getNotice_title() %></a></td>
			<td><%= list.get(i).getNotice_date() %></td>
		</tr>
	</table>
	<%}}else{
		out.print("no");
	} %>

</body>
</html>
