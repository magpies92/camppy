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
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 97.9167vw;
  height: 12.6474vw;
  position: relative;
}
.section-footer__footer-info {
  background: #2e2f31;
  border-style: solid;
  border-color: #4a4a4c;
  border-width: 0.0000vw 0.0000vw 0.0510vw 0.0000vw;
  padding: 0.0000vw 0.5099vw 0.2552vw 0.5099vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  height: 6.1198vw;
  min-height: 4.5896vw;
  position: absolute;
  width: 99.14vw
}
.section-footer__footer-list {
  padding: 0.7651vw 8.3635vw 0.7651vw 8.3635vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  position: absolute;
  right: 32.4094vw;
  left: 8.3892vw;
  top: 0.7141vw;
}
.section-footer__footer-list-1 {
  padding: 0.0000vw 0.8484vw 0.0510vw 0.9177vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 10.0979vw;
  height: 3.0599vw;
  position: relative;
}
.section-footer__link {
  color: #ffffff;
  text-align: center;
  font: 400 0.6630vw/1.4281vw "pretendard-medium", sans-serif;
  position: absolute;
  left: 0.7906vw;
  top: 0.2042vw;
  width: 8.5677vw;
  height: 2.6521vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__footer-list-2 {
  padding: 0.0000vw 0.8484vw 0.0510vw 0.9177vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 10.0979vw;
  height: 3.0599vw;
  position: relative;
}
.section-footer__footer-list-3 {
  padding: 0.0000vw 0.8484vw 0.0510vw 0.9177vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 10.0979vw;
  height: 3.0599vw;
  position: relative;
}
.section-footer__footer-list-4 {
  padding: 0.0000vw 0.8484vw 0.0510vw 0.9177vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 10.0979vw;
  height: 3.0599vw;
  position: relative;
}
.section-footer__footer-info-link {
  display: flex;
  flex-direction: row;
  gap: 0.5099vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  position: absolute;
  left: 70.4286vw;
  top: 2.2437vw;
}
.section-footer__info-site-1 {
  background: #393a3b;
  padding: 0.0510vw 0.9688vw 0.0510vw 0.9688vw;
  display: flex;
  flex-direction: row;
  gap: 0.5099vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 7.6500vw;
  height: 2.0401vw;
  position: relative;
}
.section-footer__button {
  color: #d0d0d0;
  text-align: center;
  font: 400 0.6630vw/1.9380vw "pretendard-medium", sans-serif;
  position: relative;
  width: 7.6500vw;
  height: 2.0401vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__info-site-2 {
  background: #393a3b;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 7.6500vw;
  height: 2.0401vw;
  position: relative;
}
.section-footer__ {
  color: #d0d0d0;
  text-align: center;
  font: 400 0.6630vw/1.9380vw "pretendard-medium", sans-serif;
  position: relative;
  width: 7.6500vw;
  height: 1.9380vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
.section-footer__footer-copyright {
  background: #2e2f31;
  padding: 0.5099vw;
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: center;
  flex-shrink: 0;
  width: 99.14vw;
  height: 6.6807vw;
  position: absolute;
  left: 0.0000vw;
  top: 6.1198vw;
}
.section-footer__footer-info2 {
  display: flex;
  flex-direction: row;
  gap: 0.0000vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 68.6438vw;
  height: 5.1510vw;
  position: absolute;
  left: calc(50% - 31.3641vw);
  top: 0.9688vw;
}
.section-footer___109-7 {
  color: #c0c0c0;
  text-align: left;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
  position: relative;
  width: 25.0911vw;
  height: 1.8359vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__email-camppy-itwillbs-co-kr {
  color: #c0c0c0;
  text-align: left;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
  position: absolute;
  left: 0.0000vw;
  top: 1.6318vw;
  width: 9.8427vw;
  height: 2.0401vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer-email-camppy-itwillbs-co-kr-span {
  color: #c0c0c0;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
}
.section-footer-email-camppy-itwillbs-co-kr-span2 {
  color: #c0c0c0;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
}
.section-footer__copyrights-c-2018-korea-tourism-organization-all-rights-reserved {
  color: #c0c0c0;
  text-align: left;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
  position: absolute;
  left: 0.0000vw;
  top: 3.2130vw;
  width: 25.6010vw;
  height: 2.3458vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer___051-803-0909 {
  color: #c0c0c0;
  text-align: left;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
  position: absolute;
  left: 11.3219vw;
  top: 1.8359vw;
  width: 11.0667vw;
  height: 1.8359vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__tel-051-803-0909-10-00-18-00 {
  color: #c0c0c0;
  text-align: left;
  font: 400 0.6630vw/1.1219vw "pretendard-medium", sans-serif;
  position: absolute;
  left: 25.6010vw;
  top: -0.2042vw;
  width: 16.3703vw;
  height: 2.1927vw;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.section-footer__sns {
  display: flex;
  flex-direction: row;
  gap: 1.7339vw;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 13.8714vw;
  height: 4.1307vw;
  position: absolute;
  right: -0.6630vw;
  top: 0.0000vw;
}
.section-footer__item-link {
  flex-shrink: 0;
  width: 2.0401vw;
  height: 2.0401vw;
  position: absolute;
  left: 0.7141vw;
  top: 0.7651vw;
}
.section-footer__item-link2 {
  flex-shrink: 0;
  width: 2.0401vw;
  height: 2.0401vw;
  position: absolute;
  left: 6.8849vw;
  top: 0.7651vw;
}
.section-footer__item-link3 {
  flex-shrink: 0;
  width: 2.0401vw;
  height: 2.0401vw;
  position: absolute;
  left: 3.9781vw;
  top: 0.7651vw;
}
.section-footer__item-link4 {
  flex-shrink: 0;
  width: 2.0401vw;
  height: 2.0401vw;
  position: absolute;
  left: 9.7406vw;
  top: 0.7651vw;
}
.section-footer__free-icon-up-arrow-5181252-1 {
  border-radius: 0.1531vw;
  flex-shrink: 0;
  width: 2.8047vw;
  height: 2.8047vw;
  position: absolute;
  left: 92.1031vw;
  top: 1.1729vw;
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
        <img class="section-footer__item-link" src="images/item-link.png" />
        <img class="section-footer__item-link2" src="images/item-link2.png" />
        <img class="section-footer__item-link3" src="images/item-link3.png" />
        <img class="section-footer__item-link4" src="images/item-link4.png" />
      </div>
    </div>
    <img
      class="section-footer__free-icon-up-arrow-5181252-1"
      src="images/free-icon-up-arrow-5181252-1.png"
    />
  </div>
</div>

</body>
</html>