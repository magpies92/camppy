

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
  gap: 0.5208vw;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 99.14vw;
  height: 4.3229vw;
  position: relative;
}
.section-login__login {
  display: flex;
  flex-direction: row;
  gap: 0.5208vw;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 10.4167vw;
  position: absolute;
  left: 83.3333vw;
  top: 0.7813vw;
}
.section-login__ {
  color: #000000;
  text-align: center;
  font: 400 1.0417vw/1.1458vw "Pretendard-medium", sans-serif;
  position: absolute;
  left:0.0000vw;
  top: 0.0000vw;
 /*  width: 11.3021vw;
  height: 2.0833vw; */
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
  font: 400 1.0417vw/1.1458vw "Pretendard-medium", sans-serif;
  position: absolute;
   left:5.2083vw;
  top: 0.0000vw;
  /* width: 11.3021vw;
  height: 2.0833vw; */
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
  padding: 0.0000vw 0.5094vw 0.0000vw 0.5094vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 99.14vw;
  height: 14.5193vw;
  position: relative;
  overflow: hidden;
}
.section-header__main-logo {
  padding: 0.0000vw 0.5094vw 0.0000vw 0.5094vw;
  display: flex;
  flex-direction: column;
  gap: 0.5094vw;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 99.14vw;
  height: 11.7172vw;
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
  width: 18.5443vw;
  height: 11.7172vw;
  position: relative;
  cursor: pointer; 
}

.section-navi,
.section-navi * {
  box-sizing: border-box;
}
.section-navi {
  background: ghostwhite;
  padding: 0.8854vw 0.5208vw 0.8854vw 0.5208vw;
  display: flex;
  flex-direction: row;
  gap: 0.5208vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 99.14vw;
  height: 5.6771vw;
  position: relative;
  overflow: hidden;
}
.section-navi__navi-list {
  padding: 0.7813vw 8.5417vw 0.7813vw 8.5417vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 87.7083vw;
  position: absolute;
  left: calc(50% - 49.0104vw);
  top: 0.4688vw;
}
.section-navi__navi-list-1 {
  padding: 0.0000vw 0.8667vw 0.0521vw 0.9375vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 10.4167vw;
  height: 3.1250vw;
  position: absolute;
  left: 14.9479vw;
  top: 1.0417vw;
}
.section-navi__link {
  color: #000000;
  text-align: center;
  font: 400 1.2500vw/1.4583vw "Pretendard-medium", sans-serif;
  position: absolute;
  left: calc(50% - 4.1667vw);
  top: 0.2083vw;
  width: 9.3333vw;
  height: 2.6042vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-navi__link:hover { /* a태그에 마우스를 올렸을 때 */
  color:red;
  cursor: pointer; 
}
.section-navi__navi-list-2 {
  padding: 0.0000vw 0.8667vw 0.0521vw 0.9375vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 10.4167vw;
  height: 3.1250vw;
  position: absolute;
  left: 33.0729vw;
  top: 1.0417vw;
}
.section-navi__link2 {
  color: #000000;
  text-align: center;
  font: 400 1.2500vw/1.4583vw "Pretendard-medium", sans-serif;
  position: absolute;
  left: calc(50% - 4.1667vw);
  top: 0.2604vw;
  width: 8.3333vw;
  height: 2.6042vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-navi__navi-list-3 {
  padding: 0.0000vw 0.8667vw 0.0521vw 0.9375vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 10.4167vw;
  height: 3.1250vw;
  position: absolute;
  left: 51.1979vw;
  top: 1.0417vw;
}
.section-navi__navi-list-4 {
  padding: 0.0000vw 0.8667vw 0.0521vw 0.9375vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 10.4167vw;
  height: 3.1250vw;
  position: absolute;
  left: 55.7604vw;
  top: 1.0417vw;
}

.section-navi__navi-list-5 {
  padding: 0.0000vw 0.8667vw 0.0521vw 0.9375vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap;
  flex-shrink: 0;
  width: 10.4167vw;
  height: 3.1250vw;
  position: absolute;
  left: 69.3229vw;
  top: 1.0417vw;
}

.logout,
.logout * {
  box-sizing: border-box;
}
.logout {
  display: flex;
  flex-direction: row;
  gap: 0.5208vw;
  align-items: flex-start;
  justify-content: flex-end;
  flex-shrink: 0;
  width: 19.9479vw;
  height: 2.8646vw;
  position: relative;
  left: 78.1250vw;
}

.logout___000 {
  color: #000000;
  text-align: left;
  font: 400 1.0417vw/1.1458vw "Pretendard-medium", sans-serif;
  position: absolute;
  left: 0.5vw;
  top: 0.6771vw;
  width: fit-content;
  height: 1.6146vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.logout__free-icon-user-8484069-5 {
  flex-shrink: 0;
  width: 2.3438vw;
  height: 2.3438vw;
  position: absolute;
  left: 0.0000vw;
  top: 0.2604vw;
}
.logout__button {
  background: #4da385;
  border-radius: 0.5208vw;
  flex-shrink: 0;
  width: 4.9479vw;
  height: 2.2917vw;
  position: absolute;
  top: 0.3646vw;
  left: 8.8542vw;
  color: #ffffff;
  text-align: center;
  font: 700 0.7813vw/2.2917vw "Pretendard-medium", sans-serif;
}
.logout__button:hover { /* a태그에 마우스를 올렸을 때 */
  cursor: pointer; 
}
.logout__button1 {
  background: #4da385;
  border-radius: 0.5208vw;
  flex-shrink: 0;
  width: 4.9479vw;
  height: 2.2917vw;
  position: absolute;
  top: 0.3646vw;
  left: 14.0625vw;
  color: #ffffff;
  text-align: center;
  font: 700 0.7813vw/2.2917vw "Pretendard-medium", sans-serif;
}
.logout__button1:hover { /* a태그에 마우스를 올렸을 때 */
  cursor: pointer; 
}
.logout__button2 {
  background: #4da385;
  border-radius: 0.5208vw;
  flex-shrink: 0;
  width: 4.9479vw;
  height: 2.2917vw;
  position: absolute;
  top: 0.3646vw;
  left: -5.0625vw;
  color: #ffffff;
  text-align: center;
  font: 700 0.7813vw/2.2917vw "Pretendard-medium", sans-serif;
}
.logout__button2:hover { /* a태그에 마우스를 올렸을 때 */
  cursor: pointer; 
}

.logout__ {
  
  
  
  position: absolute;
  left: 0.8333vw;
  top: 0.4688vw;
  width: 3.3333vw;
  height: 1.4063vw;
  display: flex;
  align-items: center;
  justify-content: center;
}




</style>

<script type="text/javascript">
function openCenteredPopup(url, name, width, height) {
    // 화면 중앙에 창이 위치하도록 left와 top 값을 계산합니다.
    var left = (1880/2)-(width/2);
    var top = (screen.height/2)-(height/2);

    // 팝업창을 엽니다.
    window.open(url, name, 'width=820, height=' + height + ', left=' + left + ', top=' + top);
}
function openCenteredPopup(url, name, width, height) {
    // 화면 중앙보다 조금 위에 창이 위치하도록 left와 top 값을 계산합니다.
    var left = (screen.width/2)-(width/2);
    var top = (screen.height/2)-(height/2) - 50; // 50px만큼 위로 올립니다.

    // 팝업창을 엽니다.
    window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
}

</script>

<body>
<%
//로그인 하면 => 로그인한 정보를 세션 저장
// 세션에 로그인 정보 가져오기
String id=(String)session.getAttribute("id");
String nickname=(String)session.getAttribute("nickname");
//Integer memberid=(Integer)session.getAttribute("memberid");
// 세션에 로그인 정보가 없으면(null) => 로그인login, 회원가입join
// 세션에 로그인 정보가 있으면 => ..님 로그아웃logout 회원수정update
if(id == null){
	%>
<div class="section-login">
  <div class="section-login__login">
<button type="button" onclick="openCenteredPopup('insert.me', 'ReviewPopup', 780, 920)" class="section-login__">회원가입</button>
<button type="button" onclick="openCenteredPopup('login.me', 'ReviewPopup', 700, 850)" class="section-login__1">로그인</button>
  </div>
</div>
	<%
}else{
	
%>
<div class="logout">
<%if(id.equals("admin")){%>
<button type="button" onclick="location.href='campreg.campreg'" class="logout__button1">캠핑장 등록</button>
<button type="button" onclick="location.href='admin_reserve.re'" class="logout__button2">예약 관리</button>
	<%
} %>

  <div class="logout___000"><%=nickname %>님</div>
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