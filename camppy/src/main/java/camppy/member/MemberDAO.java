package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=	(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		// 디비연결
		Connection con=ds.getConnection();
		return con;
	}
	
	//기억장소 해제 메서드()
	public void dbClose() {
		// 예외 상관 없이 마무리 작업 
					//  => con, pstmt, rs 기억장소 해제
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	
	// 리턴없음 insertMember(바구니주소)
	public void insertMember(MemberDTO memberDTO) {
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql
			String sql="insert into members(id,pass,name,date) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPass());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setTimestamp(4, memberDTO.getDate());
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO2) {
		MemberDTO memberDTO =null;
		try {
			//1,2 단계 디비연결
			con=getConnection();
			//3단계 sql
			String sql = "select * from members where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO2.getId());
			pstmt.setString(2, memberDTO2.getPass());
			//4단계 실행
			rs = pstmt.executeQuery();
			//5단계 데이터 있으면 MemberDTO 객체생성 set호출해서 열 값을 저장
			if(rs.next()) {
				memberDTO=new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return memberDTO;
	}
	
}
