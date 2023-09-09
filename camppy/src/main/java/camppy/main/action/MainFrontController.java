package camppy.main.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



//import camppy.main.action.CampRegDTO;
import camppy.main.action.PageDTO;
import camppy.main.action.CampRegService;


public class MainFrontController extends HttpServlet {
	RequestDispatcher dispatcher =null;
	CampRegService campregService = null;
	
	
	
// HttpServlet 처리담당자 -> 자동으로 doGet, doPost 호출
	// -> 재정의 해서 사용
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFrontController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFrontController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFrontController doProcess()");
		//가상주소 뽑아오기
		String sPath=request.getServletPath();
		System.out.println("뽑은 가상주소 :  " + sPath);
		
		if(sPath.equals("/main.camp")) {
			HttpSession session = request.getSession();
			// "id" 세션값 가져오기=> String id 변수 저장
			String id = (String)session.getAttribute("id");
			// member/login.jsp 주소변경 없이 이동
			dispatcher 
		    = request.getRequestDispatcher("camppymain/mainpage/mainpage.jsp");
		dispatcher.forward(request, response);
		}
		/*
		 * if(sPath.equals("/search.camp")) { HttpSession session =
		 * request.getSession(); // "id" 세션값 가져오기=> String id 변수 저장 String id =
		 * (String)session.getAttribute("id"); // member/login.jsp 주소변경 없이 이동 dispatcher
		 * = request.getRequestDispatcher("camppymain/searchpage/searchpage.jsp");
		 * dispatcher.forward(request, response); }
		 */
		
		if(sPath.equals("/list.camp")) {
			System.out.println("뽑은 가상주소 비교 : /list.bo");
			// 한페이지에서 보여지는 글개수 설정
			int pageSize=6;
			// 페이지번호 
			String pageNum=request.getParameter("pageNum");
			// 페이지번호가 없으면 1페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// 페이지 번호를 => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			// CampRegService 객체생성
			campregService = new CampRegService();
// List<CampRegDTO> campregList = getCampRegList(); 메서드 호출
			List<CampRegDTO> campregList=campregService.getCampRegList(pageDTO);
			
			// 게시판 전체 글 개수 구하기 
			int count = campregService.getCampRegCount();
			// 한화면에 보여줄 페이지개수 설정
			int pageBlock = 10;
			// 시작하는 페이지번호
			// currentPage  pageBlock  => startPage
			//   1~10(0~9)      10     =>  (0~9)/10*10+1=>0*10+1=> 0+1=> 1 
			//   11~20(10~19)   10     =>  (10~19)/10*10+1=>1*10+1=>10+1=>11
			//   21~30(20~29)   10     =>  (20~29)/10*10+1=>2*10+1=>20+1=>21
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는페이지번호
			//  startPage   pageBlock => endPage
			//     1            10    =>   10
			//     11           10    =>   20
			//     21           10    =>   30
			int endPage=startPage+pageBlock-1;
			// 계산한값 endPage 10 => 전체페이지 2
			// 전체페이지 구하기
			// 글개수 50  한화면에 보여줄글개수 10 => 페이지수 5 + 0
			// 글개수 57  한화면에 보여줄글개수 10 => 페이지수 5 + 1
			int pageCount = count / pageSize + (count % pageSize==0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			// request에 "campregList",campregList 저장
			request.setAttribute("campregList", campregList);
			request.setAttribute("pageDTO", pageDTO);
			
			// 주소변경없이 이동 center/notice.jsp
			dispatcher 
		    = request.getRequestDispatcher("camppymain/searchpage/camppage.jsp");
		dispatcher.forward(request, response);
		}//
		
		
		
		if(sPath.equals("/listSearch.camp")) {
			
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			//request 검색어 뽑아오기
			
			String sido = request.getParameter("sido");
			if (sido.equals("시/도 선택"))
			{
				response.sendRedirect("list.camp");
			}
			else {
			String gungu = request.getParameter("gungu");
			String keywordsearch = request.getParameter("keywordsearch");
			System.out.println(sido);
			System.out.println(gungu);
			System.out.println(keywordsearch);
			// 한페이지에서 보여지는 글개수 설정
						int pageSize=10;
						// 페이지번호 
						String pageNum=request.getParameter("pageNum");
						// 페이지번호가 없으면 1페이지 설정
						if(pageNum == null) {
							pageNum = "1";
						}
						// 페이지 번호를 => 정수형 변경
						int currentPage = Integer.parseInt(pageNum);
						PageDTO pageDTO = new PageDTO();
						pageDTO.setPageSize(pageSize);
						pageDTO.setPageNum(pageNum);
						pageDTO.setCurrentPage(currentPage);
						//검색어 저장
						pageDTO.setSearch(keywordsearch);
						String sido2 =  sido.substring(0,2); //abc
						pageDTO.setSido(sido2);
						pageDTO.setGungu(gungu);
						// CampRegService 객체생성
						campregService = new CampRegService();
			// List<CampRegDTO> campregList = getCampRegList(); 메서드 호출
						List<CampRegDTO> campregList=campregService.getCampRegListSearch(pageDTO);
						// 게시판 전체 글 개수 구하기 
						int count = campregService.getCampRegCountSearch(pageDTO);
						// 한화면에 보여줄 페이지개수 설정
						int pageBlock = 10;
						// 시작하는 페이지번호
						// currentPage  pageBlock  => startPage
						//   1~10(0~9)      10     =>  (0~9)/10*10+1=>0*10+1=> 0+1=> 1 
						//   11~20(10~19)   10     =>  (10~19)/10*10+1=>1*10+1=>10+1=>11
						//   21~30(20~29)   10     =>  (20~29)/10*10+1=>2*10+1=>20+1=>21
						int startPage=(currentPage-1)/pageBlock*pageBlock+1;
						// 끝나는페이지번호
						//  startPage   pageBlock => endPage
						//     1            10    =>   10
						//     11           10    =>   20
						//     21           10    =>   30
						int endPage=startPage+pageBlock-1;
						// 계산한값 endPage 10 => 전체페이지 2
						// 전체페이지 구하기
						// 글개수 50  한화면에 보여줄글개수 10 => 페이지수 5 + 0
						// 글개수 57  한화면에 보여줄글개수 10 => 페이지수 5 + 1
						int pageCount = count / pageSize + (count % pageSize==0?0:1);
						if(endPage > pageCount) {
							endPage = pageCount;
						}//pageDTO 저장
						pageDTO.setCount(count);
						pageDTO.setPageBlock(pageBlock);
						pageDTO.setStartPage(startPage);
						pageDTO.setEndPage(endPage);
						pageDTO.setPageCount(pageCount);
						// request에 "campregList",campregList 저장
						request.setAttribute("campregList", campregList);
						request.setAttribute("pageDTO", pageDTO);
					
			
			dispatcher 
		    = request.getRequestDispatcher("camppymain/searchpage/searchpage.jsp");
		dispatcher.forward(request, response);
		}//
		}
	
	
		
	}//doProcess()

}