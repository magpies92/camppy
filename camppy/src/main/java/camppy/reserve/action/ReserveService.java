package camppy.reserve.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import camppy.main.action.CampRegDAO;
import camppy.reserve.dao.ReserveDetailDAO;
import camppy.reserve.dao.ReserveDetailDTO;

public class ReserveService {
	
	ReserveDetailDAO reserveDetailDAO = null;

	public void insertReserve(HttpServletRequest request) {
		System.out.println("ReserveService insertReserve()");
		try {
			// http://localhost:8080/webProject/jsp3/insertPro.jsp?id=kim&pass=123&name=홍길동
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request 한글처리
			request.setCharacterEncoding("utf-8");	
			// request id, pass,name 가져와서 -> 변수에 저장
			
			int member_id =Integer.parseInt(request.getParameter("member_id"));  
			int res_status = 0;
			String checkin_date = request.getParameter("checkin_date");
			String checkout_date = request.getParameter("checkout_date");
			Timestamp res_time = new Timestamp(System.currentTimeMillis()); 
			int camp_id = Integer.parseInt(request.getParameter("camp_id"));
			int camp_price = Integer.parseInt(request.getParameter("camp_price"));
			
			
			
			ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
			reserveDetailDTO.setMember_id(member_id);
			reserveDetailDTO.setRes_status(0);
			reserveDetailDTO.setCheckin_date(checkin_date);
			reserveDetailDTO.setCheckout_date(checkout_date);
			reserveDetailDTO.setRes_time(res_time);
			reserveDetailDTO.setCamp_id(camp_id);
			reserveDetailDTO.setCamp_price(camp_price);
			
			// ReserveDetailDAO 객체생성
			reserveDetailDAO = new ReserveDetailDAO();
			// reserveDetailDTO = reserveDetailDTO() 메서드 호출
			reserveDetailDAO.insertReserve(reserveDetailDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public List<ReserveDetailDTO> getReserveList(int member_id) {
		List<ReserveDetailDTO> reserveList = null;
		try {
			reserveDetailDAO = new ReserveDetailDAO();
			reserveList =reserveDetailDAO.getReserveList(member_id);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reserveList;
	}
	
	
	
	
}
