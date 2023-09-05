<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./questionUpdate.css" />

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
    <div class="questionUpdate">
      <div class="questionUpdateSectionTotal">
        <div class="questionUpdateSectionBody">
          <div class="questionUpdateButton">
            <div class="questionUpdateLeaveButton">
            <input type="button" class="questionUpdateB" value="나가기">
            </div>
            <div class="questionUpdateReviseButton">
              <input type="button" class="questionUpdate2" value="수정">
            </div>
          </div>
          <div class="questionUpdateTitle">
            <div class="questionUpdate3">문의하기</div>
          </div>
          <div class="questioUpdateInputBox">
            <div class="questionUpdateLine1"></div>
            <div class="questionUpdateLine2"></div>
            <img class="questionUpdatePictureIcon" src="picture-icon.png" />
            
            <div class="questionUpdateBox"></div>
            <!--            제목을 입력해 주세요 -->
            <textarea class="questionUpdate4"></textarea>
            
			<!--            문의 내용을 입력해 주세요 -->
            <textarea class="questionUpdate5"></textarea>
            
          </div>
          
          
        </div>
      </div>
    </div>
  </body>
</html>
