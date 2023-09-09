<%@page import="com.notice.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/questionList/questionList.css" />

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
   <jsp:include page="../../inc/top.jsp"/>

<%
List<QuestionDTO> questionList = (List<QuestionDTO>)request.getAttribute("questionList");
%>

<!-- 	<div class="questionListSectionQna"> -->

<!-- 		<div class="questionListA">문의하기</div> -->

<!-- 		<div class="questionListHeader"> -->
<!-- 			<div class="questionList2">번호</div> -->
<!-- 			<div class="questionList10">제목</div> -->
<!-- 			<div class="questionList11">작성자</div> -->
<!-- 			<div class="questionList12">등록일</div> -->
<!-- 			<div class="questionList13">조회수</div> -->
<!-- 		</div> -->
		
		
		<div class="questionList">
        <div class="questionListSectionTotal">
                    <div class="questionListA">공지사항</div>
                </div>
                </div>
                            <div class="questionListBoardList">
              <div class="questionListCell1">
                <div class="questionList4">번호</div>
              </div>
              <div class="questionListCell2">
                <div class="questionList5">제목</div>
              </div>
              <div class="questionListCell3">
                <div class="questionList6">작성자</div>
              </div>
              <div class="questionListCell4">
                <div class="questionList7">등록일</div>
              </div>
              <div class="questionListCell5">
                <div class="questionList8">조회</div>
              </div>
            </div>

<%
 for(int i=0; i<questionList.size(); i++){
  	QuestionDTO questionDTO=questionList.get(i);
%>		  
	

<div class="questionListQuestionList3" onclick = "location.href='content.qu?inquriy_id=<%=questionDTO.getInquiry_id()%>'">	
		<div class="questionListQuestionList3">
			<div class="questionListLine1">
				<div class="questionList1"><%=questionDTO.getInquiry_id() %></div>
				<div class="questionList14"><%=questionDTO.getTitle()%></div>
				<div class="questionList15"><%=questionDTO.getCreated_by()%></div>
				<div class="questionList2023"><%=questionDTO.getCreate_date()%></div>
				<div class="questionListB"><%=questionDTO.getNotice_cnt()%></div>
			</div>

		</div>

	</div>

<!-- </div> -->
<%} %> 

<input type="button" value="글쓰기" class="writebtn" onclick="location.href='write.qu'">
   <jsp:include page="../../inc/bottom.jsp"/>		
</body>
</html>
