<%@page import="camppy.commu.db.CommuDTO"%>
<%@page import="java.util.List"%>
<%@page import="camppy.commu.db.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="myLikeList/myLikeList.css" />

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
<title>myContentsList</title>
</head>
<body>

	<script type="text/javascript">
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
		//선택삭제
		function selectedDel() {
			var postIds = [];
			var selectedRows = [];

			// 선택된 체크박스와 해당 행을 찾아서 배열에 추가
			$("input:checkbox[name='cbox']:checked").each(function() {
				postIds.push($(this).val());
				selectedRows.push($(this).closest(".likeListBody"));
			});

			if (postIds.length === 0) {
				alert("삭재할 글을 선택하세요.");
				return;
			}

			// 사용자에게 삭제 여부를 확인하는 대화 상자 표시
			var confirmMessage = "선택한 글 을 삭제하시겠습니까?";
			if (confirm(confirmMessage)) {
				$.ajax({
					type : "POST",
					url : "myContentsList/myContentsListDelete.jsp",
					data : {
						postIds : postIds.join("|")
					},
					success : function(result) {
						console.log(result);

						// 삭제가 성공한 경우 선택된 행을 화면에서 제거
						if (result.trim() === "success") {
							for (var i = 0; i < selectedRows.length; i++) {
								selectedRows[i].remove();
							}
							location.reload();
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

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/inc/top.jsp" />
	<jsp:include page="/inc/mypageInc.jsp" />
	<!-- 헤더들어가는 곳 -->

	<%
	PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
	List<CommuDTO> myCommuList = (List<CommuDTO>) request.getAttribute("myCommuList");
	CommuDTO commuDTO = new CommuDTO();
	String id = (String) session.getAttribute("id");

	request.setCharacterEncoding("UTF-8");
	%>

	<div class="reviewTop">
		<div class="reviewCount">글 리스트</div>

		<button type="button" onclick="selectedDel();" class="selectDel">
			<div>선택 삭제</div>
		</button>

		<label class="selectAll"> <b>전체 선택</b>&nbsp; <input
			type="checkbox" class="selectCheck" id="cboxAll">
		</label>
	</div>


	<div class="allbody">
		<div class="likeListBody">
			<%
			for (int i = 0; i < myCommuList.size(); i++) {
				commuDTO = myCommuList.get(i);
			%>
			<div class="likeList">
				<%
				if (commuDTO.getImg_url() != null) {
				%>
				<img class="likeListPhoto" src="upload/<%=commuDTO.getImg_url()%>" />
				<%
				} else {
				%>
				<img class="likeListPhoto" src="upload/5.png" />
				<%
				}
				%>
				<div class="likeList2">
					<div class="likeListAdd">
						회원번호:<%=commuDTO.getMember_id()%></div>
					<div class="likeListTitle">
						제목 :<%=commuDTO.getTitle()%></div>
					<div class="likeListTag">
						내용 :<%=commuDTO.getContent()%></div>
					<!-- 					<div class="likeListTell">전화번호</div> -->

					<div class="likeTitle">
						<img src="myContentsList/like-1.png" class=hearts>
						<div class="likeNum"><%=commuDTO.getLike_cnt()%></div>
					</div>
				</div>
				<!-- 			  //선택삭제 -->

				<div class="eachCheck">
					<input type="checkbox" name="cbox" class="eachCheckbox"
						value="<%=commuDTO.getPost_id()%>">
				</div>
			</div>
			<%
			}
			%>
		
		</div>
	</div>
	<%=pageDTO.getStartPage() %>
	<%=pageDTO.getEndPage()%>
			<div>
				<%
				// 시작 페이지 1페이지 Prev 없음
				// 시작 페이지 11, 21, 31 Prev 보임
				if (pageDTO.getStartPage() > pageDTO.getPageBlock()) {
				%>
				<a
					href="myContentsList.commu?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
				<%
				} 
				%>


				<%
				// for(int i=시작하는 페이지 번호; i<=끝나는 페이지 번호; i++)
				for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
				%>
				
				<a href="myContentsList.commu?pageNum=<%=i%>" class="page"><%=i%>ﾠ
				</a>
			
				<%
				}
				%>


				<%
				// 끝페이지번호 전체페이지수 비교 -> 전체페이지수 클 때 -> Next 보임
				if (pageDTO.getEndPage() < pageDTO.getPageCount()) {
				%>
				<a
					href="myContentsList.commu?pageNum=<%=pageDTO.getStartPage() + pageDTO.getPageBlock()%>">Next</a>
				<%
				}
				%>
</div>


	<jsp:include page="/inc/bottom.jsp"></jsp:include>

</body>
</html>
