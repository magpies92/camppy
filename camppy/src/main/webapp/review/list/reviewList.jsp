<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./reviewList.css" />

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
}
</style>
<title>reviewList</title>
</head>

<body>
	<%
	//세션에서 로그인 정보를 가져오기
	String id = (String) session.getAttribute("id");
	%>
	<div class="reviewTop">
		<div class="reviewCount">이용후기</div>
		<input type="button" value="글쓰기" onclick="popupInsert();" class="buttonInsert"/>
		
	</div>
	<%
	//1단계 JDBC 프로그램 가져오기 
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계 디비 연결
	String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
	String dbUser = "c1d2304t3";
	String dbPass = "1234";
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// 3단계 문자열 -> sql구문 변경
	//  select * from board 
	String sql = "select * from review";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
	ResultSet rs = pstmt.executeQuery();
	%>

	<%
	//5단계 : while  행 접근 -> 데이터 있으면 true 
	//-> 글번호 글쓴이 제목 조회수 글쓴날짜 출력 
	while (rs.next()) {
	%>


	<div class="campinfoRow">
		<div class="campinfoStar">
			<div class="campinfoStar1">
				★
				<%=rs.getFloat("review_rate")%></div>
		</div>
		<div class="reviewNum">
			<div class="reviewNum1"><%=rs.getInt("review_id")%></div>
		</div>
		<div class="reviewName">
			<div class="reviewName1"><%=rs.getString("created_by")%></div>
		</div>
		<div class="reviewDate">
			<div class="reviewDate1"><%=rs.getTimestamp("created_date")%></div>
		</div>
		<button type="button" onclick="popupUpdate();" class="buttonUpdate">
			<div class="del">수정</div>
		</button>
		<button type="button" onclick="popupDel();" class="buttonDel">
			<div class="del">삭제</div>
		</button>
		<div class="reviewContents">
			<div class="reviewContents1"><%=rs.getString("content")%></div>
		</div>
	</div>

	<%
	}
	%>

	<script>
		function popupInsert() {
			var url = "../insert/reviewInsert.jsp";
			var name = "reviewInsert";
			var option = "width = 710, height = 730, top= 100, left= 500"
			window.open(url, name, option);
		}// 인서트 팝업창 불러오기 기능

		function popupUpdate() {
			var url = "reviewUpdate.jsp";
			var name = "reviewUpdate";
			var option = "width = 710, height = 730, top= 100, left= 500"
			window.open(url, name, option);
		}// 수정 팝업창 불러오기 기능

		function popupDel() {
			var url = "popupDel.jsp";
			var name = "reviewDel";
			var option = "width = 400, height = 120, left=500px"
			window.open(url, name, option);
		}// 삭제 팝업창 불러오기 기능
	</script>

</body>

</html>
