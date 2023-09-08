<%@page import="camppy.main.action.PageDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="camppy.main.action.CampRegDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="camppymain/searchpage/searchpage.css" />

   
    <title>Document</title>
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
       table {
    /* width: 400px;
    height: 200px; */
    margin-left: auto;
    margin-right: auto;
  }
     
    </style>
  </head>
  <body>
  <jsp:include page="/inc/top.jsp"/>
  
  <%
List<CampRegDTO> campregList 
    = (List<CampRegDTO>)request.getAttribute("campregList");

PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");
%>
    <div class="mainpage">
  <div class="mainpage__section-total">
    <div class="mainpage__search-box-frame">
      <div class="mainpage__search-box">
        <div class="mainpage__searchbox-form">
          <div class="mainpage__form-1">
            <div class="mainpage__options-2">
              <div class="mainpage__options-2-1">
                <div class="mainpage__">전체/시/군</div>
              </div>
            </div>
            <div class="mainpage__options-1">
              <div class="mainpage__option-1-1"></div>
              <div class="mainpage__2">전체/도</div>
            </div>
          </div>
          <div class="mainpage__button">
            <div class="mainpage__3">상세검색</div>
          </div>
          <div class="mainpage__form-2">
            <div class="mainpage__options-12"></div>
          </div>
          <div class="mainpage__button">
            <div class="mainpage__3">검색</div>
          </div>
        </div>
      </div>
    </div>
    <div class="mainpage__popular-info">
    <table>
    <tr>
    <%
    for(int i=1;i<=campregList.size();i++){
    	CampRegDTO campregDTO=campregList.get(i-1);
    	%>
    	<td>
    	<button type="button" onclick="location.href='detail.de?campId=<%=campregDTO.getCampid()%>'">
        <img class="mainpage__forest-7" src="campimg/<%=campregDTO.getCampimg()%>" /><br>
        <div class="mainpage__4"><%=campregDTO.getCampname()%></div><br>
       <div class="mainpage__4">주소</div><br>
       <div class="mainpage__4"><%=campregDTO.getTel()%></div>
       </button>       
       
       </td>
       <%if((i % 3) ==0 ){%></tr><%
       }
    }
    %>
    </table>
      <div class="mainpage__list">
        <img
          class="mainpage__item-link-btn-pre-00-png"
          src="camppymain/searchpage/item-link-btn-pre-00-png.png"
        /><img
          class="mainpage__item-link-btn-pre-01-png"
          src="camppymain/searchpage/item-link-btn-pre-01-png.png"
        />
        <%
// 시작페이지 1페이지 Prev 없음
// 시작페이지 11,21,31 Prev 보임
if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	%>
	<a href="list.camp?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock()%>">Prev</a>
	<%
}
%> 

<%
for(int i=pageDTO.getStartPage();i<=pageDTO.getEndPage();i++){
	%>
	<a href="list.camp?pageNum=<%=i%>"><%=i %></a> 
	<%
}
%>

<%
//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%>
	<a href="list.camp?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">Next</a>
	<%
}
%>
       <!--  <div class="mainpage__item">
          <div class="mainpage__link-1">1</div>
        </div>
        
        <img
          class="mainpage__item-link-btn-next-01-png"
          src="camppymain/searchpage/item-link-btn-next-01-png.png"
        /><img
          class="mainpage__item-link-btn-next-00-png"
          src="camppymain/searchpage/item-link-btn-next-00-png.png"
        />
      </div>
      <!-- <div class="mainpage__5">인기순</div> -->
    </div>
  </div>
</div>
</div>

    <jsp:include page="/inc/bottom.jsp"/>
  </body>
</html>