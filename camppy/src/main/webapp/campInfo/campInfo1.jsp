<%@page import="com.camppy.dto.DetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="campInfo/campInfo.css" />

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
    </style>
    
    <title>Document</title>
  </head>
  <body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="/inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<%
DetailDTO detailDTO=(DetailDTO)request.getAttribute("detailDTO");
%>

<!-- 페이지 전체 -->
<div class="campInfo">

<!-- 캠핑장명 및 예약하기 버튼 있는 헤더 -->
  <div class="bannerSectionTotal">
<!--헤더 배경 이미지 들어감-->
  <img class="bannerBg" src="campInfo/banner-bg.png" />
<!-- 캠핑장명 및 한 줄 소개 -->
    <div class="campName"><%=detailDTO.getCamp_name() %>
    <div class="campReport">일몰과 바다 전망이 장관인 솔섬오토캠핑장</div>
   </div>
<!-- 예약하기 버튼 -->              
    <input type="button" value="예약하기" class="bannerRsButton" >        
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
      				<label for=slide4 class="left">
      				<img src="campInfo/left-arrow.png" 
      				style="width: 50px; opacity: 50%; position: relative; right: 78px;" ></label>
      				<img src="campInfo/photo1.png"/>
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
      				<img src="campInfo/photo2.png"/>
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
      				<img src="campInfo/photo6.png"/>
      				<label for="slide4" class="right">
      				<img src="campInfo/right-arrow.png"
      				style="width: 50px; opacity: 50%; position: relative; left: 78px;" ></label>
      			</a>
      		</li>
      		<li>
      			<a>
      				<label for=slide3 class="left">
      				<img src="campInfo/left-arrow.png" 
      				style="width: 50px; opacity: 50%; position: relative; right: 78px;" ></label>
      				<img src="campInfo/photo7.png"/>
      				<label for="slide1" class="right">
      				<img src="campInfo/right-arrow.png"
      				style="width: 50px; opacity: 50%; position: relative; left: 78px;" ></label>
      			</a>
      		</li>
      	
      	</ul>
      
      </div>

   </div>
<!--캠핑장 메인 정보 프레임-->
      <div class="infoList">
<!--캠핑장 주소-->
      <div class="infoAddress">주소
        <div class="campAddress">경남 사천시 서포면 토끼로 245-29</div>
      </div>
<!--캠핑장 번호-->
     <div class="infoTell">문의처
       <div class="tellNum">055-854-0404 , 010-4955-0506</div>
     </div>
<!--캠핑장 환경-->
     <div class="infoSet">캠핑장 환경
       <div class="setBg">산, 숲 / 민간</div>
     </div>
<!--캠핑장 유형-->
     <div class="infoType">캠핑장 유형
       <div class="type">자동차야영장</div>
     </div>
<!--운영 기간-->
     <div class="runSeason">운영기간
       <div class="season">봄, 여름, 가을, 겨울</div>
     </div>
<!--운영일-->
      <div class="runDay">운영일
        <div class="week">평일+주말</div>
      </div>
<!--홈페이지 연결-->
      <div class="homePage">홈페이지
        <div class="pageLink">홈페이지 바로가기</div>
      </div>
<!--주변이용시설-->
     <div class="useSpace">주변이용시설
       <div class="space">산책로, 낚시, 강/물놀이, 청소년체험시설</div>
     </div>
<!--별점-->
     <div class="rating">별점
       <div class="star">
        <span id="star1">✰</span>
        <span id="star2">✰</span>
        <span id="star3">✰</span>
        <span id="star4">✰</span>
        <span id="star5">✰</span></div>
        <input type="button" value="찜하기" class="likeButton">
     </div>
 </div> <!--캠핑장 메인 정보 닫기-->
</div> <!-- 캠핑장 정보 상단 전체 닫기-->

<!-- 카테고리 링크 -->
 <div class="infoLinkList">
   <div class="infoLink1">캠핑장소개</div>
   <div class="infoLink2">위치/주변정보</div>
   <div class="infoLink2">캠핑후기</div>
 </div>
 
<!-- 캠핑장 중간 사진 -->
 <div class="campCenterImg">
   <img class="campCenterImg1"
    src="campInfo/campCenterImg1.png"/>
  <img class="campCenterImg2"
   src="campInfo/campCenterImg2.png"/>
  <img class="campCenterImg3"
   src="campInfo/campCenterImg3.png"/>
 </div>

<!-- 캠핑장 상세 소개 -->       
  <div class="campExplain">
   솔섬오토캠핑장은 별주부전 테마파크가 있는 사천시 비토섬 인근
   해안에 위치하고 있는 캠핑장이다. 바닥은 파쇄석으로 되어 있으며,
   바다 사이트와 일반 사이트로 구분되어져 있다. 황토방과 펜션도
   함께 운영하고 있어 초보 캠퍼가 이용하기 좋은 캠핑장이다. 바다
   사이트 쪽은 카라반과 트레일러의 입장이 안된다. 그늘막이 있는
   수영장과 항상 깨끗하게 관리되고 있는 화장실과 개수대, 샤워장은
   24시간 온수가 나와 좋으며, 개수대에는 전자레인지와 공용 냉장고가
   설치되어 있어, 언제나 편리하게 신선한 음식을 먹을 수 있어 좋다.
   캠핑장 바로 앞이 바닷가라 갯벌체험을 할 수 있도록 5000원에
   장화와 호미를 대여해 주고 있다. 아이들과 갯벌에서의 바지락, 굴,
   고동, 낚지 등을 잡아 저녁거리도 준비하고 수다로 한편의 추억을
   쌓아보자. 솔섬오토캠핑장은 일몰이 아름답기로 소문난 곳이다.
   타이밍을 놓치지 말고 아름다운 노을을 감상하며 사진으로 담아보길
   권한다. 주변 관광지로는 별주부전 테마파크,삼천포 케이블카, 사천
   항공우주박물관, 삼천포 수산시장이 있으니 아이들과 방문해 보자.
  <span class="reviseDay">최종 정보 수정일 : 2023-08-27</span>
  </div>

<!-- 캠핑장 시설 정보 -->
 <div class="campInfoFacilities">
   <img class="facilitiesIcon" src="campInfo/_1.png"/>
   <div class="infoFacilities">캠핑장 시설 정보</div>
   <!-- 아이콘 -->
   <div class="facilitiesImgBox">
     <img class="facilitiesImg" src="campInfo/_2023-08-18-6-16-1.png"/> 
   </div>
   <!-- 추신 -->
   <div class="infoSpan">
     <span class="infoSpan1"> 
	  * 캠피에 등록된 정보는 현장 상황과 다소 다를 수 있으니 </span>
	 <span class="infoSpan2">
		반려동물 동반 여부, 부가 시설물, 추가 차 </span>
	 <span class="infoSpan3">
        등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 
        확인하시기 바랍니다.</span> </div>
  </div>
 </div> <!-- 캠핑장 정보 닫기-->

 </div> <!-- 페이지 전체 닫기 -->
<!-- 푸터들어가는 곳 -->
<jsp:include page="/inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->    
  </body>
</html>
