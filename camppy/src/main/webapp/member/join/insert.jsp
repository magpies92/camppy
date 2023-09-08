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
    <script type="text/javascript" 
        src="script/jquery-3.7.0.js"></script>
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
		if ($('.id').val().length < 5 || $('.id').val().length > 20) {
		    alert("아이디는 5~20자 사이여야 합니다.");
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
		if ($('.id').val().length < 5 || $('.id').val().length > 20) {
		    alert("아이디는 5~20자 사이여야 합니다.");
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
		if (!clicked4) {
			alert("닉네임 중복확인 눌러주세요");
	        return false;
	    }
		if($('.name').val()==""){
			alert("이름을 입력하세요");
			$('.name').focus();
			return false;
		}
		if ($('.phone').val().length != 11) {
		    alert("휴대전화 번호는 11자여야 합니다.");
		    $('.phone').focus();
		    return false;
		}
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
    <div class="member-sign">
      
        <div class="member-sign__sign-box">
          <div class="member-sign__id-box">
   <input type="text" id="id" class="id" name="id" placeholder="아이디">
   <div class="phone-certify">
<input type="button" value="중복확인" class="phone-certify2">  
</div>
          </div>
          <div class="member-sign__pass-box">
   <input type="password" id="pass" class="pass" name="pass" placeholder="비밀번호">
          </div>
          <div class="member-sign__pass-check-box">
   <input type="password" id="memberSingCh" class="check" name="check" placeholder="비밀번호 확인">
          </div>
          <div class="member-sign__nick-box">
   <input type="text" id="nick" class="nick" name="nick" placeholder="닉네임">
<div class="phone-certify">
<input type="button" value="중복확인" class="phone-certify3">  
</div>         
          </div>
          <div class="member-sign__name-box">
   <input type="text" id="name" class="name" name="name" placeholder="이름">
          </div>
          <div class="member-sign__phone-box">
          <label for="memberSingPhone"></label>
   <input type="tel" id="phone" class="phone" name="phone" placeholder="휴대전화">
            <div class="member-sign__phone-certify">
              <div class="member-sign__4">인증하기</div>
            </div>
          </div>
          <div class="member-sign__join-box">
<input type="submit" value="가입하기" class="member-sign__5">
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
