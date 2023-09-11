

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<style>

@font-face {
    font-family: 'Pretendard-medium';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
.section-login,
.section-login * {
  box-sizing: border-box;
}
.section-login {
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 1880px;
  height: 83px;
  position: relative;
}
.section-login__login {
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 200px;
  position: absolute;
  left: 1600px;
  top: 15px;
}
.section-login__ {
  color: #000000;
  text-align: center;
  font: 400 20px/22px "Pretendard-medium", sans-serif;
  position: absolute;
  left:0px;
  top: 0px;
 /*  width: 217px;
  height: 40px; */
  display: flex;
 /*  align-items: center;
  justify-content: center; */
}
.section-login__:hover { /* a태그에 마우스를 올렸을 때 */
  color:red;
  cursor: pointer; 
}

.section-login__1 {
  color: #000000;
  text-align: center;
  font: 400 20px/22px "Pretendard-medium", sans-serif;
  position: absolute;
   left:100px;
  top: 0px;
  /* width: 217px;
  height: 40px; */
  display: flex;
  /* align-items: center;
  justify-content: center; */
}
.section-login__1:hover { /* a태그에 마우스를 올렸을 때 */
  color:red;
  cursor: pointer; 
}
.section-header,
.section-header * {
  box-sizing: border-box;
}
.section-header {
  background: rgba(240, 241, 245, 0.1);
  padding: 0px 9.78px 0px 9.78px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 1878.04px;
  height: 278.77px;
  position: relative;
  overflow: hidden;
}
.section-header__main-logo {
  padding: 0px 9.78px 0px 9.78px;
  display: flex;
  flex-direction: column;
  gap: 9.78px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 1872.17px;
  height: 224.97px;
  position: relative;
  cursor: pointer; 
}
.section-header__camppy-2 {
  background: linear-gradient(
    to left,
    rgba(240, 241, 245, 0.2),
    rgba(240, 241, 245, 0.2)
  );
  flex-shrink: 0;
  width: 356.05px;
  height: 224.97px;
  position: relative;
  cursor: pointer; 
}

.section-navi,
.section-navi * {
  box-sizing: border-box;
}
.section-navi {
  background: #e1e3e9;
  padding: 17px 10px 17px 10px;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 1880px;
  height: 109px;
  position: relative;
  overflow: hidden;
}
.section-navi__navi-list {
  padding: 15px 164px 15px 164px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 1684px;
  position: absolute;
  left: calc(50% - 941px);
  top: 9px;
}
.section-navi__navi-list-1 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 200px;
  height: 60px;
  position: absolute;
  left: 287px;
  top: 20px;
}
.section-navi__link {
  color: #000000;
  text-align: center;
  font: 400 24px/28px "Pretendard-medium", sans-serif;
  position: absolute;
  left: calc(50% - 80px);
  top: 4px;
  width: 160px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-navi__link:hover { /* a태그에 마우스를 올렸을 때 */
  color:red;
  cursor: pointer; 
}
.section-navi__navi-list-2 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 200px;
  height: 60px;
  position: absolute;
  left: 635px;
  top: 20px;
}
.section-navi__link2 {
  color: #000000;
  text-align: center;
  font: 400 24px/28px "Pretendard-medium", sans-serif;
  position: absolute;
  left: calc(50% - 80px);
  top: 5px;
  width: 160px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-navi__navi-list-3 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 200px;
  height: 60px;
  position: absolute;
  left: 983px;
  top: 20px;
}
.section-navi__navi-list-4 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 200px;
  height: 60px;
  position: absolute;
  left: 1070.6px;
  top: 20px;
}

.section-navi__navi-list-5 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 200px;
  height: 60px;
  position: absolute;
  left: 1331px;
  top: 20px;
}

.logout,
.logout * {
  box-sizing: border-box;
}
.logout {
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 383px;
  height: 55px;
  position: relative;
  left: 1500px;
}

.logout___000 {
  color: #000000;
  text-align: left;
  font: 400 20px/22px "Pretendard-medium", sans-serif;
  position: absolute;
  left: 61px;
  top: 13px;
  width: 165px;
  height: 31px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.logout__free-icon-user-8484069-5 {
  flex-shrink: 0;
  width: 45px;
  height: 45px;
  position: absolute;
  left: 0px;
  top: 5px;
}
.logout__button {
  background: #4da385;
  border-radius: 10px;
  flex-shrink: 0;
  width: 95px;
  height: 44px;
  position: absolute;
  top: 7px;
  left: 170px;
  color: #ffffff;
  text-align: center;
  font: 700 15px/44px "Pretendard-medium", sans-serif;
}
.logout__button:hover { /* a태그에 마우스를 올렸을 때 */
  cursor: pointer; 
}
.logout__button1 {
  background: #4da385;
  border-radius: 10px;
  flex-shrink: 0;
  width: 95px;
  height: 44px;
  position: absolute;
  top: 7px;
  left: 270px;
  color: #ffffff;
  text-align: center;
  font: 700 15px/44px "Pretendard-medium", sans-serif;
}
.logout__button1:hover { /* a태그에 마우스를 올렸을 때 */
  cursor: pointer; 
}

.logout__ {
  
  
  
  position: absolute;
  left: 16px;
  top: 9px;
  width: 64px;
  height: 27px;
  display: flex;
  align-items: center;
  justify-content: center;
}




</style>
<body>
<%
//로그인 하면 => 로그인한 정보를 세션 저장
// 세션에 로그인 정보 가져오기
String id=(String)session.getAttribute("id");
//Integer memberid=(Integer)session.getAttribute("memberid");
// 세션에 로그인 정보가 없으면(null) => 로그인login, 회원가입join
// 세션에 로그인 정보가 있으면 => ..님 로그아웃logout 회원수정update
if(id == null){
	%>
<div class="section-login">
  <div class="section-login__login">
    <button type="button" onclick="location.href='insert.me'" class="section-login__">회원가입</button>
    <button type="button" onclick="location.href='login.me'" class="section-login__1">로그인</button>
  </div>
</div>
	<%
}else{
	
%>
<div class="logout">
<%if(id.equals("admin")){%>
<button type="button" onclick="location.href='campreg.campreg'" class="logout__button1">캠핑장 등록</button>
	<%
} %>

  <div class="logout___000"><%=id %>님</div>
  <!-- <img
    class="login__free-icon-user-8484069-5"
    src="free-icon-user-8484069-5.png"
  /> -->
 
  <button type="button" onclick="location.href='logout.me'" class="logout__button">로그아웃</button>
  
</div>

<%	
}
%>

<div class="section-header">
<button type="button" onclick="location.href='main.camp'" class="section-header__main-logo>">
<img class="section-header__camppy-2" src="images/camppy-2.png" />
</button> 
</div>
<div class="section-navi">
  <div class="section-navi__navi-list">
    <div class="section-navi__navi-list-1">
      <button type="button" onclick="location.href='list.camp'" class="section-navi__link">캠핑장</button>
    </div>
    <div class="section-navi__navi-list-2">
      <button type="button" onclick="location.href='commuContentsList.commu'" class="section-navi__link">커뮤니티</button>
    </div>
    <div class="section-navi__navi-list-3">
       <button type="button" onclick="location.href='list.qu'" class="section-navi__link">문의하기</button>
    </div>
    <!-- <div class="section-navi__navi-list-4">
      <button type="button" onclick="location.href='campreg.campreg'" class="section-navi__link">예약조회</button>
    </div> -->
    <div class="section-navi__navi-list-5">
     <button type="button" onclick="location.href='likeList.my'" class="section-navi__link">마이페이지</button>
    </div>
  </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>