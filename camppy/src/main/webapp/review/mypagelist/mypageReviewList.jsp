<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=chrome" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./mypageReviewList.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
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

	<div class="mypageReviewList">
		<div class="reviewContents">
			<label class="selectAll"> <input type="checkbox"
				class="selectCheck" id="cboxAll"><b>전체선택</b>
			</label>
		</div>
		<div class="mypageReview1">
			<img class="reviewImg1" src="forest.png" />
			<div class="reviewInfo1">부산 오션뷰 펜션</div>
			<div class="reviewReply1">벌레가 심각하게 많습니다</div>
			<div class="reviewStar1">별점위치할자리</div>
			<input type="checkbox" class="reviewCheckbox1" name="cbox" />
		</div>
		<div class="mypageReview2">
			<img class="reviewImg1" src="forest.png" />
			<div class="reviewInfo2">부산 해돋이 글램핑</div>
			<div class="reviewReply2">좋은데 돈 값까진 못하는 듯</div>
			<div class="reviewStar2">별점위치할자리</div>
			<input type="checkbox" class="reviewCheckbox2" name="cbox" />
		</div>
		<button type="button" onclick="popupDel();" class="buttonDel">
			<div class="del">삭제</div>
		</button>
	</div>
	</div>
	<script>
		$(document).ready(function() {
			$(document).on("click", "input:checkbox[name=cbox]", function(e) {
				var chks = document.getElementsByName("cbox");
				var chksChecked = 0;

				for (var i = 0; i < chks.length; i++) {
					var cbox = chks[i];

					if (cbox.checked) {
						chksChecked++;
					}
				}
				if (chks.length == chksChecked) {
					$("#cboxAll").prop("checked", true);
				} else {
					$("#cboxAll").prop("checked", false);
				}
			});

			$("#cboxAll").on("click", function() {
				$("input:checkbox[name=cbox]").prop("checked", this.checked);
			});
		});

		function popupDel() {
			var url = "popupDel.jsp";
			var name = "popup test";
			var option = "width = 330, height = 110, location = center "
			window.open(url, name, option);
		}
	</script>
</body>
</html>