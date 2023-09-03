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
<link rel="stylesheet" href="./mypageReveiwList.css" />
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
<title>mypagereviewList</title>
</head>

<%
// 세션에서 로그인 정보를 가져오기
// String id = (String) session.getAttribute("id");
String id = "ksb"; // 임의의 id 값 "ksb" 설정
%>

<div class="reviewTop">
	<div class="reviewCount">리뷰</div>
<!-- 	<input type="button" value="글쓰기" onclick="popupInsert();" -->
<!-- 		class="buttonInsert" /> -->
		<button type="button" onclick="selectedDel();" class="selectDel"><div>선택삭제</div></button>
		<label class="selectAll"> <b>전체선택</b>&nbsp;<input type="checkbox"
			class="selectCheck" id="cboxAll" > 
		</label>
	
</div>

<%
// 1단계 JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 디비 연결
String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
String dbUser = "c1d2304t3";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 문자열 -> sql구문 변경
// select * from review where created_by = ?
String sql = "select * from review where created_by = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id); // 로그인된 아이디로 조회
// 4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
ResultSet rs = pstmt.executeQuery();
%>

<%
// 5단계: while 행 접근 -> 데이터 있으면 true 
// -> 글번호 글쓴이 제목 조회수 글쓴날짜 출력 
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
		<%if (!id.equals(rs.getString("created_by"))) {%>
		style="display: none;" <%}%>>
		<div class="update">수정</div>
	</button>
	<button type="button" onclick="deleteRow(this);" class="buttonDel"
		<%if (!id.equals(rs.getString("created_by"))) {%>
		style="display: none;" <%}%>>
		<div class="del">삭제</div>
	</button>
	<div class="reviewContents">
		<div class="reviewContents1"><%=rs.getString("content").replace("\n", "<br>")%></div>
		<textarea class="editContent" style="display: none;"></textarea>
		<button class="buttonSave" style="display: none;"
			onclick="saveContent(this);">저장</button>
		<br>
		<button class="buttonCancel" style="display: none;"
			onclick="cancelEdit(this);">취소</button>
	</div>
	<div class="reviewCheckbox">
		<input type="checkbox" class="reviewCheckbox1" name="cbox" value="<%=rs.getInt("review_id")%>" />

	</div>
</div>

<%
}
%>


<script>

// 	//글쓰기용 팝업버튼
// 	function popupInsert() {
// 		var url = "../insert/reviewInsert.jsp";
// 		var name = "reviewInsert";
// 		var option = "width = 710, height = 730, top= 100, left= 500";
// 		window.open(url, name, option);
		
// 		newWindow.addEventListener("unload", function () {
// 		    location.reload(); // 새로고침
// 		  });
// 	}

	//수정버튼
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

	//수정시 저장
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

	//수정시 취소버튼
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

	//해당 열 삭제
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
	
	//체크박스
	$(document).ready(function() {
		$(document).on("click", "input:checkbox[name=cbox]", function(e) {
			var chks = document.getElementsByName("cbox");
			var chksChecked = 0;

			for (var i = 0; i < chks.length; i++) {
				var cbox = chks[i];

				if (cbox.checked) {
					chksChecked++;
				}
			}
			if (chks.length == chksChecked) {
				$("#cboxAll").prop("checked", true);
			} else {
				$("#cboxAll").prop("checked", false);
			}
		});

		$("#cboxAll").on("click", function() {
			$("input:checkbox[name=cbox]").prop("checked", this.checked);
		});
	});
	

	
// 선택삭제
// 선택삭제
function selectedDel() {
  var reviewIds = [];
  var selectedRows = []; // 선택된 행의 DOM 요소를 저장하는 배열

  // 선택된 체크박스와 해당 행을 찾아서 배열에 추가
  $("input:checkbox[name='cbox']:checked").each(function () {
    reviewIds.push($(this).val());
    selectedRows.push($(this).closest(".campinfoRow")); // 선택된 행 추가
  });

  if (reviewIds.length === 0) {
    alert("삭제할 리뷰를 선택하세요.");
    return;
  }

  // 사용자에게 삭제 여부를 확인하는 대화 상자 표시
  var confirmMessage = "선택한 리뷰를 삭제하시겠습니까?";
  if (confirm(confirmMessage)) {
    $.ajax({
      type: "POST",
      url: "deleteSelectedReviews.jsp",
      data: {
        reviewIds: reviewIds.join("|") // 선택된 리뷰 ID를 파이프로 구분하여 문자열로 전달
      },
      success: function (result) {
        console.log(result);

        // 삭제가 성공한 경우 선택된 행을 화면에서 제거
        if (result.trim() === "success") {
          for (var i = 0; i < selectedRows.length; i++) {
            selectedRows[i].remove();
          }
        } else {
          alert("삭제 실패");
        }
      },
      error: function (xhr, status, error) {
        alert(error);
      }
    });
  }
}


</script>

</body>

</html>