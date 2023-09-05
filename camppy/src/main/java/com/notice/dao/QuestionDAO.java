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

import com.notice.dto.QuestionDTO;
import com.notice.dto.QuestionPageDTO;




public class QuestionDAO {
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
			if(con != null) {try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}} //if con
			if(rs != null) {try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}} //if rs
	}
		
		public List<QuestionDTO> getQuestionList(QuestionPageDTO questionPageDTO) {
			System.out.println("QuestionDAO getQuestionList()");
			List<QuestionDTO> questionList = null;
			try {
				con = getConnection();
				String sql = "select * from question order by notice_id desc limit ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, questionPageDTO.getStartRow()-1);//시작행-1
				pstmt.setInt(2, questionPageDTO.getPageSize());//몇개

				rs = pstmt.executeQuery();
				
				questionList = new ArrayList<>();
				
				while(rs.next()) {
					QuestionDTO questionDTO = new QuestionDTO();
					questionDTO.setNotice_id(rs.getInt("notice_id"));
					questionDTO.setComment_cnt(rs.getInt("comment_cnt"));
					questionDTO.setCreate_date(rs.getString("create_date")); // 작성날짜
					questionDTO.setLast_modified_date(rs.getString("last_modified_date")); //수정날짜
					questionDTO.setCreated_by(rs.getString("created_by")); // 생성자
					questionDTO.setLast_modified_by(rs.getString("last_modified_by")); // 마지막 수정자
					questionDTO.setContent(rs.getString("content")); //댓글
					questionDTO.setLike_cnt(rs.getInt("like_cnt")); //좋아요 개수
					questionDTO.setPost_type(rs.getString("post_type")); //게시글 종류
					questionDTO.setTitle(rs.getString("title")); //제목
					questionDTO.setMember_id(rs.getString("member_id")); //회원 아이디
					questionDTO.setNotice_cnt(rs.getInt("noitce_cnt")); //조회수
					questionDTO.setImage_url(rs.getString("image_url")); //공지사진주소
					// 배열 한 칸에 저장
					questionList.add(questionDTO);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return questionList;
		} //getNoticeList
		
		

		public int getQuestionCount() {
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


	

}
