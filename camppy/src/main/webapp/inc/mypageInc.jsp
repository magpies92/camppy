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
	left: 515px;
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

.buttonDel {
	display: flex;
	flex-direction: column;
	gap: 0px;
	align-items: flex-start;
	justify-content: flex-start;
	width: 138px;
	height: 61px;
	position: relative;
	left: 1555px;
	background: #4da385;
	border-radius: 5px;
	border: none;
}

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
</style>



<body>

	<div class="mypageProfile">
		<img class="mypageUserIcon" src="free-icon-user-8484069-2.png" />
		<div class="profileNickname">발레하는 고구마</div>
		<button type="button" onclick="location.href = 'abc.jsp'"
			class="updateButton">
			<div class="updateProfile">프로필수정</div>
		</button>
		<div class="mypageProfileNum">
			<div class="myVisit">방문횟수</div>
			<div class="visitNum">29</div>
			<div class="myArticle">작성글</div>
			<div class="myArticleNum">3</div>
			<div class="myReply">댓글</div>
			<div class="myReplyNum">6</div>
		</div>
	</div>
	<div class="mypageNavi">
		<div class="tab" id="tab1">찜 목록</div>
		<div class="tab" id="tab2">작성한 글</div>
		<div class="tab" id="tab3">작성 리뷰</div>
		<div class="tab" id="tab4">예약 내역</div>
	</div>
	<div class="tabContents">
		<!-- The content from tab1 (star.html) will be displayed here by default -->
		<jsp:include page="./top.jsp" />
	</div>



	<script type="text/javascript">
const tabs = document.querySelectorAll('.tab');
const tabContents = document.querySelector('.tabContents');

tabs.forEach(tab => {
    tab.addEventListener('click', () => {
        tabs.forEach(t => t.classList.remove('active'));
        tab.classList.add('active');
        
        let contentPath = "";
        if (tab.id === "tab1") {
            contentPath = "./top.jsp";
        } else if (tab.id === "tab2") {
            contentPath = "./test.jsp";
        } else if (tab.id === "tab3") {
            contentPath = "../review/mypagelist/listTest.jsp";
        } else if (tab.id === "tab4") {
            contentPath = "./mypageInc.jsp";
        }
        
        // Load content using jQuery
        $.get(contentPath, function (data) {
            tabContents.innerHTML = data;
        });
    });
});

// Simulate a click on the first tab to show its content by default
tabs[0].click();

function popupDel(){
    var url = "popupDel.jsp";
    var name = "popup test";
    var option = "width = 330, height = 110, location = center "
    window.open(url, name, option);
}// 삭제 팝업창 불러오기 기능

</script>
</body>
</html>