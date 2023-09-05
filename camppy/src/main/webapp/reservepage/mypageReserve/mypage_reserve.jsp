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
    width: 900px;
    height: 700px;
  	padding-left: 100px;
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
     
}
.table td.a{
color: #22741C;
font-weight: bold;
}

.count{
float: right;	
}
.res{
height: 150px;

}

</style>
</head>
<body>

<!-- 헤더들어가는 곳 -->
<%-- <jsp:include page="../inc/my_header.jsp" /> --%>
<!-- 헤더들어가는 곳 -->
		

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
       <div class="col-lg-12">  
       </div>
       </div>
	<div><table class="table">
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
 		
 		CampRegDAO cdao = new CampRegDAO();
 		CampRegDTO cdto = new CampRegDTO();
 		%> 
 	<tr><td> <%=rdto.getRes_id()%> </td> 
	    <td> <%=rdto.getCamp_id()%> </td> 
	        <td class="a"> <% 
	    if(rdto.getRes_status()==0){
 	    	out.print("입금대기"); 	    
 	    }else if(rdto.getRes_status()==1){
 	    	out.print("예약완료");
  	    }%> </td>
	    <td> <%=rdto.getRes_time()%> </td>
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
	<a href="mypage.reserve.re?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
 %>
<div class="room-pagination">
<%
 for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="mypage.reserve.re?pageNum=<%=i%>"><%=i%></a>
	<%
}
 %> 
</div>
<%

// 10페이지 다음
if(endPage < pageCount){
	%>
	<a href="mypage.reserve.re?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
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
<%-- <jsp:include page="../inc/.jsp" /> --%>
<!-- <!-- 푸터 들어가는 곳 -->

</body>
</html>