package camppy.reserve.action;

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

import com.mysql.cj.Session;

import camppy.main.action.CampRegDTO;
import camppy.main.action.CampRegService;
import camppy.member.MemberDTO;
import camppy.member.MemberService;
import camppy.reserve.dao.ReserveDetailDTO;


public class ReserveController extends HttpServlet {
	RequestDispatcher dispatcher =null;
	MemberService memberService = null;
	CampRegService campRegService = null;
	ReserveService reserveService = null;
	
// HttpServlet 처리담당자 -> 자동으로 doGet, doPost 호출
	// -> 재정의 해서 사용
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveController doProcess()");
		//가상주소 뽑아오기
		String sPath=request.getServletPath();
		System.out.println("뽑은 가상주소 :  " + sPath);
		
		if(sPath.equals("/reserve_detail.re")) {
			// reserve/login.jsp 주소변경 없이 이동
//			HttpSession session=request.getSession();
//			String id=(String)session.getAttribute("id");
			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);			
			
			
//			int campid=Integer.parseInt(request.getParameter("campid"));
			int campid=2;
			campRegService = new CampRegService();
			CampRegDTO campRegDTO=campRegService.getCampReg(campid);
			
			
			request.setAttribute("memberDTO", memberDTO);	
			request.setAttribute("campRegDTO", campRegDTO);
			
			
			dispatcher 
		    = request.getRequestDispatcher("reservepage/reserveDetail/reserve_detail.jsp");
		dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/reserve_detailPro.re")) {
			System.out.println("비교 : reserve_detailPro.re");
			reserveService = new ReserveService();
			reserveService.insertReserve(request);
			
			response.sendRedirect("mypage_reserve.re");
			
//			dispatcher 
//		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
//		dispatcher.forward(request, response);
		}
		if(sPath.equals("/mypage_reserve.re")) {
			// reserve/login.jsp 주소변경 없이 이동
//			HttpSession session=request.getSession();
//			String id=(String)session.getAttribute("id");
			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();
			
			reserveService = new ReserveService();
			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(member_id);
		
			request.setAttribute("reserveList", reserveList);
			
			dispatcher 
		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
		dispatcher.forward(request, response);
		}
		
		
		
		//
		
//		if(sPath.equals("/loginPro.me")) {
//			System.out.println("뽑은 가상주소 비교 : /insertPro.me");
//	// MemberService 객체생성
//			memberService = new MemberService();
//	// MemberDTO memberDTO = userCheck(request) 메서드 호출
//	MemberDTO memberDTO = memberService.userCheck(request);
//
//	if(memberDTO != null) {
//		// memberDTO != null 아이디 비밀번호 일치=> 세션값 저장=>main.me
//		HttpSession session = request.getSession();
//		session.setAttribute("id", memberDTO.getId());
//		response.sendRedirect("main.me");
//	}else {
//		// memberDTO == null 아이디 비밀번호 틀림=> member/msg.jsp
//		dispatcher 
//	    = request.getRequestDispatcher("member/msg.jsp");
//	dispatcher.forward(request, response);
//	}
//	
//	}//	if
//		
//	if(sPath.equals("/main.me")) {
//		dispatcher 
//	    = request.getRequestDispatcher("main/main.jsp");
//	dispatcher.forward(request, response);
//	}//
//	
//	if(sPath.equals("/logout.me")) {
//		//세션값 전체 삭제
//		HttpSession session = request.getSession();
//		session.invalidate();
//		// main.me 주소변경하면서 이동
//		response.sendRedirect("main.me");
//	}//
//	
//	if(sPath.equals("/update.me")) {
//		System.out.println("뽑은 가상주소 비교 : /update.me");
//		//수정하기 전에 디비 나의 정보 조회(세션값 id) => jsp 화면 출력
//		// 세션 객체생성
//		HttpSession session = request.getSession();
//		// "id" 세션값 가져오기=> String id 변수 저장
//		String id = (String)session.getAttribute("id");
//		// MemberService 객체생성
//		memberService = new MemberService();
//		// MemberDTO memberDTO = getMember(id) 메서드 호출
//		MemberDTO memberDTO = memberService.getMember(id);
//		// request에 memberDTO 저장 ("이름",값)
//		request.setAttribute("memberDTO", memberDTO);
//		// member/update.jsp 주소변경없이 이동
//		dispatcher 
//	    = request.getRequestDispatcher("member/update.jsp");
//	dispatcher.forward(request, response);
//	}//
//	
//	if(sPath.equals("/updatePro.me")) {
//		System.out.println("뽑은 가상주소 비교 : /updatePro.me");
//		// request안에 폼에서 입력한 수정할 값이 저장
//		// MemberService 객체생성
//		memberService = new MemberService();
//		// 아이디 비밀번호 일치 확인 =>
//		// MemberDTO memberDTO = userCheck(request) 메서드 호출
//		MemberDTO memberDTO = memberService.userCheck(request);
//		if(memberDTO != null) {
//			// memberDTO != null 아이디 비밀번호 일치=> 
//			// 수정  리턴할형없음  updateMember(request) 메서드 호출 
//			//  sql =>  update members set name = ? where id = ? 
//			memberService.updateMember(request);
//			// =>main.me
//			response.sendRedirect("main.me");
//		}else {
//			// memberDTO == null 아이디 비밀번호 틀림=> member/msg.jsp
//			dispatcher 
//		    = request.getRequestDispatcher("member/msg.jsp");
//		dispatcher.forward(request, response);
//		}
//		
//	}//
//	
//	if(sPath.equals("/delete.me")) {
//		System.out.println("뽑은 가상주소 비교 : /delete.me");
//		// member/delete.jsp 주소변경없이 이동
//		dispatcher 
//	    = request.getRequestDispatcher("member/delete.jsp");
//	dispatcher.forward(request, response);
//	}//
//	
//	if(sPath.equals("/deletePro.me")) {
//		System.out.println("뽑은 가상주소 비교 : /deletePro.me");
//		// MemberService 객체생성
//		memberService = new MemberService();
//		// 아이디 비밀번호 일치 확인 =>
//		// MemberDTO memberDTO = userCheck(request) 메서드 호출
//		MemberDTO memberDTO = memberService.userCheck(request);
//
//		if(memberDTO != null) {
//			// memberDTO != null 아이디 비밀번호 일치=> 
//			// 삭제  리턴할형없음  deleteMember(request) 메서드 호출
//			memberService.deleteMember(request);
//			// => 세션값 초기화
//			HttpSession session = request.getSession();
//			session.invalidate();
//			// =>main.me 이동
//			response.sendRedirect("main.me");
//		}else {
//			// memberDTO == null 아이디 비밀번호 틀림=> member/msg.jsp
//			dispatcher 
//		    = request.getRequestDispatcher("member/msg.jsp");
//		dispatcher.forward(request, response);
//		}
//	}//
//	
//	//아이디 중복체크
//	if(sPath.equals("/idCheck.me")) {
//		System.out.println("뽑은 가상주소 비교 : /idCheck.me");
//		String id = request.getParameter("id");
//		System.out.println("받은 아이디 : " + id);
//		// MemberService 객체생성
//		memberService = new MemberService();
//		// getMember() 메서드 호출
//		MemberDTO memberDTO = memberService.getMember(id);
//		String result="";
//		if(memberDTO != null) {
//			//아이디 있음 => 아이디 중복
//			System.out.println("아이디 있음 => 아이디 중복");
//			result = "아이디 중복";
//		}else {
//			//아이디 없음 => 아이디 사용가능
//			System.out.println("아이디 없음 => 아이디 사용가능");
//			result = "아이디 사용가능";
//		}
//		//이동하지 않고 =>결과 웹에 출력 => 출력 결과를 가지고 되돌아감
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter printWriter = response.getWriter();
//		printWriter.println(result);
//		printWriter.close();
//		
//	}//
//	
//	// list.me 주소비교
//	if(sPath.equals("/list.me")) {
//		System.out.println("뽑은 가상주소 비교 : /list.me");
//		// MemberService 객체생성
//		memberService = new MemberService();
//// List<MemberDTO> memberList  =  getMemberList();메서드호출
//List<MemberDTO> memberList = memberService.getMemberList();
//		
//		// request에 "memberList", memberList를 담기
//		request.setAttribute("memberList", memberList);
//		
//		// member/list.jsp 주소변경 없이 이동
//		dispatcher 
//	    = request.getRequestDispatcher("member/list.jsp");
//	dispatcher.forward(request, response);
//	}//
//	
//	if(sPath.equals("/listjson.me")) {
//		System.out.println("뽑은 가상주소 비교 : /list.me");
//		// MemberService 객체생성
//		memberService = new MemberService();
//// List<MemberDTO> memberList  =  getMemberList();메서드호출
//		List<MemberDTO> memberList = memberService.getMemberList();
//		// memberList => json 변경해서 출력
//		// 자바 => json 변경하는 프로그램 설치
//		// webapp - WEB-INF - lib - json-simple-1.1.1.jar
//		
//		// List => JSONArray
//		// import org.json.simple.JSONArray;
//		JSONArray arr = new JSONArray();
//		//날짜 => 원하는 형으로 문자열 변경
//		SimpleDateFormat format =new SimpleDateFormat("yyyy.MM.dd");
//		for(int i=0;i<memberList.size();i++) {
//			MemberDTO memberDTO=memberList.get(i);
//			// MemberDTO => JSONObject
//			JSONObject object = new JSONObject();
//			object.put("id", memberDTO.getId());
//			object.put("pass", memberDTO.getPass());
//			object.put("name", memberDTO.getName());
//			object.put("date", format.format(memberDTO.getDate()));
//			// 배열 한칸에 저장
//			arr.add(object);
//		}
//		//이동하지 않고 =>결과 웹에 출력 => 출력 결과를 가지고 되돌아감
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter printWriter = response.getWriter();
//		printWriter.println(arr);
//		printWriter.close();
//		// json 데이터 결과 확인
//		// http://localhost:8080/FunWeb/listjson.me
//		
// }
	
	
		
	}//doProcess()

}