<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./reserve_detail.css" />

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
    <div class="reserve-detail">
      <div class="reserve-detail__section-total">
        <div class="reserve-detail__body">
          <div class="reserve-detail__body-head">
            <div class="reserve-detail__">예약 정보 확인 및 결제</div>
          </div>
          <div class="reserve-detail__body-info-1">
            <div class="reserve-detail__info-1-section">
              <div class="reserve-detail__list-1">
                <div class="reserve-detail__2">예약 정보</div>
                <div class="reserve-detail__3">몽산포 오토캠핑장</div>
              </div>
              <div class="reserve-detail__list-2">
                <div class="reserve-detail__list-2-1">
                  <div class="reserve-detail__4">체크인</div>
                  <div class="reserve-detail___2023-01-26-15-00">
                    2023.01.26(목)<br />
                    <br />15:00
                  </div>
                </div>
                <div class="reserve-detail__list-2-2">
                  <div class="reserve-detail__5">체크아웃</div>
                  <div class="reserve-detail___2023-01-27-19-00">
                    2023.01.27(금)<br /><br />19:00
                  </div>
                </div>
              </div>
              <div class="reserve-detail__list-3">
                <div class="reserve-detail__list-3-1">
                  <div class="reserve-detail__6">인원선택</div>
                  <div class="reserve-detail___2">2명</div>
                </div>
                <div class="reserve-detail__list-3-2">
                  <div class="reserve-detail__7">객실선택</div>
                  <div class="reserve-detail___101">101호</div>
                </div>
              </div>
            </div>
          </div>
          <div class="reserve-detail__body-info-2">
            <div class="reserve-detail__list-22">
              <div class="reserve-detail__8">전화번호</div>
              <div class="reserve-detail___010-1234-1234">010-1234-1234</div>
            </div>
            <div class="reserve-detail__list-12">
              <div class="reserve-detail__9">예약자 정보</div>
              <div class="reserve-detail__10">장미꽃을 문 감자님</div>
              <div class="reserve-detail__11">
                *투숙객 이름은 체크인 시 제시할 유효한 신분증 이름과 정확히
                일치해야 합니다.
              </div>
            </div>
          </div>
          <div class="reserve-detail__body-info-3">
            <div class="reserve-detail__list-5">
              <div class="reserve-detail__12">전액사용</div>
            </div>
            <div class="reserve-detail__list-4">
              <div class="reserve-detail__13">포인트</div>
              <div class="reserve-detail___10-p">보유포인트 : 10P</div>
            </div>
            <div class="reserve-detail__list-32">
              <div class="reserve-detail__list-3-12">
                <div class="reserve-detail___10000">10000</div>
              </div>
              <div class="reserve-detail__p">P</div>
            </div>
            <div class="reserve-detail__list-23">
              <div class="reserve-detail__14">쿠폰</div>
              <div class="reserve-detail___0">0원</div>
            </div>
            <div class="reserve-detail__list-13">
              <div class="reserve-detail__15">할인 적용</div>
              <svg
                class="reserve-detail__line-12"
                width="1427"
                height="3"
                viewBox="0 0 1427 3"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M0.205734 0.831055C557.022 1.60765 869.206 2.04305 1426.02 2.81964"
                  stroke="black"
                  stroke-width="0.978598"
                />
              </svg>
            </div>
          </div>
          <div class="reserve-detail__body-info-4">
            <div class="reserve-detail__list-42">
              <div class="reserve-detail___90-000">90,000원</div>
              <div class="reserve-detail__16">총 결제 금액</div>
            </div>
            <div class="reserve-detail__list-33">
              <div class="reserve-detail__17">금액</div>
              <div class="reserve-detail___100-000">100,000원</div>
            </div>
            <div class="reserve-detail__list-24">
              <div class="reserve-detail__18">할인금액</div>
              <div class="reserve-detail___10-000">10,000원</div>
            </div>
            <div class="reserve-detail__list-14">
              <div class="reserve-detail__19">결제 내역</div>
            </div>
            <svg
              class="reserve-detail__line-13"
              width="1426"
              height="3"
              viewBox="0 0 1426 3"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M0.0987091 0.100586C556.915 0.877177 869.099 1.31258 1425.92 2.08917"
                stroke="black"
                stroke-width="0.978598"
              />
            </svg>
          </div>
          <div class="reserve-detail__body-info-5">
            <div class="reserve-detail__payment-1">
              <div class="reserve-detail__check"></div>
              <div class="reserve-detail__without-bankbook">
                <div class="reserve-detail__20">무통장 입금</div>
              </div>
            </div>
            <div class="reserve-detail__payment-2">
              <div class="reserve-detail__check"></div>
              <div class="reserve-detail__account-transfer">
                <div class="reserve-detail__21">계좌 이체</div>
              </div>
            </div>
            <div class="reserve-detail__payment">
              <div class="reserve-detail__check"></div>
              <div class="reserve-detail__next-time">
                <div class="reserve-detail__22">
                  이 결제 수단을 다음에도 사용
                </div>
              </div>
            </div>
            <div class="reserve-detail__list-15">
              <div class="reserve-detail__23">결제 수단 선택</div>
              <svg
                class="reserve-detail__line-14"
                width="1427"
                height="3"
                viewBox="0 0 1427 3"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M0.334183 0.174805C557.15 0.951396 869.335 1.3868 1426.15 2.16339"
                  stroke="black"
                  stroke-width="0.978598"
                />
              </svg>
            </div>
          </div>
          <div class="reserve-detail__agree-condition">
            <div class="reserve-detail__condition-list">
              <div class="reserve-detail__total-check">
                <div class="reserve-detail__rectangle-15"></div>
                <div class="reserve-detail__24">필수 약관 전체 동의</div>
              </div>
              <div class="reserve-detail__list-25">
                <div class="reserve-detail__check2"></div>
                <div class="reserve-detail___14">
                  [필수] 만14세 이상 이용 동의
                </div>
              </div>
              <div class="reserve-detail__list-34">
                <div class="reserve-detail__check2"></div>
                <div class="reserve-detail___14">
                  [필수] 만14세 이상 이용 동의
                </div>
              </div>
              <div class="reserve-detail__list-43">
                <div class="reserve-detail__check2"></div>
                <div class="reserve-detail___14">
                  [필수] 만14세 이상 이용 동의
                </div>
              </div>
              <div class="reserve-detail__list-52">
                <div class="reserve-detail__check2"></div>
                <div class="reserve-detail___14">
                  [필수] 만14세 이상 이용 동의
                </div>
              </div>
            </div>
          </div>
          <div class="reserve-detail__user-rule">
            <div class="reserve-detail__head">
              <div class="reserve-detail__25">이용 규칙</div>
              <div
                class="reserve-detail__this-letter-first-started-in-england-and-gave-luck-to-the-recipients-around-the-world-and-now-this-letter-that-has-reached-you-has-to-leave-you-within-4-days-you-must-send-7-copies-including-this-letter-to-the-person-in-need-of-good-luck-you-can-also-make-a-copy-you-may-call-it-superstition-but-it-is-true-a-british-man-named-hgxwch-received-this-letter-in-1930-he-asked-his-secretary-to-copy-and-send-it-a-few-days-later-he-won-the-lottery-and-received-2-billion-won-some-received-this-letter-but-forgot-that-it-had-to-leave-their-hands-within-96-hours-he-was-soon-resigned-i-only-found-out-about-this-later-and-sent-7-letters-but-i-got-a-good-job-again-president-kennedy-of-the-united-states-received-this-letter-but-simply-threw-it-away-eventually-nine-days-later-he-was-assassinated-please-remember-if-you-send-this-letter-there-will-be-7-years-of-good-fortune-otherwise-there-will-be-3-years-of-misfortune-and-you-must-never-throw-away-or-scribble-on-this-letter-7-cans-whoever-receives-this-letter-will-be-lucky-it-s-hard-but-think-good-is-good-7-years-of-good-luck"
              >
                This letter first started in England and gave luck to the
                recipients around the world, and now this letter that has
                reached you has to leave you within 4 days. You must send 7
                copies, including this letter, to the person in need of good
                luck. You can also make a copy. You may call it superstition,
                but it is true.
              </div>
            </div>
            <div class="reserve-detail__check3">
              <div class="reserve-detail__rectangle-16"></div>
              <div class="reserve-detail__26">확인하였습니다[필수]</div>
            </div>
          </div>
          <div class="reserve-detail__reeservation-button">
            <div class="reserve-detail__rectangle-6"></div>
            <div class="reserve-detail__27">예약하기</div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
