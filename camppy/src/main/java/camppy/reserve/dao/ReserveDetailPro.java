package camppy.reserve.dao;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camppy.reserve.dao.Action;
import camppy.reserve.dao.ActionReserve;

import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.MyReserveDTO;
import camppy.reserve.dao.ReserveDetailDAO;
import camppy.reserve.dao.ReserveDetailDTO;
import camppy.main.action.CampRegDAO;
import camppy.main.action.CampRegDTO;

public class ReserveDetailPro implements Action {

	@Override
	public ActionReserve execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ReserveDetailPro execute()");

			int camp_id=Integer.parseInt(request.getParameter("camp_id")); // 펜션 번호
			int res_id=Integer.parseInt(request.getParameter("res_id")); // 예약 회원 번호
			Timestamp res_time =new Timestamp(System.currentTimeMillis()); // 예약 날짜시간
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
						boolean check1=rdao.checkCamp(camp_id, checkin_date, checkout_date);					
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
								MyReserveDTO mdto=new MyReserveDTO();
//								mdto.setRes_id(res_id);
//								mdto.setCamp_id(camp_id);
//								mdto.setRes_time(res_time);

								MyReserveDAO dao=new MyReserveDAO();
								// DB에 예약정보 저장
								mdao.insertReserve(mdto);

								// 저장된 예약정보 ano 가져오기
//								Timestamp checkin_date = new Timestamp(System.currentTimeMillis()); // 입실일
//								Timestamp checkout_date = new Timestamp(System.currentTimeMillis()); // 퇴실일
								mdto = dao.getReserve(res_id);
								res_id = mdto.getRes_id();
			
								// Sales dto에 값 저장
//								MyReserveDTO mrdto = new MyReserveDTO();
								mdto.setRes_id(res_id);
								mdto.setCamp_id(camp_id);
								mdto.setRes_time(res_time);
								mdto.setCheckin_date(checkin_date);
								mdto.setCheckout_date(checkout_date);
								mdto.setSprice(sprice);
			
								mdao.insertReserve(mdto);
					
								response.setContentType("text/html; charset=UTF-8");
								PrintWriter out = response.getWriter();
								out.println("<script type='text/javascript'>");
								out.println("alert('총 "+daycount+"박 숙박료 "+sprice+"원 입니다')");
								out.println("alert('예약 입금 대기 되었습니다.')");
								out.println("alert('입금 확인 후 예약 완료 됩니다.')");
								out.println("location.href='mypage_reserve.pr';");
								out.println("</script>");
								out.close();
							}
						}
					}
				
		return null;	
	}
	
}

