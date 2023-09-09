package camppy.reserve.action;

import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import camppy.member.MemberDAO;
import camppy.member.MemberDTO;
import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.MyReserveDTO;
import camppy.reserve.dao.ReserveDetailDAO;
import camppy.reserve.dao.ReserveDetailDTO;
//import products.SalesDAO;
//import products.SalesDTO;

public class MyListPro implements Action{

	@Override
	public ActionReserve execute(HttpServletRequest request, HttpServletResponse response) throws Exception, ParseException {
		
		System.out.println("MemberMyList execute()");
		
		// 아이디 세션 값
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		// 유저정보 no 값
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(id);
		int member_id = mdto.getMember_id();
		
		return null;
		
		
		
	
		
		
		
		
		
	}
	
	
	
	
}
