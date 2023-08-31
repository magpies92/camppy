package camppy.main.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camppy.main.action.CampRegDTO;
import camppy.main.action.PageDTO;

public class CampRegDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	ResultSet rs =null;
	
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=
		(DataSource)init.lookup("java:comp/env/c1d2304t3");
		con=ds.getConnection();
		return con;
	}
	//기억장소 해제 메서드()
	public void dbClose() {
		//  => con, pstmt, rs 기억장소 해제
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
	
	public List<CampRegDTO> getCampRegList(int campid) {
		System.out.println("CampRegDAO getCampRegList()");
		List<CampRegDTO> campregList = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql  => mysql 제공 => limit 시작행-1, 몇개
			String sql="select * from camp where camp_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, campid);
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			// campregList 객체생성
			campregList = new ArrayList<>();
			//5 결과 행접근 => CampRegDTO객체생성 => set호출(열접근저장)
			// => 배열 한칸에 저장
			if(rs.next()) {
				CampRegDTO campregDTO =new CampRegDTO();
				campregDTO.setCampimg("camp_img");
				campregDTO.setCampname("camp_name");
				// => 배열 한칸에 저장
				campregList.add(campregDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregList;
	}//getCampRegList()
	
//	public int getMaxNum() {
//		System.out.println("CampRegDAO getMaxNum()");
//		int num = 0;
//		try {
//			//1,2 디비연결
//			con=getConnection();
//			//3 sql select max(num) from members
//			String sql = "select max(num) from campreg;";
//			pstmt=con.prepareStatement(sql);
//			//4 실행 => 결과저장
//			rs =pstmt.executeQuery();
//			//5 if 다음행  => 열데이터 가져와서 => num저장
//			if(rs.next()) {
//				num = rs.getInt("max(num)");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		return num;
//	}//getMaxNum()
	
	public void insertCampReg(CampRegDTO campregDTO) {
		System.out.println("CampRegDAO insertCampReg()");
		// campreg테이블 file 열추가
		// mysql -uroot -p1234 jspdb
		// file컬럼 추가
		// alter table campreg
		// add file varchar(100);
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql insert
			String sql = "insert into camp(homepage,camp_type,intro,runtime,season,facility,tel,environment,bank_account,camp_name,short_intro,camp_img,camp_price,bank_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			    //(물음표 순서,값)
			pstmt.setString(1, campregDTO.getHomepage());
			pstmt.setString(2, campregDTO.getCamptype());
			pstmt.setString(3, campregDTO.getIntro());
			pstmt.setString(4, campregDTO.getRuntime());
			pstmt.setString(5, campregDTO.getSeason());
			pstmt.setString(6, campregDTO.getFacility());
			pstmt.setString(7, campregDTO.getTel());
			pstmt.setString(8, campregDTO.getEnvironment());
			pstmt.setString(9, campregDTO.getBankaccount());
			pstmt.setString(10, campregDTO.getCampname());
			pstmt.setString(11, campregDTO.getShortintro());
			pstmt.setString(12, campregDTO.getCampimg()); 
			pstmt.setString(13, campregDTO.getCampprice());
			pstmt.setString(14, campregDTO.getBankname()); 
			pstmt.executeUpdate();
			
			
			System.out.println("CampRegDAO getMaxNum()");
			int num = 0;
//			try {
//				//1,2 디비연결
//				con=getConnection();
//				//3 sql select max(num) from members
//				String sql = "select max(num) from campreg;";
//				pstmt=con.prepareStatement(sql);
//				//4 실행 => 결과저장
//				rs =pstmt.executeQuery();
//				//5 if 다음행  => 열데이터 가져와서 => num저장
//				if(rs.next()) {
//					num = rs.getInt("max(num)");
//				}
			String sql1 = "select * from camp ORDER BY camp_id DESC LIMIT 1";
			pstmt1=con.prepareStatement(sql1);
			//4 실행 => 결과저장/			
			rs =pstmt1.executeQuery();
			//5 if 다음행  => 열데이터 가져와서 => num저장
			if(rs.next()) {
				num = rs.getInt("camp_id");
			}			
			sql1 = "insert into camp_pic(camp_id,pic) values(?,?)";
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, num);		
			pstmt1.setString(2, campregDTO.getCamppic());	
			pstmt1.executeUpdate();			
		
			
			String sql2 = "insert into camp_tag(camp_id,tag) values(?,?)";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, num);	
			pstmt2.setString(2, campregDTO.getCamptag());
//								//파일추가
//	
			pstmt2.executeUpdate();
//			
			String sql3 = "insert into camp_addr(camp_id,camp_addr,do_nm,sigungu_nm,mapx,mapy) values(?,?,?,?,?,?)";
			pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, num);	
			pstmt3.setString(2, campregDTO.getCampaddr());
			pstmt3.setString(3, campregDTO.getDoo());
			pstmt3.setString(4, campregDTO.getSigungu());
			pstmt3.setString(5, campregDTO.getMapx());
			pstmt3.setString(6, campregDTO.getMapy());
			pstmt3.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//insertCampReg()
//	
//	public int getCampRegCount() {
//		int count = 0;
//		try {
//			//1,2 디비연결
//			con=getConnection();
//			//3 sql select count(*) from campreg
//			String sql = "select count(*) from campreg;";
//			pstmt=con.prepareStatement(sql);
//			//4 실행 => 결과저장
//			rs = pstmt.executeQuery();
//			//5 결과 행접근 => 열접근 => count변수 저장
//			if(rs.next()) {
//				count = rs.getInt("count(*)");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		return count;
//	}//getCampRegCount()
	
	public CampRegDTO getCampReg(int campid) {
		CampRegDTO campregDTO = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql select * from campreg where num = ?
			String sql="select * from camp where camp_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, campid);
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => campregDTO 객체생성 
			//        => set메서드 호출 => 열접근 데이터 저장
			if(rs.next()) {
				campregDTO = new CampRegDTO();
				campregDTO.setCampimg(rs.getString("camp_img"));
				campregDTO.setCampname(rs.getString("camp_name"));
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setCampprice(rs.getString("camp_price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregDTO;
	}//getCampReg

}//클래스
