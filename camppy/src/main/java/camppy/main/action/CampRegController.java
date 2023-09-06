package camppy.main.action;

import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import camppy.main.action.CampRegDTO;
import camppy.main.action.CampRegService;

//import .domain.CampRegDTO;
//import .domain.PageDTO;
//import.service.CampRegService;

public class CampRegController extends HttpServlet {

	CampRegService campregService = null;
	RequestDispatcher dispatcher = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CampRegController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CampRegController doPost()");
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CampRegController doProcess()");
		// 가상주소 뽑아오기
		String sPath = request.getServletPath();
		System.out.println("뽑아온 가상주소:" + sPath);

		// 주소 비교 => 실제페이지 매핑
//		http://localhost:8080/FunWeb/list.bo
//		http://localhost:8080/FunWeb/list.bo?pageNum=2

		
		/*
		 * if(sPath.equals("/camp.campreg")) {
		 * System.out.println("뽑은 가상주소 비교 : /list.bo");
		 * 
		 * // List<BoardDTO> boardList = getBoardList(); 메서드 호출 campregService = new
		 * CampRegService(); int campid=0;
		 * 
		 * List<CampRegDTO> campregList=campregService.getCampRegList(campid);
		 * 
		 * // 주소변경없이 이동 center/notice.jsp dispatcher =
		 * request.getRequestDispatcher("center/notice.jsp");
		 * dispatcher.forward(request, response); }//
		 */		
		

		// 첨부파일
//		http://localhost:8080/FunWeb/fwrite.bo
		if (sPath.equals("/campreg.campreg")) {
			// 주소변경없이 이동 center/fwrite.jsp
			HttpSession session = request.getSession();
			// 세션에서 로그인 정보 가져오기
			String id=(String)session.getAttribute("id");
			if(id == null){
				 response.setContentType("text/html; charset=utf-8");
			        PrintWriter w = response.getWriter();
			        w.write("<script>alert('관리자 계정으로 로그인 먼저 해주세요');history.go(-1);</script>");
			        w.flush();
			        w.close();			        
		       
		    } 
			else if(id.equals("admin")){
				dispatcher = request.getRequestDispatcher("camppymain/campreg/campreg.jsp");
				dispatcher.forward(request, response);
			}
			else {
				response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('관리자 계정이 아닙니다');history.go(-1);</script>");
		        w.flush();
		        w.close();
				
			}
			
			}
		
		

		
		if(sPath.equals("/campregPro.campreg")) {
		 //System.out.println("뽑은 가상주소 비교 : /fwritePro.bo"); // CampRegService 객체생성
		  campregService = new CampRegService(); // 리턴할형없음 finsertCampReg(request) 메서드 호출
		  campregService.finsertCampReg(request); // list.bo 주소 변경 되면서 이동
		response.sendRedirect("main.camp"); }
		 

	}// doProcess()

}// 클래스
