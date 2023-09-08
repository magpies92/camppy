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
    <link rel="stylesheet" href="notice/noticeUpdate/noticeUpdate.css" />

    <style>
        a, button, input, h1, h2, h3, h4, h5, * {
        margin: 0;
        padding: 0;
        border: none;
        text-decoration: none;
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
<%
String id = (String)session.getAttribute("id");

MemberDTO  memberDTO =(MemberDTO)request.getAttribute("memberDTO");

NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("noticeDTO");
%>
<%--  	<%=memberDTO.getMember_id() %>  --%>
  <form action="updatePro.no" method="post">
  
    <div class="noticeupdate">
        <div class="noticeupdateSectionBody">
          <div class="noticeupdateBodyContents">
            
            <div class="noticeupdateGroup2">
              <div class="noticeupdateRectangle2">
                 <select class="noticeUpdate23" name="post_type">
                <option value="1">말머리</option>
             	<option value="2">로그인</option>
             	<option value="3">결제</option>
             </select>
  			 </div>
		 </div>

<%-- <tr><td><input type="text" name="created_by" readonly="readonly" value="<%=id%>" class="name"></td></tr> --%>
		
		<input type = "hidden" name = "notice_id" value = "<%=noticeDTO.getNotice_id()%>">

            <div class="noticeupdateRectangle1"></div>
            <div class="noticeupdateLine1">            </div>

            <!--            제목을 입력해 주세요 -->
            <textarea class="noticeupdate2" name="title"><%=noticeDTO.getTitle() %></textarea>
			<!--            문의 내용을 입력해 주세요 -->
            <textarea class="noticeupdate3" name="content"><%=noticeDTO.getContent() %></textarea>
	</div>

          <div class="noticeupdateBodyButton">
         <input type="button" class="noticeupdateButtonExit" value="나가기" onclick="location.href='list.no'">
              <input type="submit" class="noticeupdateButtonupdate" value="수정">



		</div>
       
       
        </div>
        </div>
    </form>
    
  </body>
</html>