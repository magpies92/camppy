package com.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.notice.dto.NoticeDTO;
import com.notice.dto.NoticePageDTO;

public class NoticeDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/c1d2304t3");
		con = ds.getConnection();
		return con;
	}
	
	//기억장소 해제 메서드()
	public void dbClose() {
		// 예외 상관없이 마무리 작업 => con, pstmt, rs 기억장소 해제 
		if(pstmt != null) {try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}} //if pstmt
		if(con != null) {try { con.close();} catch (SQLException e) {e.printStackTrace();}} //if con
		if(rs != null) {try { rs.close();} catch (SQLException e) {e.printStackTrace();}} //if rs
}
	
	public List<NoticeDTO> getNoticeList(NoticePageDTO noticePageDTO) {
		System.out.println("NoticeDAO getNoticeList()");
		List<NoticeDTO> noticeList = null;
		try {
			con = getConnection();
			String sql = "select * from notice order by notice_id desc limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticePageDTO.getStartRow()-1);//시작행-1
			pstmt.setInt(2, noticePageDTO.getPageSize());//몇개

			rs = pstmt.executeQuery();
			
			noticeList = new ArrayList<>();
			
			while(rs.next()) {
				NoticeDTO noticeDTO = new NoticeDTO();
				noticeDTO.setNotice_id(rs.getInt("notice_id"));
				noticeDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
				noticeDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
				noticeDTO.setCreated_by(rs.getString("created_by")); // 생성자
				noticeDTO.setLast_modified_by(rs.getString("last_modified_by")); // 마지막 수정자
				noticeDTO.setContent(rs.getString("content")); //댓글
				noticeDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
				noticeDTO.setTitle(rs.getString("title")); //제목
				noticeDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
				noticeDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
				// 배열 한 칸에 저장
				noticeList.add(noticeDTO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return noticeList;
	} //getNoticeList
	


	public int getNoticeCount() {
		int count = 0;
		try {
			con = getConnection();
			
			String sql = "select count(*) from notice";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	} // getNoticeCount

	
	
	
	public int getMaxNotice_id() {
		System.out.println("NoticeDAO getMaxNotice_id()");
		int notice_id = 0;
		try {
			con = getConnection();
			
			String sql = "select max(notice_id) from notice";
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notice_id = rs.getInt("max(notice_id)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return notice_id;
	} // getMaxNotice_id
	
	
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO insertNotice()");
		
		try {
			con = getConnection();
			
			String sql = "insert into notice( post_type, title, member_id, content, create_date, last_modified_date, notice_cnt, created_by ) values( ?, ?, ?, ?, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, noticeDTO.getNotice_id());
			pstmt.setInt(1, noticeDTO.getPost_type());
			pstmt.setString(2, noticeDTO.getTitle());
			pstmt.setInt(3,noticeDTO.getMember_id());
			pstmt.setString(4, noticeDTO.getContent());
			pstmt.setTimestamp(5, noticeDTO.getCreate_date());
			pstmt.setTimestamp(6,  noticeDTO.getLast_modified_date());
			pstmt.setInt(7, noticeDTO.getNotice_cnt());
			pstmt.setString(8,  noticeDTO.getCreated_by());

			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	} //insertNotice

	
	
	public NoticeDTO getNotice(int notice_id) {
		NoticeDTO noticeDTO = null;
		try {
			con = getConnection();
			
			String sql = "select * from notice where notice_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, notice_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				noticeDTO = new NoticeDTO();			
				noticeDTO.setNotice_id(rs.getInt("notice_id"));
				noticeDTO.setCreated_by(rs.getString("created_by")); // 생성자
				noticeDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
				noticeDTO.setTitle(rs.getString("title")); //제목
				noticeDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
				noticeDTO.setContent(rs.getString("content")); //댓글
				noticeDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
				noticeDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
				noticeDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return noticeDTO;
	} // getNotice(int notice_id)


	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> noticeList = null;
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con=getConnection();
			// 3단계  num 기준으로 내림차순
			String sql = "select * from notice ";
			pstmt=con.prepareStatement(sql);
			// //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
			rs =pstmt.executeQuery();
			// 5단계
			// 배열 객체생성
			noticeList = new ArrayList<>();
			while(rs.next()) {
				NoticeDTO noticeDTO = new NoticeDTO();
				noticeDTO.setNotice_id(rs.getInt("notice_id"));
				noticeDTO.setCreated_by(rs.getString("created_by")); // 생성자
				noticeDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
				noticeDTO.setTitle(rs.getString("title")); //제목
				noticeDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
				noticeDTO.setContent(rs.getString("content")); //댓글
				noticeDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
				noticeDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
				noticeDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
				//배열 한칸 저장
				noticeList.add(noticeDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} //finally
		return noticeList;
	}  // getBoardList()

	
	public void updateNotice(NoticeDTO noticeDTO) {
		try {
			con = getConnection();
			
			String sql = "update notice set post_type = ?, title = ?, content =? where notice_id = ?" ;
		
			pstmt=con.prepareStatement(sql);
			
//			pstmt.setString(1, noticeDTO.getCreated_by());
			pstmt.setInt(1, noticeDTO.getPost_type());
			pstmt.setString(2, noticeDTO.getTitle());
			pstmt.setString(3, noticeDTO.getContent());
			pstmt.setInt(4, noticeDTO.getNotice_id());
			  
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	} // updateNotice
	
	public void deleteNotice(int notice_id) {
		try {
			con = getConnection();
			String sql = "delete from notice where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	} // deleteNotice

	public void notice_cnt(int notice_id) {
		try {
			con = getConnection();
			
			String sql = "update notice set notice_cnt =notice_cnt+1 where notice_id = ?" ;
		
			pstmt=con.prepareStatement(sql);


			pstmt.setInt(1, notice_id);
			  
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}


	
} //클래스