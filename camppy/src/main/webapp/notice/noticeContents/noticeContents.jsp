<%@page import="java.util.List"%>
<%@page import="com.notice.dto.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/noticeContents/noticeContents.css" />

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
    <title>Document</title>
  </head>
  <body>
  
      <jsp:include page="../../inc/top.jsp"/> 
  <%
String id = (String)session.getAttribute("id");

NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("noticeDTO");

List<NoticeDTO> noticeList = (List<NoticeDTO>)request.getAttribute("noticeList");
%>


	<div class="noticeContents">
		<div class="noticeContentsSectionBody">
			<div class="noticeContentsQuestionContents">
				<div class="noticeContentsA">공지사항</div>

				<div class="noticeContentsTitleNcontent">
					<div class="noticeContentsC"><%=noticeDTO.getTitle()%></div>
					<div class="noticeContentsD"><%=noticeDTO.getContent()%></div>
				</div>

				<div class="noticeContentsName">
					<div class="noticeContentsE"><%=noticeDTO.getCreated_by()%> &nbsp; </div>
				</div>

				<div class="noticeContentsDateNbutton">
					<div class="noticeContents2023"><%=noticeDTO.getCreate_date()%></div> 
									</div>
					
				<div class="ContentsNbutton">
					<input type="button" class="noticeContentsH" value="수정" onclick="location.href='update.no?notice_id=<%=noticeDTO.getNotice_id()%>'"> 
					<input type="button" class="noticeContentsI" value="삭제" onclick="location.href='delete.no?notice_id=<%=noticeDTO.getNotice_id()%>'">
					<input type="button" class="noticeContents22" value="목록" onclick="location.href='list.no'">
				</div>

			</div>
		</div>
	</div>


   <jsp:include page="../../inc/bottom.jsp"/>		
</body>
</html>
