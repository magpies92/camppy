<%@page import="com.notice.dto.NoticePageDTO"%>
<%@page import="com.notice.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="notice/noticeList/noticeList.css" />
    <style>
        a, button, input, select, h1, h2, h3, h4, h5, * {
            margin: 0;
            padding: 0;
            border: none;
            text-decoration: none;
            appearance: none;
            background: none;
        }
    </style>
    <title>공지사항</title>
</head>
<body>
 <jsp:include page="../../inc/top.jsp"/> 



<%
List<NoticeDTO> noticeList = (List<NoticeDTO>)request.getAttribute("noticeList");

NoticePageDTO noticePageDTO = (NoticePageDTO)request.getAttribute("noticePageDTO");
%>

    <div class="noticeList">
        <div class="noticeListSectionTotal">
                    <div class="noticeListA">공지사항</div>
                </div>
                </div>
                            <div class="noticeListBoardList">
              <div class="noticListCell1">
                <div class="noticeList4">번호</div>
              </div>
              <div class="noticListCell2">
                <div class="noticeList5">제목</div>
              </div>
              <div class="noticListCell3">
                <div class="noticeList6">작성자</div>
              </div>
              <div class="noticListCell4">
                <div class="noticeList7">등록일</div>
              </div>
              <div class="noticListCell5">
                <div class="noticeList8">조회</div>
              </div>
            </div>
            
            
    <%
    for(int i=0; i<noticeList.size(); i++){
    	NoticeDTO noticeDTO=noticeList.get(i);
    	%>
    	
                  
             			<div class="noticeListList2" onclick = "location.href='content.no?notice_id=<%=noticeDTO.getNotice_id()%>'">
             			
    					<div class="noticeListNum">
        					<div class="noticeListB"><%=noticeDTO.getNotice_id() %></div>
    					</div> 
    						<div class="noticeListTitle">
        					<div class="noticeList2023Event"><%=noticeDTO.getTitle()%></div>
    						</div>
    						 <div class="noticeListAdmin2"> 
        					<div class="noticeListC"><%=noticeDTO.getCreated_by()%></div>
    						</div>
    						<div class="noticeListDate2">
        					<div class="noticeList2023"><%=noticeDTO.getCreate_date()%></div>
    						</div>
    						<div class="noticeListNum2">
        					<div class="noticeListD"><%=noticeDTO.getNotice_cnt()%></div>
    						</div>
       			 		</div>
    				
<%} %>

<input type="button" value="글쓰기" class="writebtn" onclick="location.href='write.no'">

<div class="clear"></div>
<div id="pageControl">
<%
// 시작페이지 1페이지 Prev 없음
// 시작페이지 11, 21, 31 Prev 보임 
if(noticePageDTO.getStartPage() > noticePageDTO.getPageBlock()) {
	%>
	<a href="list.no?pageNum=<%= noticePageDTO.getStartPage() - noticePageDTO.getPageBlock()%>">Prev</a>
	<%
}
%>

<%
for(int i = noticePageDTO.getStartPage(); i <= noticePageDTO.getEndPage(); i++) {
	%>
	<a href="list.no?pageNum=<%= i%>"><%= i %></a>
	<%
}
%>

<%
// 끝페이지 번호 전체페이지 수 비교 => 전체페이지 수 크면 Next보임
if(noticePageDTO.getEndPage() < noticePageDTO.getPageCount()) {
	%>
	<a href="list.no?pageNum=<%= noticePageDTO.getStartPage() + noticePageDTO.getPageBlock()%>">Next</a>
	<%
}
%>


</div>
   <jsp:include page="../../inc/bottom.jsp"/>		
</body>
</html>
   