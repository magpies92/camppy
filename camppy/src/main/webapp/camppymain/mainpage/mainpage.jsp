<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="camppy.main.action.CampRegDTO" %>
<%@ page import="camppy.main.action.CampRegDAO" %>
<%@ page import="camppy.main.action.CampRegService" %>

    
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
<!-- <script type="text/javascript" src="camppymain/mainpage/mainpage.js"></script> -->
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
              <img class="mainpage__icon-speak" src="camppymain/mainpage/icon-speak.png" />
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
          <%
			// BoardService 객체생성
			CampRegService campregService1 = new CampRegService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출
			CampRegDTO campregDTO1 = campregService1.getCampReg(1);
			// request에 "boardDTO",boardDTO 담아서
			CampRegService campregService2 = new CampRegService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출
			CampRegDTO campregDTO2 = campregService2.getCampReg(2);
			CampRegService campregService3 = new CampRegService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출 
			CampRegDTO campregDTO3 = campregService3.getCampReg(3);
			CampRegService campregService4 = new CampRegService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출
			CampRegDTO campregDTO4 = campregService2.getCampReg(4);
		%>
          <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO1.getCampid()%>'">
            
                <img
                  class="mainpage__icon-1"
                  src="camppymain/campreg/campimg/<%=campregDTO1.getCampimg()%>"
                />
                </button>
         <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO2.getCampid()%>'" >     
                <img
                  class="mainpage__icon-2"
                  src="camppymain/campreg/campimg/<%=campregDTO2.getCampimg()%>"
                />
             </button>
         <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO3.getCampid()%>'" >   
                <img
                  class="mainpage__icon-3"
                  src="camppymain/campreg/campimg/<%=campregDTO3.getCampimg()%>"
                />
              </button>
           <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO4.getCampid()%>'" > 
                <img
                  class="mainpage__icon-4"
                  src="camppymain/campreg/campimg/<%=campregDTO4.getCampimg()%>"
                />
             </button>   
                <div class="mainpage__name-camping">
              <div class="mainpage__7"><%=campregDTO1.getCampname() %></div>
            </div>
            <div class="mainpage__name-glaming">
              <div class="mainpage__7"><%=campregDTO2.getCampname() %></div>
            </div>
            <div class="mainpage__name-caravan">
              <div class="mainpage__7"><%=campregDTO3.getCampname() %></div>
            </div>
            <div class="mainpage__name-pension">
              <div class="mainpage__7"><%=campregDTO4.getCampname() %></div>
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

