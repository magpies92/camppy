package camppy.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

public class MemberController extends HttpServlet{
	RequestDispatcher dispatcher =null;
	MemberService memberService = null;
	
	// 주소매핑 담당자 => 서블릿(처리담당자) 지정 -> HttpServlet 상속
	// 서블릿 처리 할때 (동작원리) 
	// => 자동으로 service() doGet() doPost() 호출
	
	// 부모의 메서드 재정의(메서드 오버라이딩) alt shift s -> v
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doProcess()");
		//가상주소 뽑아오기
//		http://localhost:8080/MVCProject/insert.me
		String sPath=request.getServletPath();
//		/insert.me
		System.out.println("뽑아온 가상주소 : " + sPath); 
		
		//주소매핑 가상주소 비교 -> 실제파일 연결
		if(sPath.equals("/insert.me")) {
			// 실제파일 연결 
			// => insert.jsp 이동
			// (하이퍼링크, location.href, response.sendRedirect())
			// 주소가 변경되면서 이동하는 방식 
//			response.sendRedirect("member/insert.jsp");
			
			// 주소가 변경되지 않으면서 이동하는 방식 (forward방식)
			// request, response 정보도 들고 이동
			dispatcher 
			    = request.getRequestDispatcher("member/insert.jsp");
			dispatcher.forward(request, response);
			
		}//
		
		if(sPath.equals("/insertPro.me")) {
			System.out.println("주소 비교 : /insertPro.me");
			// 실제페이지 자바파일 처리메서드()
			// MemberController 
			// => com.itwillbs.service.MemberService파일 insertMember() 메서드 정의
			// => com.itwillbs.dao.MemberDAO파일 insertMember() 메서드 정의
			
			// MemberService 객체생성
			memberService = new MemberService();
			// insertMember() 메서드 정의
			memberService.insertMember(request);
			
			// 로그인 주소가 변경되면서 이동(가상주소 login.me)
			response.sendRedirect("login.me");
		}//
		
		if(sPath.equals("/login.me")) {
			// 주소변경 없이 이동 member/login.jsp
			dispatcher 
		    = request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request, response);
		}//
		
		if(sPath.equals("/loginPro.me")) {
			System.out.println("주소 비교 : /loginPro.me");
			//실제페이지 자바파일 처리메서드()
			
			// MemberService 객체생성
			memberService = new MemberService();
			// MemberDTO memberDTO = userCheck(request) 메서드 호출
			MemberDTO memberDTO = memberService.userCheck(request);
			if(memberDTO != null) {
			// 아이디 비밀번호 일치 -> 로그인(세션 로그인값 저장) -> main.me 이동
				System.out.println(memberDTO);
				System.out.println("아이디 비밀번호 일치");
				// 세션 객체생성 => 세션 기억장소 안에 로그인값 저장
				HttpSession session = request.getSession();
				session.setAttribute("id", memberDTO.getId());
				// 주소 변경하면서 이동 -> 가상주소 main.me 이동 
				response.sendRedirect("main.me");
			}else {
			// 아이디 비밀번호 틀림 -> 아이디 , 비밀번호 틀림 , 뒤로이동
				System.out.println(memberDTO);
				System.out.println("아이디 비밀번호 틀림");
				// 주소 변경없이 이동 =>  member/msg.jsp 
				dispatcher 
			    = request.getRequestDispatcher("member/msg.jsp");
			dispatcher.forward(request, response);
			}
			

		}
		if(sPath.equals("/main.me")) {
			// 주소 변경없이 이동 => member/main.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("member/main.jsp");
			dispatcher.forward(request, response);
		}
		if(sPath.equals("/logout.me")) {
			//세션초기화
			// 세션 객체생성 => 세션 기억장소 안에 로그인값 저장
			HttpSession session = request.getSession();
			// 세션 내장객체 전체 삭제(기억장소 해제)
			session.invalidate();
			// 주소 변경하면서 이동  main.me 이동
			response.sendRedirect("main.me");
		}
		
		// info.me 비교 일치 -> 처리 -> member/info.jsp
		if(sPath.equals("/info.me")) {
			// 세션 객체생성 => 세션 기억장소 안에 로그인값 저장
			HttpSession session = request.getSession();
			// 세션에서 로그인 정보 가져오기
			String id=(String)session.getAttribute("id");
			
			// MemberService 객체생성
			memberService = new MemberService();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			MemberDTO memberDTO=memberService.getMember(id);
			
			//info.jsp이동할때 request에 담아서 이동
			request.setAttribute("memberDTO", memberDTO);
			
			// 주소 변경없이 이동 => member/info.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("member/info.jsp");
			dispatcher.forward(request, response);
		}
		// update.me 비교 일치 -> 처리 -> member/update.jsp
		if(sPath.equals("/update.me")) {
			// 세션 객체생성 => 세션 기억장소 안에 로그인값 저장
			HttpSession session = request.getSession();
			// 세션에서 로그인 정보 가져오기
			String id=(String)session.getAttribute("id");
			
			// MemberService 객체생성
			memberService = new MemberService();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			MemberDTO memberDTO=memberService.getMember(id);
			
			//update.jsp이동할때 request에 담아서 이동
			request.setAttribute("memberDTO", memberDTO);
			
			// 주소 변경없이 이동 => member/update.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("member/update.jsp");
			dispatcher.forward(request, response);
		}
		if(sPath.equals("/updatePro.me")) {
			System.out.println("주소 비교 : /updatePro.me");
			//한글처리
			request.setCharacterEncoding("utf-8");
			// MemberService 객체생성
			memberService = new MemberService();
			// MemberDTO memberDTO = userCheck(request) 메서드 호출
			MemberDTO memberDTO = memberService.userCheck(request);
			if(memberDTO != null) {
				// memberDTO != null
				// 아이디 비밀번호 일치 -> 수정 -> main.me 이동
				//     수정  updateMember(request) 메서드 호출
				memberService.updateMember(request);
				//     main.me 이동
				response.sendRedirect("main.me");
			}else {
				// else => memberDTO == null
				//     아이디 비밀번호 틀림 -> member/msg.jsp 이동
				dispatcher 
			    = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		}//
		
		// delete.me 비교 일치 -> 처리 -> member/delete.jsp
		if(sPath.equals("/delete.me")) {
			// 주소 변경없이 이동 => member/delete.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("member/delete.jsp");
			dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/deletePro.me")) {
			System.out.println("주소 비교 : /deletePro.me");
			// MemberService 객체생성
			memberService = new MemberService();
			// MemberDTO memberDTO = userCheck(request) 메서드 호출
			MemberDTO memberDTO = memberService.userCheck(request);
			if(memberDTO != null) {
				// memberDTO != null
				// 아이디 비밀번호 일치 -> 삭제 -> 세션전체삭제 ->main.me 이동
				//     삭제  deleteMember(request) 메서드 호출
				memberService.deleteMember(request);
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("main.me");
			}else {
				// else => memberDTO == null
				//     아이디 비밀번호 틀림 -> member/msg.jsp 이동	
				dispatcher 
			    = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}

		}//if
		
		if(sPath.equals("/list.me")) {
			System.out.println("주소 비교 : /list.me");
			// MemberService 객체생성
		memberService = new MemberService();
// List<MemberDTO> memberList =   getMemberList() 호출
List<MemberDTO> memberList = memberService.getMemberList();	
			// request => "memberList",memberList 담아서
			request.setAttribute("memberList", memberList);
			// 주소 변경없이 member/list.jsp 이동
			dispatcher 
		    = request.getRequestDispatcher("member/list.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}//doProcess() 메서드

	
}//클래스
