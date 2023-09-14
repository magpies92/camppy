<%@page import="camppy.commu.db.CommuDAO"%>
<%@page import="camppy.member.MemberService"%>
<%@page import="camppy.commu.action.CommuService"%>
<%@page import="camppy.commu.db.PageDTO"%>
<%@page import="camppy.commu.db.CommuDTO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@page import="camppy.member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="commuContentsList/style.css" />

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	/* 	appearance: none; */
	background: none;
}
</style>
<title>commuContentsList</title>
</head>




 

<body>
	<jsp:include page="/inc/top.jsp" />

	<!-- 	베스트 게시글  -->
	<%
	String id = (String) session.getAttribute("id");
	MemberDTO memberDTO = new MemberDTO();
	if(id != null){
	memberDTO = (MemberDTO) request.getAttribute("memberDTO");
	}
	
	List<CommuDTO> commuRankList = (List<CommuDTO>) request.getAttribute("commuRankList");
	List<CommuDTO> commuList = (List<CommuDTO>) request.getAttribute("commuList");
	PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
	CommuDAO commuDAO = new CommuDAO();
	CommuDTO commuDTO = new CommuDTO();
	%>
	<div class="commu-contents-list">
		<div class="commu-contents-list__section-body">
			<div class="commu-contents-list__best-contents">
				<div class="commu-contents-list__contents-box">
					<div class="commu-contents-list__best">BEST 게시글</div>

					<%
					for (int i = 0; i < commuRankList.size(); i++) {
					%>
					<%
					commuDTO = commuRankList.get(i);
					%>
					<div class="commu-contents-list__box-3">
						<div class="commu-contents-list__"><%=commuDTO.getTitle()%></div>
						<div class="commu-contents-list__frame-189">
							<a href="commuContentsList?post_id=<%=commuDTO.getPost_id()%>">
								<%
								if (commuDTO.getImg_url() != null) {
								%> <img class="commu-contents-list__rectangle-7"
								src="upload/<%=commuDTO.getImg_url()%>" id="picture3"> <%
 } else {
 %> <img class="commu-contents-list__rectangle-7" src="upload/5.png"
								id="picture3"> <%
 }
 %>
							</a>
							<!-- user 닉네임 -->
							<div class="commu-contents-list__user" id="name3"><%=commuDTO.getNickname()%></div>
							<!-- 유저 아이콘  -->
							<img class="commu-contents-list__free-icon-user-8484069-3"
								src="commuContentsList/free-icon-user-8484069-3.png" />
							<!-- 좋아요 -->
<!-- 							<form action="submit" method="post"> -->
<!-- 								<button type="button" id="likeButton3"> -->
<!-- 									<img class="commu-contents-list__image-3" -->
<!-- 										src="commuContentsList/image-3.png" /> -->
<!-- 								</button> -->
<!-- 							</form> -->
<!-- 							좋아요  -->
<%-- 							<div class="commu-contents-list___51" id="likeCount3"><%=commuDTO.getLike_cnt()%></div> --%>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>

 
			<div class="commu-contents-list__title">
				<div class="commu-contents-list__2">커뮤니티</div>
			</div>

			<%
			if (id != null) {
			%>
			<input type="button" value="글쓰기" class="button-insert"
				onclick="location.href='commuInsert.commu'">
			<%
}
%>
			<form action="commuContentsListSearch.commu" method="post"
				class="commu-contents-list__search">
				<div class="commu-contents-list__div-myp-02">
					<select name="searchtype" class="commu-contents-list__options">
						<option class="commu-contents-list__3" value="제목+내용">제목+내용</option>
						<option class="commu-contents-list__3" value="작성자">작성자</option>
					</select> <input type="text" class="commu-contents-list__div-sc-camp"
						name="search" placeholder="검색어를 입력하세요"> <img
						class="commu-contents-list__button"
						src="commuContentsList/button.png" />
				</div>
			</form>


			<%
			for (int i = 0; i < commuList.size(); i++) {
				//commuList.size()
			%>

			<%
			commuDTO = commuList.get(i);
			%>


			<form action="submit" method="post"
				class="commu-contents-list__contents-<1">

				<div class="commu-contents-list__contents-1">

					<!--              캠핑장 후기 타이틀 -->
					<div class="commu-contents-list___00" id="title"><%=commuDTO.getTitle()%></div>

					<!--              유저 아이콘  -->
					<img class="commu-contents-list__free-icon-user-8484069-12"
						src="commuContentsList/free-icon-user-8484069-12.png"
						id="bodyUsericon">

					<!--              닉네임  -->
					<div class="commu-contents-list__user-1" id="bodyName"><%=commuDTO.getNickname()%></div>

					<!--              후기  -->
					<div class="commu-contents-list__5" id="campLater">
						<%=commuDTO.getContent()%><br>
					</div>

					<!--              내용이미지  -->
					<%
					if (commuDTO.getImg_url() != null) {
					%>
					<a
						href="commuContentsListSearch.commu?post_id=<%=commuDTO.getPost_id()%>">
						<img class="commu-contents-list___002"
						src="upload/<%=commuDTO.getImg_url()%>" id="bodyContentsImage">
					</a>
					<%
					} else {
					%>
					<a href="commuContents.commu?post_id=<%=commuDTO.getPost_id()%>">
						<img class="commu-contents-list___002" src="upload/5.png"
						id="bodyContentsImage">
					</a>
					<%
					}
					%>

					<%
					if (id != null) {
						//if (id.equals(memberDTO.getId())) {
						if (commuDTO.getMember_id() == memberDTO.getMember_id()) {
					%>
					<input type="button" value="수정" class="commu-contents-list___12"
						onclick="location.href='commuUpdate.commu?post_id=<%=commuDTO.getPost_id()%>'">

					<input type="button" value="삭제" class="commu-contents-list___13"
						onclick="location.href='commuDelete.commu?post_id=<%=commuDTO.getPost_id()%>'">
					<%
					}
					}
					%>

				</div>

			</form>
			<%
			}
			%>

		</div>


		<div class="commu-contents-list__page-list">
			<div id="page_control" class="commu-contents-list__list">

				<%
				if (pageDTO.getStartPage() > pageDTO.getPageBlock()) {
				%>
				<a
					href="commuContentsList.commu?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
				<%
}
%>

				<%
				for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
				%>
				<div class="commu-contents-list__item your-button-class">
					<a href="commuContentsList.commu?pageNum=<%=i%>"
						class="commu-contents-list__item your-button-class"><%=i%></a>
				</div>
				<%
}
%>

				<%
				//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
				if (pageDTO.getEndPage() < pageDTO.getPageCount()) {
				%>
				<a
					href="commuContentsList.commu?pageNum=<%=pageDTO.getStartPage() + pageDTO.getPageBlock()%>">Next</a>
				<%
				}
				%>





			</div>
		</div>


	</div>
	<!-- //section-total -->
	<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
	<script type="text/javascript">
<%--  likecount = <%=commuDAO.getlikecount(commuDTO.getPost_id())%>; --%>
 function likeButton(e){ // e -> (this)의 정보를 여기로 전달하겠다
 	var i = $(".unLikeButton").index(e); // 같은 클래스 내 index 값을 가져옴
 	var memberid = <%=memberDTO.getMember_id()%>;
 	var postid= <%=commuDTO.getPost_id()%>;
 	likecount++;
 
	
 			document.getElementsByClassName('unLikeButton')[i].style.display = "none"; // 즐겨찾기 취소 버튼 비활성화
 			document.getElementsByClassName('likeButton')[i].style.display = "inline"; // 즐겨찾기 추가 버튼 활성화
 			document.getElementsByClassName('unLikeButton')[i].value = "찜 "+likecount;
 			document.getElementsByClassName('likeButton')[i].value = "찜 "+likecount;
 			$.ajax({
 		         type : "POST",
 		         url : "insertLike.commu",
 		         data: {'member_id':memberid,'post_id':postid},
 		        /*  contentType: "application/json",
 		         dataType: "json",  */
 		          /* success : function (data, status) {
 		            alert(status);
 		         },
 		         error : function (status) {
 		            alert(status + "error!");
 		         }  */
 		     });
 
    }
 
 // 즐겨찾기 해제!!
 function unLikeButton(e){
    var i = $(".likeButton").index(e); // 같은 클래스 내 index 값을 가져옴
    var memberid = <%=memberDTO.getMember_id()%>;
 	var postid= <%=commuDTO.getPost_id()%>;
 	likecount--;
 	
    document.getElementsByClassName('unLikeButton')[i].style.display = "inline"; // 즐겨찾기 취소 버튼 비활성화
    document.getElementsByClassName('likeButton')[i].style.display = "none"; // 즐겨찾기 추가 버튼 활성화
    document.getElementsByClassName('unLikeButton')[i].value = "찜 "+likecount;
		document.getElementsByClassName('likeButton')[i].value = "찜 "+likecount;
   $.ajax({
 		         type : "POST",
 		         url : "deleteLike.commu",
 		         data: {'member_id':memberid,'post_id':postid}, 
 		        /* success : function (data, status) {
 		            alert(status);
 		         },
 		         error : function (status) {
 		            alert(status + "error!");
 		         }  */
 		     }); 
 
    } 

 
 
 
 </script>



	<jsp:include page="/inc/bottom.jsp" />
</body>
</html>
