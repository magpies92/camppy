<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./myLikeList.css" />
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
       /*  appearance: none; */
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="likeListBody">
         <div class="allCheck"> 전체선택
         <input type="checkbox" name="all" class="allCheckbox"
         style="margin-left: 1vw;"></div> 
          <div class="likeList">
            <img class="likeListPhoto"
             src="campphoto.png"/>
            <div class="likeListTitle">거제 해오름 캠핑장</div>
            <div class="likeListAdd">
              거제시 해운리 강동로 132-12
            </div>
            <div class="likeListTag">
              #전기 #온수 #개별화장실 #개별샤워장
            </div>
            <div class="likeListTell">055-123-4567</div>
            
              <div class="likeTitle">찜
			  <div class="likeNum">25</div></div>

              <div class="readCount">조회수
			  <div class="count">1153</div></div>
                    
			  <div class="eachCheck">
             <input type="checkbox" name="each" class="eachCheckbox"></div> 
          

            <input type="button" value="삭제" class="bannerRsButton" >  
          </div>
          <div class="mypage-like-list__page-list">
            <img
              class="mypage-like-list__item-link-btn-pre-00-png"
              src="photo1.png"
            /><img
              class="mypage-like-list__item-link-btn-pre-01-png"
              src="photo2.png"
            />
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-1">1</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-2">2</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-3">3</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-4">4</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-5">5</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-6">6</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-7">7</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-8">8</div>
            </div>
            <div class="mypage-like-list__item">
              <div class="mypage-like-list__link-9">9</div>
            </div>
            <div class="mypage-like-list__item2">
              <div class="mypage-like-list__link-10">10</div>
            </div>
            <img
              class="mypage-like-list__item-link-btn-next-01-png"
              src="photo3.png"
            /><img
              class="mypage-like-list__item-link-btn-next-00-png"
              src="photo4.png"
            />
          </div>
    </div>
  </body>
</html>
