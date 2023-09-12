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
</head>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
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
	font: 400 40px/28px "pretendard-medium", sans-serif;
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
	font: 700 30px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 25px/28px "pretendard-medium", sans-serif;
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
	font: 400 30px/28px "pretendard-medium", sans-serif;
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
	font: 400 30px/28px "pretendard-medium", sans-serif;
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
	font: 400 30px/28px "pretendard-medium", sans-serif;
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
	font: 400 30px/28px "pretendard-medium", sans-serif;
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
	font: 700 25px/45px "pretendard-medium", sans-serif;
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
	font: 400 30px/28px "pretendard-medium", sans-serif;
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
	String id = (String) session.getAttribute("id");
	%>

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
		<div class="tab" id="tab1" onclick="location.href='likeList.my'">찜 리스트</div>
		<div class="tab" id="tab2" onclick="location.href='myContentsList.commu'">작성한 글</div>
		<div class="tab" id="tab3" onclick="location.href='mypageReviewList.rv'">작성 리뷰</div>
		<div class="tab" id="tab4" onclick="location.href='mypage_reserve.re'">예약 내역</div>
	</div>
	<!-- <div class="tabContents" id="contentContainer">
		The content from tab1 (star.html) will be displayed here by default

	</div> -->
	
</body>
</html>