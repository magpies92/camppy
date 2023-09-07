<%@page import="camppy.reserve.dao.ReserveDetailDTO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@page import="camppy.main.action.CampRegDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet"> -->
<!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet"> -->
<!-- <link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png"> -->
<meta charset="UTF-8">
<title>Camppy</title>

<!-- <link rel="stylesheet" href="css/insert.css" type="text/css" > -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<style>
div {
	display: block;
}

.heading-section {
	font-size: 45px;
	color: #393939;
	line-height: 1.5;
	font-weight: 400;
	font-family: 'NanumSquareNeo';
	/*     font-family: "Poppins", Arial, sans-serif; */
	font-weight: bold;
	text-align: center;
	margin: 25px;
}

#wrap {
	width: 700px;
	margin: 30px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	font-family: 'NanumSquareNeo';
}

legend {
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.menu-section {
	font-size: 25px;
	color: #393939;
	/*     line-height: 1.5; */
	/*     font-weight: 400; */
	/*     font-family: "Poppins", Arial, sans-serif; */
	font-family: 'NanumSquareNeo';
	font-weight: bold;
	text-align: center;
	margin: 25px;
}

fieldset {
	border: none;
	margin: 0;
	padding: 0;
}

input[type="text"], input[type="password"], input[type="date"], input[type="nick"],
	select {
	display: block;
	width: 100%;
	margin-bottom: 5px;
	padding: 10px;
	font-size: 1rem;
	border-radius: 5px;
	border: 1px solid #99b19c;
}

select option {
	font-size: 1rem;
}

input[type="button"], input[type="submit"], input[type="reset"] {
	display: inline-block;
	padding: 10px;
	font-size: 1rem;
	color: #fff;
	background-color: #99b19c;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	float: right;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	background-color: #113000;
}

label {
	display: block;
	font-size: 1rem;
	margin-bottom: 5px;
	font-weight: bold;
}

.clear {
	clear: both;
}

#error-msg {
	color: red;
	font-weight: bold;
	margin-top: 10px;
}

.divresult {
	margin-bottom: 10px;
	font-size: 1rem;
	font-weight: bold;
}

.address-wrap {
	display: flex;
	flex-wrap: wrap;
}

#sample4_postcode {
	width: 150px;
	margin-right: 10px;
}

#sample4_roadAddress {
	flex: 1;
	margin-right: 10px;
}

#sample4_detailAddress {
	flex: 1;
}
</style>
</head>
<body>



	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../../inc/top.jsp"/>
	<!-- 헤더파일들어가는 곳 -->
	<%
	// String id=(String)session.getAttribute("id"); 
	// CampRegDTO cdto = (CampRegDTO)request.getAttribute("cdto");
	// MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");
	%>
	<article>
		<!-- 	<h2 class="heading-section">예약</h2> -->
		<!-- 	<div id="wrap">               -->
		<!--   		<form action="ProductAppointmentPro.pr" name="appointmentform" id="appointment" method="post"> -->
		<!--           <fieldset>                   -->
		<!--                <h3 class="menu-section">예약자 정보확인</h3> -->
		<!--                  <div class="ap-services"> -->
		<%--                     예약자명 : <input type="text" name="mname" value="<%=mdto.getName()%>" readonly><br> --%>
		<%--                     전화번호 : <input type="text" name="phone" value="<%=mdto.getPhone()%>" readonly> --%>
		<%--                     닉네임 : <input type="text" name="" value="<%=mdto.getNick()%>" readonly> --%>
		<!-- 				 </div> -->

		<!--  <h3 class="menu-section">예약정보 입력</h3> -->
		<!-- 				  <div class="ap-services">	 -->
		<%-- 					펜션이름 : <input type="text" name="pname" value="<%=cdto.getCampname()%>" readonly><br> --%>
		<%-- 					숙박료 : <input type="text" name="price" value="<%=cdto.getCampprice()%>원 /1박" readonly><br> --%>
		<!-- 					입실일 : <input type="date" name="indate" id="chekcin"><br> -->
		<!-- 					퇴실일 : <input type="date" name="checkout"><br> -->
		<!-- 					인원수 : <select name="guest"> -->
		<!--                                                     <option value="1">1명</option> -->
		<!--                                                     <option value="2">2명</option> -->
		<!--                                                     <option value="3">3명</option> -->
		<!--                                                     <option value="4">4명</option> -->
		<!--                                                     <option value="5">5명</option> -->
		<!--                                                     <option value="6">6명</option> -->
		<!--                                                     <option value="7">7명</option> -->
		<!--                                                     <option value="8">8명</option> -->
		<!--                                                     <option value="9">9명</option></select><br> -->
		<!-- 				</div> -->
		<!-- 					<input type="submit" value="예약하기"> -->
		<%-- 					<input type="hidden" name="id" value="<%=mdto.getId()%>"> --%>
		<%-- 					<input type="hidden" name="campid" value="<%=cdto.getCampid()%>"> --%>
		<!-- 					</fieldset> -->
		<!-- 				</form> -->
		<!--                </div>   -->
<%
MemberDTO memberDTO =(MemberDTO)request.getAttribute("memberDTO");
CampRegDTO campRegDTO = (CampRegDTO)request.getAttribute("campRegDTO");
%>


		<div id="wrap">
			<form action="reserve_detailPro.re" name="reservedetailform"
				id="reserve_detail" method="post">
				<fieldset>
					<h3 class="menu-section">예약자 정보확인</h3>
					<div class="ap-services">
					<input type="hidden" name="member_id" value="<%=memberDTO.getMember_id() %>"><br>
					<input type="hidden" name="id" value="<%=memberDTO.getId() %>"><br>
						예약자명 : <input type="text" name="name" value="<%=memberDTO.getName()%>"><br>
						전화번호 : <input type="text" name="phone" value="<%=memberDTO.getPhone()%>"><br>
						닉네임 : <input type="text" name="nick" value="<%=memberDTO.getNick()%>">
					</div>

					<h3 class="menu-section">예약정보 입력</h3>
					<div class="ap-services">
					<input type="hidden" name="camp_id" value="<%=campRegDTO.getCampid() %>"><br>
					<input type="hidden" name="camp_price" value="<%=campRegDTO.getCampprice() %>"><br>
						펜션이름 : <input type="text" name="camp_name" value="<%=campRegDTO.getCampname()%>"><br>
						숙박료 : <input type="text" name="price" value="<%=campRegDTO.getCampprice() %>원 /1박"><br>
						입실일 : <input type="date" name="checkin_date"><br>
						퇴실일 : <input type="date" name="checkout_date"><br> 인원수 : <select
							name="guest">
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
						</select><br>
					</div>
					<input type="submit" value="예약하기" >
<!-- 					onclick="location.href='../mypageReserveDetail/mypage_reserve_detail.jsp'">  -->
					<input type="hidden" name="id" value="textbox"> <input type="hidden"
						name="campid" value="textbox">
				</fieldset>
			</form>
		</div>

	</article>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../../inc/bottom.jsp" />
	<!-- 푸터 들어가는 곳 -->
</body>
</html>
<!-- <input type="submit" class="reserve-detail__27" value="예약하기" -->
<!-- 	onclick="location.href='../mypageReserveDetail/mypage_reserve_detail.jsp'"> -->
</div>
</div>
</div>
</div>



</body>

</html>
