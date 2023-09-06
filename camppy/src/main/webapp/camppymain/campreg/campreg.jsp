<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.Normalizer"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
       function selectAll(selectAll)  {
    	  const checkboxes1 
    	       = document.getElementsByName('camptag1');
    	  const checkboxes2 
    	  = document.getElementsByName('camptag2');
    	  const checkboxes3 
    	  = document.getElementsByName('camptag3');
    	  const checkboxes4 
    	  = document.getElementsByName('camptag4');
    	  const checkboxes5
    	  = document.getElementsByName('camptag5');
    	  const checkboxes6
    	  = document.getElementsByName('camptag6');
    	  const checkboxes7
    	  = document.getElementsByName('camptag7');
    	  
    	  checkboxes1.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	  checkboxes2.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	   checkboxes3.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	   checkboxes4.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	   checkboxes5.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	   checkboxes6.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	   checkboxes7.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	}
</script>

<meta charset="UTF-8">
<title>캠핑장 등록</title>


</head>
<body>

	<h2>캠핑장 정보 등록</h2>

	<form action="campregPro.campreg" method="post" enctype="multipart/form-data">
		캠핑장 이름 : <input type="text" name="campname" required><br>
		한줄 소개 : <input type="text" name="shortintro" required><br>
		<h3>캠핑장 태그를 선택해주세요</h3>
		<input type="checkbox"
       name="camptagall" 
       value="selectall"
       onclick='selectAll(this)'/> <b>전체 선택</b>
<br>
<input type="checkbox"
       name="camptag1" 
       value="O"/> 전기

<input type="checkbox" 
       name="camptag2" 
       value='O' /> 와이파이

<input type="checkbox" 
       name="camptag3" 
       value="O" /> 장작판매
      
<input type="checkbox" 
       name="camptag4" 
       value="O" /> 온수
      
       <input type="checkbox" 
       name="camptag5" 
       value="O" /> 물놀이장
     
       <input type="checkbox" 
       name="camptag6" 
       value="O" /> 놀이터
      
       <input type="checkbox" 
       name="camptag7" 
       value="O" /> 운동시설
       <br>
       
		
		캠핑장 대표 사진 : <input type="file" name="campimg" required><br>
		주소 : <input type="text" id="sample4_postcode" placeholder="우편번호" name="postAddr1"  readonly required>
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="postAddr2" size="60"  readonly required><br>
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60" required>
<span id="guide" style="color:#999;display:none" ></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="postAddr3" size="60"><br>
<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60" required>
<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" required><br>

		문의처 : <input type="text" name="tel" required><br>
		캠핑장 환경 : <input type="text" name="environment" required><br>
		캠핑장 유형 : <input type="text" name="camptype" required><br>
		운영기간 : <input type="text" name="season" required><br>
		운영일 : <input type="text" name="runtime" required><br>
		홈페이지 : <input type="text" name="homepage" required><br>
		주변이용가능시설 : <input type="text" name="facility" required><br>
		소개 : <input type="text" name="intro" required><br>
		<h3>캠핑장 사진들(최대 5개)</h3>
<input type="button" value="사진 추가" onclick="javascript:addInputBox();">  <input type="button" value="추가한 사진 삭제" onclick="javascript:subtractInputBox();"><br>
<table id="dynamic_table" border="1">
</table>
		은행명 : <input type="text" name="bankname" required><br>
		계좌번호 : <input type="text" name="bankaccount" required><br>
		캠핑장 가격 : <input type="text" name="campprice" required><br>


<input type="submit" value="캠핑장 정보 등록" onclick="if(!confirm('정말로 등록 하시겠습니까??')){return false;}" />
	
	
<br>
<div id="map" style="width:400px;height:400px;"></div>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05f313ffd7b2e16a198f2cdd6635f723&libraries=services"></script>	
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
           

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
     
            document.getElementById("sample4_engAddress").value = data.addressEnglish;
            
            var dosigungu = data.roadAddress;
            var doo = dosigungu.substring(0, dosigungu.indexOf(' '));               // 결과 : 'HTML'
            var sigungu = dosigungu.substring(dosigungu.indexOf(' ')+1, dosigungu.indexOf(' ', dosigungu.indexOf(' ')+1));
            // 결과 : 'CSS'
            document.getElementById('doo').value = doo;
            document.getElementById('sigungu').value = sigungu;
                   
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            document.getElementById("sample4_detailAddress").focus(); 
            
         // 주소로 좌표를 검색합니다
            geocoder.addressSearch(data.roadAddress, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    document.getElementById('mapx').value = result[0].x;
                    document.getElementById('mapy').value = result[0].y;

                    // 결과값으로 받은 위치를 마커로 표시합니다
                   

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                   /*  var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                    });
                    infowindow.open(map, marker); */

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });    
        }
    }).open();
}   

</script>

<input type="text" id="doo" placeholder="도"  size="60" name="doo" readonly><br>
<input type="text" id="sigungu" placeholder="시군구"  size="60" name="sigungu" readonly><br>
<input type="text" id="mapx" placeholder="X좌표"  name="mapx" size="60" readonly><br>
<input type="text" id="mapy" placeholder="Y좌표"  name="mapy" size="60" readonly><br>
<input type="text" id="rowscount" placeholder="rowscount"  name="rowscount" size="60" readonly><br>
</form>

<script type="text/javascript">
 var count = 1;
 var addCount;
 
//행추가
function addInputBox() {
	if(count<=5){
 for(var i=1; i<=count; i++) {
  if(!document.getElementsByName("camppic"+i)) {
   addCount = i;
   break;
  }
  else addCount = count;
 }
 var table = document.getElementById("dynamic_table");
 var newRow = table.insertRow();
 var newCell = newRow.insertCell();
 var addStr = "<td width=140><input type=file name=camppic"+addCount+" size=40></td></tr>";

 newCell.innerHTML = addStr;
 count++;
	}
	else
		{ alert("더 이상 추가 할 수 없습니다.");}
	document.getElementById('rowscount').value = count-1;
	
	
}

 
//행삭제
function subtractInputBox() {
 var table = document.getElementById("dynamic_table");
 //var max = document.gForm.checkList.length;
 //alert(max);
 var rows = dynamic_table.rows.length;
 
 document.getElementById('rowscount').value = "0";

 if(rows >= 1){	 	
	 for (var i=0; i<rows; i++) {		 
		    table.deleteRow(i);
		    i--;
		    count--;		    	  
		 }
	
	 
}
 else{
	    alert("삭제 할 사진이 없습니다");
	    
	   }
 
}
 
</script>





</body>
</html>