<%@page import="camppy.commu.action.CommuService"%>
<%@page import="camppy.commu.db.PageDTO"%>
<%@page import="camppy.commu.db.CommuDTO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./commuContentsList/style.css" />

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
	CommuDTO commuDTO = new CommuDTO();
	List<CommuDTO> commuRankList = (List<CommuDTO>) request.getAttribute("commuRankList");
	%>
	<div class="commu-contents-list">
		<div class="commu-contents-list__section-total">
			<div class="commu-contents-list__section-body">
				<!--  best-게시글  -->
				<div class="commu-contents-list__best-contents">
					<div class="commu-contents-list__contents-box">
						<div class="commu-contents-list__best">BEST 게시글</div>

						<%
// 						CommuService commuService = new CommuService();
// 						CommuDTO commuDTO1 = commuService.getCommuRank(1);
// 						CommuDTO commuDTO2 = commuService.getCommuRank(2);
// 						CommuDTO commuDTO3 = commuService.getCommuRank(3);
// 						CommuDTO commuDTO4 = commuService.getCommuRank(4);
						%>
						
						<% 
			for (int i = 0; i < commuRankList.size(); i++) {
			%>

						<%
			commuDTO = commuRankList.get(i);
			%>

						<div class="commu-contents-list__box-3">
							<div class="commu-contents-list__">best3</div>
							<div class="commu-contents-list__frame-189">
								<a href="commuContentsList?post_id=<%=commuDTO.getPost_id()%>">
									<img class="commu-contents-list__rectangle-7"
									src="upload/<%=commuDTO.getImg_url()%>" id="picture3">
								</a>
								<!-- user 닉네임 -->
								<div class="commu-contents-list__user" id="name3"><%=commuDTO.getNickname()%></div>
								<!-- 유저 아이콘  -->
								<img class="commu-contents-list__free-icon-user-8484069-3"
									src="./commuContentsList/free-icon-user-8484069-3.png" />
								<!-- 좋아요 -->
								<form action="submit" method="post">
									<button type="button" id="likeButton3">
										<img class="commu-contents-list__image-3"
											src="./commuContentsList/image-3.png" />
									</button>
								</form>
								<!-- 좋아요  -->
								<div class="commu-contents-list___51" id="likeCount3"><%=commuDTO.getLike_cnt()%></div>
							</div>
						</div>
						<%
						} 
						%>

						<!-- 						<div class="commu-contents-list__box-2"> -->
						<!-- 							<div class="commu-contents-list__">best2</div> -->
						<!-- 							<div class="commu-contents-list__frame-188"> -->
						<%-- 								<a href="commuContentsList?post_id=<%=commuDTO.getPost_id()%>"> --%>
						<!-- 									<img class="commu-contents-list__rectangle-6" -->
						<%-- 									src="upload/<%=commuDTO2.getImg_url()%> id="picture2"> --%>
						<!-- 								</a> -->
						<!-- 								유저 닉네임  -->
						<%-- 								<div class="commu-contents-list__user" id="name2"><%=commuDTO2.getNickname()%></div> --%>
						<!-- 								유저 아이콘 -->
						<!-- 								<img class="commu-contents-list__free-icon-user-8484069-2" -->
						<!-- 									src="./commuContentsList/free-icon-user-8484069-2.png" /> -->
						<!-- 								좋아요 -->
						<!-- 								<form action="submit" method="post"> -->
						<!-- 									<button type="button" id="likeButton2"> -->
						<!-- 										<img class="commu-contents-list__image-2" -->
						<!-- 											src="./commuContentsList/image-2.png" /> -->
						<!-- 									</button> -->
						<!-- 								</form> -->
						<!-- 								좋아요 수  -->
						<%-- 								<div class="commu-contents-list___82" id="likeCount"><%=commuDTO2.getLike_cnt()%></div> --%>
						<!-- 							</div> -->
						<!-- 						</div> -->

						<!-- 						<div class="commu-contents-list__box-1"> -->
						<!-- 							<div class="commu-contents-list___1">best1</div> -->
						<!-- 							<div class="commu-contents-list__frame-187"> -->
						<%-- 								<a href="commuContentsList?post_id=<%=commuDTO.getPost_id()%>"> --%>
						<!-- 									<img class="commu-contents-list__rectangle-2" -->
						<%-- 									src="upload/<%=commuDTO1.getImg_url()%>" id="picture3"> --%>
						<!-- 								</a> -->
						<!-- 								좋아요 수  -->
						<%-- 								<div class="commu-contents-list___512" id="likeCount2"><%=commuDTO1.getLike_cnt()%></div> --%>
						<!-- 								유저 아이콘  -->
						<!-- 								<img class="commu-contents-list__free-icon-user-8484069-1" -->
						<!-- 									src="./commuContentsList/free-icon-user-8484069-1.png" /> -->
						<!-- 								유저 닉네임	 -->
						<%-- 								<div class="commu-contents-list__user2" id="name1"><%=commuDTO1.getNickname()%></div> --%>
						<!-- 								좋아요  -->
						<!-- 								<form action="submit" method="post"> -->
						<!-- 									<button type="button" id="likeButton1"> -->
						<!-- 										<img class="commu-contents-list__image-1" -->
						<!-- 											src="./commuContentsList/image-1.png" /> -->
						<!-- 									</button> -->
						<!-- 								</form> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

						<!-- 						<div class="commu-contents-list__box-4"> -->
						<!-- 							<div class="commu-contents-list__">best4</div> -->
						<!-- 							<div class="commu-contents-list__frame-190"> -->
						<%-- 								<a href="commuContentsList?post_id=<%=commuDTO.getPost_id()%>"> --%>
						<!-- 									<img class="commu-contents-list__rectangle-5" -->
						<%-- 									src="upload/<%=commuDTO4.getImg_url()%>" id="picture4"> --%>
						<!-- 								</a> -->
						<!-- 								유저 닉네임 -->
						<%-- 								<div class="commu-contents-list__user3" id="name4"><%=commuDTO4.getNickname()%></div> --%>
						<!-- 								유저 아이콘  -->
						<!-- 								<img class="commu-contents-list__free-icon-user-8484069-4" -->
						<!-- 									src="./commuContentsList/free-icon-user-8484069-4.png" /> -->
						<!-- 								좋아요 수  -->
						<%-- 								<div class="commu-contents-list___513" id="likeCount"><%=commuDTO4.getLike_cnt()%></div> --%>
						<!-- 								좋아요  -->
						<!-- 								<form action="submit" method="post"> -->
						<!-- 									<button type="button" id="likeButton4"> -->
						<!-- 										<img class="commu-contents-list__image-4" -->
						<!-- 											src="./commuContentsList/image-4.png" /> -->
						<!-- 									</button> -->
						<!-- 								</form> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
											</div>

					</div>



					<!-- 				커뮤니티 -->
					<div class="commu-contents-list__title">
						<div class="commu-contents-list__2">커뮤니티</div>
					</div>

					<!-- 				<div class="commuwrite"> -->
					<!-- 					<button type="submit" id="insert"> -->
					<!-- 						<div class="commuwrite1">글쓰기</div> -->
					<!-- 					</button> -->
					<!-- 				</div> -->
					<% if(id != null){ %>
					<input type="button" value="글쓰기" class="button-insert"
						onclick="location.href='commuInsert.commu'">
					<%
}
%>

					<!-- 				제목+내용 검색 -->

					<form action="commuListSearch.commu" method="post"
						class="commu-contents-list__search">
						<div class="commu-contents-list__div-myp-02">
							<select name="searchtype" class="commu-contents-list__options">
								<option class="commu-contents-list__3">제목+내용</option>
								<option class="commu-contents-list__3">아이디</option>
							</select> <input type="text" class="commu-contents-list__div-sc-camp"
								name="search" placeholder="검색어를 입력하세요"> <img
								class="commu-contents-list__button"
								src="./commuContentsList/button.png" />
						</div>
					</form>
				</div>

				<%
			List<CommuDTO> commuList = (List<CommuDTO>) request.getAttribute("commuList");
			PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
			%>

				<%
			for (int i = 0; i < commuList.size(); i++) {
			%>

				<%
			commuDTO = commuList.get(i);
			%>
				<form action="submit" method="post">

					<div class="commu-contents-list__contents-1">

						<!--              캠핑장 후기 타이틀 -->
						<div class="commu-contents-list___00" id="title"><%=commuDTO.getTitle()%></div>

						<!--              유저 아이콘  -->
						<img class="commu-contents-list__free-icon-user-8484069-12"
							src="./commuContentsList/free-icon-user-8484069-12.png"
							id="bodyUsericon">

						<!--              닉네임  -->
						<div class="commu-contents-list__user-1" id="bodyName"><%=commuDTO.getMember_id()%></div>

						<!--              후기  -->
						<div class="commu-contents-list__5" id="campLater">
							<%=commuDTO.getContent()%><br>
						</div>

						<!--              내용이미지  -->
						<a href="commuContents.commu?post_id=<%=commuDTO.getPost_id()%>">
							<img class="commu-contents-list___002"
							src="./upload/<%=commuDTO.getImg_url()%>" id="bodyContentsImage">
						</a>

						<!--              좋아요 아이콘  -->
						<button type="button" id="bodyLikeIcon">
							<img class="commu-contents-list__like-1"
								src="./commuContentsList/like-1.png">
						</button>

						<!--              좋아요 수  -->
						<div class="commu-contents-list___25" id="bodyLikeCount"><%=commuDTO.getLike_cnt()%></div>

						<%
					if (id != null) {
						if (id.equals(memberDTO.getId())) {
					%>

						<input type="button" value="수정" class="commu-contents-list___12"
							onclick="location.href='commuUpdate.commu?id=<%=memberDTO.getId()%>'">

						<input type="button" value="삭제" class="commu-contents-list___13"
							onclick="location.href='commuDelete.commu?id=<%=memberDTO.getId()%>'">
						<%
					}
					}
					%>
						<!--             댓글 -->
						<div id="commentNum" class="commu-contents-list___3"><%=commuDTO.getComment_cnt()%></div>

						<!--            댓글 이미지 -->
						<button type="button" id="bodycomment">
							<img class="commu-contents-list__text-box-1"
								src="./commuContentsList/text-box-1.png" />
						</button>
					</div>

				</form>
				<%
			}
			%>


				<div class="commu-contents-list__page-list">
					<div id="page_control" class="commu-contents-list__list">
						<%
					// 시작페이지 1페이지 Prev 없음
					// 시작페이지 11,21,31 Prev 보임
					if (pageDTO.getStartPage() > pageDTO.getPageBlock()) {
					%>
						<a
							href="commuContentsList?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
						<%
}
%>

						<%
					for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
					%>
						<div class="commu-contents-list__item your-button-class">
							<a href="commuContentsList?pageNum=<%=i%>"
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
							href="commuContentsList?pageNum=<%=pageDTO.getStartPage() + pageDTO.getPageBlock()%>">Next</a>
						<%
}
%>

					</div>
				</div>

			</div>
			<!-- //section_tota -->
		</div>
		<!-- //section-total -->

		<jsp:include page="/inc/bottom.jsp" />
</body>
</html>
