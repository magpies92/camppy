<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/update.css" />

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
<%MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");%>
<form action="updatePro.me" method="post">
    <div class="edit-profile">
      <div class="edit-profile__edit-header">
        <div class="edit-profile__">프로필 편집</div>
      </div>
      <div class="edit-profile__deit-contents">
        <div class="edit-profile__tel">
          <div class="edit-profile__2">전화번호</div>
          <div class="edit-profile__input-tel"></div>
          <div class="edit-profile__phone-certify">
            <div class="edit-profile__3">인증하기</div>
          </div>
        </div>
        <div class="edit-profile__pass-check">
          <div class="edit-profile__4">비밀번호 확인</div>
          <div class="edit-profile__input-passcheck"></div>
        </div>
        <div class="edit-profile__pass">
          <div class="edit-profile__4">비밀번호</div>
<input type="password" class="edit-profile__input-pass" name="pass">
        </div>
        <div class="edit-profile__id">
          <div class="edit-profile__4">아이디</div>
<input type="text" class="edit-profile__input-id" name="id" value="<%=memberDTO.getId() %>" readonly>
        </div>
        <div class="edit-profile__nickname">
          <div class="edit-profile__4">닉네임</div>
<input type="text" class="edit-profile__input-nickname" name="nick">
        </div>
        <div class="edit-profile__picture">
          <img
            class="edit-profile__free-icon-user-8484069-2"
            src="./images/free-icon-user-8484069-2.png"
          />
          <div class="edit-profile__input-button">
            <div class="edit-profile__5">사진 등록</div>
          </div>
        </div>
      </div>
      <div class="edit-profile__button">
        <div class="edit-profile__button-update">
          <button class="edit-profile__6">수정</button>
        </div>
        <div class="edit-profile__button-withdraw">
          <div class="edit-profile__7">회원 탈퇴</div>
        </div>
      </div>
    </div>
</form>
  </body>
</html>
