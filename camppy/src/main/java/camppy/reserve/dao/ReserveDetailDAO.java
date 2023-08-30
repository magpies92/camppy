package camppy.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReserveDetailDAO {
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
	
	
	public ArrayList<ReserveDetailDTO> getList(int pageNumber){
		String SQL = "select camp_name, camp_price from camp ORDER BY camp_name;";
		ArrayList<ReserveDetailDTO> list = new ArrayList<ReserveDetailDTO>();
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			// pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
//				reserveDetailDTO.setMember_id(rs.getString(1));
				System.out.println(rs.getInt(1));
//				reserveDetailDTO.setTel(rs.getString(2));
				reserveDetailDTO.setCamp_name(rs.getString(1));
				reserveDetailDTO.setCamp_price(rs.getString(2));
//				reserveDetailDTO.setCheckin_date(rs.getString(5));
//				reserveDetailDTO.setCheckout_date(rs.getString(6));
//				reserveDetailDTO.setMax_men(rs.getString(7));
				list.add(reserveDetailDTO);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM MyReserveDTO WHERE memberID < ? AND reserveAvailable = 1";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			//pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
