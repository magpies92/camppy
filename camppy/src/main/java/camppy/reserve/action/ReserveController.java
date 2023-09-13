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
			
			String checkin_date = request.getParameter("checkin_date");
			String checkout_date = request.getParameter("checkout_date");
								
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
			   	

				
				ReserveDetailDAO rdao = new ReserveDetailDAO();
					MyReserveDAO mdao = new MyReserveDAO();
				
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
								  dao.getDetailList(camp_id); 
								  member_id = mdto.getRes_id();
								  
								  
								  System.out.println("비교 : reserve_detailPro.re"); 
								  reserveService = new ReserveService();
								  reserveService.insertReserve(request);
								  
								  response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
								  response.getWriter(); out.println("<script type='text/javascript'>");
									/* out.println("alert('총 "+daycount+"박 숙박료 "+sprice+"원 입니다')"); */
								  out.println("alert('예약 입금 대기 되었습니다.')");
								  out.println("alert('입금 확인 후 예약 완료 됩니다.')");
								  out.println("location.href='mypage_reserve.re';"); out.println("</script>");
								  out.close();
								 
						
						
					}
			
			
			
			
					

//			response.sendRedirect("mypage_reserve.re");
			
			
			
			
			
			
			
			
//			dispatcher 
//		    = request.getRequestDispatcher("reservepage/mypageReserve/mypage_reserve.jsp");
//		dispatcher.forward(request, response);
		}
		
		
		
		if(sPath.equals("/mypage_reserve.re")) {
			System.out.println("비교 : myreserve.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session = request.getSession();
			String id=(String)session.getAttribute("id");
			if(id == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('로그인을 해주세요')");
				out.println("parent.location.replace('main.camp')");
				out.println("</script>");
				out.close();
			}
			else {
				int member_id = (int)session.getAttribute("memberid");
			
			
			memberService= new MemberService();
			/*MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();*/
			
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
		}
		
		
		if(sPath.equals("/admin_reserve.re")) {
			System.out.println("비교 : admin.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session = request.getSession();
			String id=(String)session.getAttribute("id");
			if(id == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('로그인을 해주세요')");
				out.println("parent.location.replace('main.camp')");
				out.println("</script>");
				out.close();
			}
			else {
				int member_id = (int)session.getAttribute("memberid");
			
			
			memberService= new MemberService();
			/*MemberDTO memberDTO=memberService.getMember(id);
			
			int member_id=memberDTO.getMember_id();*/
			
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
			
			List<ReserveDetailDTO> reserveList =reserveService.getReserveList1(pageDTO);
			
			
			
			// 게시판 전체 글 개수 구하기 
			int count = reserveService.getReserveCount1(pageDTO);
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
		    = request.getRequestDispatcher("reservepage/mypageReserve/admin_reserve.jsp");
		dispatcher.forward(request, response);
			}
		}
		
		if(sPath.equals("/resstch.re")) {
			request.setCharacterEncoding("utf-8");
			// num 파라미터 값 가져오기
			// MemberService 객체생성
			ReserveService reserveService = new ReserveService();
			// getMember() 메서드 호출
			reserveService.resstch(request);
				
				    
				    response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("location.replace('admin_reserve.re')");
					out.println("</script>");
					out.close();
				   
			
		}
		
		System.out.println("비교 : myreserve.reP");
		
		
		
		
		if(sPath.equals("/DetailList.re")) {
			System.out.println("비교 : DetailList.re");
			// reserve/login.jsp 주소변경 없이 이동
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
//			String id="ljy";
			System.out.println("받은 예약번호는 : " + request.getParameter("res_id"));
			if(request.getParameter("res_id") == "") {
				//아이디 없음 => 아이디 사용가능
				 response.setContentType("text/html; charset=UTF-8");
				    PrintWriter printWriter = response.getWriter();
				    printWriter.println("<script>alert('예약 번호를 입력해주세요.');");
				    printWriter.println("history.back();");
				    printWriter.println("</script>");
				    printWriter.close();
			}
			
			int res_id = Integer.parseInt(request.getParameter("res_id"));
			System.out.println("받은 닉네임 : " + res_id);
			// MemberService 객체생성
			ReserveService reserveService = new ReserveService();
			// getMember() 메서드 호출
			ReserveDetailDTO reserveDetailDTO = reserveService.getReserve(res_id);
			System.out.println(reserveDetailDTO);
			if(reserveDetailDTO != null) {
				//아이디 있음 => 아이디 중복
				dispatcher 
			    = request.getRequestDispatcher("reservepage/mypageReserveDetail/DetailList.jsp");
			dispatcher.forward(request, response);
			}else {
				//아이디 없음 => 아이디 사용가능
				 response.setContentType("text/html; charset=UTF-8");
				    PrintWriter printWriter = response.getWriter();
				    printWriter.println("<script>alert('예약 내역이 없습니다.');");
				    printWriter.println("history.back();");
				    printWriter.println("</script>");
				    printWriter.close();
			}		
		
			
		}
		
		System.out.println("비교 : DetailList.reR");
		
		if(sPath.equals("/admindelete.re")) {
			int res_id=Integer.parseInt(request.getParameter("res_id"));
			
			
//			ReserveDetailDAO rdao = new ReserveDetailDAO();
//			rdao.deleteReserveDetail(res_id);
			
			
			MyReserveDAO mdao = new MyReserveDAO();
			mdao.deleteReserve(res_id);
			
//			SalesDAO sdao = new SalesDAO();
//			sdao.deleteSales(ano);
			
					
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("location.replace('admin_reserve.re')");
			out.println("</script>");
			out.close();
			
		
			
		}	
		

	
		
		
//		------------------------------------------------------
		
		
		// 이동정보를 저장하는 자바파일 선언
					ActionReserve forward=null;
					//부모 인터페이스 틀 선언
					Action action=null;
								
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
	
	
		
	}//doProcess()

	}
}
