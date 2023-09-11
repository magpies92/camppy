package camppy.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camppy.dto.DetailDTO;

import camppy.main.action.CampRegDTO;
import camppy.main.action.CampRegService;
import camppy.main.action.PageDTO;
import camppy.member.MemberDTO;
import camppy.member.MemberService;
import camppy.mypage.MypageService;

public class MypageController extends HttpServlet {

	RequestDispatcher dispatcher = null;
	MypageService mypageService = null;

	// HttpServlet 상속 => Servlet 처리담당자 => 동작
	// 자동으로 doGet(), doPost() 호출
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MypageController doGet()");
		// doProcess() 호출
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MypageController doPost()");
		// doProcess() 호출
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MypageController doProcess()");
		// 가상주소 => 가상 주소 비교 => 실 주소 연결(이동)
		String sPath = request.getServletPath();
		System.out.println("가상주소 뽑아오기 : " + sPath);

//			http://localhost:8080/Camppy/mypage.my
		if (sPath.equals("/mypage.my")) {
			// 주소변경 없이 => board/write.jsp 이동
			dispatcher = request.getRequestDispatcher("/inc/mypageInc.jsp");
			dispatcher.forward(request, response);
		} // if
//			if(sPath.equals("/reviewInsertPro.rv")) {
//				request.setCharacterEncoding("utf-8");
//				// BoardService 객체생성
//				reviewService = new ReviewService();
//				// insertBoard(request) 메서드 호출
//				reviewService.insertReview(request);
//				// 주소 변경없이 list.bo 이동 
//				dispatcher 
//			    = request.getRequestDispatcher("review/camp.reveiwlist/campReviewList.jsp");
//				dispatcher.forward(request, response);
//			}

		if (sPath.equals("/likeList.my")) {
			System.out.println("가상주소 비교: /likeList.my");

			// 한 페이지에서 보여지는 글 개수 설정
			int pageSize = 5;

			// 페이지 번호
			String pageNum = request.getParameter("pageNum");

			// 페이지 번호가 없으면 1페이지 설정
			if (pageNum == null) {
				pageNum = "1";
			}

			// 페이지 번호 -> 정수형 변경
			int currentPage = Integer.parseInt(pageNum);

			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setMemberid(id);

			// BoardService 객체 생성
			mypageService = new MypageService();
			// List<LikeDTO> likeList = getLikeList(); 메서드 호출
			List<LikeDTO> likeList = mypageService.getLikeList(pageDTO);

			// DetailDTO = getDetail(request) 메서드 호출
			//mypageService.getHeartsCount(request);

			// 게시판 전체 글 개수 구하기
			int count = mypageService.getLikeCount(pageDTO);

			// 한 화면에 보여 줄 페이지 개수 설정
			int pageBlock = 10;

			// 시작하는 페이지 번호
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;

			// 끝나는 페이지 번호
			int endPage = startPage + pageBlock - 1;

			// 계산한 값
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			if (endPage > pageCount) { // endPage > 전체 페이지
				endPage = pageCount; // endPage = 전체 페이지;
			}

			// pageDTO 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);

			// request에 "likeList", likeList 저장
			request.setAttribute("likeList", likeList);
			request.setAttribute("pageDTO", pageDTO);
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);

			// 주소 변경 없이 이동 (myLikeList/myLikeList.jsp)
			dispatcher = request.getRequestDispatcher("myLikeList/myLikeList.jsp");
			dispatcher.forward(request, response);
		} // likeList.my

		
		  if(sPath.equals("/insertLike.my")) {
		  System.out.println("주소 비교: /insertLike.my");
		  
		  request.setCharacterEncoding("utf-8");
		  
		  //MypageService 객체 생성 
		  mypageService = new MypageService();
		  
		  //insertLike(request) 메서드 호출 
		  mypageService.insertLike(request);
		  
		 // 주소 변경되면서 likeList.my 이동 
		  //response.sendRedirect("likeList.my");
		  }
		  
		  if(sPath.equals("/deleteLike.my")) {
		  System.out.println("주소 비교: /deleteLike.my");
		  
		  request.setCharacterEncoding("utf-8");
		  
		  //MypageService 객체 생성
		  mypageService = new MypageService();
		  
		  //insertLike(request) 메서드 호출
		  mypageService.deleteLike(request);
		  
		  //주소 변경되면서 likeList.my 이동 response.sendRedirect("likeList.my");
		  }
		 

	}// doProcess
}// MypageController