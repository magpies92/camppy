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
<title>reviewPro.jsp</title>
</head>
<body>
<% 
// 사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
//request member_id, revie_rate,content 가져와서 -> 변수에 저장
String member_id = request.getParameter("member_id");
String review_rateP = request.getParameter("review_rate");
if (review_rateP != null && !review_rateP.isEmpty()) {
    try {
        int review_rate = Integer.parseInt(review_rateP);
        
        // review_rate를 사용하여 원하는 처리 수행
    } catch (NumberFormatException e) {
        // 정수로 변환 중 오류 발생 시 예외 처리 로직 작성
        e.printStackTrace();
    }
} else {
    // review_rateP가 null이거나 비어있는 경우에 대한 처리
}
int review_rate = Integer.parseInt(review_rateP);
String content = request.getParameter("content");
//리뷰 글번호
int review_id= 1;
review_rate = 0;
//글쓴날짜 -> 시스템날짜 java.sql.Timestamp
Timestamp created_date= new Timestamp(System.currentTimeMillis());
//1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계 디비 연결
String dbUrl="jdbc:mysql://itwillbs.com:3306/c1d2304t3";
String dbUser="c1d2304t3";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 -> sql select max(review_id) from review
String sql2 = "select max(review_id) from review";
PreparedStatement pstmt2=con.prepareStatement(sql2);
//4단계 실행 -> 결과 저장
ResultSet rs=pstmt2.executeQuery();
//5단계 다음행 접근 -> 데이터있음 true -> max(review_id) 열 가져와서 + 1
if(rs.next()){
	review_id=rs.getInt("max(review_id)")+1;
}
//3단계 문자열 -> sql구문 변경 insert into review 
String sql = "insert into review(review_id,member_id,review_rate,content,created_date) values(?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, review_id);      //(물음표 순서,값)
pstmt.setString(2, member_id); 
pstmt.setInt (3, review_rate);
pstmt.setString(4, content);
pstmt.setTimestamp(5, created_date);
//4단계 sql구문 실행
pstmt.executeUpdate();
// //list.jsp이동
// response.sendRedirect("list.jsp");
%>

%>
</body>
</html>