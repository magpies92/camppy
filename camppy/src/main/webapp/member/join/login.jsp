<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="member/join/login.css" />

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
  <form action="loginPro.me" method="post">
    <div class="popup-login">
      <div class="popup-login__login-google">
        <svg
          class="popup-login__rectangle-11"
          width="483"
          height="69"
          viewBox="0 0 483 69"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path d="M0 0H483V69H0V0Z" fill="#EBEFEA" />
        </svg>

        <div class="popup-login__sign-in-with-google">Sign in with Google</div>
        <img class="popup-login__google-image" src="member/join/images/images/google-image.png" />
      </div>
      <div class="popup-login__logi-naver">
        <svg
          class="popup-login__rectangle-10"
          width="483"
          height="69"
          viewBox="0 0 483 69"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path d="M0 0H483V69H0V0Z" fill="#CCEBC7" />
        </svg>

        <img class="popup-login__naver-image" src="member/join/images/images/naver-image.png" />
        <div class="popup-login__sign-in-with-naver">Sign in with Naver</div>
      </div>
      <div class="popup-login__function">
        <div class="popup-login__id">ID/비밀번호 찾기</div>
        <div class="popup-login__">회원가입</div>
      </div>
      <div class="popup-login__button-login">
<input type="submit" class="popup-login__2" value="로그인">
      </div>
      <div class="popup-login__input-box">
        <div class="popup-login__id-box"></div>
<input type="text" id="id" class="popup-login__id2" name="id" placeholder="ID">
        <div class="popup-login__pass-box"></div>
<input type="password" id="pass" class="popup-login__password" name="pass" placeholder="PASSWORD">
      </div>
      <div class="popup-login__main-logo">
        <img class="popup-login__camppy-2" src="member/join/images/camppy-2.png" />
      </div>
      <div class="popup-login__button">
        <div class="popup-login__x">X</div>
      </div>
    </div>
    </form>
  </body>
</html>
