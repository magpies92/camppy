<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String campLikeIdsParam = request.getParameter("campLikeIds");
if (campLikeIdsParam == null || campLikeIdsParam.isEmpty()) {
    out.print("empty"); // 파라미터가 없거나 비어있을 경우 "empty" 반환
} else {
    try {
        String[] campLikeIdArray = campLikeIdsParam.split("\\|"); // 파이프로 구분된 문자열을 배열로 분리

        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
        String dbUser = "c1d2304t3";
        String dbPass = "1234";
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        // 배열을 순회하면서 각 리뷰를 삭제
        for (String campLikeIdParam : campLikeIdArray) {
            int campLikeId = Integer.parseInt(campLikeIdParam);

            String deleteQuery = "DELETE FROM camp_like WHERE camp_like_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, campLikeId);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted == 0) {
                out.print("delete error"); // 삭제 실패 시 "delete error" 반환
                return;
            }
        }

        out.print("success"); // 모든 리뷰가 삭제되면 "success" 반환
        conn.close();
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.print("parsing error"); // 리뷰 ID를 정수로 파싱할 수 없는 경우 "parsing error" 반환
    } catch (Exception e) {
        e.printStackTrace();
        out.print("error: " + e.getMessage()); // SQL 예외 발생 시 오류 메시지를 포함하여 "error" 반환
    }
}
%>
