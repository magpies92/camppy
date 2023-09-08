<%@page import="java.util.List"%>
<%@page import="camppy.main.action.PageDTO"%>
<%@page import="camppy.mypage.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="myLikeList/myLikeList.css" />
	<style>
      a,button, input,select, h1,h2,h3,h4,h5,
      * {margin: 0; padding: 0; border: none; text-decoration: none;
       /*  appearance: none; */ background: none; }
    </style>
    <title>Document</title>
  </head>
  <body>
  
  <%
  PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");
  List<LikeDTO> likeList = (List<LikeDTO>)request.getAttribute("likeList");
  LikeDTO likeDTO = (LikeDTO)request.getAttribute("likeDTO");
  String id=(String)session.getAttribute("id");
  %>

	<%
	for(int i=0; i<likeList.size(); i++){
		likeDTO = likeList.get(i);
		%>
  
    <div class="likeListBody">
         <div class="allCheck"> 전체선택
         <input type="checkbox" name="all" class="allCheckbox"
         style="margin-left: 1vw;"></div> 
          <div class="likeList">
            <img class="likeListPhoto"
             src="campimg/<%=likeDTO.getCamp_img() %>"/>
            <div class="likeListTitle"><%=likeDTO.getCamp_name()%></div>
            <div class="likeListAdd">
            <%=likeDTO.getCamp_addr()%>
            </div>
            <div class="likeListTag">
              <%=likeDTO.getFacility()%>
            </div>
            <div class="likeListTell"><%=likeDTO.getTel()%></div>
            
              <div class="likeTitle">
              <img src="myLikeList/hearts.png" class=hearts>
			  <div class="likeNum"><%=likeDTO.getCamp_like_id()%></div></div>
          
          
          <%
		
	}
		
	%>



                    
			  <div class="eachCheck">
             <input type="checkbox" name="each" class="eachCheckbox"></div> 
          

            <input type="button" value="삭제" class="bannerRsButton" >  
          </div>
          
    </div>
  </body>
</html>
