package camppy.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



import camppy.main.action.PageDTO;

public class LikeDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	

	public List<LikeDTO> getLikeList(PageDTO pageDTO) {
		System.out.println("LikeDAO getLikeList()");
		List<LikeDTO> likeList = null;
		LikeDTO likeDTO = null;
		try {
			con=getConnection();
			System.out.println("rs");
			String sql = "select c.camp_name, c.facility, c.tel, c.camp_img, cl.camp_like_id, cl.camp_id, cl.member_id, ca.camp_addr\n"
					+ "					from camp c left join camp_like cl\n"
					+ "					on c.camp_id = cl.camp_id\n"
					+ "					left join camp_addr ca\n"
					+ "					on c.camp_id = ca.camp_id\n"
					+ "					where cl.member_id = 2\n"
					+ "					order by cl.camp_like_id desc\n"
					+ "					limit ?, ?";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1, likeDTO.getMember_id());
			pstmt.setInt(2, pageDTO.getStartRow()-1);//시작행-1
			pstmt.setInt(3, pageDTO.getPageSize());//몇 개
			rs=pstmt.executeQuery();
			System.out.println("rs1"+rs);
			likeList=new ArrayList<>();
			while(rs.next()) {
				likeDTO = new LikeDTO();
				likeDTO.setCamp_like_id(rs.getInt("camp_like_id"));
				likeDTO.setCamp_id(rs.getInt("camp_id"));
				likeDTO.setMember_id(rs.getInt("member_id"));
				likeDTO.setCamp_name(rs.getString("camp_name"));
				likeDTO.setCamp_addr(rs.getString("camp_addr"));
				likeDTO.setFacility(rs.getString("facility"));
				likeDTO.setTel(rs.getString("tel"));
				likeDTO.setCamp_img(rs.getString("camp_img"));
				
				likeList.add(likeDTO);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {dbClose();}
		return likeList;
	}//getLikeList()

	
	public int getLikeCount() {
		System.out.println("LikeDAO getLikeCount()");
		int count=0;
		try {
			con=getConnection();
			
			String sql="select count(*) from camp_like";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {dbClose();}
		return count;
	}//getLikeCount()
	
	
	public void getHeartsCount(int campId) {
		System.out.println("LikeDAO getHeartsCount()");
		
		
		
		try {
			con = getConnection();
			
			String sql = "select count(camp_like_id) as camp_like_id from camp_like where camp_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, campId);
			
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	

}//LikeDAO 
