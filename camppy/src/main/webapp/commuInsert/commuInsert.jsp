<%@page import="camppy.commu.db.CommuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./commuInsert/style.css" />

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	appearance: none;
	background: none;
}
</style>
<title>commuInsert</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	// 제목 창 안에 클릭하면 텍스트 삭제
	function clearDefaultText(inputElement) {
		if (inputElement.value === inputElement.defaultValue) {
			inputElement.value = "";
		}
	}

	function restoreDefaultText(inputElement) {
		if (inputElement.value === "") {
			inputElement.value = inputElement.defaultValue;
		}
	}
</script>
<body>

	<div class="commu-insert">
		<div class="commu-insert__section-total">

			<div class="commu-insert__section-body">

				<div class="commu-insert__body-contents">

					<div class="commu-insert__line-2"></div>
					<!-- 말머리  -->
					<form action="commuInsertPro.commu" method="post" name=title
						class="commu-insert__group-2" enctype="multipart/form-data">

						<select name="titleOption" class="commu-insert__rectangle-2">
							<option class="commu-insert__" id="option1">캠핑후기</option>
						</select>

						<!-- 말머리 방향표   -->
						<img class="commu-insert__image-1" src="./commuInsert/image-1.png" />

						<!-- 제목/문의 전체  -->
						<div class="commu-insert__rectangle-1"></div>

						<!-- 제목/문의 사각형 밑에 라인 -->
						<div class="commu-insert__line-1"></div>


						<!-- 제목 입력  -->
						<input type="text" class="commu-insert__2" value="제목을 입력해 주세요."
							name="title" onfocus="clearDefaultText(this);"
							onblur="restoreDefaultText(this);">

						<!-- 설명   -->
						<textarea class="commu-insert__3" placeholder="내용을 입력해 주세요."
							name="content"></textarea>

						<label class="input-file-button" for="image-upload"> 
						<img
							class="commu-insert__free-icon-image-8191595-1"
							src="./commuInsert/free-icon-image-8191595-1.png" alt="이미지">
						</label> <input type="file" name="uploadFile" id="image-upload"
							style="display: none;">
						<!-- 						<div id="imgArea" class="fileUpload" class="commu-insert__free-icon-image-8191595-1" ></div> -->
						<!--  이미지 미리보기 위치 오류  -->



						<div class="commu-insert__body-button">
							<div class="commu-insert__button-exit">
								<button type="button" id="exit"
									onclick="location.href='commuContentsList.commu'">
									<div class="commu-insert__4">나가기</div>
								</button>
							</div>

							<div class="commu-insert__button-insert">
								<button type="submit" id="insert">
									<div class="commu-insert__5">등록</div>
								</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
</body>
</html>
