<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MySQL 연결 드라이버 테스트</title>
</head>
<body>
	<h1>MySQL 연결 드라이버 테스트</h1>
	<%
		String jdbcUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3";
		String dbId = "c1d2304t3";
		String dbPwd = "1234";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			out.println("MySQL 연결 성공");
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
</body>
</html>