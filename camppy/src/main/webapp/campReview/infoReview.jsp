<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.mbeans.DataSourceUserDatabaseMBean"%>
<%@page import="com.camppy.dto.DetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="campReview/infoReview.css" />
	<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	appearance: none;
	background: none;
}

.starImg {
	position: relative;
	display: inline-block;
}
</style>

<title>Document</title>
</head>
<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/inc/top.jsp"></jsp:include>
	<!-- 헤더들어가는 곳 -->

	<%
	DetailDTO detailDTO = (DetailDTO) request.getAttribute("detailDTO");
	String camp_addr = detailDTO.getCamp_addr();
	String id=(String)session.getAttribute("id");
	// int camp_id=(int)session.getAttribute("camp_id");
	 int camp_id = 2;
	%>

	<!-- 페이지 전체 -->
	<div class="campInfo">

		<!-- 캠핑장명 및 예약하기 버튼 있는 헤더 -->
		<div class="bannerSectionTotal">
			<!--헤더 배경 이미지 들어감-->
			<img class="bannerBg" src="campInfo/banner-bg.png" />
			<!-- 캠핑장명 및 한 줄 소개 -->
			<div class="campName"><%=detailDTO.getCamp_name()%>
				<div class="campReport"><%=detailDTO.getShort_intro()%></div>
			</div>
			<!-- 예약하기 버튼 -->
			<input type="button" value="예약하기" class="bannerRsButton"
				onclick="location.href='reserve_detail.re?campId=<%=detailDTO.getCamp_id()%>'">
		</div>
		<!-- 캠핑장명 및 예약하기 버튼 있는 헤더 닫기 -->

		<!-- 캠핑장 정보 -->
		<div class="infoSectionBody">

			<!-- 캠핑장 정보 상단 전체 -->
			<div class="mainInfo">
				<!--캠핑장 메인 사진-->
				<div class="campPhotoBox">
					<input type="radio" name="slide" id="slide1" checked> <input
						type="radio" name="slide" id="slide2"> <input type="radio"
						name="slide" id="slide3"> <input type="radio" name="slide"
						id="slide4">

					<div class="slideWrap">
						<ul class="slideList" style="list-style-type: none;">
							<li><a> <label for=slide3 class="left"> <img
										src="campInfo/left-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; right: 78px;"></label>
									<img src="campimg/<%=detailDTO.getCamp_img()%>"> <label
									for="slide2" class="right"> <img
										src="campInfo/right-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; left: 78px;"></label>
							</a></li>
							<li><a> <label for=slide1 class="left"> <img
										src="campInfo/left-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; right: 78px;"></label>
									<img src="campimg/<%=detailDTO.getPic1()%>"> <label
									for="slide3" class="right"> <img
										src="campInfo/right-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; left: 78px;"></label>
							</a></li>
							<li><a> <label for=slide2 class="left"> <img
										src="campInfo/left-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; right: 78px;"></label>
									<img src="campimg/<%=detailDTO.getPic2()%>"> <label
									for="slide1" class="right"> <img
										src="campInfo/right-arrow.png"
										style="width: 50px; opacity: 50%; position: relative; left: 78px;"></label>
							</a>
						</ul>

					</div>

				</div>
				<!--캠핑장 메인 정보 프레임-->
				<div class="infoList">
					<!--캠핑장 주소-->
					<div class="infoAddress">
						주소
						<div class="campAddress"><%=detailDTO.getCamp_addr()%></div>
					</div>
					<!--캠핑장 번호-->
					<div class="infoTell">
						문의처
						<div class="tellNum"><%=detailDTO.getTel()%></div>
					</div>
					<!--캠핑장 환경-->
					<div class="infoSet">
						캠핑장 환경
						<div class="setBg"><%=detailDTO.getEnvironment()%></div>
					</div>
					<!--캠핑장 유형-->
					<div class="infoType">
						캠핑장 유형
						<div class="type"><%=detailDTO.getCamp_type()%></div>
					</div>
					<!--운영 기간-->
					<div class="runSeason">
						운영기간
						<div class="season"><%=detailDTO.getSeason()%></div>
					</div>
					<!--운영일-->
					<div class="runDay">
						운영일
						<div class="week"><%=detailDTO.getRuntime()%></div>
					</div>
					<!--홈페이지 연결-->
					<div class="homePage">
						홈페이지 <a href="<%=detailDTO.getHomepage()%>" class="pageLink">바로
							가기</a>
					</div>
					<!--주변이용시설-->
					<div class="useSpace">
						주변이용시설
						<div class="space"><%=detailDTO.getFacility()%></div>
					</div>
					<!--별점-->
					<div class="rating">
						별점
						<div class="star">
							<%-- <%=detailDTO.getReview_rate() %> --%>
							<%-- <%
        float review_rate=Float.parseFloat(detailDTO.getReview_rate());
        int r1=(int)review_rate;
        
        for(int i=1; i<=5; i++){
        	if(i<=r1){
        		%>
        		
        		
             	<img src="campInfo/star-on.png"> 
             	<%
        	}else{
        		if(review_rate>0/* review_rate*10.0%10==0 */){
        			%>
        			<img src="campInfo/star-half.png"> 
        			<% 
                }else{
                	
                } 
        		%>
        		
        		<img src="campInfo/star-off.png">
        		<%
        	}
         	
         }

        %> --%>

							<%
							float rating = Float.parseFloat(detailDTO.getRating());
							int integerPart = (int) rating;
							int fractionalPart = Math.round((rating - integerPart) * 10);

							for (int i = 1; i <= 5; i++) {
								if (i <= integerPart) {
							%>
							<img src="campInfo/star-on.png" class="starImg">
							<%
							} else {
							if (fractionalPart > 0) {
							%>
							<img src="campInfo/star-half.png" class="starImg">
							<%
							fractionalPart = 0;
							} else {
							%>
							<img src="campInfo/star-off.png" class="starImg">
							<%
							}
							}
							}
							%>
							<!-- </div> -->
						</div>
						<span class="unLikeButton" style="display: inline;"
							onclick="likeButton(this)">찜하기</span> <span class="likeButton"
							style="display: none;" onclick="unLikeButton(this)">찜하기</span>
					</div>
				</div>
				<!--캠핑장 메인 정보 닫기-->
			</div>
			<!-- 캠핑장 정보 상단 전체 닫기-->

			<!-- 카테고리 링크 -->
			<div class="infoLinkList">
				<!-- <div class="infoLink1">캠핑장소개</div> -->
				<input type="button" value="캠핑장소개" class="infoLink2"
					onclick="location.href='detail.de?campId=<%=detailDTO.getCamp_id()%>'">

				<!--    <div class="infoLink1">위치/주변정보</div> -->
				<input type="button" value="위치/주변정보" class="infoLink2"
					onclick="location.href='position.de?campId=<%=detailDTO.getCamp_id()%>'">
					
				<div class="infoLink1">캠핑후기</div>
				
			</div>

			<!-- 찾아오시는 길 -->
			<div class="campReview">
				<!-- 타이틀 -->
				<%

				%>
				<div class="reviewTop">
					<div class="reviewCount">이용후기</div>
					<input type="button" value="글쓰기" onclick="popupInsert();"
						class="buttonInsert" />
				</div>
				<%
				int pageSize = 5; // 한 페이지에 표시될 레코드 수
				int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

				Class.forName("com.mysql.cj.jdbc.Driver");
				String dbUrl = "jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul";
				String dbUser = "c1d2304t3";
				String dbPass = "1234";
				Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

				String countSql = "SELECT COUNT(*) AS total FROM review WHERE camp_id = ?";
				PreparedStatement countStmt = con.prepareStatement(countSql);
				countStmt.setInt(1, camp_id);
				ResultSet countRs = countStmt.executeQuery();
				countRs.next();
				int totalRecords = countRs.getInt("total");
				int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

				String sql = "SELECT * FROM review WHERE camp_id = ? ORDER BY review_id DESC LIMIT ?, ?";
				int startRecord = (currentPage - 1) * pageSize;

				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, camp_id);
				pstmt.setInt(2, startRecord);
				pstmt.setInt(3, pageSize);

				ResultSet rs = pstmt.executeQuery();
				%>

				<%
				//5단계 : while  행 접근 -> 데이터 있으면 true 
				//-> 글번호 글쓴이 제목 조회수 글쓴날짜 출력 
				while (rs.next()) {
				%>
				<div class="campinfoRow"
					data-review-id="<%=rs.getInt("review_id")%>">
					<div class="campinfoStar">
						<div class="campinfoStar1">
							★
							<%=rs.getFloat("rating")%></div>
					</div>
					<div class="reviewNum">
						<div class="reviewNum1"><%=rs.getInt("review_id")%></div>
					</div>
					<div class="reviewName">
						<div class="reviewName1"><%=rs.getString("created_by")%></div>
					</div>
					<div class="reviewDate">
						<div class="reviewDate1"><%=rs.getTimestamp("created_date")%></div>
					</div>
					<button type="button" onclick="updateRow(this);"
						class="buttonUpdate"
						<%if (id == null || id.isEmpty() || !id.equals(rs.getString("created_by"))) {%>
						style="display: none;" <%}%>>
						<div class="update">수정</div>
					</button>
					<button type="button" onclick="deleteRow(this);" class="buttonDel"
						<%if (id == null || id.isEmpty() || !id.equals(rs.getString("created_by"))) {%>
						style="display: none;" <%}%>>
						<div class="del">삭제</div>
					</button>
					<div class="reviewContents">
						<div class="reviewContents1"><%=rs.getString("content").replace("\n", "<br>")%></div>
						<textarea class="editContent" style="display: none;"></textarea>
						<button class="buttonSave" style="display: none;"
							onclick="saveContent(this);">저장</button>
						<br>
						<button class="buttonCancel" style="display: none;"
							onclick="cancelEdit(this);">취소</button>
					</div>
				</div>
				<%
				}
				%>

				<!-- 페이징 링크 출력 부분 -->
				<div class="pagination">
					<%
					if (currentPage > 1) {
					%>
					<a href="?page=<%=currentPage - 1%>">이전</a>
					<%
					}

					for (int i = 1; i <= totalPages; i++) {
					%>
					<a href="?page=<%=i%>"
						class="<%=(i == currentPage) ? "active" : ""%>"><%=i%></a>
					<%
					}

					if (currentPage < totalPages) {
					%>
					<a href="?page=<%=currentPage + 1%>">다음</a>
					<%
					}
					%>

</div>
</div>
</div>
</div>

				
					

					<!-- 푸터들어가는 곳 -->
					<jsp:include page="/inc/bottom.jsp"></jsp:include>
					<!-- 푸터들어가는 곳 -->
					
					<script type="text/javascript">
					function likeButton(e){ // e -> (this)의 정보를 여기로 전달하겠다
					 	var i = $(".unLikeButton").index(e); // 같은 클래스 내 index 값을 가져옴
					 	var id = "<%=id%>"; <%-- String으로 들고 와서 "" 붙여야 됨 --%>
						    if(id=="null"){ <%-- String으로 들고 와서 "" 붙여야 됨 --%>
					    	alert("로그인 후 사용할 수 있습니다");
					    	location.href="${sPath}/camppy/login.me";
					    	
					 		}else{
					 			alert("찜하기 목록으로 가시겠습니까?");
					 			//document.getElementsByClassName('unLikeButton')[i].style.display = "none"; // 즐겨찾기 취소 버튼 비활성화
					 			document.getElementsByClassName('likeButton')[i].style.display = "inline"; // 즐겨찾기 추가 버튼 활성화
					 		}
					 
					    }
						// 즐겨찾기 해제
						function unLikeButton(e) {
							var i = $(".likeButton").index(e); // 같은 클래스 내 index 값을 가져옴
							document.getElementsByClassName('unLikeButton')[i].style.display = "inline"; // 즐겨찾기 취소 버튼 비활성화
							document.getElementsByClassName('likeButton')[i].style.display = "none"; // 즐겨찾기 추가 버튼 활성화
						}
						
						 function popupInsert() {
					            var url = "review/insert/reviewInsert.jsp";
					            var name = "reviewInsert";
					            var option = "width = 710, height = 730, top= 100, left= 500";
					            window.open(url, name, option);
					        }

						 function updateRow(button) {
					            var row = button.closest(".campinfoRow");
					            var contentsElement = row.querySelector(".reviewContents1");
					            var editContent = row.querySelector(".editContent");
					            var buttonSave = row.querySelector(".buttonSave");
					            var buttonCancel = row.querySelector(".buttonCancel"); // 수정된 부분

					            contentsElement.style.display = "none";
					            editContent.style.display = "block";
					            buttonSave.style.display = "block";
					            buttonCancel.style.display = "block"; // 수정된 부분

					            // 현재 내용을 텍스트 입력 필드에 설정
					            editContent.value = contentsElement.textContent;

					            // 수정 버튼 비활성화
					            button.disabled = true;

					            editContent.focus();

					            var maxLength = 130;

					            editContent.addEventListener("input", function() {
					                var currentLength = editContent.value.length;

					                if (currentLength > maxLength) {
					                    // 최대 글자 수를 초과한 경우 현재 입력을 최대 글자 수로 자르기
					                    editContent.value = editContent.value.slice(0, maxLength);
					                }
					            });
					        }

					        function saveContent(button) {
					            var row = button.closest(".campinfoRow");
					            var reviewId = row.querySelector(".reviewNum1").textContent;
					            var contentsElement = row.querySelector(".reviewContents1");
					            var editContent = row.querySelector(".editContent");
					            var buttonSave = row.querySelector(".buttonSave");
					            var buttonCancel = row.querySelector(".buttonCancel"); // 수정된 부분

					            // 수정한 내용을 가져와서 서버로 전송
					            var updatedContent = editContent.value;

					            if (updatedContent.trim() === "") {
					                alert("내용을 입력하세요.");
					                return;
					            }

					            $.ajax({
					                url : "../update/updateReviewList.jsp",
					                method : "POST",
					                data : {
					                    review_id : reviewId,
					                    updated_content : updatedContent
					                },
					                success : function(response) {
					                    if (response.trim() === "success") {
					                        // 수정 성공 시 UI 업데이트
					                        contentsElement.textContent = updatedContent;
					                        contentsElement.style.display = "block";
					                        editContent.style.display = "none";
					                        buttonSave.style.display = "none";
					                        buttonCancel.style.display = "none"; // 저장 성공 시 취소 버튼도 숨김

					                        // 수정 버튼 활성화
					                        row.querySelector(".buttonUpdate").disabled = false;
					                    } else {
					                        alert("수정 실패");
					                    }
					                },
					                error : function() {
					                    alert("오류 발생");
					                }
					            });
					        }

					        function cancelEdit(button) {
					            var row = button.closest(".campinfoRow");
					            var contentsElement = row.querySelector(".reviewContents1");
					            var editContent = row.querySelector(".editContent");
					            var buttonSave = row.querySelector(".buttonSave");
					            var buttonCancel = row.querySelector(".buttonCancel");

					            if (contentsElement && editContent && buttonSave && buttonCancel) {
					                contentsElement.style.display = "block";
					                editContent.style.display = "none";
					                buttonSave.style.display = "none";
					                buttonCancel.style.display = "none";

					                // 수정 버튼 활성화
					                row.querySelector(".buttonUpdate").disabled = false;
					            } else {
					                console.error("One or more elements not found.");
					            }
					        }

					        function deleteRow(button) {
					            var row = button.closest(".campinfoRow");
					            var reviewId = row.querySelector(".reviewNum1").textContent;

					            console.log("Review ID:", reviewId);

					            if (confirm("정말로 삭제하시겠습니까?")) {
					                $.ajax({
					                    url : "review/del/deleteReview.jsp",
					                    method : "POST",
					                    data : {
					                        review_id : reviewId
					                    },
					                    success : function(response) {
					                        if (response.trim() === "success") {
					                            row.remove();
					                            location.reload();
					                        } else {
					                            alert("삭제 실패");
					                        }
					                    },
					                    error : function() {
					                        alert("오류 발생");
					                    }
					                });
					            }
					        }
					</script>
</body>
</html>
