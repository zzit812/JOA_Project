<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 도서추가 페이지</title>
<style type="text/css">

</style>
</head>
<body>

	<section id="writeForm">
		<h2>관리자용 도서추가 페이지</h2>
		<form action="bookInfoAdd.bk" method="post"
			enctype="multipart/form-data" name="boardform">
			<!-- enctype이 부분 없으면 파일 경로만 전송되고, 파일내용은 전송되지 않는다. -->
			<table>
				<tr>
					<td class="td_left"><label for="isbn">isbn</label></td>
					<td class="td_right"><input type="text" name="isbn"
						id="isbn" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="isbn_plus">isbn_plus</label></td>
					<td class="td_right"><input type="text" name="isbn_plus"
						id="isbn_plus" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="author">author</label></td>
					<td class="td_right"><input name="author" type="text"
						id="author" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="publisher">publisher</label></td>
					<td class="td_right"><input name="publisher" type="text"
						id="publisher" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="book_title">book_title</label></td>
					<td class="td_right"><input name="book_title" type="text"
						id="book_title" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="pub_date">pub_date</label></td>
					<td class="td_right"><input name="pub_date" type="text"
						id="pub_date" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="book_story">book_story</label></td>
					<td><textarea id="book_story" name="book_story"
					cols="40" rows="12" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for=book_img>book_img</label></td>
					<td class="td_right"><input name="book_img" type="file" id="book_img"
					accept=".gif, .jpg, .png, .jpeg" id="BOARD_FILE" required="required" /></td>
				</tr>
			</table>
			<b>이미지 gif,jpg,png,jpeg만 허용</b>
			<br/><br/><br/><br/>
			
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" />
			</section>
		</form>
</body>
</html>