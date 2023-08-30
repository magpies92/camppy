<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 등록</title>
</head>
<body>
	<h2>캠핑장 정보 등록</h2>

	<form action="campregPro.campreg" method="post" enctype="multipart/form-data">
		캠핑장 이름 : <input type="text" name="campname"><br>
		한줄 소개 : <input type="text" name="shortintro"><br>
		태그 : <input type="text" name="camptag"><br>
		캠핑장 대표 사진 : <input type="file" name="campimg"><br>
		주소 : <input type="text" name="campaddr"><br>
		문의처 : <input type="text" name="tel"><br>
		캠핑장 환경 : <input type="text" name="environment"><br>
		캠핑장 유형 : <input type="text" name="camptype"><br>
		운영기간 : <input type="text" name="season"><br>
		운영일 : <input type="text" name="runtime"><br>
		홈페이지 : <input type="text" name="homepage"><br>
		주변이용가능시설 : <input type="text" name="facility"><br>
		소개 : <input type="text" name="intro"><br>
		은행 계좌 : <input type="text" name="bankaccount"><br>
		캠핑장 가격 : <input type="text" name="campprice"><br>
		캠핑장 사진들 : <input type="file" name="camppic"><br>
		<input type="submit" value="submit">
	</form>
</body>
</html>