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
.section-footer,
.section-footer * {
  box-sizing: border-box;
}
.section-footer {
  display: flex;
  flex-direction: column;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 1880px;
  height: 248px;
  position: relative;
}
.section-footer__footer-info {
  background: #2e2f31;
  border-style: solid;
  border-color: #4a4a4c;
  border-width: 0px 0px 1px 0px;
  padding: 0px 10px 5px 10px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  height: 120px;
  min-height: 90px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 0px;
}
.section-footer__footer-list {
  padding: 15px 164px 15px 164px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  position: absolute;
  right: 635.5px;
  left: 164.5px;
  top: 14px;
}
.section-footer__footer-list-1 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 198px;
  height: 60px;
  position: relative;
}
.section-footer__link {
  color: #ffffff;
  text-align: center;
  font: 400 13px/28px "NanumGothic", sans-serif;
  position: absolute;
  left: 15.5px;
  top: 4px;
  width: 168px;
  height: 52px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__footer-list-2 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 198px;
  height: 60px;
  position: relative;
}
.section-footer__footer-list-3 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 198px;
  height: 60px;
  position: relative;
}
.section-footer__footer-list-4 {
  padding: 0px 16.64px 1px 18px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 198px;
  height: 60px;
  position: relative;
}
.section-footer__footer-info-link {
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  position: absolute;
  left: 1381px;
  top: 44px;
}
.section-footer__info-site-1 {
  background: #393a3b;
  padding: 1px 19px 1px 19px;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 150px;
  height: 40px;
  position: relative;
}
.section-footer__button {
  color: #d0d0d0;
  text-align: center;
  font: 400 13px/38px "Inter", sans-serif;
  position: relative;
  width: 150px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__info-site-2 {
  background: #393a3b;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 150px;
  height: 40px;
  position: relative;
}
.section-footer__ {
  color: #d0d0d0;
  text-align: center;
  font: 400 13px/38px "Inter", sans-serif;
  position: relative;
  width: 150px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__footer-copyright {
  background: #2e2f31;
  padding: 10px;
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 1880px;
  height: 131px;
  position: absolute;
  left: 0px;
  top: 120px;
}
.section-footer__footer-info2 {
  display: flex;
  flex-direction: row;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 1346px;
  height: 101px;
  position: absolute;
  left: calc(50% - 615px);
  top: 19px;
}
.section-footer___109-7 {
  color: #c0c0c0;
  text-align: left;
  font: 400 13px/22px "NanumGothic", sans-serif;
  position: relative;
  width: 492px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__email-camppy-itwillbs-co-kr {
  color: #c0c0c0;
  text-align: left;
  font: 400 13px/22px "NanumGothic", sans-serif;
  position: absolute;
  left: 0px;
  top: 32px;
  width: 193px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer-email-camppy-itwillbs-co-kr-span {
  color: #c0c0c0;
  font: 400 13px/22px "NanumGothic", sans-serif;
}
.section-footer-email-camppy-itwillbs-co-kr-span2 {
  color: #c0c0c0;
  font: 400 13px/22px "NanumGothic", sans-serif;
}
.section-footer__copyrights-c-2018-korea-tourism-organization-all-rights-reserved {
  color: #c0c0c0;
  text-align: left;
  font: 400 13px/22px "NanumGothic", sans-serif;
  position: absolute;
  left: 0px;
  top: 63px;
  width: 502px;
  height: 46px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer___051-803-0909 {
  color: #c0c0c0;
  text-align: left;
  font: 400 13px/22px "NanumGothic", sans-serif;
  position: absolute;
  left: 222px;
  top: 36px;
  width: 217px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__tel-051-803-0909-10-00-18-00 {
  color: #c0c0c0;
  text-align: left;
  font: 400 13px/22px "NanumGothic", sans-serif;
  position: absolute;
  left: 502px;
  top: -4px;
  width: 321px;
  height: 43px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__sns {
  display: flex;
  flex-direction: row;
  gap: 34px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 272px;
  height: 81px;
  position: absolute;
  right: -13px;
  top: 0px;
}
.section-footer__item-link {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: absolute;
  left: 14px;
  top: 15px;
}
.section-footer__item-link2 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: absolute;
  left: 135px;
  top: 15px;
}
.section-footer__item-link3 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: absolute;
  left: 78px;
  top: 15px;
}
.section-footer__item-link4 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: absolute;
  left: 191px;
  top: 15px;
}
.section-footer__free-icon-up-arrow-5181252-1 {
  border-radius: 3px;
  flex-shrink: 0;
  width: 55px;
  height: 55px;
  position: absolute;
  left: 1806px;
  top: 23px;
}
</style>
<body>
<div class="section-footer">
  <div class="section-footer__footer-info">
    <div class="section-footer__footer-list">
      <div class="section-footer__footer-list-1">
        <div class="section-footer__link">개인정보처리방침</div>
      </div>
      <div class="section-footer__footer-list-2">
        <div class="section-footer__link">전자우편무단수집거부</div>
      </div>
      <div class="section-footer__footer-list-3">
        <div class="section-footer__link">캠핑장 등록안내</div>
      </div>
      <div class="section-footer__footer-list-4">
        <div class="section-footer__link">미등록야영장불법영업신고</div>
      </div>
    </div>
    <div class="section-footer__footer-info-link">
      <div class="section-footer__info-site-1">
        <div class="section-footer__button">지자체공무원</div>
      </div>
      <div class="section-footer__info-site-2">
        <div class="section-footer__">관련사이트</div>
      </div>
    </div>
  </div>
  <div class="section-footer__footer-copyright">
    <div class="section-footer__footer-info2">
      <div class="section-footer___109-7">
        부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
        부산교육센터 7층
      </div>
      <div class="section-footer__email-camppy-itwillbs-co-kr">
        <span
          ><span class="section-footer-email-camppy-itwillbs-co-kr-span"
            >EMAIL : camppy</span
          ><span class="section-footer-email-camppy-itwillbs-co-kr-span2"
            >@itwillbs.co.kr</span
          ></span
        >
      </div>
      <div
        class="section-footer__copyrights-c-2018-korea-tourism-organization-all-rights-reserved"
      >
        Copyrights(c) 2018 KOREA TOURISM ORGANIZATION ALL RIGHTS RESERVED.
      </div>
      <div class="section-footer___051-803-0909">
        온라인교육 고객센터 : 051-803-0909
      </div>
      <div class="section-footer__tel-051-803-0909-10-00-18-00">
        TEL : 051-803-0909(상담시간 : 평일 10:00~18:00)
      </div>
      <div class="section-footer__sns">
        <img class="section-footer__item-link" src="../../images/item-link.png" />
        <img class="section-footer__item-link2" src="../../images/item-link2.png" />
        <img class="section-footer__item-link3" src="../../images/item-link3.png" />
        <img class="section-footer__item-link4" src="../../images/item-link4.png" />
      </div>
    </div>
    <img
      class="section-footer__free-icon-up-arrow-5181252-1"
      src="../../images/free-icon-up-arrow-5181252-1.png"
    />
  </div>
</div>

</body>
</html>