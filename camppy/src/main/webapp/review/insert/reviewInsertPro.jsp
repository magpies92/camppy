<%@page import="java.awt.Window"%>
<%@page import="java.sql.Timestamp"%>
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
<title>reviewInsertPro.jsp</title>
</head>
<body>
<% 
// 사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
//request member_id, rating,content 가져와서 -> 변수에 저장
String member_id = request.getParameter("member_id");
int rating =  Integer.parseInt(request.getParameter("rating"));
String content = request.getParameter("content");
//리뷰 글번호
int review_id= 1;
//글쓴날짜 -> 시스템날짜 java.sql.Timestamp
Timestamp created_date= new Timestamp(System.currentTimeMillis());
int res_id= 1;

//1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계 디비 연결
String dbUrl="jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
String dbUser="c1d2304t3";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 -> sql select max(num) from review
String sql2 = "select max(review_id) from review";
PreparedStatement pstmt2=con.prepareStatement(sql2);
//4단계 실행 -> 결과 저장
ResultSet rs=pstmt2.executeQuery();
//5단계 다음행 접근 -> 데이터있음 true -> max(num) 열 가져와서 + 1
if(rs.next()){
	review_id=rs.getInt("max(review_id)")+1;
}
//3단계 문자열 -> sql구문 변경 insert into review 
String sql = "insert into review(review_id,member_id,rating,content,created_date,res_id) values(?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, review_id);      //(물음표 순서,값)
pstmt.setString(2, member_id); 
pstmt.setInt (3, rating);
pstmt.setString(4, content);
pstmt.setTimestamp(5, created_date);
pstmt.setInt (6, res_id);
//4단계 sql구문 실행
pstmt.executeUpdate();

 %> 
 <script> 
window.close();
</script>
</body>
</html>