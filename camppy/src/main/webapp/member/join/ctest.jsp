<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="ctest.css" />

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
  <form action="ctestpro.jsp" method="post">
    <div class="member-sign">
      <div class="member-sign__section-total">
        <div class="member-sign__section-footer">
          <div class="member-sign__footer-info">
            <div class="member-sign__footer-list">
              <div class="member-sign__footer-list-1">
                <div class="member-sign__link">개인정보처리방침</div>
              </div>
              <div class="member-sign__footer-list-2">
                <div class="member-sign__link">전자우편무단수집거부</div>
              </div>
              <div class="member-sign__footer-list-3">
                <div class="member-sign__link">캠핑장 등록안내</div>
              </div>
              <div class="member-sign__footer-list-4">
                <div class="member-sign__link">미등록야영장불법영업신고</div>
              </div>
            </div>
            <div class="member-sign__footer-info-link">
              <div class="member-sign__info-site-1">
                <div class="member-sign__button">지자체공무원</div>
              </div>
              <div class="member-sign__info-site-2">
                <div class="member-sign__">관련사이트</div>
              </div>
            </div>
          </div>
          <div class="member-sign__footer-copyright">
            <div class="member-sign__footer-info2">
              <div class="member-sign___109-7">
                부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                부산교육센터 7층
              </div>
              <div class="member-sign__email-camppy-itwillbs-co-kr">
                <span
                  ><span class="member-sign-email-camppy-itwillbs-co-kr-span"
                    >EMAIL : camppy</span
                  ><span class="member-sign-email-camppy-itwillbs-co-kr-span2"
                    >@itwillbs.co.kr</span
                  ></span
                >
              </div>
              <div
                class="member-sign__copyrights-c-2018-korea-tourism-organization-all-rights-reserved"
              >
                Copyrights(c) 2018 KOREA TOURISM ORGANIZATION ALL RIGHTS
                RESERVED.
              </div>
              <div class="member-sign___051-803-0909">
                온라인교육 고객센터 : 051-803-0909
              </div>
              <div class="member-sign__tel-051-803-0909-10-00-18-00">
                TEL : 051-803-0909(상담시간 : 평일 10:00~18:00)
              </div>
              <div class="member-sign__sns">
                <img class="member-sign__item-link" src="./images/item-link.png" /><img
                  class="member-sign__item-link2"
                  src="./images/item-link2.png"
                /><img
                  class="member-sign__item-link3"
                  src="./images/item-link3.png"
                /><img class="member-sign__item-link4" src="./images/item-link4.png" />
              </div>
            </div>
            <img
              class="member-sign__free-icon-up-arrow-5181252-1"
              src="./images/free-icon-up-arrow-5181252-1.png"
            />
          </div>
        </div>
        <div class="member-sign__main-page">
          <div class="member-sign__header-insert-login"></div>
          <div class="member-sign__section-header">
            <div class="member-sign__main-logo">
              <img class="member-sign__camppy-2" src="./images/camppy-2.png" />
            </div>
          </div>
        </div>
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
            <button class="member-sign__5" onclick="validateForm()">가입하기</button>
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
    </div>
    </form>
  </body>
</html>
