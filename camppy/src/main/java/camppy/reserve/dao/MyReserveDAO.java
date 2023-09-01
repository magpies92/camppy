package camppy.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camppy.main.action.CampRegDTO;
import camppy.reserve.dao.MyReserveDAO;

public class MyReserveDAO {
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

		
		// 리턴없음 insertMember(바구니주소)
		public void selectReserve(MyReserveDTO myReserveDTO) {
			try {
				//1,2 디비연결
				con = getConnection();
				//3 sql
				String sql="SELECT * FROM reservation(reservation_id,res_date,camp_name,checkin_date,checkout_date,res_status) values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, myReserveDTO.getRes_id());
				pstmt.setTimestamp(2, myReserveDTO.getRes_time());
				pstmt.setString(3, myReserveDTO.getCamp_id());
				pstmt.setTimestamp(4, myReserveDTO.getCheckin_date());
				pstmt.setTimestamp(5, myReserveDTO.getCheckout_date());
				pstmt.setInt(6, myReserveDTO.getRes_status());
				
				//4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();			
			}finally {
				dbClose();
		}
}
		public String getRes_date() {
			String SQL = "SELECT NOW()";
			try {
				PreparedStatement pstmt = con.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "";
		}
		
//		public int getNext() {
//			String SQL = "SELECT memberID FROM MyReserveDTO ORDER BY memberID DESC";
//			try {
//				PreparedStatement pstmt = con.prepareStatement(SQL);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					return rs.getInt(1) + 1;
//				}
//				return 1;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return -1;
//		}
		
		
		public ArrayList<MyReserveDTO> getList(int pageNumber){
			String SQL = "select res_id, res_time, camp_id, checkin_date, checkout_date, res_status from reservation ORDER BY res_id;";
			ArrayList<MyReserveDTO> list = new ArrayList<MyReserveDTO>();
			try {
				con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(SQL);
				// pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MyReserveDTO myReserveDTO = new MyReserveDTO();
					myReserveDTO.setRes_id(rs.getInt(1));
					System.out.println(rs.getInt(1));
					myReserveDTO.setRes_time(rs.getTimestamp(2));
					myReserveDTO.setCamp_id(rs.getString(3));
					myReserveDTO.setCheckin_date(rs.getTimestamp(4));
					myReserveDTO.setCheckout_date(rs.getTimestamp(5));
					myReserveDTO.setRes_status(rs.getInt(6));
					list.add(myReserveDTO);	
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
		
		public MyReserveDTO getMyReserve(int res_id) {
			MyReserveDTO myReserveDTO = null;
			try {
				//1,2 디비연결
				con = getConnection();
				//3 sql select * from campreg where num = ?
				String sql="select * from reservation where res_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, res_id);
				//4 실행 => 결과 저장
				rs = pstmt.executeQuery();
				//5 결과 행접근 => campregDTO 객체생성 
				//        => set메서드 호출 => 열접근 데이터 저장
				if(rs.next()) {
					myReserveDTO = new MyReserveDTO();
					myReserveDTO.setRes_id(rs.getInt("res_id"));
					myReserveDTO.setCamp_id(rs.getString("camp_id"));
					myReserveDTO.setRes_status(rs.getInt("res_status"));
					myReserveDTO.setRes_time(rs.getTimestamp("res_time"));
					myReserveDTO.setCamp_price(rs.getInt("camp_price"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return myReserveDTO;
		}//getCampReg
	
	
}
