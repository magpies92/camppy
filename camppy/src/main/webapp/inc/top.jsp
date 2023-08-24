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
  font: 400 20px/22px "NanumGothic", sans-serif;
  position: absolute;
  left: 4px;
  top: 0px;
  width: 217px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
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
  font: 400 24px/28px "NanumGothic", sans-serif;
  position: absolute;
  left: calc(50% - 80px);
  top: 4px;
  width: 160px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
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
  left: 645px;
  top: 20px;
}
.section-navi__link2 {
  color: #000000;
  text-align: center;
  font: 400 24px/28px "NanumGothic", sans-serif;
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
  left: 1003px;
  top: 20px;
}
.section-navi__navi-list-4 {
  padding: 0px 18px 1px 18px;
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
  left: 1361px;
  top: 20px;
}

</style>
<body>
<div class="section-login">
  <div class="section-login__login">
    <div class="section-login__">회원가입 /로그인</div>
  </div>
</div>
<div class="section-header">
  <div class="section-header__main-logo">
    <img class="section-header__camppy-2" src="images/camppy-2.png" />
  </div>
</div>
<div class="section-navi">
  <div class="section-navi__navi-list">
    <div class="section-navi__navi-list-1">
      <div class="section-navi__link">공지사항</div>
    </div>
    <div class="section-navi__navi-list-2">
      <div class="section-navi__link2">커뮤니티</div>
    </div>
    <div class="section-navi__navi-list-3">
      <div class="section-navi__link">문의하기</div>
    </div>
    <div class="section-navi__navi-list-4">
      <div class="section-navi__link">마이페이지</div>
    </div>
  </div>
</div>

</body>
</html>