<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./noticeUpdate.css" />

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
/*         appearance: none; */
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="noticeupdate">

        <div class="noticeupdateSectionBody">
          <div class="noticeupdateBodyContents">
            <div class="noticeupdateLine2"></div>
            <div class="noticeupdateGroup2">
            
              <div class="noticeupdateRectangle2">
                 <select class="noticeUpdate23" >
                <option value="1">말머리</option>
             	<option value="2">로그인</option>
             	<option value="3">결제</option>
             </select>
              
              
              </div>

            </div>
            <img class="noticeupdateFreeIconImage1" src="free-icon-image-8191595-1.png" />
<!--             <img class="noticeupdateImage1" src="image-1.png" /> -->

            <div class="noticeupdateRectangle1"></div>
            <div class="noticeupdateLine1">            </div>

            <!--            제목을 입력해 주세요 -->
            <textarea class="noticeupdate2"></textarea>
			<!--            문의 내용을 입력해 주세요 -->
            <textarea class="noticeupdate3"></textarea>
	</div>


          <div class="noticeupdateBodyButton">
              <input type="button" class="noticeupdateButtonExit" value="나가기">
              <input type="button" class="noticeupdateButtonupdate" value="수정">
		</div>
       
       
        </div>
    </div>
  </body>
</html>