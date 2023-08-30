<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
</head>
<body>
<%
//main.jsp?id=kim get방식으로 http가 들고와서 서버에 request 에 저장
//request에 저장된 id 가져와서 -> 변수에 저장
// String id = request.getParameter("id");

// 로그인 했다는 표시 값(세션 저장)=> 세션값 을 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면 (세션값이 null이면 ,로그인정보가 없으면) 
//  =>  login.jsp 이동
if(id==null){
	response.sendRedirect("login.me");
}
%>
<h1>member/main.jsp</h1>
<%=id %>님 로그인 하셨습니다.<a href="logout.me">로그아웃</a><br>
<a href="info.me">회원정보조회</a><br>
<a href="update.me">회원정보수정</a><br>
<a href="delete.me">회원정보삭제</a><br>

<%
//세션값이 있으면
if(id != null){
	//"admin" 관리자 이면 => 회원목록 보기 
	// equals() 문자열 비교 => 기억장소 안에 값을 비교 일치하면 => true
	 if(id.equals("admin")){
		%>
<a href="list.me">회원정보목록</a><br>		
		<% 
	 }
}
%>

<a href="write.bo">게시판 글쓰기</a><br>
<a href="list.bo">게시판 글목록</a><br>

</body>
</html>

