<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./infoPosition.css" />
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
<!-- 페이지 전체 -->
<div class="campInfo">

<!-- 캠핑장명 및 예약하기 버튼 있는 헤더 -->
  <div class="bannerSectionTotal">
<!--헤더 배경 이미지 들어감-->
  <img class="bannerBg" src="banner-bg.png" />
<!-- 캠핑장명 및 한 줄 소개 -->
    <div class="campName">사천비토솔섬오토캠핑장
    <div class="campReport">일몰과 바다 전망이 장관인 솔섬오토캠핑장</div>
<!-- 산 아이콘 -->
    <img class="bannerMountainIcon"
     src="banner-weather.png"/>     
<!-- 예약하기 버튼 -->              
    <input type="button" value="예약하기" class="bannerRsButton" >        
  </div> </div><!-- 캠핑장명 및 예약하기 버튼 있는 헤더 닫기 -->

<!-- 캠핑장 정보 -->     
  <div class="infoSectionBody">
  
<!-- 캠핑장 정보 상단 전체 -->
   <div class="mainInfo">
<!--캠핑장 메인 사진-->  
     <img class="mainImg"
     src="mainImg.png"/> 
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
 
<!-- 찾아오시는 길 -->
 <div class="campMap">
<!-- 타이틀 -->
   <img class="comeIcon" src="_1.png" />
   <div class="comeRoad">찾아오시는 길</div>
<!-- 이미지 -->
   <div class="mapImgDiv">
   <img class="mapImg"
    src="map.png"
              />
            </div>
          </div>
        </div>
      </div>
  </body>
</html>
