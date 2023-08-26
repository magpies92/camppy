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
	<form action="campupload.camp" method="post" enctype="multipart/form-data">
		캠핑장 이름 : <input type="text" name="name"><br>
		한줄 소개 : <input type="text" name="lineintro"><br>
		태그 : <input type="text" name="tag"><br>
		캠핑장 대표 사진 : <input type="file" name="file1"><br>
		주소 : <input type="text" name="address"><br>
		캠핑장 환경 : <input type="text" name="campenv"><br>
		캠핑장 유형 : <input type="text" name="camptype"><br>
		운영기간 : <input type="text" name="opertime"><br>
		운영일 : <input type="text" name="operday"><br>
		홈페이지 : <input type="text" name="homepage"><br>
		주변이용가능시설 : <input type="text" name="avafas"><br>
		캠핑장 사진들 : <input type="file" name="file2"><br>
		<input type="submit" value="submit">
	</form>
</body>
</html>