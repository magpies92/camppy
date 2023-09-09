<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.camppy.dto.DetailDTO" %>
<%@ page import="com.camppy.dao.DetailDAO" %>
<%@ page import="camppy.reserve.dao.ReserveDetailDTO" %>
<%@ page import="camppy.reserve.dao.ReserveDetailDAO" %>
<%@ page import="camppy.reserve.dao.MyReserveDTO" %>
<%@ page import="camppy.reserve.dao.PageDTO" %>
<%@ page import="camppy.reserve.dao.MyReserveDAO" %>    
    
<!DOCTYPE html>
<html>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>Camppy</title>
<style type="text/css">
	.wrap {
		font-family: 'NanumSquareNeo';
		max-width: 800px;
		height: 800px;
		margin: 0 auto;
		padding: 20px;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		box-sizing: border-box;
	}
	
	#myList {
		margin-left: 130px;
	}
 	
 	#myList h3 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
 	}
 	
 	#myList h5 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
		text-align: center;
 	}
 	
 	#myList ul {
 		margin: 50px 0px 40px 0px;
 	}
 	
 	#myList ul li {
 		list-style: none;
 		text-align: center;
 	}

	#myList #hrefImg {
		float: left;
		opacity: 1;
		-webkit-transition: .3s ease-in-out;
		transition: .3s ease-in-out;
	}
	#myList #hrefImg:hover {
	  	opacity: .5;
	}
	
 	#myList #timecheck {
 		margin: 10px 20px 15px 10px;
 	}
 	
 	#myList ul button {
 		margin-top: 10px;
 	}
 	
 	#myList ul #btns {
 		width: 150px;
        margin: 0 auto;
 	}
 	
 	footer {
 		padding-top: 50px;
 	}
 	
</style>
</head>

<body>
<%
	// 아이디 세션 값
	String id = (String)session.getAttribute("id");
	int res_id = Integer.parseInt(request.getParameter("res_id")); 
	
	// 예약정보
	
	
	
	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	
	//DetailDTO detailDTO=(DetailDTO)request.getAttribute("detailDTO");
	ReserveDetailDAO reserveDetailDAO = new ReserveDetailDAO();
	ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
	reserveDetailDTO = reserveDetailDAO.getDetailres(res_id);
	
%>
<!-- header -->
<header>
<%-- 	<jsp:include page="../inc/my_header.jsp" /> --%>
</header>

<div class="wrap">
	<form name="myListForm.me" id="myList" method="post">
	<h3>내 이용 내역</h3>
	
<% 
	// 예약 내역 확인
	
	
		// 예약정보 - 펜션이름, 체크인 / 체크아웃 시간
		DetailDAO ddao = new DetailDAO();
		DetailDTO ddto = ddao.getDetailList(reserveDetailDTO.getCamp_id());
		
		String camp_addr = ddto.getCamp_addr();
		String camp_img = ddto.getCamp_img();	// 펜션 대표 이미지
		String camp_name = ddto.getCamp_name(); // 펜션 이름
		String checkin_date = reserveDetailDTO.getCheckin_date(); // 체크인 시간
		String checkout_date = reserveDetailDTO.getCheckout_date(); // 체크아웃 시간
		
// 		SalesDTO salesdto = salesdao.getSalesAno(adto.getAno());
		
		String reserveIndateSt = reserveDetailDTO.getCheckin_date(); // 체크인 날짜
		String reserveOutdateSt = reserveDetailDTO.getCheckout_date(); // 체크아웃 날짜

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date reserveIndate = format.parse(reserveIndateSt);
		Date reserveOutdate = format.parse(reserveOutdateSt);
		
		
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
		
		// 예약일자 포맷 변경
		Date date = reserveDetailDTO.getRes_time();
		LocalDate reservedate = LocalDate.ofInstant(date.toInstant(), ZoneId.systemDefault()); // 예약일자
		
	
	%>
	
	<ul>
<!-- 		<hr> -->
			<li><img src="campimg/<%=camp_img%>" width="450px" height="450px"></li>
		<li>예약일자 : <%=reservedate %></li>
		<h5><%=camp_name %></h5>
		<li>주소 : <%=camp_addr %><li>
		<li id="timecheck">체크인 <%=dateFormat.format(reserveIndate) %> </li>
		<li id="timecheck">체크아웃 <%=dateFormat.format(reserveOutdate) %></li>
<%-- 		<%=checkin_date.substring(0, 2) %>시 <%=checkin_date.substring(3) %>분 --%>
<%-- 		 <%=checkout_date.substring(0, 2) %>시 <%=checkout_date.substring(3) %>분 --%>
		</ul>
		</form>
		</div>
		 <div id="map" style="width:70%;height:350px; left:250px; bottom:3vw; position: relative;"></div>
		<script type="text/javascript" src="script/jquery-3.7.0.js"></script>             
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cbf788470a637f86f3a750ad4f9d949&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};  
var addr ="<%=camp_addr%>"; 
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {
// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">여기</div>'
    });
    infowindow.open(map, marker);
    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});  

</script>


<!-- <!-- 푸터 들어가는 곳  -->
	<jsp:include page="/inc/bottom.jsp" />
<!-- <!-- 푸터 들어가는 곳 -->
		

</body>
</html>