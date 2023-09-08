package camppy.reserve.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camppy.main.action.CampRegService;
import camppy.member.MemberService;
import camppy.reserve.dao.Action;
import camppy.reserve.dao.ActionReserve;
import camppy.reserve.dao.ReserveDetailPro;

public class ReserveFrontAction extends HttpServlet {
	RequestDispatcher dispatcher = null;
	MemberService memberService = null;
	CampRegService campRegService = null;
	ReserveService reserveService = null;

// HttpServlet 처리담당자 -> 자동으로 doGet, doPost 호출
	// -> 재정의 해서 사용
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReserveController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReserveController doPost()");
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReserveController doProcess()");
		// 가상주소 뽑아오기
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 :  " + sPath);

		ActionReserve forward = null;
		// 부모 인터페이스 틀 선언
		Action action = null;

//	if(sPath.equals("/ProductWriteForm.pr")) {
//	
		if (sPath.equals("/ReserveDetailPro.re")) {
			forward = new ActionReserve();
			forward.setPath("reservepage/reserveDetail/reserve_detail.jsp");
//			forward.setPath("reservepage/mypageReserve/mypage_reserve.jsp");
			forward.setRedirect(false);

			action = new ReserveDetailPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (sPath.equals("/MyReservePro.re")) {
			action = new MyReservePro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

//------------------------------------------------------------------------		
			if (forward != null) {
				// 이동방식비교
				if (forward.isRedirect() == true) {
					response.sendRedirect(forward.getPath());
				} else {

					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}

		}
	}

}// doprocess
