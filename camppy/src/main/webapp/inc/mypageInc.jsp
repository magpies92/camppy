<%@page import="camppy.member.MemberDTO"%>
<%@page import="camppy.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=chrome" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
}

.mypageProfile {
	padding: 10px 100px 10px 100px;
	display: flex;
	flex-direction: row;
	gap: 136px;
	align-items: flex-start;
	justify-content: flex-start;
	flex-wrap: wrap;
	flex-shrink: 0;
	width: 1920px;
	height: 314px;
	position: relative;
	left: 1px;
	overflow: hidden;
}

.mypageUserIcon {
	flex-shrink: 0;
	width: 217px;
	height: 217px;
	position: absolute;
	left: 277px;
	top: 51px;
}

.profileNickname {
	color: #000000;
	text-align: left;
	font: 400 40px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 546px;
	top: 75px;
	width: 642px;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.updateButton {
	background: #4da385;
	border-radius: 5px;
	padding: 0px 9px 0px 9px;
	display: flex;
	flex-direction: row;
	gap: 10px;
	align-items: flex-start;
	justify-content: flex-start;
	flex-shrink: 0;
	width: 207px;
	height: 70px;
	position: absolute;
	left: 1258px;
	top: 80px;
	overflow: hidden;
	border: none;
}

.updateProfile {
	color: #ffffff;
	text-align: center;
	font: 700 30px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: calc(50% - 94.5px);
	top: 0px;
	width: 189px;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mypageProfileNum {
	display: flex;
	flex-direction: row;
	gap: 136px;
	align-items: flex-start;
	justify-content: flex-start;
	flex-shrink: 0;
	width: 1040px;
	height: 70px;
	position: absolute;
	left: 135px;
	top: 160px;
}

.myVisit {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 0px;
	top: 10px;
	width: 180px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.visitNum {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 180px;
	top: 10px;
	width: 100px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-left: solid 1px;
	border-left-color: grey;
}

.myArticle {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 360px;
	top: 10px;
	width: 180px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.myArticleNum {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 540px;
	top: 10px;
	width: 100px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-left: solid 1px;
	border-left-color: grey;
}

.myReply {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 720px;
	top: 10px;
	width: 180px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.myReplyNum {
	color: #000000;
	text-align: center;
	font: 400 25px/28px "NanumGothic", sans-serif;
	position: absolute;
	left: 900px;
	top: 10px;
	width: 100px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-left: solid 1px;
	border-left-color: grey;
}

.mypageNavi {
	border-style: solid;
	border-color: #000000;
	border-width: 1px 0px 1px 0px;
	display: flex;
	flex-direction: row;
	gap: 30px;
	align-items: flex-start;
	justify-content: flex-start;
	flex-wrap: wrap;
	flex-shrink: 0;
	width: 1920px;
	height: 163px;
	position: relative;
	/*   left: calc(50% - 960px); */
	padding-right: 150px;
	padding-left: 150px;
}

.mypageLike {
	color: #000000;
	text-align: center;
	font: 400 30px/28px "NanumGothic", sans-serif;
	position: relative;
	width: 380px;
	height: 160px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mypageArticle {
	color: #000000;
	text-align: center;
	font: 400 30px/28px "NanumGothic", sans-serif;
	position: relative;
	width: 380px;
	height: 160px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mypageReply {
	color: #000000;
	text-align: center;
	font: 400 30px/28px "NanumGothic", sans-serif;
	position: relative;
	width: 380px;
	height: 160px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mypageReserve {
	color: #000000;
	text-align: center;
	font: 400 30px/28px "NanumGothic", sans-serif;
	position: relative;
	width: 380px;
	height: 160px;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* .buttonDel { */
/* 	display: flex; */
/* 	flex-direction: column; */
/* 	gap: 0px; */
/* 	align-items: flex-start; */
/* 	justify-content: flex-start; */
/* 	width: 138px; */
/* 	height: 61px; */
/* 	position: relative; */
/* 	left: 1555px; */
/* 	background: #4da385; */
/* 	border-radius: 5px; */
/* 	border: none; */
/* } */
.del {
	color: #ffffff;
	text-align: center;
	font: 700 25px/45px "NanumGothic", sans-serif;
	position: absolute;
	left: calc(50% - 49px);
	top: 13px;
	width: 100px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
}

div.tab.active {
	color: black;
	font-weight: bold;
}

.mypageNavi {
	border-style: solid;
	border-color: #000000;
	border-width: 1px 0px 1px 0px;
	display: flex;
	flex-direction: row;
	gap: 30px;
	align-items: flex-start;
	justify-content: flex-start;
	flex-wrap: wrap;
	flex-shrink: 0;
	width: 1920px;
	height: 163px;
	position: relative;
	/*   left: calc(50% - 960px); */
	padding-right: 150px;
	padding-left: 150px;
}

.tab {
	color: grey;
	text-align: center;
	font: 400 30px/28px "NanumGothic", sans-serif;
	position: relative;
	width: 380px;
	height: 160px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.tabContents {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-items: center;
}

.pagination {
display: contents;

    }
</style>



<body>
	<%
	//세션에서 로그인정보, 예약정보 가져오기
	String id = (String) session.getAttribute("member_id");
	%>

	<jsp:include page="/inc/top.jsp" />

	<div class="mypageProfile">
		<img class="mypageUserIcon" src="free-icon-user-8484069-2.png" />
		<div class="profileNickname">발레하는 감자</div>
		<button type="button" onclick="location.href = 'update.me'"
			class="updateButton">
			<div class="updateProfile">프로필수정</div>
		</button>
		<div class="mypageProfileNum">
			<div class="myArticle">작성글</div>
			<div class="myArticleNum">3</div>
			<div class="myReply">댓글</div>
			<div class="myReplyNum">6</div>
		</div>
	</div>
	<div class="mypageNavi">
		<div class="tab" id="tab1">찜 리스트</div>
		<div class="tab" id="tab2">작성한 글</div>
		<div class="tab" id="tab3">작성 리뷰</div>
		<div class="tab" id="tab4">예약 내역</div>
	</div>
	<div class="tabContents" id="contentContainer">
		<!-- The content from tab1 (star.html) will be displayed here by default -->

	</div>


	<jsp:include page="./bottom.jsp" />

	<script type="text/javascript">
		// 주소 정보 객체
		var addresses = {
			"찜 리스트" : "http://aaa.me",
			"작성한 글" : "http://aaa.me",
			"작성 리뷰" : "mypageReviewList.rv",
			"예약 내역" : "mypage_reserve.re"
		};

		function updateContent(tabLabel) {
			var url = addresses[tabLabel];
			if (url) {
				// AJAX 또는 fetch를 사용하여 해당 URL에서 내용을 가져와서 업데이트
				fetch(url).then(function(response) {
					return response.text();
				}).then(
						function(data) {
							var contentContainer = document
									.getElementById("contentContainer");
							contentContainer.innerHTML = data;
						});
			}
		}

		// 탭 이벤트 핸들러 연결
		var tabs = document.querySelectorAll(".tab");
		tabs.forEach(function(tab) {
			tab.addEventListener("click", function() {
				var tabLabel = tab.textContent;
				updateContent(tabLabel);
			});
		});

		$(document).ready(function() {
			// 전체선택 체크박스 클릭 시
			$("#cboxAll").on("click", function() {
				$("input:checkbox[name=cbox]").prop("checked", this.checked);
			});

			// 개별 체크박스 클릭 시
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

			// 전체선택 체크박스 상태 변경 시
			$(document).on("change", "#cboxAll", function() {
				var chks = document.getElementsByName("cbox");

				for (var i = 0; i < chks.length; i++) {
					var cbox = chks[i];
					cbox.checked = this.checked;
				}
			});
		});
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
						location.reload();
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

		//선택삭제
		function selectedDel() {
			var reviewIds = [];
			var selectedRows = []; // 선택된 행의 DOM 요소를 저장하는 배열

			// 선택된 체크박스와 해당 행을 찾아서 배열에 추가
			$("input:checkbox[name='cbox']:checked").each(function() {
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
					type : "POST",
					url : "review/del/deleteSelectedReviews.jsp",
					data : {
						reviewIds : reviewIds.join("|")
					// 선택된 리뷰 ID를 파이프로 구분하여 문자열로 전달
					},
					success : function(result) {
						console.log(result);

						// 삭제가 성공한 경우 선택된 행을 화면에서 제거
						if (result.trim() === "success") {
							for (var i = 0; i < selectedRows.length; i++) {
								selectedRows[i].remove();
								location.reload();
							}
						} else {
							alert("삭제 실패");
						}
					},
					error : function(xhr, status, error) {
						alert(error);
					}
				});
			}
		}
	</script>
</body>
</html>