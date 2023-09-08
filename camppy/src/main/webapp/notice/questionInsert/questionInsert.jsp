<%@page import="camppy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/questionInsert/questionInsert.css" />

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
  
<%
String id = (String)session.getAttribute("id");

MemberDTO  memberDTO =(MemberDTO)request.getAttribute("memberDTO");
%>


	<div class="questionInsert">
		<div class="questionInsertSectionBody">
			<div class="questionInsertInputBox">
				<div class="questionInsertLine1"></div>
				<div class="questionInsertBox"></div>
			</div>

			<div class="questionInsertTitle">
				<div class="questionInsert3">문의하기</div>


				<tr>
					<td><input type="text" name="created_by" readonly="readonly" value="<%=id%>" class="name"></td>
				</tr>

				<input type="hidden" name="member_id" value="<%=memberDTO.getMember_id()%>">

				<!--            제목을 입력해 주세요 -->
				<textarea class="questionInsert1" name="title"></textarea>

				<!--            문의 내용을 입력해 주세요 -->
				<textarea class="questionInsert2" name="content"></textarea>
			</div>

			<div class="questionInsertButton">
				<input type="button" class="questionInsertLeaveButton" value="나가기" onclick="location.href='list.qu'"> 
				<input type="submit" class="questionInsertRegisterButton" value="등록">
			</div>

		</div>
	</div>

</body>
</html>