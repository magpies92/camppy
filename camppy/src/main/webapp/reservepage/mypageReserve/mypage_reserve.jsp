<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="camppy.reserve.dao.MyReserveDAO" %>
<%@ page import="camppy.reserve.dao.MyReserveDTO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./mypage_reserve.css" />

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
        background: none;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
  	<%
  		String memberId = null;
  	if(session.getAttribute("memberID") != null){
  	   memberId = (String) session.getAttribute("memberID");
  	}
  	int pageNumber = 1;
  	if(request.getParameter("pageNumber") != null){
  		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  	}
  	
  	
  	%>
  
    <button class="mypage-reserve">
      <div class="mypage-reserve__section-total">
        <div class="mypage-reserve__reserve-list">
          <div class="mypage-reserve__list">
            <img
              class="mypage-reserve__item-link-btn-pre-00-png"
              src="item-link-btn-pre-00-png.png"
            /><img
              class="mypage-reserve__item-link-btn-pre-01-png"
              src="item-link-btn-pre-01-png.png"
            />
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-1" >1</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-2">2</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-3">3</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-4">4</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-5">5</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-6">6</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-7">7</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-8">8</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-9">9</div>
            </div>
            <div class="mypage-reserve__item">
              <div class="mypage-reserve__link-10">10</div>
            </div>
            
  
            <img
              class="mypage-reserve__item-link-btn-next-01-png"
              src="item-link-btn-next-01-png.png"
            /><img
              class="mypage-reserve__item-link-btn-next-00-png"
              src="item-link-btn-next-00-png.png"
            />
          </div>
          
          <script>
 		 // 각 예약 항목 요소를 선택합니다
		  const reserveItems = document.querySelectorAll('.mypage-reserve__item');

		  // 각 예약 항목 요소에 클릭 이벤트 리스너를 추가합니다
		  reserveItems.forEach((item, index) => {
 		   item.addEventListener('click', () => {
   		   // 예약 항목 클릭 시 해당 페이지로 이동합니다
  		    const pageToNavigate = index + 1;  // 예약 항목 번호와 페이지 번호는 1:1 대응
   		   const nextPageURL = `page${pageToNavigate}.html`;
  		    window.location.href = nextPageURL;
 		   });
		  });
		</script>
          
          <script>
 		 // 각 예약 항목 요소를 선택
  		const reserveItems = document.querySelectorAll('.mypage-reserve__item-link-btn-next-00-png');

 		 // 각 예약 항목 요소에 클릭 이벤트 리스너를 추가
 		 reserveItems.forEach((item, index) => {
 		   item.addEventListener('click', () => {
  		    // 예약 항목 클릭 시 10페이지를 뛰어넘어 이동
 		     const nextPageIndex = index + 10;  // 10페이지를 뛰어넘도록 인덱스 조정
  		    const nextPageURL = `nextPage.html?page=${nextPageIndex}`;
 		     window.location.href = nextPageURL;
 		   });
		  });
		</script>
		
                
              
           
          <div class="mypage-reserve__frame-392">
            <div class="mypage-reserve__">예약번호</div>
            <div class="mypage-reserve__">예약일</div>
            <div class="mypage-reserve__">숙소명</div>
            <div class="mypage-reserve__2">체크인 / 체크아웃</div>
            <div class="mypage-reserve__">예약상태</div>
            
            
            
            
          </div>
            <span>
            <%
            
            MyReserveDAO myReserveDAO = new MyReserveDAO();
        	ArrayList<MyReserveDTO> list = myReserveDAO.getList(pageNumber);
        	for(int i = 0; i < list.size(); i++){
        	
            %> 
                       
              <tr>
              <td><%= list.get(i).getRes_id() %></td>
              <td><%= list.get(i).getRes_time().substring(0, 11) + list.get(i).getCheckin_date().substring(11, 13) + "시" + list.get(i).getCheckin_date().substring(14, 16) + "분" %></td>
              <td><%= list.get(i).getCamp_id() %></td>
              <td><%= list.get(i).getCheckin_date() %></td>
              <td><%= list.get(i).getCheckout_date() %></td>
              <td><%= list.get(i).getRes_status() %></td>              
              </tr><br>
                
                <% 
                }	
                %>
                </span>
        </div>
      </div>
    </button>   
  </body>
</html>
