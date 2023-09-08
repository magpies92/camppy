package com.camppy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.camppy.dto.DetailDTO;

import com.camppy.dto.DetailDTO;

public class DetailDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	//1,2단계 디비 연결 메서드 정의 -> 필요로 할 때 호출 사용
	public Connection getConnection() throws Exception {
			Context init = new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/c1d2304t3");
			con=ds.getConnection();

		return con;
	}//getConnection()
	
	
	
	//기억장소 해제 메서드()
	public void dbClose() {
		//-> con, pstmt, rs 기억장소 해제
		if(rs != null){try {rs.close();} catch (SQLException e) {}}
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		if(con != null) {try {con.close();} catch (SQLException e) {}}
	}//dbClose()
	

	
	public DetailDTO getDetail(int campId) {
		System.out.println("DetailDAO getDetail()");
		
		DetailDTO detailDTO = null;
		
		try {
			con = getConnection();

//			String sql = "select * from camp where camp_id = ?; select * from camp_addr where camp_id = ?; select * from camp_like where camp_id = ?;";

//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, camp_id);
//			pstmt.setInt(2, camp_id);
//			pstmt.setInt(3, camp_id);
			

			String sql = "select * from camp where camp_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, campId);

			String sql1 = "select * from camp_addr where camp_id = ?";
			PreparedStatement pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, campId);
			
			String sql2 = "select avg(rating) as rating, camp_id from review where camp_id = ? group by camp_id";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, campId);
			
			String sql3 = "select * from camp_pic where camp_id = ?";
			PreparedStatement pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, campId);


			/*
			 * String sql2 = "select * select * from camp_like where camp_id = ?";
			 * pstmt2=con.prepareStatement(sql2); pstmt2.setInt(1, campId);
			 */

			detailDTO = new DetailDTO();
			
			rs=pstmt.executeQuery();

			if(rs.next()) {
				detailDTO.setCamp_id(rs.getInt("camp_id"));
				detailDTO.setCamp_name(rs.getString("camp_name"));
				detailDTO.setShort_intro(rs.getString("short_intro"));
				detailDTO.setCamp_img(rs.getString("camp_img"));
				detailDTO.setTel(rs.getString("tel"));
				detailDTO.setEnvironment(rs.getString("environment"));
				detailDTO.setCamp_type(rs.getString("camp_type"));
				detailDTO.setSeason(rs.getString("season"));
				detailDTO.setRuntime(rs.getString("runtime"));
				detailDTO.setHomepage(rs.getString("homepage"));
				detailDTO.setFacility(rs.getString("facility"));
				detailDTO.setIntro(rs.getString("intro"));

			}
			
			
			ResultSet rs1=pstmt1.executeQuery();
			
			if(rs1.next()) {
				detailDTO.setCamp_addr_id(rs1.getString("camp_addr_id"));
				detailDTO.setCamp_addr(rs1.getString("camp_addr"));
			}
			
			
			
			ResultSet rs2=pstmt2.executeQuery();
			
			if(rs2.next()) {
				detailDTO.setRating(rs2.getString("rating"));
			}else {
				detailDTO.setRating("0");
			}
		
			
			ResultSet rs3=pstmt3.executeQuery();
			
			if(rs3.next()) {
				detailDTO.setPic1(rs3.getString("pic1"));
				detailDTO.setPic2(rs3.getString("pic2"));
				detailDTO.setPic3(rs3.getString("pic3"));
				detailDTO.setPic4(rs3.getString("pic4"));
				detailDTO.setPic5(rs3.getString("pic5"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {dbClose();}
		return detailDTO;
	}



	public DetailDTO getPosition(int campId) {
		System.out.println("DetailDAO getPosition()");
		
		DetailDTO detailDTO = null;
		
		try {
			con = getConnection();

//			String sql = "select * from camp where camp_id = ?; select * from camp_addr where camp_id = ?; select * from camp_like where camp_id = ?;";

//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, camp_id);
//			pstmt.setInt(2, camp_id);
//			pstmt.setInt(3, camp_id);
			

			String sql = "select * from camp where camp_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, campId);

			String sql1 = "select * from camp_addr where camp_id = ?";
			PreparedStatement pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, campId);
			
			String sql2 = "select avg(rating) as rating, camp_id from review where camp_id = ? group by camp_id";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, campId);
			
			String sql3 = "select * from camp_pic where camp_id = ?";
			PreparedStatement pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, campId);


			/*
			 * String sql2 = "select * select * from camp_like where camp_id = ?";
			 * pstmt2=con.prepareStatement(sql2); pstmt2.setInt(1, campId);
			 */

			detailDTO = new DetailDTO();
			
			rs=pstmt.executeQuery();

			if(rs.next()) {
				detailDTO.setCamp_id(rs.getInt("camp_id"));
				detailDTO.setCamp_name(rs.getString("camp_name"));
				detailDTO.setShort_intro(rs.getString("short_intro"));
				detailDTO.setCamp_img(rs.getString("camp_img"));
				detailDTO.setTel(rs.getString("tel"));
				detailDTO.setEnvironment(rs.getString("environment"));
				detailDTO.setCamp_type(rs.getString("camp_type"));
				detailDTO.setSeason(rs.getString("season"));
				detailDTO.setRuntime(rs.getString("runtime"));
				detailDTO.setHomepage(rs.getString("homepage"));
				detailDTO.setFacility(rs.getString("facility"));
				detailDTO.setIntro(rs.getString("intro"));

			}
			
			
			ResultSet rs1=pstmt1.executeQuery();
			
			if(rs1.next()) {
				detailDTO.setCamp_addr_id(rs1.getString("camp_addr_id"));
				detailDTO.setCamp_addr(rs1.getString("camp_addr"));
			}
			
			
			
			ResultSet rs2=pstmt2.executeQuery();
			
			if(rs2.next()) {
				detailDTO.setRating(rs2.getString("rating"));
			}else {
				detailDTO.setRating("0");
			}
			
			
			ResultSet rs3=pstmt3.executeQuery();
			
			if(rs3.next()) {
				detailDTO.setPic1(rs3.getString("pic1"));
				detailDTO.setPic2(rs3.getString("pic2"));
				detailDTO.setPic3(rs3.getString("pic3"));
				detailDTO.setPic4(rs3.getString("pic4"));
				detailDTO.setPic5(rs3.getString("pic5"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {dbClose();}
		return detailDTO;
	}
	
	
	
	public DetailDTO getDetailList(int camp_id) {
		System.out.println("DetailDAO getDetailList()");
		DetailDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from camp where camp_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, camp_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new DetailDTO();
				dto.setCamp_id(rs.getInt("camp_id"));
				dto.setCamp_name(rs.getString("camp_name"));
				//dto.setCamp_addr(rs.getString("camp_addr"));
				dto.setTel(rs.getString("tel"));
				/*
				 * dto.setPic1(rs.getString("pic1")); dto.setPic2(rs.getString("pic2"));
				 * dto.setPic3(rs.getString("pic3")); dto.setPic4(rs.getString("pic4"));
				 * dto.setPic5(rs.getString("pic5"));
				 */
				dto.setShort_intro(rs.getString("short_intro"));
				dto.setCamp_img(rs.getString("camp_img"));
				dto.setCamp_addr(rs.getString("camp_addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getDetailList()
	
	
	
	
	
	
	
	
	

}//DetailDAO
