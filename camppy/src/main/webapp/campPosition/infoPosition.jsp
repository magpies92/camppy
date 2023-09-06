<%@page import="org.apache.catalina.mbeans.DataSourceUserDatabaseMBean"%>
<%@page import="com.camppy.dto.DetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="campPosition/infoPosition.css" />
	
    <style>
      a,
      button,
      input,
      select,
      h1,
      h2,
      h3,
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
      
      .starImg{
      position: relative; 
      display: inline-block; 
      }
    </style>
    
    <title>Document</title>
  </head>
  <body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="/inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<%
DetailDTO detailDTO=(DetailDTO)request.getAttribute("detailDTO");
String camp_addr = detailDTO.getCamp_addr();

%>

<!-- 페이지 전체 -->
<div class="campInfo">

<!-- 캠핑장명 및 예약하기 버튼 있는 헤더 -->
  <div class="bannerSectionTotal">
<!--헤더 배경 이미지 들어감-->
  <img class="bannerBg" src="campInfo/banner-bg.png" />
<!-- 캠핑장명 및 한 줄 소개 -->
    <div class="campName"><%=detailDTO.getCamp_name() %>
    <div class="campReport"><%=detailDTO.getShort_intro() %></div>
   </div>
<!-- 예약하기 버튼 -->              
    <input type="button" value="예약하기" class="bannerRsButton"
           onclick="location.href='reserve_detail.re?campId=<%= detailDTO.getCamp_id() %>'" >        
  </div> <!-- 캠핑장명 및 예약하기 버튼 있는 헤더 닫기 -->

<!-- 캠핑장 정보 -->     
  <div class="infoSectionBody">
  
<!-- 캠핑장 정보 상단 전체 -->
   <div class="mainInfo">
<!--캠핑장 메인 사진-->  
     <div class="campPhotoBox">
      <input type="radio" name="slide" id="slide1" checked>
      <input type="radio" name="slide" id="slide2">
      <input type="radio" name="slide" id="slide3">
      <input type="radio" name="slide" id="slide4">
      
      <div class="slideWrap">
       	<ul class="slideList" style="list-style-type: none;">
      		<li>
      			<a>
      				<label for=slide3 class="left">
      				<img src="campInfo/left-arrow.png" 
      				style="width: 50px; opacity: 50%; position: relative; right: 78px;" ></label>
      				<img src="campimg/<%=detailDTO.getCamp_img() %>">
      				<label for="slide2" class="right">
      				<img src="campInfo/right-arrow.png"
      				style="width: 50px; opacity: 50%; position: relative; left: 78px;" ></label>
      			</a>
      		</li>
      		<li>
      			<a>
      				<label for=slide1 class="left">
      				<img src="campInfo/left-arrow.png" 
      				style="width: 50px; opacity: 50%; position: relative; right: 78px;" ></label>
      				<img src="campimg/<%=detailDTO.getPic1() %>">
      				<label for="slide3" class="right">
      				<img src="campInfo/right-arrow.png"
      				style="width: 50px; opacity: 50%; position: relative; left: 78px;" ></label>
      			</a>
      		</li>
      		<li>
      			<a>
      				<label for=slide2 class="left">
      				<img src="campInfo/left-arrow.png" 
      				style="width: 50px; opacity: 50%; position: relative; right: 78px;" ></label>
      				<img src="campimg/<%=detailDTO.getPic2() %>">
      				<label for="slide1" class="right">
      				<img src="campInfo/right-arrow.png"
      				style="width: 50px; opacity: 50%; position: relative; left: 78px;" ></label>
      			</a>
      	
      	</ul>
      
      </div>

   </div>
<!--캠핑장 메인 정보 프레임-->
      <div class="infoList">
<!--캠핑장 주소-->
      <div class="infoAddress">주소 
        <div class="campAddress"><%=detailDTO.getCamp_addr() %></div>
      </div>
<!--캠핑장 번호-->
     <div class="infoTell">문의처
       <div class="tellNum"><%=detailDTO.getTel() %></div>
     </div>
<!--캠핑장 환경-->
     <div class="infoSet">캠핑장 환경
       <div class="setBg"><%=detailDTO.getEnvironment() %></div>
     </div>
<!--캠핑장 유형-->
     <div class="infoType">캠핑장 유형
       <div class="type"><%=detailDTO.getCamp_type() %></div>
     </div>
<!--운영 기간-->
     <div class="runSeason">운영기간
       <div class="season"><%=detailDTO.getSeason() %></div>
     </div>
<!--운영일-->
      <div class="runDay">운영일
        <div class="week"><%=detailDTO.getRuntime() %></div>
      </div>
<!--홈페이지 연결-->
      <div class="homePage">홈페이지
        <a href="<%=detailDTO.getHomepage() %>" class="pageLink">바로 가기</a>
      </div>
<!--주변이용시설-->
     <div class="useSpace">주변이용시설
       <div class="space"><%=detailDTO.getFacility() %></div>
     </div>
<!--별점-->
     <div class="rating">별점
       <div class="star"> 
       <%-- <%=detailDTO.getReview_rate() %> --%>
        <%-- <%
        float review_rate=Float.parseFloat(detailDTO.getReview_rate());
        int r1=(int)review_rate;
        
        for(int i=1; i<=5; i++){
        	if(i<=r1){
        		%>
        		
        		
             	<img src="campInfo/star-on.png"> 
             	<%
        	}else{
        		if(review_rate>0/* review_rate*10.0%10==0 */){
        			%>
        			<img src="campInfo/star-half.png"> 
        			<% 
                }else{
                	
                } 
        		%>
        		
        		<img src="campInfo/star-off.png">
        		<%
        	}
         	
         }

        %> --%>
        
         <%
float rating = Float.parseFloat(detailDTO.getRating());
int integerPart = (int) rating;
int fractionalPart = Math.round((rating - integerPart) * 10);

for (int i = 1; i <= 5; i++) {
    if (i <= integerPart) {
%>
    <img src="campInfo/star-on.png" class="starImg">
<%
    } else {
        if (fractionalPart > 0) {
%>
            <img src="campInfo/star-half.png" class="starImg">
<%
            fractionalPart = 0;
        } else {
%>
            <img src="campInfo/star-off.png" class="starImg">
<%
        }
    }
}
%> 
  <!-- </div> -->
 </div> 
	    <span class="unLikeButton" style="display: inline;" onclick="likeButton(this)">찜하기</span>
        <span class="likeButton" style="display: none;" onclick="unLikeButton(this)">찜하기</span>
     </div>
 </div> <!--캠핑장 메인 정보 닫기-->
</div> <!-- 캠핑장 정보 상단 전체 닫기-->

<!-- 카테고리 링크 -->
 <div class="infoLinkList">
   <!-- <div class="infoLink1">캠핑장소개</div> -->
   <input type="button" value="캠핑장소개" class="infoLink2"
           onclick="location.href='detail.de?campId=<%=detailDTO.getCamp_id() %>'" >
           
   <div class="infoLink1">위치/주변정보</div>
   
   <!-- <div class="infoLink2">캠핑후기</div> -->
   <input type="button" value="캠핑후기" class="infoLink2"
           onclick="location.href='review.de?campId=<%=detailDTO.getCamp_id() %>'" > 
 </div>
 
<!-- 찾아오시는 길 -->
 <div class="campMap">
<!-- 타이틀 -->
   <img class="comeIcon" src="campPosition/_1.png" />
   <div class="comeRoad">찾아오시는 길</div>
   
<!-- 이미지 -->
   <!-- <div class="mapImgDiv"> -->
  <!--  <img class="mapImg"
    src="map.png" />-->
                <!-- </div> -->
          </div>
    </div>
  </div>
  
  <div id="map" style="width:100%;height:573px; bottom:36vw; position: relative;"></div>
  
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>             
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=
0f4aea8ae72f25c6618d8ef10e96afac&libraries=services"></script>
<script type="text/javascript">
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

function likeButton(e){
    var i = $(".unLikeButton").index(e); // 같은 클래스 내 index 값을 가져옴
    document.getElementsByClassName('unLikeButton')[i].style.display = "none"; // 즐겨찾기 취소 버튼 비활성화
    document.getElementsByClassName('likeButton')[i].style.display = "inline"; // 즐겨찾기 추가 버튼 활성화
 }
 // 즐겨찾기 해제
 function unLikeButton(e){
    var i = $(".likeButton").index(e); // 같은 클래스 내 index 값을 가져옴
    document.getElementsByClassName('unLikeButton')[i].style.display = "inline"; // 즐겨찾기 취소 버튼 비활성화
    document.getElementsByClassName('likeButton')[i].style.display = "none"; // 즐겨찾기 추가 버튼 활성화
 }

  

</script>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 --> 


              
              


  </body>
</html>
