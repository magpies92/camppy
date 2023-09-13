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

import camppy.reserve.dao.ReserveDetailDTO;
//import products.SalesDTO;

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
	

	
	
	
	
	public List<ReserveDetailDTO> getReserveList(PageDTO pageDTO){
		String SQL = "select * from reservation r left join camp c on (r.camp_id = c.camp_id) where r.member_id=? order by r.res_id desc limit ?,?;";
		List<ReserveDetailDTO> list = new ArrayList<ReserveDetailDTO>();
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			 pstmt.setInt(1, pageDTO.getMember_id());
			 pstmt.setInt(2, pageDTO.getStartRow()-1);
			 pstmt.setInt(3, pageDTO.getPageSize());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
				reserveDetailDTO.setMember_id(rs.getInt("member_id"));
				reserveDetailDTO.setRes_id(rs.getInt("res_id"));
				reserveDetailDTO.setRes_status(rs.getInt("res_status"));
				reserveDetailDTO.setRes_time(rs.getTimestamp("res_time"));
				reserveDetailDTO.setCamp_price(rs.getInt("camp_price"));
				reserveDetailDTO.setCheckin_date(rs.getString("checkin_date"));
				reserveDetailDTO.setCheckout_date(rs.getString("checkout_date"));
				reserveDetailDTO.setCamp_id(rs.getInt("camp_id"));
				reserveDetailDTO.setCamp_name(rs.getString("camp_name"));
				reserveDetailDTO.setSprice(rs.getInt("sprice"));
				reserveDetailDTO.setReview_check(rs.getInt("review_check"));
				reserveDetailDTO.setBankname(rs.getString("bank_name"));
				reserveDetailDTO.setBankaccount(rs.getString("bank_account"));
				list.add(reserveDetailDTO);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public List<ReserveDetailDTO> getReserveList1(PageDTO pageDTO){
		String SQL = "select * from reservation order by res_id desc limit ?,?";
		List<ReserveDetailDTO> list = new ArrayList<ReserveDetailDTO>();
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			 
			 pstmt.setInt(1, pageDTO.getStartRow()-1);
			 pstmt.setInt(2, pageDTO.getPageSize());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
				reserveDetailDTO.setMember_id(rs.getInt("member_id"));
				reserveDetailDTO.setRes_id(rs.getInt("res_id"));
				reserveDetailDTO.setRes_status(rs.getInt("res_status"));
				reserveDetailDTO.setRes_time(rs.getTimestamp("res_time"));
				reserveDetailDTO.setCamp_price(rs.getInt("camp_price"));
				reserveDetailDTO.setCheckin_date(rs.getString("checkin_date"));
				reserveDetailDTO.setCheckout_date(rs.getString("checkout_date"));
				reserveDetailDTO.setCamp_id(rs.getInt("camp_id"));
				reserveDetailDTO.setCamp_name(rs.getString("camp_name"));
				reserveDetailDTO.setSprice(rs.getInt("sprice"));
				list.add(reserveDetailDTO);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public ReserveDetailDTO getDetailList(int camp_id){
		System.out.println("ReserveDetailDTO getReserveList2");
		ReserveDetailDTO dto=null;
//		List<ReserveDetailDTO> list = new ArrayList<ReserveDetailDTO>();
		try {
			con = getConnection();
			String SQL = "select * from reservation where camp_id=? order by res_id desc";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			 pstmt.setInt(1, camp_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
				dto.setMember_id(rs.getInt("member_id"));
				dto.setRes_id(rs.getInt("res_id"));
				dto.setRes_status(rs.getInt("res_status"));
				dto.setCamp_price(rs.getInt("camp_price"));
				dto.setCheckin_date(rs.getString("checkin_date"));
				dto.setCheckout_date(rs.getString("checkout_date"));
				dto.setCamp_id(rs.getInt("camp_id"));
				dto.setCamp_name(rs.getString("camp_name"));
				dto.setSprice(rs.getInt("sprice"));
				
				//list.add(reserveDetailDTO);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return dto;
	}
	
	
	public int getReserveCount(PageDTO pageDTO) {
		int count = 0;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql select count(*) from board
			String sql = "select count(*) from reservation where member_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getMember_id());
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => 열접근 => count변수 저장
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	}//getBoardCount()
	
	public int getReserveCount1(PageDTO pageDTO) {
		int count = 0;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql select count(*) from board
			String sql = "select count(*) from reservation";
			pstmt=con.prepareStatement(sql);
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => 열접근 => count변수 저장
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	}
	
	// 예약취소
		public void deleteReserveDetail(int res_id) {
			Connection con =null;
			PreparedStatement pstmt=null;
			try {
				con=getConnection();
				String sql2="delete from reservation where res_id=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setInt(1, res_id);  //set 문자열 (1번째 물음표, 값 id)
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//deleteReserveDetail()
	
	
	
	public boolean checkCamp(int camp_id, String checkin_date, String checkout_date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checksCamp = true;
		try {
			con = getConnection();
			String sql = "select * from reservation where camp_id=? && ? >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, camp_id);
			pstmt.setString(2, checkin_date);
			pstmt.setString(3, checkout_date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checksCamp = true;
			} else {
				checksCamp = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return checksCamp;
	}
	
	public boolean checkCamp2(int camp_id, String checkin_date, String checkout_date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkCamp2 = true;
		try {
			con = getConnection();
			String sql = "select * from reservation where camp_id=? && res_id in (select res_id from reservation where (checkin_date >= ? && checkin_date < ?)|| (checkout_date > ? && checkout_date <= ?))";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, camp_id);
			pstmt.setString(2, checkin_date);
			pstmt.setString(3, checkout_date);
			pstmt.setString(4, checkin_date);
			pstmt.setString(5, checkout_date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkCamp2 = true;
			} else {
				checkCamp2 = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return checkCamp2;
	}
	
	
	
	
	

	public void insertReserve(ReserveDetailDTO reserveDetailDTO) {
		try {
			con=getConnection();
			String sql = "insert into reservation(checkout_date, res_status, member_id, res_time, camp_id, checkin_date, camp_price, sprice, camp_name) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, reserveDetailDTO.getCheckout_date());
			pstmt.setInt(2, reserveDetailDTO.getRes_status());
			pstmt.setInt(3, reserveDetailDTO.getMember_id());
			pstmt.setTimestamp(4, reserveDetailDTO.getRes_time());
			pstmt.setInt(5, reserveDetailDTO.getCamp_id());
			pstmt.setString(6, reserveDetailDTO.getCheckin_date());
			pstmt.setInt(7, reserveDetailDTO.getCamp_price());
			pstmt.setInt(8, reserveDetailDTO.getSprice());
			pstmt.setString(9, reserveDetailDTO.getCamp_name());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}



public ReserveDetailDTO getDetailres(int res_id) {
	ReserveDetailDTO dto=null;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		con=getConnection();
		String sql="select * from reservation where res_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, res_id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			dto=new ReserveDetailDTO();
			dto.setRes_id(rs.getInt("res_id"));
			dto.setCamp_id(rs.getInt("camp_id"));
			dto.setRes_time(rs.getTimestamp("res_time"));
			dto.setCheckin_date(rs.getString("checkin_date"));
			dto.setCheckout_date(rs.getString("checkout_date"));
			dto.setSprice(rs.getInt("sprice"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(rs!=null) try { rs.close();} catch (Exception e2) {}
		if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
		if(con!=null) try { con.close();} catch (Exception e2) {}
	}
	return dto;
}//getDetailres()



public List<ReserveDetailDTO> getDatelist(int camp_id){
	
	List<ReserveDetailDTO> datelist = null;
	try {
		con = getConnection();
		String SQL = "select * from reservation where camp_id=? order by checkin_date";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		 pstmt.setInt(1, camp_id);
		rs = pstmt.executeQuery();
		datelist = new ArrayList<>();
		while(rs.next()) {
			ReserveDetailDTO reserveDetailDTO = new ReserveDetailDTO();
			
			reserveDetailDTO.setCheckin_date(rs.getString("checkin_date"));
			reserveDetailDTO.setCheckout_date(rs.getString("checkout_date"));
			
			datelist.add(reserveDetailDTO);	
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		dbClose();
	}
	return datelist;
}

}


	

//	public boolean nextPage(int pageNumber) {
//		String SQL = "SELECT * FROM MyReserveDTO WHERE memberID < ? AND reserveAvailable = 1";
//		try {
//			PreparedStatement pstmt = con.prepareStatement(SQL);
//			//pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				return true;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		return false;
//	}
//