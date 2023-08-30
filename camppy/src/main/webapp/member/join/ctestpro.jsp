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
request.setCharacterEncoding("utf-8");
String member_id = request.getParameter("member_id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
Timestamp created_date=
    new Timestamp(System.currentTimeMillis());
String nickname = request.getParameter("nickname");
String phonenum = request.getParameter("phonenum");
 
Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl="jdbc:mysql://itwillbs.com:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser="c1d2304t3";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "insert into members(member_id,pass,name,created_date,nickname,phonenum) values(?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, member_id);
pstmt.setString(2, pass); 
pstmt.setString(3, name);
pstmt.setTimestamp(4, created_date);
pstmt.setString(5, nickname);
pstmt.setString(6, phonenum);

pstmt.executeUpdate();


response.sendRedirect("login.jsp");
%>
<a href="login.jsp">로그인 페이지 이동</a>

<script type="text/javascript">
alert("로그인 페이지 이동");
location.href="login.jsp";
</script>

</body>
</html>