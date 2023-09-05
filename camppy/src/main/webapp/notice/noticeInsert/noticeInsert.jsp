<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/noticeInsert/noticeInsert.css" />

    <style>
      a,
      button,
      input,
/*       select, */
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
      /* appearance: none; */
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="noticeInsert">
     
        <div class="noticeInsertSectionBody">
          <div class="noticeInsertBodyContents">
            <div class="noticeInsertLine2"></div>

              <div class="noticeInsertRectangle2">
                <select class="noticeInsert23" >
                <option value="1">말머리</option>
             	<option value="2">로그인</option>
             	<option value="3">결제</option>
             </select>
              </div>


     
           
            <img class="noticeInsertFreeIconImage1" src="free-icon-image-8191595-1.png"/>
            <div class="noticeInsertRectangle1"></div>
            <div class="noticeInsertLine1"></div>
           
			<!--            제목을 입력해 주세요 -->
            <textarea class="noticeInsert2"></textarea>
            
			<!--             문의 내용을 입력해 주세요 -->
            <textarea class="noticeInsert3"></textarea>
          </div>
          
            <div class="noticeInsertButton">

            <input type="button" class="noticeInsertLeaveButton" value="나가기">
            <input type="button" class="noticeInsertRegisterButton" value="등록">
          </div>
          
          
        </div>
      </div>

  </body>
</html>