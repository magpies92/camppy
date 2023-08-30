<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/delete.jsp</title>
</head>
<body>
<h1>회원삭제</h1>
<%
//로그인 정보를 session에서 가져오기
String id=(String)session.getAttribute("id");
%>
<form action="deletePro.me" method="post">
아이디 : 
<input type="text" name="id" value="<%=id%>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="회원삭제">
</form>
</body>
</html>

