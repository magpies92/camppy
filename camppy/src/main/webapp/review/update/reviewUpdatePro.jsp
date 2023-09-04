<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewUpdatePro.jsp</title>
</head>
<body>
<%
//http://localhost:8080/webProject/jsp4/
// updatePro.jsp?num=1&name=kim&subject=제목&content=내용
//사용자가 수정한 정보를 http가 들고와서 서버에 request 에 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
//수정될 값만 가져와서 -> 변수에 저장
int rating= Integer.parseInt(request.getParameter("rating"));
int review_id= Integer.parseInt(request.getParameter("review_id"));
String content = request.getParameter("content");



//1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 디비 연결
String dbUrl="jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
String dbUser="c1d2304t3";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 문자열 -> sql구문 변경 
//update board set subject=?, content=? where num=? 
String sql = "update review set rating=?, content=? where review_id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, rating);
pstmt.setString(2, content);
pstmt.setInt(3, review_id);
// 4단계 sql구문 실행	
pstmt.executeUpdate();
// list.jsp이동
response.sendRedirect("reviewList.jsp");
%>
</body>
</html>

