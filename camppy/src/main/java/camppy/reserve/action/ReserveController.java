package camppy.reserve.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import camppy.reserve.dao.ActionReserve;

import camppy.reserve.dao.PageDTO;
import camppy.reserve.action.ReserveService;
import com.mysql.cj.Session;

import camppy.main.action.CampRegDTO;
import camppy.main.action.CampRegService;
import camppy.member.MemberDTO;
import camppy.member.MemberService;
import camppy.reserve.dao.ReserveDetailDTO;
import camppy.member.MemberDAO;
import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.MyReserveDTO;


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
			HttpSession session=request.getSession();
//			String id=(String)session.getAttribute("id");
			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);			
			
			
//			int campid=Integer.parseInt(request.getParameter("campid"));
			int campid=3;
			campRegService = new CampRegService();
			CampRegDTO campRegDTO=campRegService.getCampReg(campid);
			
			System.out.println("memberDTO.getMember_id" + memberDTO.getMember_id());
			System.out.println("campRegDTO.getCamp_id" + campRegDTO.getCampid());
			System.out.println("campRegDTO.getCampprice" + campRegDTO.getCampprice());
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
			System.out.println("비교 : myreserve.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session=request.getSession();
//			String id=(String)session.getAttribute("id");
			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();
			
			reserveService = new ReserveService();
			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(member_id);
		
			request.setAttribute("reserveList", reserveList);
			
			
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
			
			// BoardService 객체생성
			reserveService = new ReserveService();
//List<BoardDTO> boardList = getBoardList(); 메서드 호출
			List<MyReserveDTO> PageList=reserveService.getPageList(pageDTO);
			
			// 게시판 전체 글 개수 구하기 
			int count = reserveService.getReserveCount();
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
			
			// request에 "boardList",boardList 저장
			request.setAttribute("pageList", PageList);
			request.setAttribute("pageDTO", pageDTO);
			dispatcher 
		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
		dispatcher.forward(request, response);
		}
		
		
		System.out.println("비교 : myreserve.reP");
	
		
		
		
		
//	if(sPath.equals("/mypage_reserveP.re")) {
//		System.out.println("뽑은 가상주소 비교 : /mypage_reservePageP.re");
//		// 한페이지에서 보여지는 글개수 설정
//		
//		// 주소변경없이 이동 center/notice.jsp
//		dispatcher 
//	    = request.getRequestDispatcher("mypageReserve/mypage_reserve.jsp");
//	dispatcher.forward(request, response);
//	}//
		
		
		
		
		
		
		
//		if(sPath.equals("/mypage_reserve.re")) {
//			// reserve/login.jsp 주소변경 없이 이동
//			HttpSession session=request.getSession();
////			String id=(String)session.getAttribute("id");
//			String id="ljy";
//			
//			memberService= new MemberService();
//			MemberDTO memberDTO=memberService.getMember(id);			
//			
//			
////			int campid=Integer.parseInt(request.getParameter("campid"));
//			int campid=3;
//			campRegService = new CampRegService();
//			CampRegDTO campRegDTO=campRegService.getCampReg(campid);
//			
//			reserveService = new ReserveService();
//			MyReserveDTO myReserveDTO = reserveService.getMyReserve(res_id);
//			
//			System.out.println("ReserveDetailDTO.getRes_id" + myReserveDTO.getMember_id());
//			System.out.println("campRegDTO.getCamp_id" + campRegDTO.getCampid());
//			System.out.println("campRegDTO.getCampprice" + campRegDTO.getCampprice());
//			request.setAttribute("memberDTO", memberDTO);	
//			request.setAttribute("campRegDTO", campRegDTO);
//			request.setAttribute("MyreserveDTO", myReserveDTO);
//			
//			dispatcher 
//		    = request.getRequestDispatcher("reservepage/reserveDetail/reserve_detail.jsp");
//		dispatcher.forward(request, response);
//		}
		
		
		
		
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