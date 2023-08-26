package camppy.member;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MemberController extends HttpServlet{
	RequestDispatcher dispatcher =null;
	
	
// HttpServlet 처리담당자 -> 자동으로 doGet, doPost 호출
	// -> 재정의 해서 사용
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doProcess()");
		//가상주소 뽑아오기
		String sPath=request.getServletPath();
		System.out.println("뽑은 가상주소 :  " + sPath);
		//뽑은 가상주소 비교하기 => 실제페이지 연결
		if(sPath.equals("/ctest.mem")) {
			// member/join.jsp 주소변경 없이 연결
			dispatcher 
		    = request.getRequestDispatcher("member/join/ctest.jsp");
		dispatcher.forward(request, response);
		}//
		
	
	
		
	}//doProcess()

}//클래스
