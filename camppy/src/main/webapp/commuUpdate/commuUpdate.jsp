<%@page import="camppy.commu.db.CommuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./commuUpdate/style.css" />

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
<title>commuUpdate</title>
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
	<div class="commu-update">

		<div class="section-body">

			<form action="commuUpdatePro.commu" method="post" name="title"
				class="group-2" enctype="multipart/form-data">

				<div class="body-contents">

					<div class="line-2"></div>
					<!-- 말머리  -->
					<select name="titleOption" class="rectangle-2">
						<option class="insert__">캠핑후기</option>
					</select> <img class="image-1" src="./commuUpdate/image-1.png" />

					<div class="rectangle-1"></div>

					<div class="line-1"></div>
					<%
					String id = (String) session.getAttribute("id");
					CommuDTO commuDTO = (CommuDTO) request.getAttribute("commudDTO");
					%>
					
					<input type="hidden" name="num" value="<%=commuDTO.getPost_id()%>">
					<input type="text" class="_2" value="<%=commuDTO.getTitle()%>"
						name="title" onfocus="clearDefaultText(this);"
						onblur="restoreDefaultText(this);">

					<textarea class="bb" name="context"><%=commuDTO.getContent()%></textarea>


					<label class="input-file-button" for="image-upload"> <img
						class="free-icon-image-8191595-1"
						src="./commuUpdate/free-icon-image-8191595-1.png" alt="이미지">

					</label> <input type="file" name="uploadFile" id="image-upload"
						style="display: none;">
				    <input type="hidden"
						name="oldfile" id="image-upload" value="<%=commuDTO.getImg_url()%>">

				</div>
				<div class="body-button">
					<div class="button-exit">
						<button type="button" id="exit"
							onclick="location.href='commuContentsList.commu'">
							<div class="_3">나가기</div>
						</button>
					</div>

					<div class="button-insert">
						<button type="submit" id="insert">
							<div class="_4">등록</div>
						</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>
