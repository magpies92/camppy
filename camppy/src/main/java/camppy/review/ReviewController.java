package camppy.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camppy.review.ReviewDTO;
import camppy.review.ReviewService;

public class ReviewController extends HttpServlet{
	
	RequestDispatcher dispatcher = null; 
	ReviewService reviewService = null;
	
	// HttpServlet 상속 => Servlet 처리담당자 => 동작
	// 자동으로 doGet(), doPost() 호출
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController doGet()");
		// doProcess() 호출
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController doPost()");
		// doProcess() 호출
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController doProcess()");
		// 가상주소 => 가상 주소 비교 => 실 주소 연결(이동)
		String sPath = request.getServletPath();
		System.out.println("가상주소 뽑아오기 : " +  sPath);
		
//		http://localhost:8080/Camppy/reviewInsert.rv
		if(sPath.equals("/reviewInsert.rv")) {
			// 주소변경 없이 => board/write.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("review/insert/reviewInsert.jsp");
			dispatcher.forward(request, response);
		}//if
		if(sPath.equals("/reviewInsertPro.rv")) {
			request.setCharacterEncoding("utf-8");
			// BoardService 객체생성
			reviewService = new ReviewService();
			// insertBoard(request) 메서드 호출
			reviewService.insertReview(request);
			// 주소 변경없이 list.bo 이동 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('작성이 완료되었습니다')");
			out.println("setTimeout(function() {\r\n"
					+ "				    opener.location.reload(); //부모창 리프레쉬\r\n"
					+ "				    self.close(); //현재창 닫기\r\n"
					+ "				    });");
			out.println("</script>");
		}//if
		if(sPath.equals("/campReviewList.rv")) {
			// BoardService 객체생성
			reviewService =new ReviewService();
			// List<BoardDTO> boardList  = getBoardList()
			List<ReviewDTO> reviewList=reviewService.getReviewList();
			
			// request 데이터(boardList) 담아서
			request.setAttribute("reviewList", reviewList);
			
			dispatcher 
		    = request.getRequestDispatcher("review/camp.reviewlist/campReviewList.jsp");
			dispatcher.forward(request, response);
		}
		if(sPath.equals("/mypageReviewList.rv")) {
			// BoardService 객체생성
			reviewService =new ReviewService();
			// List<BoardDTO> boardList  = getBoardList()
			List<ReviewDTO> reviewList=reviewService.getReviewList();
			
			// request 데이터(boardList) 담아서
			request.setAttribute("reviewList", reviewList);
			
			dispatcher 
		    = request.getRequestDispatcher("review/mypagelist/mypageReviewList.jsp");
			dispatcher.forward(request, response);
		}//
//		// http://localhost:8080/MVCProject/content.bo?num=1
//		if(sPath.equals("/content.bo")) {
//			// BoardService 객체생성
//			reviewService =new ReviewService();
//			// 조회수 증가 메서드 호출
//			reviewService.updateReadcount(request);
//			// BoardDTO boardDTO  = getBoard(request) 메서드 호출
//			BoardDTO boardDTO = boardService.getBoard(request);
//			// request 데이터(boardDTO) 담아서
//			request.setAttribute("boardDTO", boardDTO);
//			// board/content.jsp
//			dispatcher 
//		    = request.getRequestDispatcher("board/content.jsp");
//			dispatcher.forward(request, response);
//		}// 컨텐츠페이지 따로 없으니 마찬가지
		
////		http://localhost:8080/MVCProject/update.bo?num=1
//		if(sPath.equals("/reviewUpdate.rv")) {
//			// BoardService 객체생성
//			reviewService =new ReviewService();
//			// BoardDTO boardDTO  = getBoard(request) 메서드 호출
//			ReviewDTO reviewDTO=reviewService.getReview(request);
//			// request 데이터(boardDTO) 담아서
//			request.setAttribute("reviewDTO", reviewDTO);
//			// 수정하면 board/update.jsp 이동
//			dispatcher 
//		    = request.getRequestDispatcher("board/update.jsp");
//			dispatcher.forward(request, response);
//		}// 수정페이지 없음
//		
		
//		if(sPath.equals("/updatePro.bo")) {
//			System.out.println("주소 비교 : /updatePro.bo");
//			// BoardService 객체생성
//			reviewService = new ReviewService();
//			// updateBoard(request) 호출
//			reviewService.updateReview(request);
//			// => request 한글처리, request 값 가져오기, BoardDTO 값저장
//			//    BoardDAO 객체생성 updateBoard(boardDTO) 호출
//			
//			// => BoardDAO updateBoard() 1,2 디비연결, 
//			//    3 sql구문 update set subject,content수정 where num = 
//			//    4 실행
//			// 주소 변경되면서 list.bo 이동 
//			response.sendRedirect("list.bo");
//		} 수정페이지 없음
		
////		http://localhost:8080/MVCProject/delete.bo?num=1		
//		if(sPath.equals("/delete.bo")) {
//			// BoardService 객체생성
//			reviewService = new ReviewService();
//			//  deleteBoard(request) 호출
//			reviewService.deleteReview(request);
////  BoardService => int num = request 파라미터값 가져오기
////		 => BoardDAO 객체생성 , deleteBoard(num) 호출
//			//  BoardDAO => deleteBoard() 메서드 정의
//			//             1,2 디비연결, 3sql delete 4실행
//			// 주소 변경되면서 list.bo 이동 
//			response.sendRedirect("list.bo");
//		} ajax사용
		
	}//doProcess()
	

}//클래스 
