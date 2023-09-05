<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="review/insert/reviewInsert.css" />

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	
}
-we
</style>

<title>리뷰를 작성하세요</title>
</head>




<body>
	<%
	//세션에서 로그인정보, 예약정보 가져오기
	String id = (String) session.getAttribute("member_id");
	%>
	<form action="reviewInsertPro.jsp" method="post" class="writeReview"
		id="reviewForm">
		<div class="writeBody">
			<div class="writeReviewLogo">
				<img class="camppyLogo" src="images/camppy-2.png" />
			</div>
			<div class="writeStar">

				<div class="starCheck">평가를 위해 별점을 체크해주세요</div>
				<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rating" value="5"
						v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rating" value="4"
						v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
						type="radio" id="3-stars" name="rating" value="3"
						v-model="ratings" /> <label for="3-stars" class="star">★</label> <input
						type="radio" id="2-stars" name="rating" value="2"
						v-model="ratings" /> <label for="2-stars" class="star">★</label> <input
						type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
					<label for="1-star" class="star">★</label>
				</div>

			</div>
			<div class="nameBox">
				닉네임 : <input type="text" name="created_by" value="ksb"
					class="nickname" readonly>
			</div>
			<div class="idBox">
				아이디 : (주석해제로 가릴 예정) <input type="text" name="member_id" value="1"
					readonly>
			</div>
			<div class="residBox">
				예약번호 : (주석해제로 가릴 예정) <input type="text" name="res_id" value="2"
					readonly>
			</div>
			<div class="campidBox">
				캠프장아이디 : (주석해제로 가릴 예정) <input type="text" name="camp_id" value="2"
					readonly>
			</div>

			<textarea name="content" placeholder="후기를 입력하세요" maxlength="100"
				class="reviewTextarea"></textarea>
			<div class="submitButton">
				<input type='submit' value="글쓰기" class="submitReply"
					onclick="validateForm()">
			</div>
		</div>
	</form>

</body>
</html>