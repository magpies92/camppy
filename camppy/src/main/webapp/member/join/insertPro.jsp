<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<%
// http://localhost:8080/webProject/jsp3/insertPro.jsp?id=kim&pass=123&name=홍길동
//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
//request 한글처리
request.setCharacterEncoding("utf-8");
// request id, pass,name 가져와서 -> 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
// 회원가입날짜 -> 시스템날짜 java.sql.Timestamp
Timestamp date=
    new Timestamp(System.currentTimeMillis());
String nick = request.getParameter("nick");
String phone = request.getParameter("phone");

// 1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 디비 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 문자열 -> sql구문 변경
String sql = "insert into members(id,pass,name,date,nick,phone) values(?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);      //(물음표 순서,값)
pstmt.setString(2, pass); 
pstmt.setString(3, name);
pstmt.setTimestamp(4, date);
pstmt.setString(5, nick);
pstmt.setString(6, phone);
// 4단계 sql구문 실행
pstmt.executeUpdate();

// 로그인 이동(하이퍼링크)
response.sendRedirect("login.jsp");
%>
<a href="login.jsp">로그인 페이지 이동</a>

<script type="text/javascript">
alert("로그인 페이지 이동");
location.href="login.jsp";
</script>

</body>
</html>