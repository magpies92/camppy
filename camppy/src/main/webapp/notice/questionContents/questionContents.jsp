<%@page import="java.util.List"%>
<%@page import="com.notice.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/questionContents/questionContents.css" />

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

QuestionDTO questionDTO = (QuestionDTO)request.getAttribute("questionDTO");

List<QuestionDTO> questionList = (List<QuestionDTO>)request.getAttribute("questionList");
%>
  
	<div class="questionContents">
		<div class="questionContentsSectionBody">
			<div class="questionContentsQuestionContents">
				<div class="questionContentsA">문의하기</div>

				<div class="questionContentsTitleNcontent">
					<div class="questionContentsC"><%=questionDTO.getTitle()%></div>
					<div class="questionContentsD"><%=questionDTO.getContent()%></div>
				</div>

				<div class="questionContentsName">
					<div class="questionContentsE"><%=questionDTO.getCreated_by()%></div>
				</div>

				<div class="questionContentsDateNbutton">
					<div class="questionContents2023"><%=questionDTO.getCreate_date()%></div> 
				</div>
					
				<div class="ContentsNbutton">
					<input type="button" class="questionContentsH" value="수정" onclick="location.href='update.qu?inquiry_id=<%=questionDTO.getInquiry_id()%>'"> 
					<input type="button" class="questionContentsI" value="삭제" onclick="location.href='delete.qu?inquiry_id=<%=questionDTO.getInquiry_id()%>'">
					<input type="button" class="questionContents22" value="목록" onclick="location.href='list.qu'">
				</div>

			</div>
		</div>
	</div>

    <jsp:include page="../../inc/bottom.jsp"/>		  
  </body>
</html>
