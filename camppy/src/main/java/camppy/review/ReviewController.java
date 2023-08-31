package camppy.review;

import java.io.IOException;
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
		
//		http://localhost:8080/MVCProject/write.bo
		if(sPath.equals("/reviewInsert.jsp")) {
			System.out.println("주소 비교 : /reviewInsert.jsp");
			// 주소변경 없이 => board/write.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("board/write.jsp");
			dispatcher.forward(request, response);
		}//if
		if(sPath.equals("/writePro.bo")) {
			System.out.println("주소 비교 : /writePro.bo");
			request.setCharacterEncoding("utf-8");
			// BoardService 객체생성
			boardService = new BoardService();
			// insertBoard(request) 메서드 호출
			boardService.insertBoard(request);
			// 주소 변경되면서 list.bo 이동 
			response.sendRedirect("list.bo");
		}//if
		if(sPath.equals("/list.bo")) {
			// BoardService 객체생성
			boardService =new BoardService();
			// List<BoardDTO> boardList  = getBoardList()
			List<BoardDTO> boardList=boardService.getBoardList();
			
			// request 데이터(boardList) 담아서
			request.setAttribute("boardList", boardList);
			
			dispatcher 
		    = request.getRequestDispatcher("board/list.jsp");
			dispatcher.forward(request, response);
		}//
		// http://localhost:8080/MVCProject/content.bo?num=1
		if(sPath.equals("/content.bo")) {
			// BoardService 객체생성
			boardService =new BoardService();
			// 조회수 증가 메서드 호출
			boardService.updateReadcount(request);
			// BoardDTO boardDTO  = getBoard(request) 메서드 호출
			BoardDTO boardDTO = boardService.getBoard(request);
			// request 데이터(boardDTO) 담아서
			request.setAttribute("boardDTO", boardDTO);
			// board/content.jsp
			dispatcher 
		    = request.getRequestDispatcher("board/content.jsp");
			dispatcher.forward(request, response);
		}//
		
//		http://localhost:8080/MVCProject/update.bo?num=1
		if(sPath.equals("/update.bo")) {
			// BoardService 객체생성
			boardService =new BoardService();
			// BoardDTO boardDTO  = getBoard(request) 메서드 호출
			BoardDTO boardDTO=boardService.getBoard(request);
			// request 데이터(boardDTO) 담아서
			request.setAttribute("boardDTO", boardDTO);
			// 수정하면 board/update.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("board/update.jsp");
			dispatcher.forward(request, response);
		}//
		
		if(sPath.equals("/updatePro.bo")) {
			System.out.println("주소 비교 : /updatePro.bo");
			// BoardService 객체생성
			boardService = new BoardService();
			// updateBoard(request) 호출
			reviewService.reviewBoard(request);
			// => request 한글처리, request 값 가져오기, BoardDTO 값저장
			//    BoardDAO 객체생성 updateBoard(boardDTO) 호출
			
			// => BoardDAO updateBoard() 1,2 디비연결, 
			//    3 sql구문 update set subject,content수정 where num = 
			//    4 실행
			// 주소 변경되면서 list.bo 이동 
			response.sendRedirect("list.bo");
		}
		
//		http://localhost:8080/MVCProject/delete.bo?num=1		
		if(sPath.equals("/delete.bo")) {
			// BoardService 객체생성
			reviewService = new ReviewService();
			//  deleteBoard(request) 호출
			reviewService.deleteReview(request);
//  BoardService => int num = request 파라미터값 가져오기
//		 => BoardDAO 객체생성 , deleteBoard(num) 호출
			//  BoardDAO => deleteBoard() 메서드 정의
			//             1,2 디비연결, 3sql delete 4실행
			// 주소 변경되면서 list.bo 이동 
			response.sendRedirect("list.bo");
		}
		
	}//doProcess()
	

}//클래스 
