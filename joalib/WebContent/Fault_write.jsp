<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글을 insert하는 페에지</title>
</head>
<body>
	<form action="faultWrite.fa" method="post" enctype="multipart/form-data" name="fuaultWriteForm">
	<!-- 필드 : (번호) 제목, 내용, 날짜(now()), 사진경로, id	 -->
		<input type="text" id="fault_title" name="fault_title" placeholder="제목"><br> <!-- 제목 -->
		<input type="file" id="fault_attach" name="fault_attach" /><br>
		<input type="text" id="fault_text" name="fault_text" placeholder="내용"><br><!-- 내용 -->
		<input type="hidden" name="member_id" value="<%= session.getAttribute("member_id") %>">
		<input type="submit" value="연결">
	</form>
</body>
</html>