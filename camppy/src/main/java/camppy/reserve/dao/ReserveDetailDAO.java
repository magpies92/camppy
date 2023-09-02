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
	
//	public void reserveDetail(ReserveDetailDTO dto) {
//		Connection con=null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			con=getConnection();
//			int res_id=1;
//			String sql="select max(res_id) from reservation";
//			pstmt=con.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				res_id=rs.getInt("max(res_id)")+1;
//			}
//
//			sql="insert into reservation(res_id,pno,no,astatus,adate) values(?,?,?,1,?)";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, res_id);  
//			pstmt.setInt(2, dto.getCamp_id()); 
//			pstmt.setInt(3, dto.getMember_id());
//			pstmt.setTimestamp(4, dto.get());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
//			if(con!=null) try { con.close();} catch (Exception e2) {}
//		}
//		return;
//	
	
	
	
	
	public List<ReserveDetailDTO> getReserveList(int member_id){
		String SQL = "select * from reservation where member_id=? order by res_id desc";
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

	public void insertReserve(ReserveDetailDTO reserveDetailDTO) {
		try {
			con=getConnection();
			String sql = "insert into reservation(checkout_date, res_status, member_id, res_time, camp_id, checkin_date, camp_price) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, reserveDetailDTO.getCheckout_date());
			pstmt.setInt(2, reserveDetailDTO.getRes_status());
			pstmt.setInt(3, reserveDetailDTO.getMember_id());
			pstmt.setTimestamp(4, reserveDetailDTO.getRes_time());
			pstmt.setInt(5, reserveDetailDTO.getCamp_id());
			pstmt.setString(6, reserveDetailDTO.getCheckin_date());
			pstmt.setInt(7, reserveDetailDTO.getCamp_price());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
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



//	
//	// pno로 펜션 조회
//			public CampRegDTO getCampReg(int camp_id) {
//				System.out.println("CampRegDTO getCampReg()");
//				CampRegDTO dto=null;
//				Connection con=null;
//				PreparedStatement pstmt=null;
//				ResultSet rs=null;
//				try {
//					con=getConnection();
//					String sql="select * from camp where camp_id=?";
//					pstmt=con.prepareStatement(sql);
//					pstmt.setInt(1, camp_id);
//					rs=pstmt.executeQuery();
//					while(rs.next()) {
//						dto = new CampRegDTO();
//						dto.setTel(rs.getString("tel"));
//						dto.setEnvironment(rs.getString("environment"));
//						dto.setCamptype(rs.getString("camptype"));
//						dto.setSeason(rs.getString("season"));
//						dto.setRuntime(rs.getString("runtime"));
//						dto.setHomepage(rs.getString("homepage"));
//						dto.setFacility(rs.getString("facility"));
//						dto.setCampimg(rs.getString("campimg"));
//						dto.setBankaccount(rs.getString("bankaccount"));
//						dto.setBankname(rs.getString("bankname"));
//						dto.setCampprice(rs.getString("campprice"));
//						dto.setDoo(rs.getString("doo"));
//						dto.setMapx(rs.getString("mapx"));
//						dto.setMapy(rs.getString("mapy"));
//						dto.setCampid(rs.getInt("campid"));
//						dto.setIntro(rs.getString("intro"));
//
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				}finally {
//					if(rs!=null) try { rs.close();} catch (Exception e2) {}
//					if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
//					if(con!=null) try { con.close();} catch (Exception e2) {}
//				}
//				return dto;
//			}//getCampReg()
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//}
