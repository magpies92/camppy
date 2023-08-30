<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/logout.jsp</title>
</head>
<body>
<%
//로그인 했다 정보를 세션에 저장 
//로그아웃 => 세션을 삭제 => 서버 클라이언트 연결 완전히 종료
session.invalidate();
%>
<script type="text/javascript">
alert("로그아웃");
location.href="main.jsp";
</script>
</body>
</html>

