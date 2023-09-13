<%@page import="camppy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="member/join/update.css" />

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
    <script type="text/javascript" 
        src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var originalNick = $('.nick').val();
    $('#join').submit(function(event){
    	event.preventDefault();
        if ($('.nick').val() === originalNick) {
            // 닉네임이 기존과 같으면 중복 검사를 하지 않습니다.
            // 비밀번호 검사를 진행합니다.
        	if($('.pass').val()==""){
    			alert("비밀번호 입력하세요");
    			$('.pass').focus();
    			return false;
    		}
    		var password = $('.pass').val();
    		var regex1 = /^[a-zA-Z\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{8,16}$/;
    		var regex2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?])/;
    		if (!regex1.test(password)) {
    		    alert("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자만 사용해 주세요.");
    		    $('.pass').focus();
    		    return false;
    		} else if (!regex2.test(password)) {
    		    alert("비밀번호는 영문 대/소문자, 숫자, 특수문자를 모두 포함해야 합니다.");
    		    $('.pass').focus();
    		    return false;
    		}
    		if ($('.pass').val() != $('.check').val()) {
    		    alert("비밀번호가 일치하지 않습니다.");
    		    $('.check').focus();
    		    return false;
    		}
            // 모든 검사가 성공하면 양식을 제출합니다.
            $('#join')[0].submit();
        } else {
        	if($('.nick').val()==""){
    			alert("닉네임을 입력하세요");
    			$('.nick').focus();
    			return false;
    		}
        	var nick = $('.nick').val();
    		var nickReg = /^[A-Za-z0-9가-힣]{2,8}$/;

    		if (!nickReg.test(nick)) {
    		    alert("닉네임은 한글, 영문자, 숫자를 포함한 2~8자 사이입니다.");
    		    $('.nick').focus();
    		    return false;
    		}
        	$.ajax({
                url:'nickCheck.me',
                data:{'nick':$('.nick').val()},
                success:function(result){
                    if (result == 11) {
                        alert("닉네임 중복입니다. 다른 닉네임을 입력해주세요.")
                        $('.nick').focus();
                        $('.edit-profile__nickname').css('border-color', 'red');
                        return false;
                    }
                    if (result == 00) {
                        $('.edit-profile__nickname').css('border-color', '#777777');
                        
                        // 닉네임 중복 검사가 성공한 후 비밀번호 검사를 진행합니다.
                        if($('.pass').val()==""){
                			alert("비밀번호 입력하세요");
                			$('.pass').focus();
                			return false;
                		}
                		var password = $('.pass').val();
                		var regex1 = /^[a-zA-Z\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{8,16}$/;
                		var regex2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?])/;
                		if (!regex1.test(password)) {
                		    alert("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자만 사용해 주세요.");
                		    $('.pass').focus();
                		    return false;
                		} else if (!regex2.test(password)) {
                		    alert("비밀번호는 영문 대/소문자, 숫자, 특수문자를 모두 포함해야 합니다.");
                		    $('.pass').focus();
                		    return false;
                		}
                		if ($('.pass').val() != $('.check').val()) {
                		    alert("비밀번호가 일치하지 않습니다.");
                		    $('.check').focus();
                		    return false;
                		}
                        
                        // 모든 검사가 성공하면 양식을 제출합니다.
                        $('#join')[0].submit();
                    }
                }
            });
        }
    });
});
</script>
    <title>Document</title>
  </head>
  <body>
  <div class="proUpdate">
<%MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");%>
<form action="updatePro.me" id="join" method="post">
    <div class="edit-profile">
      <div class="edit-profile__edit-header">
        <div class="edit-profile__">프로필 편집</div>
      </div>
      <div class="edit-profile__deit-contents">
        <div class="edit-profile__pass-check">
          <div class="edit-profile__4">비밀번호 확인</div>
<input type="password" class="check" name="check">
        </div>
        <div class="edit-profile__pass">
          <div class="edit-profile__4">비밀번호</div>
<input type="password" id="pass" class="pass" name="pass">
        </div>
        <div class="edit-profile__id">
          <div class="edit-profile__4">아이디</div>
<input type="text" class="edit-profile__input-id" name="id" value="<%=memberDTO.getId() %>" readonly>
        </div>
        <div class="edit-profile__nickname">
          <div class="edit-profile__4">닉네임</div>
<input type="text" id="nick" class="nick" name="nick" value="<%=memberDTO.getNick() %>">
        </div>
        <div class="edit-profile__picture">
          <img
            class="edit-profile__free-icon-user-8484069-2"
            src="member/join/images/free-icon-user-8484069-2.png"
          />
          <div class="edit-profile__input-button">
            <div class="edit-profile__5">사진 등록</div>
          </div>
        </div>
      </div>
      <div class="edit-profile__button">
        <div class="edit-profile__button-update">
    <input type="submit" class="edit-profile__6" value="수정">
</div>
        <div class="edit-profile__button-withdraw">        
<button type="button" onclick="confirmDelete()" class="edit-profile__7">회원 탈퇴</button>
</div>
<script>
function confirmDelete() {
    if (confirm("회원 탈퇴 하시겠습니까?")) {
        location.href='delete.me?id=<%=memberDTO.getId() %>';
    }
}
</script>
        </div>
      </div>
    </div>
</form>
  </body>
</html>
