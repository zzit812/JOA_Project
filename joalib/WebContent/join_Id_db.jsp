<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<%
    request.setCharacterEncoding("UTF-8");
    //아이디 값을 받아온다.  
    String member_id = request.getParameter("id");


    Connection conn = null;
    Statement stmt = null;


     try {
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("Jdbc:mysql://localhost:3306/joalib2020","joalib2020","joa2020!");
       if(conn == null)
         throw new Exception("데이터베이스에 연결할 수 없습니다.");
       stmt = conn.createStatement();

      
      String sql = "select member_id from memberinfo where member_id='"+member_id+"';";
			ResultSet rs = stmt.executeQuery(sql);
      
      //////////////////////////////////////// 있을때
		if (rs.next()) {
        out.println("사용중인 아이디입니다.");
	  }else{
        out.println("사용 가능한 아이디입니다.");
      }
     } finally {
         try{
           stmt.close();
         } catch (Exception ignored) {

         }
         try{
           conn.close();
         } catch (Exception ignored){

         }
     }
    // ID를 데이터베이스로 확인해
    // 동일한 값이 있는지?
    // out.println("*사용가능한 아이디입니다"+id);
    %>
</body>
</html>
