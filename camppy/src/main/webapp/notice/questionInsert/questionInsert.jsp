<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./questionInsert.css" />

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
    <div class="questionInsert">

        <div class="questionInsertSectionBody">
        
          <div class="questionInsertInputBox">
          
            <div class="questionInsertLine1"></div>
            <div class="questionInsertLine2"></div>
            <img class="questionInsertPictureIcon" src="picture-icon.png" />
            <div class="questionInsertBox"></div>
          </div>
          
          <div class="questionInsertTitle">
            <div class="questionInsert3">문의하기</div>
            
            <!--            제목을 입력해 주세요 -->
            <textarea class="questionInsert1"></textarea>
            
			<!--            문의 내용을 입력해 주세요 -->
            <textarea class="questionInsert2"></textarea>
          </div>
          
          <div class="questionInsertButton">
           <input type="button" class="questionInsertLeaveButton" value="나가기">
             <input type="button" class="questionInsertRegisterButton" value="등록">
		</div>
          
        </div>
      </div>

  </body>
</html>