package com.camppy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.camppy.dto.DetailDTO;

public class DetailDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt1=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	
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
			String sql = "select * from camp where camp_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, campId);
			String sql1 = "select * from camp_addr where camp_id = ?";
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, campId);
			/*
			 * String sql2 = "select * select * from camp_like where camp_id = ?";
			 * pstmt2=con.prepareStatement(sql2); pstmt2.setInt(1, campId);
			 */
			

			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				detailDTO = new DetailDTO();
				
				detailDTO.setCamp_id(rs.getInt("camp_id"));
				detailDTO.setCamp_name(rs.getString("camp_name"));
				
				detailDTO.setShort_intro(rs.getString("short_intro"));
				detailDTO.setTel(rs.getString("tel"));
				detailDTO.setEnvironment(rs.getString("environment"));
				detailDTO.setCamp_type(rs.getString("camp_type"));
				detailDTO.setSeason(rs.getString("season"));
				detailDTO.setRuntime(rs.getString("runtime"));
				detailDTO.setHomepage(rs.getString("homepage"));
				detailDTO.setFacility(rs.getString("facility"));
				/* detailDTO.setCamp_like_id(rs.getString("camp_like_id")); */
				detailDTO.setIntro(rs.getString("intro"));				
				
			}
			rs1=pstmt1.executeQuery();
			if(rs1.next()) {
				detailDTO.setCamp_addr_id(rs1.getString("camp_addr_id"));
				detailDTO.setCamp_addr(rs1.getString("camp_addr"));			
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {dbClose();}
		return detailDTO;
	}
	
	
	
	
	
	
	

}//DetailDAO
