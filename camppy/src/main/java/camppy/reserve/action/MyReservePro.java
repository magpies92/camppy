package camppy.reserve.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camppy.reserve.dao.Action;
import camppy.reserve.dao.ActionReserve;

import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.ReserveDetailDAO;

public class MyReservePro implements Action {

	@Override
	public ActionReserve execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyReservePro execute()");


		int res_id=Integer.parseInt(request.getParameter("res_id"));
	
		
		MyReserveDAO mdao = new MyReserveDAO();
		mdao.deleteReserve(res_id);
		
//		SalesDAO sdao = new SalesDAO();
//		sdao.deleteSales(ano);
		
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('숙소 예약이 취소됩니다.');");
		out.println("location.href='mypage_reserve.re'");
		out.println("</script>");
		out.close();
			

		return null;
	}

}