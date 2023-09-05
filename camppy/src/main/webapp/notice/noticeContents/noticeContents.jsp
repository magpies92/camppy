<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./noticeContents.css" />

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
    <div class="noticeContents">

        <div class="noticeContentsSectionBody">
          <div class="noticeContentsQuestionContents">
            <div class="noticeContentsA">공지사항</div>
            <input type="button" class="noticeContentsCommentButton" value="댓글작성">

            <div class="noticeContentsTitleNcontent">
              <div class="noticeContentsC">
                쓰레기 분리수거 문제에 관한 공지사항
              </div>
              <div class="noticeContentsD">
                최근 쓰레기 분리수거 문제로 사업체에서 건의사항이 많이 올라오고
                있습니다 쓰레기 분리수거를 제대로 하지 않거나 쓰레기를 무단투기
                하는 회원분들이 확인된 경우 사이트 이용정지 및 해당 업체 측과
                논의하여 손해배상으로 이어질 수 있으니 이 점 유념하시어 불이익을
                받는 일이 없으시길 바라겠습니다
              </div>
            </div>
            <div class="noticeContentsName">
              <div class="noticeContentsE">관리자</div>
            </div>
            <div class="noticeContentsIconBox">
            
			<button class="noticeContentsLike">
    			<img src="like.png" alt="imgbtn">		</button>
			 <div class="noticeContentsF">3</div>
              
              <img class="noticeContentsCommentIcon" src="comment-icon.png"/>
              <div class="noticeContentsG">1</div>
            </div>
            
            <div class="noticeContentsDateNbutton">
              <div class="noticeContents2023">2023.08.17 16:45</div>

            <input type="button" class="noticeContentsH" value="수정">
            <input type="button" class="noticeContentsI" value="삭제"></div>
            <textarea class="noticeContentsCommentBox"></textarea>
	  </div>
          
          
          <div class="noticeContentsComment">
            <div class="noticeContentsJ">댓글</div>
            <div class="noticeContentsComment1">
              <div class="noticeContentsK7">7일전</div>
              
             <input type="button" class="noticeContentsL" value="삭제">
            <input type="button" class="noticeContentsM" value="수정">
              
              <div class="noticeContentsN">요새도 그런 사람들이 있나!?</div>
              <div class="noticeContentsUser">user</div>
              <img
                class="noticeContentsProfileIcon"
                src="profile-icon.png"
              />
            </div>
            
            <div class="noticeContentsComment2">
              <div class="noticeContentsO5">5일전</div>
              
             <input type="button" class="noticeContentsL" value="삭제">
            <input type="button" class="noticeContentsM" value="수정">
              
              <div class="noticeContentsN">난 항상 잘해서 걱정없음</div>
              <div class="noticeContentsUser">user</div>
              <img class="noticeContentsProfileIcon" src="profile-icon.png"/>
            </div>
            
            <div class="noticeContentsComment3">
              <div class="noticeContentsO3">3일전</div>
             <input type="button" class="noticeContentsL" value="삭제">
            <input type="button" class="noticeContentsM" value="수정">
              <div class="noticeContentsN">
                앞으로 좀 더 신경 써야 겠네요
              </div>
              <div class="noticeContentsUser">user</div>
              <img class="noticeContentsProfileIcon" src="profile-icon.png" />
            </div>
            
          </div>
          
        </div>

    </div>
  </body>
</html>
