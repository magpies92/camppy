<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="camppy.reserve.dao.ReserveDetailDTO" %>
<%@ page import="camppy.reserve.dao.ReserveDetailDTO" %>
<%@ page import="java.util.ArrayList" %>

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

//  int startPage=(Integer)request.getAttribute("startPage");
//  int pageBlock=(Integer)request.getAttribute("pageBlock");
//  int endPage=(Integer)request.getAttribute("endPage");
//  int pageCount=(Integer)request.getAttribute("pageCount");
	
//  SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");	
	List<ReserveDetailDTO> reserveList=(List<ReserveDetailDTO>)request.getAttribute("reserveList");
%>
		

<div id="wrap">
 <article class="art">	
  <div class="res">  
       <div class="col-lg-12">           
             <h3 class="heading-section">Reservation</h3><br> 
             <a class="count">계좌번호 : 아이티윌뱅크 72402170917<br>
             	예금주 : (주)섬집</a>
	   </div> 
    </div>
	<div><table class="table">
	<thead class="thead-primary"> 
<!-- 	 로그인한 사용자의 예약 리스트와 예약취소 --> 
 	<tr><td> 예약번호 </td><td> 펜션명 </td><td> 예약상태 </td> 
 	<td> 예약일자 </td><td>총 금액</td><td> 예약취소 </td></tr> 
 	</thead>
 	<% 
 	for(int i=0;i<reserveList.size();i++){
 		//배열 한칸에 내용 가져오기 
 		ReserveDetailDTO rdto=reserveList.get(i);
 		
 		%> 
 	<tr><td> <%=rdto.getRes_id()%> </td> 
	    <td> <%=rdto.getCamp_id()%> </td> 
	        <td class="a"> <% 
	    if(rdto.getRes_status()==1){
 	    	out.print("입금대기"); 	    
 	    }else if(rdto.getRes_status()==3){
 	    	out.print("예약완료");
  	    }%> </td>
	    <td> <%=dateFormat.format(adto.getAdate())%> </td> 
	    <td>
	     <script type="text/javascript">
          var num = <%=rdto.getCamp_price()%>;
          document.write(num.toLocaleString()+"원");
         </script>
         /<%=rdto.getCamp_price()/rdto.getCamp_price()%>박
	    </td>
	    <td><button type="button" class="btn btn-outline-secondary" onclick="location.href='ProductAppointManagePro.pr?ano=<%=adto.getAno()%>'">Cancel</button></td></tr>
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
//		1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//		11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//		21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

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



if(startPage > pageBlock){
	%>
	<a href="ProductAppointManage.pr?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
 %>
<div class="room-pagination">
<%
 for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="ProductAppointManage.pr?pageNum=<%=i%>"><%=i%></a>
	<%
}
 %> 
</div>
<%

// //10페이지 다음
if(endPage < pageCount){
	%>
	<a href="ProductAppointManage.pr?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
 }
 %>

</article>
</div>
<!-- <!-- 푸터 들어가는 곳 --> 
<jsp:include page="../inc/footer.jsp" />
<!-- <!-- 푸터 들어가는 곳 -->

</body>
</html>