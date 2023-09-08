package camppy.commu.action;

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

import camppy.commu.db.CommuDTO;
import camppy.commu.db.PageDTO;

public class CommuController extends HttpServlet {

	CommuService commuService = null;
	RequestDispatcher dispatcher = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MainFrontController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MainFrontController doPost()");
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MainFrontController doProcess()");
		// 가상주소 뽑아오기
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 :  " + sPath);

		//글쓰기 
		if (sPath.equals("/commuInsert.commu")) {
			dispatcher = request.getRequestDispatcher("commuInsert/commuInsert.jsp");
			dispatcher.forward(request, response);
		}
        //글쓰기
		if (sPath.equals("/commuInsertPro.commu")) {
			System.out.println("/commuInsertPro.commu");
            
			commuService = new CommuService();

			commuService.commuInsert(request);

			response.sendRedirect("commuContentsList.commu");
		}
		

		
		if (sPath.equals("/commuContentsList.commu")) {
			System.out.println("뽑은 가상주소 비교:/commuList.commu");
			// 한페이지에서 보여지는 글개수 설정
			int pageSize = 3;

			// 페이지 번호
			String pageNum = request.getParameter("pageNum");

			// 페이지번호가 없으면 1페이지 설정
			if (pageNum == null) {
				pageNum = "1";
			}

			// 페이지 번호를 => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			commuService = new CommuService();
			List<CommuDTO> commuRankList = commuService.getCommuRank();
			List<CommuDTO> commuList = commuService.getCommuList(pageDTO);
			
			//게시판 전체 글 개수 구하기
			int count = commuService.getCommuCount();
			//한 화면에 보여줄 페이지개수 설정
			int pageBlock = 10;
			
			//시작 페이지번호
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			
			int endPage=startPage+pageBlock-1;
			
			int pageCount =count /pageSize + (count % pageSize==0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndpage(endPage);
			pageDTO.setPageCount(pageCount);
			
			request.setAttribute("commuList", commuList);
			request.setAttribute("pageDTO", pageDTO);
			request.setAttribute("commuRankList", commuRankList);
			
			dispatcher = request.getRequestDispatcher("commuContentsList/commuContentsList.jsp");
			dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/commuListSearch.commu")) {
			System.out.println("뽑은 가상 주소 비교: /commuListsearch.commu");
			
			//request 한글처리 
		    request.setCharacterEncoding("utf-8");
		    
		    //request 검색어 뽑아오기 
		    String search = request.getParameter("search");
		    String searchType = request.getParameter("searchtype");
		    System.out.println(search);
		    //현재 보이는 페이지 설정 
		    int pageSize = 3;
		    
		    //페이지 번호를 => 정수형 변경 
		    String pageNum = request.getParameter("pageNum");
		    
		    //페이지 없으면 1페이지 설정 
		    if(pageNum == null) {
		    	pageNum = "1";
		    }
		    
		    //페이지 번호를 => 정수형 변경
		    int currentPage = Integer.parseInt(pageNum);
		    
		    PageDTO pageDTO = new PageDTO();
		    pageDTO.setPageSize(pageSize);
		    pageDTO.setPageNum(pageNum);
		    pageDTO.setCurrentPage(currentPage);
		    
		    //검색어 저장
		    pageDTO.setSearch(search);
		    pageDTO.setSearchType(searchType);
		    
		    
		    commuService = new CommuService();
		    
		    List<CommuDTO> commuList = commuService.getCommuListSearch(pageDTO);
		    
		    //게시판 전체 글 개수 구하기 
		    int count = commuService.getCommuCountSearch(pageDTO);
		   
		    //한 화면에서 보여줄 페이지 개수 설정 
		    int pageBlock = 3;
		    
		    //시작 페이지번호 
		    int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		    
		    //끝나는 페이지 번
		    int endPage = startPage+pageBlock-1;
		    
		    int pageCount = count /pageSize + (count % pageSize == 0?0:1);
		    if(endPage > pageCount) {
		    	endPage = pageCount;
		    }
		 
		    //pageDTO 저장
		    pageDTO.setCount(count);
		    pageDTO.setPageBlock(pageBlock);
		    pageDTO.setStartPage(startPage);
		    pageDTO.setEndpage(endPage);
		    pageDTO.setPageCount(pageCount);
		
		    request.setAttribute("commuList",commuList);
		    request.setAttribute("pageDTO",pageDTO);
		  
		    dispatcher = request.getRequestDispatcher("commuContentsList/commuContentsList.jsp");
			dispatcher.forward(request, response);
		}//listSearch
		
		if(sPath.equals("/commudelete.commu")) {
			System.out.println("/commudelet.commu");
			
			commuService = new CommuService();
			
			commuService.commudelete(request);
			
			response.sendRedirect("commuContentsList.commu");
			
		}
		
		

	}// doProcess()

}