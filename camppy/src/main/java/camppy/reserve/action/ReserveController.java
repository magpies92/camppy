package camppy.reserve.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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

import camppy.reserve.dao.Action;
import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.MyReserveDTO;
import camppy.reserve.dao.ReserveDetailDAO;
import camppy.reserve.dao.ReserveDetailDTO;
import camppy.reserve.dao.ReserveDetailPro;
import camppy.reserve.action.MyReservePro;
import com.mysql.cj.Session;

import camppy.main.action.CampRegDAO;
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
			String id=(String)session.getAttribute("id");
//			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);			
			
			
			int campid=Integer.parseInt(request.getParameter("campId"));
//			int campid=3;
			
			campRegService = new CampRegService();
			CampRegDTO campRegDTO=campRegService.getCampReg(campid);
//			String campname="사천솔섬캠핑장";
//			campRegService = new CampRegService();
//			CampRegDTO campRegDTO=campRegService.getCampReg2(campname);
			
			System.out.println("memberDTO.getMember_id" + memberDTO.getMember_id());
			System.out.println("campRegDTO.getCamp_id" + campRegDTO.getCampid());
			System.out.println("campRegDTO.getCamp_id" + campRegDTO.getCampname());
			System.out.println("campRegDTO.getCampprice" + campRegDTO.getCampprice());
			request.setAttribute("memberDTO", memberDTO);	
			request.setAttribute("campRegDTO", campRegDTO);
			
			
			dispatcher 
		    = request.getRequestDispatcher("reservepage/reserveDetail/reserve_detail.jsp");
		dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/reserve_detailPro.re")) {
			request.setCharacterEncoding("utf-8");
			int camp_id=Integer.parseInt(request.getParameter("camp_id")); // 펜션 번호
			int member_id=Integer.parseInt(request.getParameter("member_id")); // 예약 회원 번호
//			int res_id=Integer.parseInt(request.getParameter("res_id")); // 예약 회원 번호
			Timestamp res_time =new Timestamp(System.currentTimeMillis()); // 예약 날짜시간
			String camp_name = request.getParameter("camp_name");
//			Timestamp res_time=new Timestamp(System.currentTimeMillis()); // 판매 날짜시간
//			int guest=Integer.parseInt(request.getParameter("guest")); // 인원수
			
			String checkin_date = request.getParameter("checkin_date"); // 입실일
			String checkout_date = request.getParameter("checkout_date"); // 퇴실일
				
			if(checkin_date.equals("") || checkout_date.equals("")) { // 입실일 퇴실일 입력 안한 경우 경고창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('입실일 또는 퇴실일을 입력해주세요')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else { // 입실일 퇴실일 입력 되어 있는 경우
				// 총 숙박일 계산
				LocalDate startDate = LocalDate.parse(checkin_date);
				LocalDate endDate = LocalDate.parse(checkout_date);
			   	int daycount = (int)startDate.until(endDate, ChronoUnit.DAYS);
					
//			   	총 숙박료 계산
				CampRegDAO cdao = new CampRegDAO();
				CampRegDTO cdto = cdao.getCampReg(camp_id);
				int sprice = cdto.getCampprice()*daycount;
			   	

//			   	// 총 숙박료 계산
//				ReserveDetailDAO rdao = new ReserveDetailDAO();
//				ReserveDetailDTO rdto = rdao.getDetailList(camp_id);
//				int sprice = rdto.getCamp_price()*daycount;
				
				
				 // 입실일이 과거면 안되게 하는 기능
				String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		        LocalDate nowDate = LocalDate.parse(Date);
		        if(startDate.isBefore(nowDate)) {
		        	response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('입실일이 과거입니다.')");
					out.println("history.back();");
					out.println("</script>");
					out.close();
		        }
				
//					if(guest>pdto.getMax_men()) { // 입실 가능 인원 초과인 경우 
//						response.setContentType("text/html; charset=UTF-8");
//						PrintWriter out = response.getWriter();
//						out.println("<script type='text/javascript'>");
//						out.println("alert('입실 가능 인원 초과입니다.')");
//						out.println("alert('현재 펜션은 "+pdto.getMax_men()+"명 이하만 입실 가능합니다.')");
//						out.println("history.back();");
//						out.println("</script>");
//						out.close();
//					}
				ReserveDetailDAO rdao = new ReserveDetailDAO();
//		        MyReserveDAO sdao = new MyReserveDAO();
//		        	if(boolean check1=sdao.checksSales1(pno, indate, outdate);) { // 입실 가능한 인원 수 입력되어 있으면
						MyReserveDAO mdao = new MyReserveDAO();
					
						// 퇴실일이 입실일보다 이전이거나 같은경우 경고창 띄우고 history.back
						boolean check1=mdao.checkCamp(camp_id, checkin_date, checkout_date);			
						if(check1==true){
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script type='text/javascript'>");
						out.println("alert('퇴실일이 입실일 이전이거나 입실일과 같습니다.')");
						out.println("history.back();");
						out.println("</script>");
						out.close();
						} else {
						// 이미 예약된 경우 경고창 띄우고 history.back
							
							boolean check2=mdao.checkCamp2(camp_id, checkin_date, checkout_date);
							if(check2==true) {
								response.setContentType("text/html; charset=UTF-8");
								PrintWriter out = response.getWriter();
								out.println("<script type='text/javascript'>");
								out.println("alert('이미 예약된 날짜입니다.')");
								out.println("history.back();");
								out.println("</script>");
								out.close();
			
							// 예약 가능한 날짜일 경우 진행
							}else if(check2!=true) {
			
								//Appointment dto에 값 저장
								
								  ReserveDetailDTO mdto=new ReserveDetailDTO(); 
								  // mdto.setRes_id(res_id); 
							      // mdto.setCamp_id(camp_id); 
								  // mdto.setRes_time(res_time);
								  
//								  MyReserveDAO dao=new MyReserveDAO(); 
								  ReserveDetailDAO dao = new ReserveDetailDAO();
								  // DB에 예약정보 저장 
								  
								  // 저장된 예약정보 ano 가져오기 // 
//								  Timestamp checkin_date = new Timestamp(System.currentTimeMillis()); 입실일 
							   // Timestamp checkout_date = new Timestamp(System.currentTimeMillis()); // 퇴실일 mdto =
								  dao.getDetailList(member_id); 
								  member_id = mdto.getRes_id();
								  
								  // Sales dto에 값 저장 
								  // MyReserveDTO mrdto = new MyReserveDTO();
//								  mdto.setMember_id(member_id); 
//								  mdto.setCamp_id(camp_id); 
//								  mdto.setRes_time(res_time);
//								  mdto.setCamp_name(camp_name);
//								  mdto.setCheckin_date(checkin_date); 
//								  mdto.setCheckout_date(checkout_date);
//								  mdto.setSprice(sprice);
								  
								  //dao.insertReserve(mdto);
								  
								  System.out.println("비교 : reserve_detailPro.re"); 
								  reserveService = new ReserveService();
								  reserveService.insertReserve(request);
								  
								  response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
								  response.getWriter(); out.println("<script type='text/javascript'>");
								  out.println("alert('총 "+daycount+"박 숙박료 "+sprice+"원 입니다')");
								  out.println("alert('예약 입금 대기 되었습니다.')");
								  out.println("alert('입금 확인 후 예약 완료 됩니다.')");
								  out.println("location.href='mypage_reserve.re';"); out.println("</script>");
								  out.close();
								 
							}
						}
					}
			
			
			
			
					

//			response.sendRedirect("mypage_reserve.re");
			
			
			
			
			
			
			
			
//			dispatcher 
//		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
//		dispatcher.forward(request, response);
		}
		
		
		
		if(sPath.equals("/mypage_reserve.re")) {
			System.out.println("비교 : myreserve.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
//			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();
			
			reserveService = new ReserveService();
//			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(member_id);
//		
//			request.setAttribute("reserveList", reserveList);
			
			
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
//			List<MyReserveDTO> PageList=reserveService.getPageList(pageDTO);
			pageDTO.setMember_id(member_id);
			
			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(pageDTO);
			
			
			
			// 게시판 전체 글 개수 구하기 
			int count = reserveService.getReserveCount(pageDTO);
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
			System.out.println("count " + count) ;
			//pageDTO 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			// request에 "boardList",boardList 저장
			
			request.setAttribute("reserveList", reserveList);
			
//			request.setAttribute("pageList", PageList);
			request.setAttribute("pageDTO", pageDTO);
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
			
			
			
			
			dispatcher 
		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
		dispatcher.forward(request, response);
		}
		
		System.out.println("비교 : myreserve.reP");
		
		
		
		
		if(sPath.equals("/DetailList.re")) {
			System.out.println("비교 : DetailList.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
//			String id="ljy";
			
			memberService= new MemberService();
			MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();
			
			reserveService = new ReserveService();
//			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(member_id);
//		
//			request.setAttribute("reserveList", reserveList);
			
			
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
//			List<MyReserveDTO> PageList=reserveService.getPageList(pageDTO);
			pageDTO.setMember_id(member_id);
			
			List<ReserveDetailDTO> reserveList =reserveService.getReserveList(pageDTO);
			
			
			
			// 게시판 전체 글 개수 구하기 
			int count = reserveService.getReserveCount(pageDTO);
			// 한화면에 보여줄 페이지개수 설정
			int pageBlock = 3;
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
			System.out.println("count " + count) ;
			//pageDTO 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			// request에 "boardList",boardList 저장
			
			request.setAttribute("reserveList", reserveList);
			
//			request.setAttribute("pageList", PageList);
			request.setAttribute("pageDTO", pageDTO);
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
			
			
			
			
			dispatcher 
		    = request.getRequestDispatcher("reservepage/mypageReserveDetail/DetailList.jsp");
		dispatcher.forward(request, response);
		}
		
		System.out.println("비교 : DetailList.reR");
		
//		------------------------------------------------------
		
		
		// 이동정보를 저장하는 자바파일 선언
					ActionReserve forward=null;
					//부모 인터페이스 틀 선언
					Action action=null;
				
//					if(sPath.equals("/ProductWriteForm.pr")) {
//					
					if(sPath.equals("/ReserveDetailPro.re")) {
				forward=new ActionReserve();
				forward.setPath("reservepage/mypageReserve/mypage_reserve.jsp");
				forward.setRedirect(false);
				
						action=new ReserveDetailPro();
						try {
							forward=action.execute(request, response);
						} catch (Exception e) {
							e.printStackTrace();
						}
					
					}else if(sPath.equals("/MyReservePro.re")) {
						action=new MyReservePro();
						try {
							forward=action.execute(request, response);
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						
					
			
//			------------------------------------------------------------------------		
					if(forward != null) {
						//이동방식비교
						if(forward.isRedirect()==true) {
							response.sendRedirect(forward.getPath());
						}else {
					
							RequestDispatcher dispatcher=
							request.getRequestDispatcher(forward.getPath());
					        dispatcher.forward(request, response);
						}
					}
		
		
		
		
		
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
}