package camppy.member;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import camppy.member.MemberDAO;
import camppy.member.MemberDTO;
public class MemberService {
	MemberDAO memberDAO = null;
	
	public void insertMember(HttpServletRequest request) {
		System.out.println("MemberService insertMember()");
		
		try {
			// http://localhost:8080/webProject/jsp3/insertPro.jsp?id=kim&pass=123&name=홍길동
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request 한글처리
			request.setCharacterEncoding("utf-8");
			// request id, pass,name 가져와서 -> 변수에 저장
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			// 회원가입날짜 -> 시스템날짜 java.sql.Timestam
			String nick = request.getParameter("nick");
			String phone = request.getParameter("phone");
			// id,pass,name,date -> 하나의 파일(바구니)에 저장
			// com.itwillbs.domain.MemberDTO 자바파일 
			// -> id,pass,name,date 멤버변수 담기(저장)
			
			// MemberDTO 객체생성(기억장소 할당)
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 값을 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			memberDTO.setNick(nick);
			memberDTO.setPhone(phone);
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// insertMember() 메서드 정의 
		// => MemberDTO 데이터(id,pass,name,date)가 저장된 주소값을 들고감 
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}//insertMember()
	
	
	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		//MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			request.setCharacterEncoding("utf-8");
			//http://localhost:8080/webProject/jsp3/loginPro.jsp?id=kim&pass=123
			//사용자가 입력한 정보(폼)를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 id, pass 가져와서 -> 변수에 저장
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
	        // MemberDTO memberDTO = userCheck() 메서드 호출
			memberDTO = memberDAO.userCheck(id,pass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
		
	}// userCheck(request)
	
	public MemberDTO userCheck2(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		//MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			//http://localhost:8080/webProject/jsp3/loginPro.jsp?id=kim&pass=123
			//사용자가 입력한 정보(폼)를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 id, pass 가져와서 -> 변수에 저장
			String id = request.getParameter("id");
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
	        // MemberDTO memberDTO = userCheck() 메서드 호출
			memberDTO = memberDAO.userCheck2(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
		
	}// userCheck(request)
	
	// MemberDTO memberDTO = getMember(id) 메서드 호출
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			memberDTO=memberDAO.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//getMember()
	
	public MemberDTO getMember2(String nick) {
		MemberDTO memberDTO = null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			memberDTO=memberDAO.getMember2(nick);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//getMember()

	public MemberDTO updateMember(HttpServletRequest request) {
	    MemberDTO memberDTO = null;
	    try {
	    	String uploadPath=request.getRealPath("memberimg");
			// 이클립스에 실행하면 이클립스 가상경로 
			System.out.println(uploadPath);
			//파일 최대크기 지정  10M
			int maxSize=10*1024*1024; 
			// 파일 업로드 했을때 폴더내 파일이름 동일하면 파일이름 변경하는 프로그램
			//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
			// new DefaultFileRenamePolicy()
			MultipartRequest multi 
			= new MultipartRequest(request, uploadPath, maxSize,"utf-8", new DefaultFileRenamePolicy()); 
			String memberimg = multi.getFilesystemName("memberimg");
		
			
			memberDAO = new MemberDAO();
			String id = multi.getParameter("id");
	        String pass = multi.getParameter("pass");
	        String nick = multi.getParameter("nick");
	        memberDTO = new MemberDTO();
	        memberDTO.setId(id);
	        memberDTO.setPass(pass);
	        memberDTO.setNick(nick);
	        memberDTO.setMember_img(memberimg);
	        memberDAO.updateMember(memberDTO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return memberDTO;
	}


	public void deleteMember(HttpServletRequest request) {
		System.out.println("MemberService deleteMember()");
		try {
			request.setCharacterEncoding("utf-8");
			// request id, pass 가져와서 => 변수 저장
			String id = request.getParameter("id");
						
			// MemberDTO memberDTO 객체생성
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 id, pass,name 저장
			memberDTO.setId(id);
						
			// MemberDAO memberDAO 객체생성
			memberDAO = new MemberDAO(); 
			// deleteMember(memberDTO) 메서드 호출
			memberDAO.deleteMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//deleteMember()


	public List<MemberDTO> getMemberList() {
		System.out.println("MemberService getMemberList()");
		List<MemberDTO> memberList=null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
           //  memberList =   getMemberList() 호출
			memberList = memberDAO.getMemberList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}//getMemberList()
	
	

	
	
}//class
