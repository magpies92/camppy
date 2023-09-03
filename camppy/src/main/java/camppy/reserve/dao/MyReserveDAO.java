package camppy.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;

import camppy.reserve.dao.MyReserveDTO;
import camppy.reserve.dao.PageDTO;

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

		public void insertReserve(MyReserveDTO myReserveDTO) {
			try {
				con=getConnection();
				String sql = "insert into reservation(checkout_date, res_status, member_id, res_time, camp_id, checkin_date, camp_price) values(?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setTimestamp(1, myReserveDTO.getCheckout_date());
				pstmt.setInt(2, myReserveDTO.getRes_status());
				pstmt.setInt(3, myReserveDTO.getMember_id());
				pstmt.setTimestamp(4, myReserveDTO.getRes_time());
				pstmt.setString(5, myReserveDTO.getCamp_id());
				pstmt.setTimestamp(6, myReserveDTO.getCheckin_date());
				pstmt.setInt(7, myReserveDTO.getCamp_price());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
		}
	
		
		
		
		
		// 리턴없음 insertMember(바구니주소)
		public void selectReserve(MyReserveDTO myReserveDTO) {
			try {
				//1,2 디비연결
				con = getConnection();
				//3 sql
				String sql="SELECT * FROM reservation(res_id,res_date,camp_name,checkin_date,checkout_date,res_status) values(?,?,?,?,?,?)";
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

//		public boolean nextPage(int pageNumber) {
//			String SQL = "SELECT * FROM reservation WHERE member_id < ? AND reserveAvailable = 1";
//			try {
//				PreparedStatement pstmt = con.prepareStatement(SQL);
//				//pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					return true;
//				}
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return false;
//		}
		
		
		public List<MyReserveDTO> getMyReserveList2(int res_id, int startRow, int pageSize){
			String SQL = "select * from Reservation where res_id=? order by res_id desc limit ?, ?";
			List<MyReserveDTO> list = new ArrayList<MyReserveDTO>();
			try {
				con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(SQL);
				 pstmt.setInt(1, res_id);
				 pstmt.setInt(2, startRow-1);
				 pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MyReserveDTO myReserveDTO = new MyReserveDTO();
					myReserveDTO.setRes_id(rs.getInt("res_id"));
					myReserveDTO.setRes_status(rs.getInt("res_status"));
					myReserveDTO.setCamp_price(rs.getInt("camp_price"));
					myReserveDTO.setRes_time(rs.getTimestamp("res_time"));
					myReserveDTO.setCheckin_date(rs.getTimestamp("checkin_date"));
					myReserveDTO.setCheckout_date(rs.getTimestamp("checkout_date"));
					myReserveDTO.setCamp_id(rs.getString("camp_id"));
					myReserveDTO.setCamp_price(rs.getInt("member_id"));
					list.add(myReserveDTO);	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return list;
		}
		
		
		
		
		public List<MyReserveDTO> getMyReserveList1(int res_id, int startRow, int pageSize){
			String SQL = "select * from reservation order by res_id desc where res_id=?";
			List<MyReserveDTO> list = new ArrayList<MyReserveDTO>();
			try {
				con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(SQL);
				 pstmt.setInt(1, res_id);
				 pstmt.setInt(2, startRow-1);
				 pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MyReserveDTO myReserveDTO = new MyReserveDTO();
					myReserveDTO.setRes_id(rs.getInt("res_id"));
					myReserveDTO.setRes_status(rs.getInt("res_status"));
					myReserveDTO.setCamp_price(rs.getInt("camp_price"));
					myReserveDTO.setRes_time(rs.getTimestamp("res_time"));
					myReserveDTO.setCheckin_date(rs.getTimestamp("checkin_date"));
					myReserveDTO.setCheckout_date(rs.getTimestamp("checkout_date"));
					myReserveDTO.setCamp_id(rs.getString("camp_id"));
					myReserveDTO.setCamp_price(rs.getInt("member_id"));
					list.add(myReserveDTO);	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return list;
		}
		
	
		
		
		
		
		
		
		
		public List<MyReserveDTO> getPageList(PageDTO pageDTO) {
			System.out.println("MyReserveDAO getPageList()");
			List<MyReserveDTO> pageList = null;
			try {
				//1,2 디비연결
				con = getConnection();
				//3 sql  => mysql 제공 => limit 시작행-1, 몇개
//				String sql="select * from board order by num desc";
				String sql="select * from reservation order by res_id desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pageDTO.getStartRow()-1);//시작행-1
				pstmt.setInt(2, pageDTO.getPageSize());//몇개
				//4 실행 => 결과 저장
				rs = pstmt.executeQuery();
				// boardList 객체생성
				pageList = new ArrayList<>();
				//5 결과 행접근 => BoardDTO객체생성 => set호출(열접근저장)
				// => 배열 한칸에 저장
				while(rs.next()) {
					MyReserveDTO myReserveDTO =new MyReserveDTO();
					myReserveDTO.setRes_id(rs.getInt("res_id"));
					myReserveDTO.setCamp_id(rs.getString("camp_id"));
					myReserveDTO.setRes_time(rs.getTimestamp("res_time"));
					myReserveDTO.setCheckin_date(rs.getTimestamp("checkin_date"));
					myReserveDTO.setCheckout_date(rs.getTimestamp("checkout_date"));
					myReserveDTO.setRes_status(rs.getInt("res_status"));
					myReserveDTO.setMember_id(rs.getInt("member_id"));
					myReserveDTO.setCamp_price(rs.getInt("camp_price"));
					
					// => 배열 한칸에 저장
					pageList.add(myReserveDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return pageList;
		}//getPageList()

		
		public int getReserveCount() {
			int count = 0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql select count(*) from board
				String sql = "select count(*) from reservation;";
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
		}//getBoardCount()
		
		
		public MyReserveDTO getReserve(int res_id) {
			MyReserveDTO myReserveDTO = null;
			try {
				//1,2 디비연결
				con = getConnection();
				//3 sql select * from board where num = ?
				String sql="select * from reservation where res_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, res_id);
				//4 실행 => 결과 저장
				rs = pstmt.executeQuery();
				//5 결과 행접근 => boardDTO 객체생성 
				//        => set메서드 호출 => 열접근 데이터 저장
				if(rs.next()) {
					myReserveDTO = new MyReserveDTO();
					myReserveDTO.setMember_id(rs.getInt("member_id"));
					myReserveDTO.setRes_status(rs.getInt("res_status"));
					myReserveDTO.setCheckin_date(rs.getTimestamp("checkin_date"));
					myReserveDTO.setCheckout_date(rs.getTimestamp("checkout_date"));
					myReserveDTO.setRes_time(rs.getTimestamp("res_time"));
					myReserveDTO.setCamp_id(rs.getString("camp_id"));
					myReserveDTO.setCamp_price(rs.getInt("camp_price"));
					//첨부파일
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return myReserveDTO;
		}//getBoard
		
		
		
		
		public int getMaxNum() {
			System.out.println("MyReserve getMaxNum()");
			int res_id = 0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql select max(num) from members
				String sql = "select max(res_id) from reservation;";
				pstmt=con.prepareStatement(sql);
				//4 실행 => 결과저장
				rs =pstmt.executeQuery();
				//5 if 다음행  => 열데이터 가져와서 => num저장
				if(rs.next()) {
					res_id = rs.getInt("max(res_id)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return res_id;
		}//getMaxNum()
		
		
		
		public void deleteReserve(int res_id) {
			Connection con =null;
			PreparedStatement pstmt2=null;
			try {
				con=getConnection();
				String sql2="delete from reservation where res_id=?";
				pstmt2=con.prepareStatement(sql2);
				pstmt2.setInt(1, res_id);  //set 문자열 (1번째 물음표, 값 id)
				pstmt2.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//deleteAppointment()
		
		
		
	
}
