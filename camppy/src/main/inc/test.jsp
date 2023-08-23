<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.ftco-navbar-light.scrolled .nav-link {
    padding-top: 0 !important;
    padding-bottom: 0 !important;
    color: #000000 !important;
}
.nav-link {
  white-space: nowrap;
}

.navbar-brand {
	font-size: 4rem;
	font-family: "Poppins", Arial, sans-serif;
}

#login-size {
	font-size: 2rem;
}

.profile-options {
  display: none;
  position: absolute;
  right: 1px;
  background-color: #fff;
  padding: 0.8%;
  white-space: nowrap;
  border-radius: 10%;
}

 .profile-options {
   display: none;
 }
 .profile-options.show {
   display: block;
   margin-right: 1.5rem;
 }
  
#profile{
	cursor: pointer;
}



</style>




<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="./Main.park">Park<span>IT</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
			</button>
			
			

			<div class="collapse navbar-collapse" id="ftco-nav">
  <ul class="navbar-nav ml-auto">
    <li class="nav-item active"><a href="./Main.park" class="nav-link">Home</a></li>
    <li class="nav-item"><a href="./Introduction.park" class="nav-link">이용안내</a></li>
    <li class="nav-item"><a href="./Reservation.res" class="nav-link">예약하기</a></li>
     <li class="nav-item dropdown">
      <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
      <ul class="dropdown-menu">
        <li class="nav-item"><a href="./noticeList.no" class="nav-link2">공지사항</a></li>
        <li class="nav-item"><a href="./FaqList.fa" class="nav-link2">자주 묻는 질문</a></li>
        <li class="nav-item"><a href="./QuestionList.qu" class="nav-link2">1:1 문의</a></li>
      </ul>
    </li>
    <li class="nav-item">
	    <c:if test="${id.equals('admin')}">
	    	<a href="./adminMain.ad" class="nav-link">관리자 공간</a>
	 	</c:if>
 	</li>
  </ul>
</div>
		</div>

<c:if test="${empty id }">
  <div class="login-form" >
  
    <div class="form-group">
      <a class="navbar-brand" id="login-size" href="./MemberLogin.me">Park<span>IT 로그인</span></a>
    </div>
    <div class="join-membership">
      <a href="./MemberFindID.me" class="nav-link" style="color: white; padding: 0;">아이디/비밀번호 찾기</a>
    </div>
    <div class="join-membership">
      <a href="./MemberJoin.me" class="nav-link" style="color: white; padding: 0;">회원가입</a>
    </div>
    
  </div>
  
</c:if>
<c:if test="${not empty id }">

  <div class="login-form">
  
    <div class="nav-link" id="profile-link">
     <h6> <img src="img/free-icon-user-7718888.png" width="60" height="60" id="profile"> </h6>
    </div>
    
  <input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me'">	
  <ul class="profile-options" id="profile-options">
    <li><a href="./MemberUpdate.me">내 정보 보기 및 수정</a></li>
    <li><a href="./MemberPasswordUpdate.me">비밀번호 변경</a></li>
    <c:if test="${!id.equals('admin')}">
    <li><a href="./ResList.me">예약내역 보기</a></li>
    </c:if>
    <li><a href="./MemberDelete.me">회원 탈퇴</a></li>
  </ul>
  </div>
  
</c:if>

<script>
  var profileLink = document.getElementById('profile-link');
  var profileOptions = document.getElementById('profile-options');

  profileLink.addEventListener('click', function() {
    profileOptions.classList.toggle('show');
  });
</script>

	</nav>
	<!-- END  nav -->

	<div class="hero-wrap ftco-degree-bg"
		style="height: 40rem;"
		data-stellar-background-ratio="0.5" >
		<video muted autoplay loop style="width: 100%; height: 100%; object-fit: fill; z-index: -1; position: absolute;">
        <source src="./images/parkpark.mp4" type="video/mp4">
        </video>
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
				<div class="col-lg-8 ftco-animate">
					<div class="text w-100 text-center mb-md-5 pb-md-5" style="z-index: 10;">
						<p style="font-size: 18px;">주차걱정 없이 편안하게
							주차하자!</p>
						<h1 class="mb-4" style="white-space: nowrap;">빠르고 쉽게 예약하고 주차하자<br>
							Park<span style="display: inline; color: #28A745; ">IT</span></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>