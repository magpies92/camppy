<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
int reviewId = Integer.parseInt(request.getParameter("review_id"));

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
    String dbUser = "c1d2304t3";
    String dbPass = "1234";
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

    String deleteQuery = "DELETE FROM review WHERE review_id = ?";
    pstmt = conn.prepareStatement(deleteQuery);
    pstmt.setInt(1, reviewId);

    int rowsDeleted = pstmt.executeUpdate();

    if (rowsDeleted > 0) {
        out.print("success"); // 성공 시 "success" 출력
    } else {
        out.print("error"); // 실패 시 "error" 출력
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("error");
} finally {
    try { pstmt.close(); } catch (Exception e) { }
    try { conn.close(); } catch (Exception e) { }
}
%>
