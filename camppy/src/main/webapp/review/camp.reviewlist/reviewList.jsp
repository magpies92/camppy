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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        //세션에서 로그인 정보 및 캠프 아이디를 가져오기
//         String id = (String) session.getAttribute("id");
//   	   int camp_id = (int)session.getAttribute("camp_id");
    String id = "ksb"; //임의의 id 설정중
    int camp_id = 2; // 임의의 camp_id 설정중
    %>
    <div class="reviewTop">
        <div class="reviewCount">이용후기</div>
        <input type="button" value="글쓰기" onclick="popupInsert();" class="buttonInsert" />
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
        String sql = "select * from review where camp_id =?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, camp_id);
        //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
        ResultSet rs = pstmt.executeQuery();
    %>

    <%
        //5단계 : while  행 접근 -> 데이터 있으면 true 
        //-> 글번호 글쓴이 제목 조회수 글쓴날짜 출력 
        while (rs.next()) {
    %>
    <div class="campinfoRow" data-review-id="<%=rs.getInt("review_id")%>">
        <div class="campinfoStar">
            <div class="campinfoStar1">
                ★
                <%=rs.getFloat("rating")%></div>
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
        <button type="button" onclick="updateRow(this);" class="buttonUpdate"
            <%if (id == null || id.isEmpty() || !id.equals(rs.getString("created_by"))) {%>
            style="display: none;" <%}%>>
            <div class="update">수정</div>
        </button>
        <button type="button" onclick="deleteRow(this);" class="buttonDel"
            <%if (id == null || id.isEmpty() || !id.equals(rs.getString("created_by"))) {%>
            style="display: none;" <%}%>>
            <div class="del">삭제</div>
        </button>
        <div class="reviewContents">
            <div class="reviewContents1"><%=rs.getString("content").replace("\n", "<br>")%></div>
            <textarea class="editContent" style="display: none;"></textarea>
            <button class="buttonSave" style="display: none;" onclick="saveContent(this);">저장</button>
            <br>
            <button class="buttonCancel" style="display: none;" onclick="cancelEdit(this);">취소</button>
        </div>
    </div>
    <%
        }
    %>

    <script>
        function popupInsert() {
            var url = "../insert/reviewInsert.jsp";
            var name = "reviewInsert";
            var option = "width = 710, height = 730, top= 100, left= 500";
            window.open(url, name, option);
        }

        function updateRow(button) {
            var row = button.closest(".campinfoRow");
            var contentsElement = row.querySelector(".reviewContents1");
            var editContent = row.querySelector(".editContent");
            var buttonSave = row.querySelector(".buttonSave");
            var buttonCancel = row.querySelector(".buttonCancel"); // 수정된 부분

            contentsElement.style.display = "none";
            editContent.style.display = "block";
            buttonSave.style.display = "block";
            buttonCancel.style.display = "block"; // 수정된 부분

            // 현재 내용을 텍스트 입력 필드에 설정
            editContent.value = contentsElement.textContent;

            // 수정 버튼 비활성화
            button.disabled = true;

            editContent.focus();

            var maxLength = 130;

            editContent.addEventListener("input", function() {
                var currentLength = editContent.value.length;

                if (currentLength > maxLength) {
                    // 최대 글자 수를 초과한 경우 현재 입력을 최대 글자 수로 자르기
                    editContent.value = editContent.value.slice(0, maxLength);
                }
            });
        }

        function saveContent(button) {
            var row = button.closest(".campinfoRow");
            var reviewId = row.querySelector(".reviewNum1").textContent;
            var contentsElement = row.querySelector(".reviewContents1");
            var editContent = row.querySelector(".editContent");
            var buttonSave = row.querySelector(".buttonSave");
            var buttonCancel = row.querySelector(".buttonCancel"); // 수정된 부분

            // 수정한 내용을 가져와서 서버로 전송
            var updatedContent = editContent.value;

            if (updatedContent.trim() === "") {
                alert("내용을 입력하세요.");
                return;
            }

            $.ajax({
                url : "../update/updateReviewList.jsp",
                method : "POST",
                data : {
                    review_id : reviewId,
                    updated_content : updatedContent
                },
                success : function(response) {
                    if (response.trim() === "success") {
                        // 수정 성공 시 UI 업데이트
                        contentsElement.textContent = updatedContent;
                        contentsElement.style.display = "block";
                        editContent.style.display = "none";
                        buttonSave.style.display = "none";
                        buttonCancel.style.display = "none"; // 저장 성공 시 취소 버튼도 숨김

                        // 수정 버튼 활성화
                        row.querySelector(".buttonUpdate").disabled = false;
                    } else {
                        alert("수정 실패");
                    }
                },
                error : function() {
                    alert("오류 발생");
                }
            });
        }

        function cancelEdit(button) {
            var row = button.closest(".campinfoRow");
            var contentsElement = row.querySelector(".reviewContents1");
            var editContent = row.querySelector(".editContent");
            var buttonSave = row.querySelector(".buttonSave");
            var buttonCancel = row.querySelector(".buttonCancel");

            if (contentsElement && editContent && buttonSave && buttonCancel) {
                contentsElement.style.display = "block";
                editContent.style.display = "none";
                buttonSave.style.display = "none";
                buttonCancel.style.display = "none";

                // 수정 버튼 활성화
                row.querySelector(".buttonUpdate").disabled = false;
            } else {
                console.error("One or more elements not found.");
            }
        }

        function deleteRow(button) {
            var row = button.closest(".campinfoRow");
            var reviewId = row.querySelector(".reviewNum1").textContent;

            console.log("Review ID:", reviewId);

            if (confirm("정말로 삭제하시겠습니까?")) {
                $.ajax({
                    url : "deleteReview.jsp",
                    method : "POST",
                    data : {
                        review_id : reviewId
                    },
                    success : function(response) {
                        if (response.trim() === "success") {
                            row.remove();
                        } else {
                            alert("삭제 실패");
                        }
                    },
                    error : function() {
                        alert("오류 발생");
                    }
                });
            }
        }
    </script>

</body>

</html>
