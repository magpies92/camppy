<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/loginPro.jsp</title>
</head>
<body>
<%
//http://localhost:8080/webProject/jsp3/loginPro.jsp?id=kim&pass=123
//사용자가 입력한 정보(폼)를 http가 들고와서 서버에 request 에 저장
//request에 저장된 id, pass 가져와서 -> 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");

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
// out.println(pstmt);

//5단계 : if  행 접근 -> 데이터 있으면 true -> 아이디 비밀번호 일치 출력
//       else              없으면 false -> 아이디 비밀번호 틀림 출력
if(rs.next()){
	//true 아이디 비밀번호 일치 => main.jsp 이동
	// id값을 다음페이지로 전달(get방식 데이터 전달) 
// 	http://localhost:8080/webProject/jsp1/testPro1.jsp?id=kim&num=5
// 	http://localhost:8080/webProject/jsp3/main.jsp?id=kim
// 	response.sendRedirect("main.jsp?id="+id);
	
	// 로그인 했다는 표시 저장 => 페이지 상관이 로그인 표시가 유지 
	// 세션 내장객체 저장 : 페이지 상관없이 값이 유지
	//                   로그인 했다는 표시 값으로 사용
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
	
	%>
<%-- 	<%="아이디 비밀번호 일치"%> --%>
	<%
}else{
	//false 아이디 비밀번호 틀림, 뒤로이동
	%>
<%-- 	<%="아이디 비밀번호 틀림"%> --%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>


