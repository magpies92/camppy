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
<!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet"> -->
<!-- <link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png"> -->
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
	
	// 예약정보
	List<ReserveDetailDTO> reserveList=(List<ReserveDetailDTO>)request.getAttribute("reserveList");
	
	PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");
	
	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
	
	// 페이징
	int currentPage = (Integer)request.getAttribute("currentPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int pageBlock = (Integer)request.getAttribute("pageBlock");
	int endPage = (Integer)request.getAttribute("endPage");
	int pageCount = (Integer)request.getAttribute("pageCount");
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
	if(reserveList.size() == 0) {
		%>
		<p>예약된 내역이 없습니다.</p>
		<%
	} else {
		
	for(int i = 0 ; i < reserveList.size(); i++){
		
		// 예약정보 - 펜션이름, 체크인 / 체크아웃 시간
		ReserveDetailDTO rdto = reserveList.get(i);
		DetailDAO ddao = new DetailDAO();
		DetailDTO ddto = ddao.getDetailList(rdto.getCamp_id());
		
		String camp_img = ddto.getCamp_img();	// 펜션 대표 이미지
		String camp_name = rdto.getCamp_name(); // 펜션 이름
		String checkin_date = rdto.getCheckin_date(); // 체크인 시간
		String checkout_date = rdto.getCheckout_date(); // 체크아웃 시간
		int res_id = rdto.getRes_id();
		
		// 체크인 / 체크아웃 날짜
		ReserveDetailDAO reserveDetailDAO = new ReserveDetailDAO();
		rdto = reserveDetailDAO.getDetailres(res_id);
// 		SalesDTO salesdto = salesdao.getSalesAno(adto.getAno());
		
		String reserveIndateSt = rdto.getCheckin_date(); // 체크인 날짜
		String reserveOutdateSt = rdto.getCheckout_date(); // 체크아웃 날짜

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date reserveIndate = format.parse(reserveIndateSt);
		Date reserveOutdate = format.parse(reserveOutdateSt);
		
		
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
		
		// 예약일자 포맷 변경
		Date date = rdto.getRes_time();
		LocalDate reservedate = LocalDate.ofInstant(date.toInstant(), ZoneId.systemDefault()); // 예약일자
		
	%>
	<ul>
<!-- 		<hr> -->
			<li><img src="campimg/<%=camp_img %>" width="150" height="150"></li>
		<li>예약일자 : <%=reservedate %></li>
		<h5><%=camp_name %></h5>
		<li id="timecheck">체크인 <%=format.format(reserveIndate) %> <%=checkin_date.substring(0, 2) %>시 <%=checkin_date.substring(3) %>분</li>
		<li id="timecheck">체크아웃 <%=format.format(reserveOutdate) %> <%=checkout_date.substring(0, 2) %>시 <%=checkout_date.substring(3) %>분</li>
		</ul>
		</form>
		</div>
		<%
	
	}
	}
	
		
		
		%>
	
		
		<%
		
 if(startPage > pageBlock){
	%>
	<a href="DetailList.re?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
 %>
<div class="room-pagination">
<%
 for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="DetailList.re?pageNum=<%=i%>"><%=i%></a>
	<%
}
 %> 
</div>
<%

// 10페이지 다음
if(endPage < pageCount){
	%>
	<a href="DetailList.re?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%

 }
 %>
	





<%
// for(int i=pageDTO.getStartPage();i<=pageDTO.getEndPage();i++){
	%>
<%-- 	<a href="list.bo?pageNum=<%=i%>"><%=i %></a>  --%>
	<%
// }
%>

<%
//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
// if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%>
<%-- 	<a href="list.bo?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">Next</a> --%>
	<%
// }
%>
<%-- 	<a href="list.bo?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock()%>">Prev</a> --%>
 

</form>

<!-- <!-- 푸터 들어가는 곳  -->
	<jsp:include page="../../inc/bottom.jsp" />
<!-- <!-- 푸터 들어가는 곳 -->
		

</body>
</html>