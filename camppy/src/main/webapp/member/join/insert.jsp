<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="member/join/insert.css" />

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
    
<script type="text/javascript">
window.onload = function() {
    var phoneInput = document.getElementById("memberSingPhone");
    phoneInput.addEventListener("keypress", function(event) {
        if (event.which < 48 || event.which > 57) {
            event.preventDefault();
        }
    });
}
function validateForm() {
	var id = document.getElementById("memberSignId");
    if (id.value.length < 5 || id.value.length > 20) {
        alert("아이디는 5~20자 사이여야 합니다.");
        return false;
    } 
    var pass = document.getElementById("memberSingPw").value;
    if (pass.length < 5 || pass.length > 20) {
        alert("비밀번호는 5~20자 사이여야 합니다.");
        return false;
    }
    var passConfirm = document.getElementById("memberSingCh").value;
    if (pass !== passConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    var nickname = document.getElementById("memberSingNick").value;
    if (nickname.length < 2 || nickname.length > 20) {
        alert("닉네임은 2~20자 사이여야 합니다.");
        return false;
    }
    var name = document.getElementById("memberSingName").value;
    if (name.length < 2 || name.length > 20) {
        alert("이름은 2~20자 사이여야 합니다.");
        return false;
    }
    var phone = document.getElementById("memberSingPhone").value;
    if (phone.length != 11) {
        alert("휴대전화 번호는 11자여야 합니다.");
        return false;
    }
    var checkbox = document.getElementById("large-checkbox");
    if (!checkbox.checked) {
        alert("체크박스를 체크해주세요.");
        return false;
    }
    
    	alert('가입이 완료되었습니다!');
    
}
</script>
   
    
    <title>Document</title>	
  </head>
  <body>
  <form onsubmit="return validateForm(event)" action="insertPro.me" method="post">
    <div class="member-sign">
      
        <div class="member-sign__sign-box">
          <div class="member-sign__id-box">
   <input type="text" id="memberSignId" class="member-sign__2" name="id" placeholder="아이디">
          </div>
          <div class="member-sign__pass-box">
   <input type="password" id="memberSingPw" class="member-sign__2" name="pass" placeholder="비밀번호">
          </div>
          <div class="member-sign__pass-check-box">
   <input type="password" id="memberSingCh" class="member-sign__2" name="check" placeholder="비밀번호 확인">
          </div>
          <div class="member-sign__nick-box">
   <input type="text" id="memberSingNick" class="member-sign__2" name="nick" placeholder="닉네임">
          </div>
          <div class="member-sign__name-box">
   <input type="text" id="memberSingName" class="member-sign__2" name="name" placeholder="이름">
          </div>
          <div class="member-sign__phone-box">
          <label for="memberSingPhone"></label>
   <input type="tel" id="memberSingPhone" class="member-sign__2" name="phone" placeholder="휴대전화">
            <div class="member-sign__phone-certify">
              <div class="member-sign__4">인증하기</div>
            </div>
          </div>
          <div class="member-sign__join-box">
            <button class="member-sign__5">가입하기</button>
          </div>
          <div class="member-sign__terms-box">  
          <label for="terms" class="member-sign__2">
    [필수] 약관 전체 동의
    <input type="checkbox" id="large-checkbox" name="large-checkbox" style="display: inline-block; margin-left: 5px;">
</label>
                
<!--             <div class="member-sign__2">[필수] 약관 전체 동의</div> -->
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
