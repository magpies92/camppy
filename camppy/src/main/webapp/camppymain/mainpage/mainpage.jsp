<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="camppy.main.action.CampRegDTO" %>
<%@ page import="camppy.main.action.CampRegDAO" %>
<%@ page import="camppy.main.action.CampRegService" %>
<%@ page import="java.text.SimpleDateFormat"%>

    
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
<script src="script/jquery-3.7.0.js"></script>
 <script> 
 $('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	   
	   $("select[name^=sido]").each(function() {
		   $selsido = $(this);
		   $.each(eval(area0), function() {
		    $selsido.append("<option value='"+this+"'>"+this+"</option>");
		   });
		   $selsido.next().append("<option value=''>구/군 선택</option>");
		  });

		  

		  // 시/도 선택시 구/군 설정

		  $("select[name^=sido]").change(function() {
		   var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		   var $gugun = $(this).next(); // 선택영역 군구 객체
		   $("option",$gugun).remove(); // 구군 초기화

		   if(area == "area0")
		    $gugun.append("<option value=''>구/군 선택</option>");
		   else {
		    $.each(eval(area), function() {
		     $gugun.append("<option value='"+this+"'>"+this+"</option>");
		    });
		   }
		  });


		 });
	   
    </script> 
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
            
            
            <form action="list.camp" method="post" class="mainpage__div-search-box">
              <div class="mainpage__div-searchbox-form">
                <div class="mainpage__div-form-1-2">             
 <select name="sido" class="mainpage__options-1">
          <!-- <option class="mainpage__3"   >전체/도</option> -->
          
        </select>
           
           <select name="gungu"  class="mainpage__options-2">
          <!-- <option class="mainpage__3" >전체/시/군</option> -->
         
        </select>
                 </div>
                           
            
                <div class="mainpage__div-form-1-3">
                
                  
                  <input type="text" name="Keywordsearch" placeholder="키워드 검색" class="mainpage__options">
                  <button type="submit" class="mainpage__button">
                    검색
                  </button> <!-- 검색 버튼 -->    
                </div>
              </div>
            </form> <!-- form -->
            
            
            
          </div>
        </div>
        <div class="mainpage__section-notice" onclick="location.href='list.no'">
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
			CampRegService campregService = new CampRegService();
			CampRegDTO campregDTO1 = campregService.getCampReg(1);
			CampRegDTO campregDTO2 = campregService.getCampReg(25);	
			CampRegDTO campregDTO3 = campregService.getCampReg(3);			
			CampRegDTO campregDTO4 = campregService.getCampReg(4);
		%>
		
          <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO1.getCampid()%>'">
            
                <img
                  class="mainpage__icon-1"
                  src="campimg/<%=campregDTO1.getCampimg()%>"
                />
                </button>
         <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO2.getCampid()%>'" >     
                <img
                  class="mainpage__icon-2"
                  src="campimg/<%=campregDTO2.getCampimg()%>"
                />
             </button>
         <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO3.getCampid()%>'" >   
                <img
                  class="mainpage__icon-3"
                  src="campimg/<%=campregDTO3.getCampimg()%>"
                />
              </button>
           <button type="button" onclick="location.href='detail.de?campId=<%=campregDTO4.getCampid()%>'" > 
                <img
                  class="mainpage__icon-4"
                  src="campimg/<%=campregDTO4.getCampimg()%>"
                />
             </button>   
                <div class="mainpage__name-camping">
              <div class="mainpage__7"><%=campregDTO1.getCampname()%></div>
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
         <%
			CampRegDTO camprankDTO1 = campregService.getCampRank(1);
			CampRegDTO camprankDTO2 = campregService.getCampRank(2);
			CampRegDTO camprankDTO3 = campregService.getCampRank(3);
			CampRegDTO camprankDTO4 = campregService.getCampRank(4);
			CampRegDTO camprankDTO5 = campregService.getCampRank(5);
	
		%>
        <div class="mainpage__section-best">
          <div class="mainpage__best">
            <div class="mainpage__best-contents">
              <div class="mainpage__div-best-num-1">
                <div class="mainpage__best-num-1-contents">
                  <%=camprankDTO1.getShortintro()%>
                </div>
                <button type="button" onclick="location.href='detail.de?campId=<%=camprankDTO1.getCampid()%>'">
                <img
                  class="mainpage__best-num-1-img"
                  src="campimg/<%=camprankDTO1.getCampimg()%>"
                />
                </button>
                
                <div class="mainpage__best-num-1-name">
                  1위 <%=camprankDTO1.getCampname()%>
                </div>
              </div>
              <div class="mainpage__div-best-num-2">
                <div class="mainpage__best-num-2-contents">
                  <%=camprankDTO2.getShortintro()%>
                </div>
                <button type="button" onclick="location.href='detail.de?campId=<%=camprankDTO2.getCampid()%>'">
                <img
                  class="mainpage__best-num-2-img"
                  src="campimg/<%=camprankDTO2.getCampimg()%>"
                />
                </button>
                <div class="mainpage__best-num-2-name">
                  2위 <%=camprankDTO2.getCampname()%>
                </div>
              </div>
              <div class="mainpage__div-best-num-3">
                <div class="mainpage__best-num-3-contents">
                  <%=camprankDTO3.getShortintro()%>
                </div>
                <button type="button" onclick="location.href='detail.de?campId=<%=camprankDTO3.getCampid()%>'">
                <img
                  class="mainpage__best-num-3-img"
                  src="campimg/<%=camprankDTO3.getCampimg()%>"
                />
                </button>
                <div class="mainpage__best-num-3-name">
                  3위 <%=camprankDTO3.getCampname()%>
                </div>
              </div>
              <div class="mainpage__div-best-num-4">
                <div class="mainpage__best-num-4-contents">
                  <%=camprankDTO4.getShortintro()%>
                </div>
                <button type="button" onclick="location.href='detail.de?campId=<%=camprankDTO4.getCampid()%>'">
                <img
                  class="mainpage__best-num-4-img"
                  src="campimg/<%=camprankDTO4.getCampimg()%>"
                />
                </button>
                <div class="mainpage__best-num-4-name">
                  4위 <%=camprankDTO4.getCampname()%>
                </div>
              </div>
              <div class="mainpage__div-best-num-5">
                <div class="mainpage__best-num-5-contents">
                  <%=camprankDTO5.getShortintro()%>
                </div>
                <button type="button" onclick="location.href='detail.de?campId=<%=camprankDTO5.getCampid()%>'">
                <img
                  class="mainpage__best-num-5-img"
                  src="campimg/<%=camprankDTO5.getCampimg()%>"
                />
                </button>
                <div class="mainpage__best-num-5-name">
                  5위 <%=camprankDTO5.getCampname()%>
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