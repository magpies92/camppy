<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=chrome" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./mypageProfile.css" />

    <title>Document</title>
  </head>
<body>
        <div class="mypageProfile">
          <img
            class="mypage-review__free-icon-user-8484069-2"
            src="free-icon-user-8484069-2.png"
          />
          <div class="profileNickname">발레하는 고구마</div>
          <button type="button" onclick="location.href = 'abc.jsp'" class="updateButton">
            <div class="updateProfile">프로필수정</div>
          </button>
          <div class="mypageProfileNum">
            <div class="myVisit">방문횟수</div>
            <div class="visitNum">29</div>
            <div class="myArticle">작성글</div>
            <div class="myArticleNum">3</div>
            <div class="myReply">댓글</div>
            <div class="myReplyNum">6</div>       
          </div>
        </div>
        <div class="mypageNavi">
            <div class="mypageLike" >찜 목록</div>
            <div class="mypageArticle">작성한 글</div>
            <div class="mypageReply">작성 리뷰</div>
            <div class="mypageReserve">예약 내역</div>
        </div>
        
</body>
</html>