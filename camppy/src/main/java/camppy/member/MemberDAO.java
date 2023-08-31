package camppy.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import camppy.member.MemberDTO;

public class MemberDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		// throws Exception => 메서드 호출한 곳에서 예외처리하도록 함
		
//		// 1단계 JDBC 프로그램 가져오기 
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		// 2단계 디비 연결
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
//		String dbUser="root";
//		String dbPass="1234";
//		Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		// 서버에서 미리 디비연결을 하고 연결한 자원의 이름을
		// 불러서 사용
		// DBCP (DataBase Connection Pool)
		// 프로그램 설치 => 미리 서버에 설치 되어있음
		// webapp - META-INF - context.xml 만들기
		// => 서버에서 미리 디비연결
		
		// context.xml 불러오기위해 Context 객체생성
		// import javax.naming.Context;
		// import javax.naming.InitialContext;
		Context init = new InitialContext();
		// lookup 메서드 (자원위치/자원이름 불러오기)
		// import javax.sql.DataSource;
		DataSource ds=
				(DataSource)init.lookup("java:comp/env/c1d2304t3");
		// 디비연결
		Connection con=ds.getConnection();
		return con;
		// 작업 속도가 빨라짐(1,2 단계 생략)=> 성능향상
		// 디비연결 정보를 context.xml에서만 수정하면 모든 자바파일 수정 됨 
	}
	
	//기억장소 해제 메서드()
	public void dbClose() {
		// 예외 상관 없이 마무리 작업 
					//  => con, pstmt, rs 기억장소 해제
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	public void insertMember(MemberDTO memberDTO) {
		// 바구니 주소값을 담을 변수
		// String id,String pass,String name,Timestamp date
		System.out.println("MemberDAO insertMember()");
		System.out.println("바구니(MemberDTO) 주소값 : " + memberDTO);
		System.out.println("주소를 찾아가서 id값 가져오기 : " + memberDTO.getId());
		System.out.println("주소를 찾아가서 pass값 가져오기 : " + memberDTO.getPass());
		System.out.println("주소를 찾아가서 name값 가져오기 : " + memberDTO.getName());
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con=getConnection();
			
			// 3단계 문자열 -> sql구문 변경
			String sql = "insert into members(id,pass,name,nickname,phonenum) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());      //(물음표 순서,값)
			pstmt.setString(2, memberDTO.getPass()); 
			pstmt.setString(3, memberDTO.getName());
			pstmt.setString(4, memberDTO.getNick());
			pstmt.setString(5, memberDTO.getPhone());
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}//insertMember()
	
	public MemberDTO userCheck(String id,String pass) {
		System.out.println("MemberDAO userCheck()");
		// MemberDTO 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = getConnection();

			// 3단계 문자열 -> sql구문 변경
			//  select * from members where id=폼입력id and pass=폼입력pass
			String sql = "select * from members where id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
			rs =pstmt.executeQuery();
			// out.println(pstmt);

			//5단계 : if  행 접근 -> 데이터 있으면 true -> 아이디 비밀번호 일치 출력
//			       else              없으면 false -> 아이디 비밀번호 틀림 출력
			if(rs.next()){
				//true 아이디 비밀번호 일치 => 세션값 => main.jsp 이동
				// 열접근 id,pass,name,date => MemberDTO 담아서 리턴
// MemberDTO 객체생성=> 기억장소 할당=> id,pass,name,date 값 저장
				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
			}else{
				//false 아이디 비밀번호 틀림, 뒤로이동
				// 열접근 못함 => MemberDTO null 담아서 리턴
				memberDTO=null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		// 아이디 비밀번호 일치하면  MemberDTO 주소값 리턴;
		// 아이디 비밀번호 틀리면 MemberDTO null 리턴
		return memberDTO;
		
	}// userCheck()
	
	// MemberDTO memberDTO = getMember(id) 메서드 호출
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = getConnection();
			// 3단계 문자열 -> sql구문 변경
		//  select * from members where id=폼입력id
		String sql = "select * from members where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);

		//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
		rs =pstmt.executeQuery();

		//5단계 : if  행 접근 -> 데이터 있으면 true 
//		     -> 아이디 비밀번호 이름 가입날짜 출력
		if(rs.next()){
			// => MemberDTO 객체생성 -> 기억장소 할당
			// -> 멤버변수에 rs 열에서 가져온값을 저장
			memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPass(rs.getString("pass"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setDate(rs.getTimestamp("created_date"));
			memberDTO.setPhone(rs.getString("phonenum")); 
			memberDTO.setNick(rs.getString("nickname")); 
			memberDTO.setMember_id(rs.getInt("member_id"));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberDTO;
	}//getMember()

	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updateMember()");
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con=getConnection();
			
			// 3단계 문자열 -> sql구문 변경
			String sql = "update members set nick = ? where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getNick());
			pstmt.setString(2, memberDTO.getId());      //(물음표 순서,값)
			
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}//updateMember()

	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO deleteMember()");
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con=getConnection();
			
			// 3단계 문자열 -> sql구문 변경
			String sql = "delete from members where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());      //(물음표 순서,값)
			
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//deleteMember()

	public List<MemberDTO> getMemberList() {
		System.out.println("MemberDAO getMemberList()");
		List<MemberDTO> memberList = null;
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = getConnection();
			// 3단계 문자열 -> sql구문 변경
			//  select * from members
			String sql = "select * from members";
			pstmt=con.prepareStatement(sql);

			//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
			rs =pstmt.executeQuery();

			//5단계 : while  행 접근 -> 데이터 있으면 true 
//			-> 아이디 비밀번호 이름 가입날짜 => MemberDTO 저장 => 배열한칸
			// 배열 객체생성 => 기억장소 할당
			memberList = new ArrayList<>();
			while(rs.next()){
				// => MemberDTO 객체생성 -> 기억장소 할당
				// -> 멤버변수에 rs 열에서 가져온값을 저장
				MemberDTO memberDTO = new MemberDTO();
				System.out.println("회원한명 : "+memberDTO);
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
				// 한 사람의 주소를 배열 한칸에 저장
				memberList.add(memberDTO);
			}
			System.out.println("배열 회원여러명 : "+memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberList;
	}//getMemberList()
	
	
	
}//class
