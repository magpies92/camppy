package camppy.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

////			http://localhost:8080/Camppy/reviewInsert.rv
//			if(sPath.equals("/reviewInsert.rv")) {
//				// 주소변경 없이 => board/write.jsp 이동
//				dispatcher 
//			    = request.getRequestDispatcher("review/insert/reviewInsert.jsp");
//				dispatcher.forward(request, response);
//			}//if
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
	}
}