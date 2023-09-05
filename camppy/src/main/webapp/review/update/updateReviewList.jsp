<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
int reviewId = Integer.parseInt(request.getParameter("review_id"));
String updatedContent = request.getParameter("updated_content");

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
    String dbUser = "c1d2304t3";
    String dbPass = "1234";
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

    String updateQuery = "UPDATE review SET content = ?, last_modified_date = NOW(), last_modified_by = ? WHERE review_id = ?";
    pstmt = conn.prepareStatement(updateQuery);
    pstmt.setString(1, updatedContent);
    pstmt.setString(2, (String) session.getAttribute("id")); // Replace with your session attribute name for user ID
    pstmt.setInt(3, reviewId);

    int rowsUpdated = pstmt.executeUpdate();

    if (rowsUpdated > 0) {
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
