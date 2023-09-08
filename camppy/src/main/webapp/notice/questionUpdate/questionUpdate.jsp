<%@page import="com.notice.dto.QuestionDTO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/questionUpdate/questionUpdate.css" />

    <style>
        a, button, input, selet, h1, h2, h3, h4, h5, * {
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
  
<%
String id = (String)session.getAttribute("id");

MemberDTO  memberDTO =(MemberDTO)request.getAttribute("memberDTO");

QuestionDTO questionDTO = (QuestionDTO)request.getAttribute("questionDTO");
%>
  
    <form action="updatePro.qu" method="post">
    <div class="questionUpdate">
      <div class="questionUpdateSectionTotal">
        <div class="questionUpdateSectionBody">
  
  	<input type = "hidden" name = "inquiry_id" value = "<%=questionDTO.getInquiry_id()%>">        
          <div class="questionUpdateButton">
            <div class="questionUpdateLeaveButton">
            <input type="button" class="questionUpdateB" value="나가기" onclick="location.href='list.qu'">
            </div>
            <div class="questionUpdateReviseButton">
              <input type="submit" class="questionUpdate2" value="수정">
            </div>
          </div>
          
          <div class="questionUpdateTitle">
            <div class="questionUpdate3">문의하기</div>
          </div>
          
          <div class="questioUpdateInputBox">
            <div class="questionUpdateLine1"></div>
            
            <div class="questionUpdateBox"></div>
            <!--            제목을 입력해 주세요 -->
            <textarea class="questionUpdate4" name="title"></textarea>
            
			<!--            문의 내용을 입력해 주세요 -->
            <textarea class="questionUpdate5" name="content"></textarea>
           </div>
          
          
        </div>
      </div>
    </div>
    
    </form>
  </body>
</html>
