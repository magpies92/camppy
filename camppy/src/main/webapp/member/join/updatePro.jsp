<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updatePro.jsp</title>
</head>
<body>
<%
//http://localhost:8080/webProject/jsp3/updatePro.jsp?id=kim&pass=123&name=홍길동
//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
//request 한글처리
request.setCharacterEncoding("utf-8");
//request id, pass,name 가져와서 -> 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String nick = request.getParameter("nick");

// 1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 디비 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 문자열 -> sql구문 변경
//  select * from members where id=폼입력id and pass=폼입력pass
String sql = "select * from members where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
ResultSet rs =pstmt.executeQuery();
//5단계 : if  행 접근 -> 데이터 있으면 true -> 아이디 비밀번호 일치
//       수정작업 3단계 update members set name=? where id=? 
//              4단계 실행
//              main.jsp 이동
//       else  데이터 없으면 false -> 아이디 비밀번호 틀림, 뒤로이동
if(rs.next()){
//  수정작업 3단계 update members set name=? where id=? 
//  4단계 실행
String sql2 = "update members set nick=? where id=?";
PreparedStatement pstmt2=con.prepareStatement(sql2);
pstmt2.setString(1, nick);  // setString 자동으로 'name' 붙음
pstmt2.setString(2, id);      //(물음표 순서,값)
// 4단계 sql구문 실행
pstmt2.executeUpdate();
	response.sendRedirect("main.jsp");
	%>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>

