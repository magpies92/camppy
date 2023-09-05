<%@page import="com.notice.dto.NoticeDTO"%>
<%@page import="com.notice.dao.NoticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="notice/noticeList/noticeList.css" />

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
    <div class="noticeList">
      <div class="noticeListSectionTotal">
        <div class="noticeListSectionBody">
          <div class="noticeListBodyTitle">
            <div class="noticeListA">공지사항</div>
          </div>
          <div class="noticeListListBody">
            <div class="noticeListList">
              <%
                NoticeDAO noticeDAO = new NoticeDAO();
                List<NoticeDTO> noticeListFromDAO = noticeDAO.getNoticeList(NoticeDTO); // 변수 이름 변경

                for(NoticeDTO noticeDTO : noticeListFromDAO) {
              %>
              <div class="noticeListList1">
                <div class="noticeListNum">
                  <div class="noticeListB"><%=noticeDTO.getNotice_id()%></div>
                </div>
                <div class="noticeListTitle">
                  <div class="noticeList2023Event">
                    <%= noticeDTO.getTitle()%>
                  </div>
                </div>
                <div class="noticeListAdmin">
                  <div class="noticeListC"><%=noticeDTO.getCreated_by() %></div>
                </div>
                <div class="noticeListDate">
                  <div class="noticeList2023"><%=noticeDTO.getCreated_date() %></div>
                </div>
                <div class="noticeListNum2">
                  <div class="noticeListD"><%=noticeDTO.getNotice_cnt() %></div>
                </div>
              </div>
              <% } %>
              <!-- 두번째 -->
              <div class="noticeListList2">
                <div class="noticeListNum">
                  <div class="noticeListB">67</div>
                </div>
                <div class="noticeListTitle">
                  <div class="noticeList2023Event2">
                    [조기종료][2023 만만한캠핑 EVENT] 캠핑도 하고 네이버페이포인트 리워드(1만원) 받기!
                  </div>
                </div>
                <div class="noticeListAdmin2">
                  <div class="noticeListC">관리자</div>
                </div>
                <div class="noticeListDate2">
                  <div class="noticeList202301">2023-05-25</div>
                </div>
                <div class="noticeListNum2">
                  <div class="noticeListD">1764</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
