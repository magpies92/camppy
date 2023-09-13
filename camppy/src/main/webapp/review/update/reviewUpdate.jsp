<%@page import="camppy.reserve.action.ReserveService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="camppy.reserve.dao.ReserveDetailDTO" %>
<%@ page import="camppy.reserve.dao.ReserveDetailDAO" %>
<%@ page import="camppy.review.ReviewDAO" %>
<%@ page import="camppy.review.ReviewDTO" %>
<%@page import="camppy.member.MemberDTO"%>
<%@page import="camppy.member.MemberDAO"%>
<%@page import="camppy.member.MemberService"%>
<%@page import="camppy.main.action.CampRegDTO"%>
<%@page import="camppy.main.action.CampRegDAO"%>
<%@page import="camppy.main.action.CampRegService"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.List"%>
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

.popup-write-review, .popup-write-review * {
	box-sizing: border-box;
}


.writeReview {
	background: #ffffff;
	width: 700px;
	height: 700px;
	position: relative;
	overflow: hidden;
}

.writeBody {
	width: 700px;
	height: 700px;
	position: relative;
	left: 0px;
	overflow: hidden;
}

.writeReviewLogo {
	padding: 0px 10px 0px 10px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	align-items: center;
	justify-content: flex-start;
	width: 550px;
	position: relative;
	left: calc(50% - 275px);
}

.camppyLogo {
	background: linear-gradient(to left, rgba(240, 241, 245, 0.2),
		rgba(240, 241, 245, 0.2));
	flex-shrink: 0;
	width: 225px;
	height: 174px;
	position: relative;
	font-size: 25px;
}

.writeStar {
	border-style: solid;
	border-color: #b3b3b3;
	border-width: 1px 0px 1px 0px;
	display: flex;
	flex-direction: column;
	gap: 0px;
	align-items: center;
	justify-content: flex-start;
	width: 700px;
	height: 118px;
	position: relative;
	left: 1px;
	top: 6px;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

.starCheck {
	
	font-size: 23px;
}


/* .reviewTextarea { */
/* 	color: #000000; */
/* 	text-align: left; */
/* 	font: 23px "Inter", sans-serif; */
/* 	position: relative; */
/* 	width: 680px; */
/* 	height: 150px; */
/* 	display: flex; */
/* 	align-items: center; */
/* 	justify-content: center; */
/* 	resize: none; */
/* 	margin: 10px; */
/* 	line-height: 150%; */
/* } */
/* .submitButton{ */
/* 	text-align: center; */
/* } */
/* .submitReply { */
/* 	color: #ffffff; */
/* 	text-align: center; */
/* 	font: 700 14px/45px "NanumGothic", sans-serif; */
/* 	background: #4da385; */
/* 	width: 100px; */
/* 	height: 30px; */
/* 	position: relative; */
/* 	line-height: inherit; */
/* } */

/* .nameBox { */
/* 	position: relative; */
/* 	margin: 10px; */
/* 	font: 20px "Inter", sans-serif; */
/* } */
/* .nickname { */
/* 	font-size: 20px; */
/* } */
/* .idBox { */
/* 	position: relative; */
/* 	margin: 10px; */
/* 	font: 20px "Inter", sans-serif; */
/* /* 	display: none;  */ */
/* } */
/* .residBox { */
/* 	position: relative; */
/* 	margin: 10px; */
/* 	font: 20px "Inter", sans-serif; */
/* /* 	display: none;   */ */
/* } */
/* .campidBox { */
/* 	position: relative; */
/* 	margin: 10px; */
/* 	font: 20px "Inter", sans-serif; */
/* /* 	display: none;  */ */
/* } */

</style>

<title>리뷰를 작성하세요</title>
</head>




<body>



	<%
	//세션에서 로그인정보, 예약정보 가져오기
	String id = (String)session.getAttribute("id");
	MemberDTO memberDTO = new MemberDTO();
	MemberService memberService = new MemberService();
	int camp_id =  Integer.parseInt(request.getParameter("camp_id"));
	int res_id =  Integer.parseInt(request.getParameter("res_id"));
	ReviewDTO reviewDTO = new ReviewDTO();
	
	
	if (id != null){
	memberDTO = memberService.getMember(id);
	}
	CampRegService campregService = new CampRegService();
	CampRegDTO campregDTO = new CampRegDTO();
	campregDTO = campregService.getCampReg(camp_id);
	
	
	
	ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
	ReserveService reserveService = new ReserveService();
	reserveDetailDTO = reserveService.getReserve(res_id);
	
	
// 	int camp_id = (int)session.getAttribute("camp_id");
	//ReserveDetailDTO rdto = new ReserveDetailDTO();
	//ReserveDetailDTO rdto = (ReserveDetailDTO)request.getAttribute("rdto");
// 	int member_id = rdto.getMember_id();
// 	String camp_name = rdto.getCamp_name();
	ReviewDTO vdto = new ReviewDTO();
	
	%>
	
	
	<form action="reviewInsertPro.rv" method="post" class="writeReview"
		id="reviewForm">
		<div class="writeBody">
			<div class="writeReviewLogo">
				<img class="camppyLogo" src="logoCamppy.png" />
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
				닉네임 : <input type="text" name="created_by" value="<%=memberDTO.getNick()%>"
					class="nickname" readonly>
			</div>
			<div class="idBox">
				아이디 : <input type="text" name="id" value="<%=id%>" class="id"
					readonly>
			</div>
			
			<div class="resBox">
				예약 번호 : <input type="text" name="res_id" value="<%=reserveDetailDTO.getRes_id()%>" class="res_id"
					readonly>
			</div>
			
			
			<div class="campidBox">
				캠프장 이름 : <input type="text" name="camp_name" value="<%=campregDTO.getCampname()%>" class="camp_id"
				readonly>
			</div>

			<input type="hidden" name="camp_id" value="<%=campregDTO.getCampid()%>">
			
			<input type="hidden" name="member_id" value="<%=memberDTO.getMember_id()%>">
			

			<textarea name="content" placeholder="후기를 입력하세요" maxlength="100"
				class="reviewTextarea"><%=reviewDTO.getContent()%></textarea>
			<div class="submitButton">
				<input type='submit' value="글쓰기" class="submitReply">
			</div>
		</div>
		
	</form>

</body>
</html>
