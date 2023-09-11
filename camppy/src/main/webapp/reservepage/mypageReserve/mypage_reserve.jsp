<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="camppy.reserve.dao.ReserveDetailDTO" %>
<%@ page import="camppy.reserve.dao.ReserveDetailDAO" %>
<%@ page import="camppy.main.action.CampRegDAO" %>
<%@ page import="camppy.main.action.CampRegDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="camppy.reserve.dao.MyReserveDTO" %>
<%@ page import="camppy.reserve.dao.PageDTO" %>
<%@ page import="camppy.reserve.dao.MyReserveDAO" %>
<%@ page import="camppy.reserve.action.ReserveService" %>
<%@ page import="camppy.reserve.action.ReserveController" %>
<%-- <%@ page import="camppy.main.action.CampRegDTO" %> --%>
<%-- <%@ page import="camppy.main.action.CampRegDAO" %> --%>

<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="UTF-8">
<title>Camppy</title>
<style type="text/css">
#sidebar{
   width: 250px; 
   height: 700px;   
   float: left;
}
.art{
 	font-family: 'NanumSquareNeo';
    width: 600px;
    height: 600px;
  	padding-left: 50px;
/*     margin-bottom: 300px; */
    margin-left: 200;
 
}
.table thead.thead-primary{
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;	
}
.heading-section {
    font-size: 28px;
    color: #393939;
	height: 30px;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    position: relative;
    left: 195px
     
}
.table td.a{
color: #22741C;
font-weight: bold;
}

.count{
float: right;
position: relative;
left: 400px;	
}
.res{
height: 150px;
position: relative; 
left: 400px;
}

	  a,
      button,
      input,
      select,
      h1,
      h2,
      
      h4,
      h5,
      * {
        margin: 0;
        padding: 0;
        border: none;
        text-decoration: none;
        appearance: none; 
        background: none;
      }
       table {
    /* width: 400px;
    height: 200px; */
    margin-left: auto;
    margin-right: auto;
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
	left: 135px;
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
  #tab4 {
	color: lightseagreen;
}
  

</style>
</head>
<body>


<!-- 헤더들어가는 곳 -->
	<jsp:include page="/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


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
		<div class="tab" id="tab1" onclick="location.href='likeList.my'" >찜 리스트</div>
		<div class="tab" id="tab2" onclick="location.href='myCommutList.commu'">작성한 글</div>
		<div class="tab" id="tab3" onclick="location.href='mypageReviewList.rv'">작성 리뷰</div>
		<div class="tab" id="tab4" onclick="location.href='mypage_reserve.re'">예약 내역</div>
	</div>
	

<%
 String id=(String)session.getAttribute("id"); //id 세션값 불러오기 

//  ArrayList<AppointmentDTO> AppointmentList=(ArrayList<AppointmentDTO>)request.getAttribute("AppointmentList");

//  PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
//  System.out.println("pageDTO: " + request.getAttribute("pageDTO"));
//  System.out.println("PageDTO pageSize: " + pageDTO.getPageCount());
//  System.out.println("PageDTO startPage: " + pageDTO.getStartPage());
 
// PageDTO pageDTO = (PageDTO)session.getAttribute("pageDTO");

// List<PageDTO> pageList = (List<PageDTO>) request.getAttribute("pageList");
//     int startPage = pageDTO.getStartPage();
//     int pageBlock = pageDTO.getPageBlock();
//     int endPage = pageDTO.getEndPage();
//     int pageCount = pageDTO.getPageCount();
// pageDTO=(PageDTO)session.getAttribute("PageDTO");



int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
	
PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");

	List<ReserveDetailDTO> reserveList=(List<ReserveDetailDTO>)request.getAttribute("reserveList");
  SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");	
%>
		

<!-- <div id="wrap"> -->
<!--  <article class="art">	 -->
<!--   <div class="res">   -->
<!--        <div class="col-lg-12">            -->
<!--              <h3 class="heading-section">Reservation</h3><br>  -->
<!--              <a class="count">계좌번호 : 아이티윌뱅크 72402170917<br> -->
<!--              	예금주 : (주)섬집</a> -->
<!-- 	   </div>  -->
<!--     </div> -->
<div id="wrap">
 <article class="art">	
  <div class="res">  
       <div class="col-lg-12" >  
<%--        startPage<%=startPage %> --%>
<%--        pageBlock<%=pageBlock %> --%>
<%--        endPage<%=endPage %> --%>
<%--        pageCount<%=pageCount %> --%>
      	 <h3 class="heading-section">Reservation</h3><br> 
      	  <a class="count">계좌번호 : 아이티윌뱅크 202304201023<br>
             	예금주 : (주)Camppy</a>
       </div>
       </div>
	<div><table class="table" style="
    position: relative;
    left: 570px; transform: scale(1.3,1.3);
    top: 21px; line-height: 170%; letter-spacing: 0.5px;
">
	<thead class="thead-primary"> 
<!-- 	 로그인한 사용자의 예약 리스트와 예약취소 --> 
 	<tr><td> 예약번호 </td><td> 펜션명 </td><td> 예약상태 </td> 
 	<td> 예약일자 </td><td>총 금액</td><td> 예약취소 </td></tr> 
 	</thead>
 	<% 
//  	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
 	for(int i=0;i<reserveList.size();i++){
 		//배열 한칸에 내용 가져오기 
 		ReserveDetailDTO rdto=reserveList.get(i);
//  		MyReserveDTO mdto = new MyReserveDTO();
 
//  		CampRegDAO cdao = new CampRegDAO();
//  		CampRegDTO cdto = new CampRegDTO();
 		%> 
 	<tr><td onclick="location.href='DetailList.re?res_id=<%=rdto.getRes_id()%>'"><%=rdto.getRes_id()%> </td>
 	
	    <td> <%=rdto.getCamp_name()%> </td>
	        <td class="a"> <% 
	    if(rdto.getRes_status()==0){
 	    	out.print("입금대기"); 	    
 	    }else if(rdto.getRes_status()==1){
 	    	out.print("예약완료");
  	    }%> </td>
	    <td> <%=dateFormat.format(rdto.getRes_time()) %> </td>
	    <td>
	    
	     
	     <script type="text/javascript">
          var num = <%=rdto.getSprice()%>;
          document.write(num.toLocaleString()+"원");
         </script>
 	

         <%
%>
<% 

// int campPrice = rdto.getCamp_price();
%>
<%-- <%= campPrice %>박 --%>
<!--  int campPrice = rdto.getCamp_price()/rdto.getCamp_price(); -->
<!--   if (campPrice != 0) { -->
<!--       out.print(campPrice + "박"); -->
<!--   } else { -->
<!--       out.print("박"); -->
<!--   } -->
<%
// int campPrice = rdto.getCamp_price();
// int sprice = rdto.getSprice();
// String result = campPrice == 0 ? "박" : (sprice / campPrice) + "박";
%>
<%-- <%= result %> --%>
         <%=rdto.getSprice()/rdto.getCamp_price()%>박
<%-- 			  <%=rdto.getCamp_price()%>박 --%>
				
	    </td>
	    <td><button type="button" class="btn btn-outline-secondary" onclick="location.href='MyReservePro.re?res_id=<%=rdto.getRes_id()%>'">Cancel</button></td></tr>
		<%
 	}
 	%> 
 	
	</table>
	</div>
<!-- <h1>page</h1> -->
<%
// 한 화면에 보여줄 페이지 개수 설정
// int pageBlock=10;
// 시작하는 페이지 번호 구하기
// currentPage			pageBlock	=> startPage
// 		1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
// 		11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
// 		21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
// startPage pageBlock => endPage
//	1			10	   =>	1+10-1  => 10
//	11			10	   =>	11+10-1 => 20
//	21			10	   =>	21+10-1 => 30
// int endPage=startPage+pageBlock-1;
//전체글 개수 select count(*) from Appointment
// int 리턴할형 getAppointmentCount() 메서드 정의
// getAppointmentCount() 메서드 호출
// int count = dao2.getAppointmentCount(no);
//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
//전체페이지(pageCount) 구하기
//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
//
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }
//10페이지 이전

// PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");
// 시작페이지 1페이지 Prev 없음
// 시작페이지 11,21,31 Prev 보임
// if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	
// 	PageDTO pageDTO = (PageDTO)session.getAttribute("pageDTO");
	


// if (pageDTO != null) {
//     int startPage = pageDTO.getStartPage();
//     int pageBlock = pageDTO.getPageBlock();
//     int endPage = pageDTO.getEndPage();
//     int pageCount = pageDTO.getPageCount();




 if(startPage > pageBlock){
	%>
	<a href="mypage_reserve.re?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
 %>
<div class="room-pagination" style=" position: relative; left: 880px; top: 86px">
<%
 for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="mypage_reserve.re?pageNum=<%=i%>"><%=i%></a>
	<%
}
 %> 
</div>
<%

// 10페이지 다음
if(endPage < pageCount){
	%>
	<a href="mypage_DetailList?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
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
	<%

%> 






</article>
</div>
<!-- <!-- 푸터 들어가는 곳  -->
<jsp:include page="/inc/bottom.jsp" />
<!-- <!-- 푸터 들어가는 곳 -->

</body>
</html>