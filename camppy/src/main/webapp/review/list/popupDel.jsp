<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    

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
    .popup-logout,
.popup-logout * {
  box-sizing: border-box;
}
.popupDel {
  background: #ffffff;
  width: 400px;
  height: 125px;
  position: relative;
  overflow: hidden;
}
.delSection	{
  display: flex;
  flex-direction: row;
  gap: 7.16px;
  align-items: flex-end;
  justify-content: flex-start;
  flex-wrap: wrap;
  width: 400px;
  height: 125.37px;
  position: absolute;
  left: calc(50% - 200px);
  top: 0px;
}


.delAlert {
  color: #000000;
  text-align: center;
  font: 400 14.33px "Inter", sans-serif;
  position: absolute;
  left: calc(50% - 146.27px);
  top: 33.43px;
  width: 292.54px;
  height: 23.88px;
}
.yesButton {
  background: #4da385;
  border-radius: 5.97px;
  flex-shrink: 0;
  width: 64.48px;
  height: 26.27px;
  position: absolute;
  left: 130.76px;
  top: 62.09px;
  color: #ffffff;
  text-align: center;
  font: "NanumGothic", sans-serif;
}
.noButton {
  background: #4da385;
  border-radius: 5.97px;
  flex-shrink: 0;
  width: 64.48px;
  height: 26.27px;
  position: absolute;
  left: 207.76px;
  top: 62.09px;
  color: #ffffff;
  text-align: center;
  font: "NanumGothic", sans-serif;
}
</style>
<title>리뷰삭제</title>
</head>
<%
//로그인 정보를 session에서 가져오기
String id=(String)session.getAttribute("id");
%>
  <body>
    <form action="deletePro.jsp" method="post" class="popupDel">
      <div class="delSection">
 		<div class="delAlert">삭제 하시겠습니까?</div>
         <input type="submit" value="네" class="yesButton" onclick="deleteReview();">
         <input type='BUTTON' value=" 아니요" class="noButton"
         onClick='window.close()'>
      </div>
    </form>
  </body>
</html>
