<%@page import="camppy.reserve.dao.ReserveDetailDTO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@page import="camppy.main.action.CampRegDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet"> -->
<!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet"> -->
<!-- <link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png"> -->
<meta charset="UTF-8">
<title>Camppy</title>

<!-- <link rel="stylesheet" href="css/insert.css" type="text/css" > -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
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
      
div {
	display: block;
}

.heading-section {
	font-size: 45px;
	color: #393939;
	line-height: 1.5;
	font-weight: 400;
	font-family: 'NanumSquareNeo';
	/*     font-family: "Poppins", Arial, sans-serif; */
	font-weight: bold;
	text-align: center;
	margin: 25px;
}

#wrap {
	width: 700px;
	margin: 30px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	font-family: 'NanumSquareNeo';
}

legend {
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.menu-section {
	font-size: 25px;
	color: #393939;
	/*     line-height: 1.5; */
	/*     font-weight: 400; */
	/*     font-family: "Poppins", Arial, sans-serif; */
	font-family: 'NanumSquareNeo';
	font-weight: bold;
	text-align: center;
	margin: 25px;
}

fieldset {
	border: none;
	margin: 0;
	padding: 0;
}

input[type="text"], input[type="password"], input[type="date"], input[type="nick"],
	select {
	display: block;
	width: 100%;
	margin-bottom: 5px;
	padding: 10px;
	font-size: 1rem;
	border-radius: 5px;
	border: 1px solid #99b19c;
}

select option {
	font-size: 1rem;
}

input[type="button"], input[type="submit"], input[type="reset"] {
	display: inline-block;
	padding: 10px;
	font-size: 1rem;
	color: #fff;
	background-color: #99b19c;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	float: right;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	background-color: #113000;
}

label {
	display: block;
	font-size: 1rem;
	margin-bottom: 5px;
	font-weight: bold;
}

.clear {
	clear: both;
}

#error-msg {
	color: red;
	font-weight: bold;
	margin-top: 10px;
}

.divresult {
	margin-bottom: 10px;
	font-size: 1rem;
	font-weight: bold;
}

.address-wrap {
	display: flex;
	flex-wrap: wrap;
}

#sample4_postcode {
	width: 150px;
	margin-right: 10px;
}

#sample4_roadAddress {
	flex: 1;
	margin-right: 10px;
}

#sample4_detailAddress {
	flex: 1;
}

 	   
       table {
    /* width: 400px;
    height: 200px; */
    margin-left: auto;
    margin-right: auto;
  }





@import url('https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css');

/* section calendar */
@font-face {
    font-family: 'NanumSquareR';
    font-style: normal;
    font-weight: 400;
    src: local('Nanum Square Regular'),
        local('NanumSquareR'),
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    --blue: #3f99ff;
}

body {
    font-family: NanumSquareR;
}

a {
    text-decoration-line: none;
    text-decoration: none;
    color: #000;
}

ol,
ul {
    list-style: none;
}


/* Calendar ---------------------------------------------------- */
.calendar-wrap {
    max-width: 1175px;
    padding-top: 50px;
    margin: 0 auto;
    font-family: "NanumSquareR";
    display: flex;
    gap: 2%;
    margin-bottom: 20px;
}

.calendar-wrap>div {}

.calendar-middle-wrap {
    background: #fafbfa;
    width: 34%;
    padding: 40px 32px;
    padding-bottom: 100px;
}

.checkInOutInfo {
    width: 30%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fafbfa;
    position: relative;
}

.calendar-wrap .cal_nav {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    font-size: 48px;
    line-height: 78px;
}

.calendar-wrap .cal_nav .year-month {
    width: 300px;
    text-align: center;
    line-height: 1;
    font-size: 20px;
}

.calendar-wrap .cal_nav .nav {
    display: flex;
    border: 1px solid #333333;
    border-radius: 5px;
}

.calendar-wrap .cal_nav .go-prev,
.calendar-wrap .cal_nav .go-next {
    display: block;
    width: 50px;
    font-size: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.calendar-wrap .cal_nav .go-prev::before,
.calendar-wrap .cal_nav .go-next::before {
    content: "";
    display: block;
    width: 10px;
    height: 10px;
    border: 1px solid #000;
    border-width: 3px 3px 0 0;
    transition: border 0.1s;
}

.calendar-wrap .cal_nav .go-prev::before {
    transform: rotate(-135deg);
}

.calendar-wrap .cal_nav .go-next::before {
    transform: rotate(45deg);
}

.calendar-wrap .cal_wrap {
    padding-top: 40px;
    position: relative;
    margin: 0 auto;
}

.calendar-wrap .cal_wrap::after {
    top: 368px;
}

.calendar-wrap .cal_wrap .dates {
    display: flex;
    flex-flow: wrap;
    height: 290px;
}

.calendar-wrap .cal_wrap .days {
    display: flex;
    margin-bottom: 20px;
}

.calendar-wrap .cal_wrap .day {
    display: flex;
    justify-content: center;
    align-items: center;
    width: calc(100% / 7);
    text-align: left;
    color: #2d1d0b;
    font-size: 13px;
    font-weight: bold;
    text-align: center;
    border-radius: 5px;
    cursor: pointer;
    position: relative;
}

.calendar-wrap .cal_wrap .day span {
    z-index: 5;
}

.calendar-wrap .cal_wrap .day .check_in_out_p {
    position: absolute;
    left: 50%;
    top: 47px;
    transform: translateX(-50%);
    font-size: 12px;
    width: 100%;
    color: var(--blue);
}

.calendar-wrap .cal_wrap .checkIn span {
    color: #fff;
}

.calendar-wrap .cal_wrap .checkOut span {
    color: #fff;
}

.calendar-wrap .cal_wrap .selectDay {
    position: relative;
}

.calendar-wrap .cal_wrap .selectDay::before {
    content: '';
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 100%;
    height: 30px;
    background: #c3defc;
    opacity: 0.5;
    z-index: 1;
}

.calendar-wrap .cal_wrap .checkIn.selectDay::before {
    left: 50%;
    width: 50%;
}

.calendar-wrap .cal_wrap .checkOut.selectDay::before {
    width: 50%;
}

.calendar-wrap .cal_wrap .checkIn::after,
.calendar-wrap .cal_wrap .checkOut::after,
.calendar-wrap .cal_wrap .checkIn::after {
    content: '';
    background: var(--blue);
    position: absolute;
    left: 50%;
    top: 50%;
    width: 30px;
    height: 30px;
    transform: translate(-50%, -50%);
    border-radius: 50%;
    z-index: 2;
}

.calendar-wrap .cal_wrap .day:nth-child(7n -6) {
    color: #ed2a61;
}

.calendar-wrap .cal_wrap .day:nth-child(7n) {
    color: #3c6ffa;
}

.calendar-wrap .cal_wrap .day.disable {
    color: #ddd;
}

.current.today {
    background: rgb(242 242 242);
}

.checkInOutInfo>div {
    text-align: center;
    display: flex;
    flex-direction: column;
}

.checkInOutInfo p {
    font-size: 24px;
    color: #494949;
    line-height: 1.7;
    text-align: center;
}

.checkInOutInfo p.space {
    margin-bottom: 10px;
}

.checkInOutInfo p:nth-child(1) {
    width: 100%;
}

.checkInOutInfo p:nth-child(3) {
    width: 100%;
}

.checkInOutInfo p span {
    display: block;
    font-size: 16px;
    color: #a1a1a1;
}


@media screen and (max-width :1200px) {
    .calendar-wrap {
        flex-wrap: wrap;
        padding: 2%;
    }

    .calendar-middle-wrap {
        width: 49%;
        padding: 40px 7%;
    }

    .checkInOutInfo {
        width: 100%;
        margin-top: 2%;
        padding: 50px;
    }

    .checkInOutInfo>div {
        flex-direction: row;
        width: 100%;
    }

    .checkInOutInfo p:nth-child(1) {
        width: 50%;
    }

    .checkInOutInfo p:nth-child(2) {
        width: 50px;
    }

    .checkInOutInfo p:nth-child(3) {
        width: 50%;
    }
}

@media screen and (max-width:768px) {
    .calendar-middle-wrap {
        width: 100%;
        padding: 40px 10%;
    }

    .calendar-middle-wrap:first-of-type {
        margin-bottom: 2%;
    }

    .checkInOutInfo {
        padding: 20px;
    }

    .checkInOutInfo>div {
        flex-direction: column;
    }

    .checkInOutInfo p:nth-child(1) {
        width: 100%;
    }

    .checkInOutInfo p:nth-child(2) {
        width: 100%;
    }

    .checkInOutInfo p:nth-child(3) {
        width: 100%;
    }

    .checkInOutInfo p.space {
        margin-bottom: 0;
    }

    .checkInOutInfo p span {
        display: inline-block;
        margin-right: 10px;
    }

    .checkInOutInfo p label {
        font-size: 20px;
    }
}



</style>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>



	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/inc/top.jsp"/>
	<!-- 헤더파일들어가는 곳 -->
	<%
	// String id=(String)session.getAttribute("id"); 
	// CampRegDTO cdto = (CampRegDTO)request.getAttribute("cdto");
	// MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");
	%>
	<article>
		
<%
MemberDTO memberDTO =(MemberDTO)request.getAttribute("memberDTO");
CampRegDTO campRegDTO = (CampRegDTO)request.getAttribute("campRegDTO");
%>


		<div id="wrap">
			<form action="reserve_detailPro.re" name="reservedetailform"
				id="reserve_detail" method="post">
				<fieldset>
					<h3 class="menu-section">예약자 정보확인</h3>
					<div class="ap-services">
					<input type="hidden" name="member_id" value="<%=memberDTO.getMember_id() %>"><br>
					<input type="hidden" name="id" value="<%=memberDTO.getId() %>"><br>
						예약자명 : <input type="text" readonly name="name" value="<%=memberDTO.getName()%>"><br>
						전화번호 : <input type="text" readonly name="phone" value="<%=memberDTO.getPhone()%>"><br>
						닉네임 : <input type="text" readonly name="nick" value="<%=memberDTO.getNick()%>">
					</div>

					<h3 class="menu-section">예약정보 입력</h3>
					<div class="ap-services">
					<input type="hidden" name="camp_id" value="<%=campRegDTO.getCampid() %>"><br>
					<input type="hidden" name="camp_price" value="<%=campRegDTO.getCampprice() %>"><br>
						펜션이름 : <input type="text" readonly name="camp_name" value="<%=campRegDTO.getCampname()%>"><br>
						
					
					<div class="ui-grid-b">
        
        
        <div class="ui-block-c">
        </div>
    </div>
    <div class="ui-grid-b">
    <div class="ui-block-a">
            <label>입실일</label>
        </div>
        <div class="ui-block-a">
            <input type="text" id="datepicker_start" name="checkin_date" readonly="readonly">
        </div>
        <div class="ui-block-b">
            <label>퇴실일</label>
        </div>
        <div class="ui-block-b">
            <input type="text" id="datepicker_end" name="checkout_date" readonly="readonly">
        </div>
        <!-- <div class="ui-block-c">
            <button id="date_search">날짜검색</button>
        </div> -->
    </div>
							
						숙박료 : <input type="text" readonly id ="price" class="price" name="price" value="<%=campRegDTO.getCampprice() %>원 /1박"><br>
						
						<!-- 입실일 : <input type="date"  id="checkin_date" name="checkin_date"><br>
 						퇴실일 : <input type="date"  name="checkout_date" id="checkout_date"> -->
						<br> 인원수 : <select
							name="guest">
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
						</select><br>
					</div>
					<input type="submit" value="예약하기" >
					<input type="hidden" name="id" value="textbox"> <input type="hidden"
						name="campid" value="textbox">
				</fieldset>
			</form>
			
		</div>
		
		

	</article>
	
<script>
$(function() {
    fn_default_datepicker();
});
    
function fn_default_datepicker()
{
var start = $( "#datepicker_start" ).datepicker({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true //콤보박스에서 년 선택 가능
    ,changeMonth: true //콤보박스에서 월 선택 가능                
    //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
    //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
    //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "3M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
});
    
var end = $( "#datepicker_end" ).datepicker({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true //콤보박스에서 년 선택 가능
    ,changeMonth: true //콤보박스에서 월 선택 가능                
    //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
    //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
    //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "3M+1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
       ,defaultDate: "+1w"
  });

//초기값을 오늘 날짜로 설정
$('#datepicker_start').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
$('#datepicker_end').datepicker('setDate', 'today+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}

function getDate( element ) {
var date;
var dateFormat = "yy-mm-dd";
try {
  date = $.datepicker.parseDate( dateFormat, element.value );
} catch( error ) {
  date = null;
}
return date;
}
 
    
$(document).ready(function(){
	
    
    $("#datepicker_start").on("click",function(){
        
    });
    
 
     $("#datepicker_start").on("change",function(e){
    	 var addoneday = addOneDay(getDate(e.target));
         var end = $( "#datepicker_end" ).datepicker( "option", "minDate",addoneday);
     });
     
     $("#datepicker_end").on("change",function(e){
    	 
    	 document.getElementById("price").value =start+"원 /1박";
    	 const oldDate = new Date($("#datepicker_start").val());
    	 const newDate = new Date($("#datepicker_end").val());
    	 let diff = Math.abs(newDate.getTime() - oldDate.getTime());
    	 diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
    	 alert(diff);
     });
     
    /*  $("#date_search").on("click",function(){
         var start = $("#datepicker_start").val();
         var end = $("#datepicker_end").val();
     });  */   
});

function addOneDay(date = new Date()) {
	  date.setDate(date.getDate() + 1);

	  return date;
	}
 
</script>


</body>
</html>
