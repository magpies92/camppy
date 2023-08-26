<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="camppymain/mainpage/mainpage.css" />
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
<title>Insert title here</title>
<script type="text/javascript" src="camppymain/mainpage/mainpage.js"></script>
</head>
<body>
<jsp:include page="/inc/top.jsp"/>
    <div class="mainpage">
      <div class="mainpage__section-total">
        <div class="mainpage__section-search">
          <div class="mainpage__bg">
            <img
              class="mainpage___73222-f-48-f-4887-1"
              src="camppymain/mainpage/_73222-f-48-f-4887-1.png"
            />
          </div>
          <div class="mainpage__search">
            <div class="mainpage__div-search-title">
              <div class="mainpage__div-search-text">
                <div class="mainpage___3657">
                  캠피 는 관광사업자에 등록된 3657개의 캠핑장 정보를 볼 수
                  있습니다.
                </div>
                <div class="mainpage__">캠핑장 정보</div>
                <div class="mainpage__2">어디에서 찾으세요?</div>
              </div>
            </div>
            
            
            <form action="search.camp" method="post" class="mainpage__div-search-box">
              <div class="mainpage__div-searchbox-form">
                <div class="mainpage__div-form-1-2">             
 <select name="do" class="mainpage__options-1">
          <option class="mainpage__3" >전체/도</option>
          <option value="seoul">서울시</option>
          <option value="busan">부산시</option>
          <option value="daegu">대구시</option>
        </select>
           
           <select name="do" class="mainpage__options-2">
          <option class="mainpage__3" >전체/시/군</option>
          <option value="si1">시1</option>
          <option value="si2">시2</option>
          <option value="si3">시3</option>
        </select>
                 </div>
                           
            
                <div class="mainpage__div-form-1-3">
                
                  
                  <select name="do" class="mainpage__options">
          <option class="mainpage__3" >전체테마</option>
          <option value="tema1">테마1</option>
          <option value="tema2">테마2</option>
          <option value="tema3">테마3</option>
        </select>
                  <button type="submit" class="mainpage__button">
                    검색
                  </button> <!-- 검색 버튼 -->    
                </div>
              </div>
            </form> <!-- form -->
            
            
            
          </div>
        </div>
        <div class="mainpage__section-notice">
          <div class="mainpage__notice-left">
            <div class="mainpage__div-notice-head">
              <div class="mainpage__5">공지사항</div>
              <img class="mainpage__icon-speak" src="/camppymain/mainpage/icon-speak.png" />
            </div>
          </div>
          <div class="mainpage__notice-center">
            <div class="mainpage__notice-contents">
              <div class="mainpage__item-link">
                <div class="mainpage__6">
                  고캠핑 홈페이지 개인정보 처리방침 변경 안내
                </div>
              </div>
            </div>
          </div>
          <div class="mainpage__notice-right">
            <div class="mainpage__notice-etc">
              <div class="mainpage__notice-date-link">Thu Jul 20</div>
              <img
                class="mainpage__free-icon-zoom-in-9546602-1"
                src="camppymain/mainpage/free-icon-zoom-in-9546602-1.png"
              />
            </div>
          </div>
        </div>
        <div class="mainpage__section-category">
        <div class="mainpage__best-head">
              <div class="mainpage__best-5">캠피 추천 캠핑장</div>
            </div>
          <div class="mainpage__category-icon">
          <button type="button" onclick="location.href='search.camp'" >
            
                <img
                  class="mainpage__icon-camping"
                  src="camppymain/mainpage/1.png"
                />
                </button>
         <button type="button" onclick="location.href='search.camp'" >     
                <img
                  class="mainpage__icon-glamping"
                  src="camppymain/mainpage/2.png"
                />
             </button>
         <button type="button" onclick="location.href='search.camp'" >   
                <img
                  class="mainpage__icon-caravan"
                  src="camppymain/mainpage/3.png"
                />
              </button>
           <button type="button" onclick="location.href='search.camp'" > 
                <img
                  class="mainpage__icon-pension"
                  src="camppymain/mainpage/4.png"
                />
             </button>   
                <div class="mainpage__name-camping">
              <div class="mainpage__7">캠핑장1</div>
            </div>
            <div class="mainpage__name-glaming">
              <div class="mainpage__7">캠핑장2</div>
            </div>
            <div class="mainpage__name-caravan">
              <div class="mainpage__7">캠핑장3</div>
            </div>
            <div class="mainpage__name-pension">
              <div class="mainpage__7">캠핑장4</div>
            </div>
            
            
          </div>
        
          
        </div>
        <div class="mainpage__section-best">
          <div class="mainpage__best">
            <div class="mainpage__best-contents">
              <div class="mainpage__div-best-num-1">
                <div class="mainpage__best-num-1-contents">
                  부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                  부산교육센터 7층
                </div>
                <img
                  class="mainpage__best-num-1-img"
                  src="camppymain/mainpage/best-num-1-img.png"
                />
                <div class="mainpage__best-num-1-name">
                  1위 기장 베스트 카라반
                </div>
              </div>
              <div class="mainpage__div-best-num-2">
                <div class="mainpage__best-num-2-contents">
                  부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                  부산교육센터 7층
                </div>
                <img
                  class="mainpage__best-num-2-img"
                  src="camppymain/mainpage/best-num-2-img.png"
                />
                <div class="mainpage__best-num-2-name">
                  2위 양산 산마루 펜션
                </div>
              </div>
              <div class="mainpage__div-best-num-3">
                <div class="mainpage__best-num-3-contents">
                  부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                  부산교육센터 7층
                </div>
                <img
                  class="mainpage__best-num-3-img"
                  src="camppymain/mainpage/best-num-3-img.png"
                />
                <div class="mainpage__best-num-3-name">
                  3위 김해 가야 글램핑
                </div>
              </div>
              <div class="mainpage__div-best-num-4">
                <div class="mainpage__best-num-4-contents">
                  부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                  부산교육센터 7층
                </div>
                <img
                  class="mainpage__best-num-4-img"
                  src="camppymain/mainpage/best-num-4-img.png"
                />
                <div class="mainpage__best-num-4-name">
                  4위 창원 산마루 캠핑장
                </div>
              </div>
              <div class="mainpage__div-best-num-5">
                <div class="mainpage__best-num-5-contents">
                  부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 아이티윌
                  부산교육센터 7층
                </div>
                <img
                  class="mainpage__best-num-5-img"
                  src="camppymain/mainpage/best-num-5-img.png"
                />
                <div class="mainpage__best-num-5-name">
                  5위 울산 갯바위 펜션
                </div>
              </div>
            </div>
            <div class="mainpage__best-head">
              <div class="mainpage__best-5">Best 5</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/inc/bottom.jsp"/>
  </body>
</html>

