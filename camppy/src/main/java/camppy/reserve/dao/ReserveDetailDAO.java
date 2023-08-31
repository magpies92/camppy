package camppy.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		DataSource ds=	(DataSource)init.lookup("java:comp/env/c1d2304t3");
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
	
	
	public List<ReserveDetailDTO> getReserveList(int member_id){
		String SQL = "select * from reservation order by res_id desc where member_id=?";
		List<ReserveDetailDTO> list = new ArrayList<ReserveDetailDTO>();
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			 pstmt.setInt(1, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
				reserveDetailDTO.setMember_id(rs.getInt("member_id"));
				reserveDetailDTO.setRes_id(rs.getInt("res_id"));
				reserveDetailDTO.setRes_status(rs.getInt("res_status"));
				reserveDetailDTO.setCamp_price(rs.getInt("camp_price"));
				reserveDetailDTO.setCheckin_date(rs.getString("checkin_date"));
				reserveDetailDTO.setCheckout_date(rs.getString("checkout_date"));
				reserveDetailDTO.setCamp_id(rs.getInt("camp_id"));
				list.add(reserveDetailDTO);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
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
		}finally {
			dbClose();
		}
		return false;
	}

	public void insertReserve(ReserveDetailDTO reserveDetailDTO) {
		try {
			con=getConnection();
			String sql = "insert into reservation(checkout_date, res_status, member_id, res_time, camp_id, checkin_date) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, reserveDetailDTO.getCheckout_date());
			pstmt.setInt(2, reserveDetailDTO.getRes_status());
			pstmt.setInt(3, reserveDetailDTO.getMember_id());
			pstmt.setTimestamp(4, reserveDetailDTO.getRes_time());
			pstmt.setInt(5, reserveDetailDTO.getCamp_id());
			pstmt.setString(6, reserveDetailDTO.getCheckin_date());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
