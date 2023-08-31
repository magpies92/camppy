<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/delete.jsp</title>
</head>
<body>
<%
// delete.jsp?num=1
// num=1 사용자가 선택한 정보를 http가 들고와서 서버에 request 에 저장
// request num 가져와서 -> int num 변수에 저장
int review_id= Integer.parseInt(request.getParameter("review_id"));
// 1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 디비 연결
String dbUrl="jdbc:mysql://itwillbs.com:3306/c1d2304t3";
String dbUser="c1d2304t3";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 문자열 -> sql구문 변경 
// delete from board where num=?
String sql = "delete from review where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, review_id);
// 4단계 sql구문 실행	
pstmt.executeUpdate();
// list.jsp이동
response.sendRedirect("list.jsp");
%>
</body>
</html>

