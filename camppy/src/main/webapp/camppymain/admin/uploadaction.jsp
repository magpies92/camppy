<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String id = request.getParameter("id");
	out.print(id); // request.getParameter() 사용 불가  */
	
	String name = "";
	String lineintro = "";
	String tag = "";
	String address = "";
	String campenv = "";
	String camptype = "";
	String opertime = "";
	String operday = "";
	String hompage = "";
	String avafas = "";
	String file1 = "";
	String file2 = "";
	String orgfile1 = "";
	String orgfile2 = "";
	
	String uploadPath = request.getRealPath("/camppymain/admin/campimg"); // upload는 폴더명 / 폴더의 경로를 구해옴
	out.print(uploadPath);

	try {
		MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
				request, 
				uploadPath, // 파일을 저장할 디렉토리 지정
				1024*1024*3, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
				"utf-8", // 인코딩 방식 지정
				
				new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
		);
		name = multi.getParameter("name");
		lineintro = multi.getParameter("lineintro");
		tag = multi.getParameter("tag");
		address = multi.getParameter("address");
		campenv = multi.getParameter("campenv");
		camptype = multi.getParameter("camptype");
		opertime = multi.getParameter("opertime");
		operday = multi.getParameter("operday");
		hompage = multi.getParameter("hompage");
		avafas = multi.getParameter("avafas");

		/* form의 <input type="file"> name값을 모를 경우 name을 구할때 사용
		Enumeration files=multi.getFileNames(); // form의 type="file" name을 구함
		String file1 =(String)files.nextElement(); // 첫번째 type="file"의 name 저장
		String file2 =(String)files.nextElement(); // 두번째 type="file"의 name 저장
		*/

		file1 = multi.getFilesystemName("file1"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
		orgfile1 = multi.getOriginalFileName("file1"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)

		file2 = multi.getFilesystemName("file2");
		orgfile2 = multi.getOriginalFileName("file2");
		
	} catch (Exception e) {
		e.getStackTrace();
	} // 업로드 종료
%>

<!-- 업로드 된 파일을 확인하는 폼으로 이동 / 위에서 구한 데이터를 hidden 방식으로 전송 -->
<html>
<body>
	
</body>
</html>