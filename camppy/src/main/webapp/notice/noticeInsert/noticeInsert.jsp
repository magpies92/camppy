<%@page import="camppy.member.MemberDTO"%>
<%@page import="com.notice.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/noticeInsert/noticeInsert.css" />

    <style>
       a, button, input, h1, h2, h3, h4, h5, * {
        margin: 0;
        padding: 0;
        border: none;
        text-decoration: none;
      /* appearance: none; */
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
  
  
<%
// NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("noticeDTO");

String id = (String)session.getAttribute("id");

MemberDTO  memberDTO =(MemberDTO)request.getAttribute("memberDTO");

// int notice_id = noticeDTO.getNotice_id();
%>
	<div class="noticeInsert">

		<div class="noticeInsertSectionBody">
<%-- 			<%=id %> --%>
<%-- 			<%=memberDTO.getMember_id() %> --%>

			<form action="writePro.no" method="post">
				<div class="noticeInsertBodyContents">
					<div class="noticeInsertRectangle2">
						<select class="noticeInsert23" name="post_type">
							<option value="1">말머리</option>
							<option value="2">로그인</option>
							<option value="3">결제</option>
						</select>
					</div>

					<tr>
						<td><input type="text" name="created_by" readonly="readonly" value="<%=id%>" class="name"></td>
					</tr>

					<input type="hidden" name="member_id" value="<%=memberDTO.getMember_id()%>">
					<div class="noticeInsertRectangle1"></div>
					<div class="noticeInsertLine1"></div>

					<!--            제목을 입력해 주세요 -->
					<textarea class="noticeInsert2" name="title"></textarea>

					<!--             문의 내용을 입력해 주세요 -->
					<textarea class="noticeInsert3" name="content"></textarea>
				</div>

				<div class="noticeInsertButton">

					<input type="button" class="noticeInsertLeaveButton" value="나가기" onclick="location.href='list.no'">
					<input type="submit" class="noticeInsertRegisterButton" value="등록">
				</div>
			</form>

		</div>
	</div>

</body>
</html>