<%@page import="com.itwillbs.domain.MemberDTO"%>
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
<title>member/info.jsp</title>
</head>
<body>
<h1>나의 정보 조회 info.jsp</h1>
<%
//info.jsp?id=kim get방식으로 http가 들고와서 서버에 request 에 저장
//request에 저장된 id 가져와서 -> 변수에 저장
// String id = request.getParameter("id");

// 로그인 한 사용자는 => session에 값이 저장되어 있음
// session 로그인 값을 가져와서 사용
// session에 저장될때 -> Object 업캐스팅 형변환 저장
// session 가져올때 -> 원래 자식형으로 되돌리는 다운캐스팅 명시적 형변환
// String id=(String)session.getAttribute("id");


// //1단계 JDBC 프로그램 가져오기 
// Class.forName("com.mysql.cj.jdbc.Driver");
// // 2단계 디비 연결
// String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
// String dbUser="root";
// String dbPass="1234";
// Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// // 3단계 문자열 -> sql구문 변경
// //  select * from members where id=폼입력id
// String sql = "select * from members where id=?";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);

// //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
// ResultSet rs =pstmt.executeQuery();

// //5단계 : if  행 접근 -> 데이터 있으면 true 
// //     -> 아이디 비밀번호 이름 가입날짜 출력
// if(rs.next()){
	
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
	
	%>
아이디 : <%=memberDTO.getId() %><br>
비밀번호 : <%=memberDTO.getPass() %><br>
이름 : <%=memberDTO.getName() %><br>
가입날짜 : <%=memberDTO.getDate() %><br>	
	<%
// }
%>
<a href="main.me">메인으로 이동</a>
</body>
</html>
