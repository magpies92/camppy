<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/list.jsp</title>
</head>
<body>
<h1>회원목록</h1>
<%
//세션에서 로그인 정보를 가져오기
String id=(String)session.getAttribute("id");

if(id == null){
	//로그인 안함
	response.sendRedirect("login.me");
}else{
	//로그인 함 => admin이 아니면 main.jsp
	if(!(id.equals("admin"))){
		response.sendRedirect("main.me");
	}
}


List<MemberDTO> memberList =
       (List<MemberDTO>)request.getAttribute("memberList");
%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
for(int i=0;i<memberList.size();i++){
	MemberDTO memberDTO = memberList.get(i);
	%>
<tr><td><%=memberDTO.getId() %></td>
    <td><%=memberDTO.getPass() %></td>
    <td><%=memberDTO.getName() %></td>
    <td><%=memberDTO.getDate() %></td></tr>	
	<%
}
%>

</table>
</body>
</html>



