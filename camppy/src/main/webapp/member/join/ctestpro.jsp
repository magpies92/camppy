<%@page import="camppy.member.MemberDAO"%>
<%@page import="camppy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

//로그인 버튼에 이벤트 리스너 추가
document.getElementById("loginButton").addEventListener("click", function(event) {
    // 폼 데이터 가져오기
    var formData = new FormData(document.getElementById("loginForm"));
    // 서버에 로그인 요청 전송
    fetch("ctestpro.jsp", {
        method: "POST",
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        // 로그인 성공 여부 확인
        if (data === "success") {
            // 로그인 성공 시 메인 페이지로 이동
            window.location.href = "main.jsp";
        } else {
            // 로그인 실패 시 오류 메시지 표시
            document.getElementById("errorMessage").textContent = "로그인에 실패했습니다.";
        }
    });
    // 폼 제출 방지
    event.preventDefault();
});


window.onload = function() {
    var phoneInput = document.getElementById("memberSingPhone");
    phoneInput.addEventListener("keypress", function(event) {
        if (event.which < 48 || event.which > 57) {
            event.preventDefault();
        }
    });
}
function validateForm() {
	var id = document.getElementById("memberSignId");
    if (id.value.length < 5 || id.value.length > 20) {
        alert("아이디는 5~20자 사이여야 합니다.");
        id.style.borderColor = "red";
        return false;
    } else {
        id.style.borderColor = "green";
    }
    var pass = document.getElementById("memberSingPw").value;
    if (pass.length < 5 || pass.length > 20) {
        alert("비밀번호는 5~20자 사이여야 합니다.");
        return false;
    }
    var passConfirm = document.getElementById("memberSingCh").value;
    if (pass !== passConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    var nickname = document.getElementById("memberSingNick").value;
    if (nickname.length < 5 || nickname.length > 20) {
        alert("닉네임은 5~20자 사이여야 합니다.");
        return false;
    }
    var name = document.getElementById("memberSingName").value;
    if (name.length < 5 || name.length > 20) {
        alert("이름은 5~20자 사이여야 합니다.");
        return false;
    }
    var phone = document.getElementById("memberSingPhone").value;
    if (phone.length != 11) {
        alert("휴대전화 번호는 11자여야 합니다.");
        return false;
    }
    alert('가입이 완료되었습니다!');
}


</script>  
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDTO memberDTO2 = new MemberDTO();

memberDTO2.setId(id);
memberDTO2.setPass(pass);

MemberDAO memberDAO = new MemberDAO();

MemberDTO memberDTO = memberDAO.userCheck(memberDTO2);
if(memberDTO != null){
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
} else {
%>
	<script type="text/javascript">
		alert("틀림");
		location.href="ctest.jsp";
	</script>
	<%
}
%>
</body>
</html>