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
    body {
    overflow-x: hidden;
}
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
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.phone').attr('maxlength', 11);
	$('.phone').keypress(function (e) {
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	        return false;
	    }
	});
	$('.phone').on('input', function () {
	    var phone = $(this).val();
	    phone = phone.replace(/[^0-9]/g, '');
	    $(this).val(phone);
	});
	var clicked = false;
	var clicked2 = false;
	var clicked3 = false;
	var clicked4 = false;
	$('.phone-certify2').click(function(){
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return false;
		}
		var id = $('.id').val();
		var idReg = /^[A-Za-z0-9]{5,20}$/;

		if (!idReg.test(id)) {
		    alert("아이디는 영문자와 숫자를 포함한 5~20자 사이입니다.");
		    $('.id').focus();
		    return false;
		}
		clicked = true;
		$.ajax({
			url:'idCheck.me',
			data:{'id':$('.id').val()},
			success:function(result){
				if (result == 1) {
					$('.member-sign__id-box').css('border-color', 'red');
					alert("아이디 중복입니다. 다른 아이디를 입력해주세요.")
				}
				if (result == 0) {
					$('.member-sign__id-box').css('border-color', '#777777');
					alert("사용가능한 아이디입니다.")
				}
			}
		});//ajax()
	});//click()
	$('.phone-certify3').click(function(){
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
		clicked4 = true;
		$.ajax({
			url:'nickCheck.me',
			data:{'nick':$('.nick').val()},
			success:function(result){
				if (result == 11) {
					$('.member-sign__nick-box').css('border-color', 'red');
					alert("닉네임 중복입니다. 다른 닉네임을 입력해주세요.")
				}
				if (result == 00) {
					$('.member-sign__nick-box').css('border-color', '#777777');
					alert("사용가능한 닉네임입니다.")
				}
			}
		});//ajax()
	});//click()
	$('#join').submit(function(event){
		event.preventDefault();
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return false;
		}
		var id = $('.id').val();
		var idReg = /^[A-Za-z0-9]{5,20}$/;

		if (!idReg.test(id)) {
		    alert("아이디는 영문자와 숫자를 포함한 5~20자 사이입니다.");
		    $('.id').focus();
		    return false;
		}
		if (!clicked) {
			alert("아이디 중복확인 눌러주세요");
	        return false;
	    }
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
		if (!clicked4) {
			alert("닉네임 중복확인 눌러주세요");
	        return false;
	    }
		var name = $('.name').val();
		var nameReg = /^[가-힣]{2,5}$/;

		if (!nameReg.test(name)) {
		    alert("이름은 한글로만 이루어진 2~5자 사이입니다.");
		    $('.name').focus();
		    return false;
		}
		var phone = $('.phone').val();
		var phoneReg = /^01([0|1|6|7|8|9]?)([0-9]{4})([0-9]{4})$/;

		if (!phoneReg.test(phone)) {
		    alert("휴대전화 번호를 올바르게 입력해 주세요");
		    $('.phone').focus();
		    return false;
		}
// 		if($("#email").val() == ""){
// 		    alert("이메일을 입력해주세요.");
// 		    $("#email").focus();
// 		    return false;
// 		}
// 		var email = $("#email").val();
// 		var emailRegEx = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// 		if(!emailRegEx.test(email)){
// 		    alert("유효한 이메일 주소를 입력해주세요.");
// 		    $("#email").focus();
// 		    return false;
// 		}
		if (!$('#large-checkbox').is(':checked')) {
		    alert("약관동의에 체크해주세요.");
		    $('#large-checkbox').focus();
		    return false;
		}
		    $.ajax({
		        url:'idCheck.me',
		        data:{'id':$('.id').val()},
		        success:function(result){
		            if (result == 1) {
		                alert("아이디 중복입니다. 다른 아이디를 입력해주세요.")
		                $('.id').focus();
		                $('.member-sign__id-box').css('border-color', 'red');
		                return false;
		            }
		            if (result == 0) {
		                $('.member-sign__id-box').css('border-color', '#777777');
		            }

		            // 첫 번째 $.ajax() 함수가 완료된 후에 두 번째 $.ajax() 함수를 실행합니다.
		            $.ajax({
		                url:'nickCheck.me',
		                data:{'nick':$('.nick').val()},
		                success:function(result){
		                    if (result == 11) {
		                        alert("닉네임 중복입니다. 다른 닉네임을 입력해주세요.")
		                        $('.nick').focus();
		                        $('.member-sign__nick-box').css('border-color', 'red');
		                        return false;
		                    }
		                    if (result == 00) {
		                        $('.member-sign__nick-box').css('border-color', '#777777');
		                    }

		                    // 두 번째 $.ajax() 함수가 완료된 후에 폼을 제출합니다.
		                    $('#join')[0].submit();
		                }
		            });
		        }
		    });
		});
	});
</script>
    <title>Document</title>
  </head>
  <body>
<form action="insertPro.me" id="join" method="post">
    <div class="slide-16-9-1">
    <div class="slide-16-9-1__id-box">
<input type="text" id="id" class="id" name="id" placeholder="아이디">
        <div class="slide-16-9-1__id-check">
<input type="button" value="중복확인" class="phone-certify2">
        </div>
      </div>
      <div class="slide-16-9-1__pass-box">
<input type="password" id="pass" class="pass" name="pass" placeholder="비밀번호">
      </div>
      <div class="slide-16-9-1__passcheck-box">
<input type="password" id="memberSingCh" class="check" name="check" placeholder="비밀번호 확인">
      </div>
      <div class="slide-16-9-1__nickname-box">
<input type="text" id="nick" class="nick" name="nick" placeholder="닉네임">
        <div class="slide-16-9-1__nick-check">
<input type="button" value="중복확인" class="phone-certify3">
        </div>
      </div>
      <div class="slide-16-9-1__name-box">
<input type="text" id="name" class="name" name="name" placeholder="이름">
      </div>
      <div class="slide-16-9-1__phone-box">
<input type="tel" id="phone" class="phone" name="phone" placeholder="휴대전화">
      </div>
      
<!--       <div class="slide-16-9-1__email-box"> -->
<!-- <input type="text" id="email" class="email" name="email" placeholder="이메일"> -->
<!--         <div class="slide-16-9-1__email-check"> -->
<!-- <input type="button" class="emailcheck" name="email2" value="인증하기"> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="slide-16-9-1__checknumber-box"> -->
<!-- <input type="number" id="number" class="number" name="number" placeholder="인증번호"> -->
<!--         <div class="slide-16-9-1__number-check"> -->
<!-- <input type="button" class="numcheck" name="email3" value="인증확인"> -->
<!--         </div> -->
<!--       </div> -->
      
<img class="slide-16-9-1__camppy-2" src="member/join/images/camppy-2.png" />

      <div class="slide-16-9-1__terms-box">
<div class="slide-16-9-1__">[필수] 약관 전체 동의
<input type="checkbox" id="large-checkbox" name="large-checkbox" style="display: inline-block; margin-left: 5px;">
</div>
      </div>
      <div class="slide-16-9-1__join-box">
<input type="submit" value="가입하기" class="slide-16-9-1__3">
      </div>
    </div>
   </form>
  </body>
</html>
