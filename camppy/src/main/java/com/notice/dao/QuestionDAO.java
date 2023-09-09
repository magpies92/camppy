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
			if(con != null) {try { con.close();} catch (SQLException e) {e.printStackTrace();}} //if con
			if(rs != null) {try { rs.close();} catch (SQLException e) {e.printStackTrace();}} //if rs
	}
		
		public List<QuestionDTO> getQuestionList(QuestionPageDTO questionPageDTO) {
			System.out.println("QuestionDAO getQuestionList()");
			List<QuestionDTO> questionList = null;
			try {
				con = getConnection();
				String sql = "select * from inquiry order by inquiry_id desc limit ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, questionPageDTO.getStartRow()-1);//시작행-1
				pstmt.setInt(2, questionPageDTO.getPageSize());//몇개

				rs = pstmt.executeQuery();
				
				questionList = new ArrayList<>();
				
				while(rs.next()) {
					QuestionDTO questionDTO = new QuestionDTO();
					questionDTO.setInquiry_id(rs.getInt("inquiry_id"));
					questionDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
					questionDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
					questionDTO.setCreated_by(rs.getString("created_by")); // 생성자
					questionDTO.setLast_modified_by(rs.getString("last_modified_by")); // 마지막 수정자
					questionDTO.setContent(rs.getString("content")); //댓글
					questionDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
					questionDTO.setTitle(rs.getString("title")); //제목
					questionDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
					questionDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
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
				
				String sql = "select count(*) from inquiry";
				
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
		} // getQuestionCount

		public int getMaxInquiry_id() {
			System.out.println("QuestionDAO getMaxInquiry_id()");
			int inquiry_id = 0;
			try {
				con = getConnection();
				
				String sql = "select max(inquiry_id) from inquiry";
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					inquiry_id = rs.getInt("max(inquiry_id)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return inquiry_id;
		} // getMaxInquiry_id
		
		
		public void insertQuestion(QuestionDTO questionDTO) {
			System.out.println("QuestionDAO insertQuestion()");
			
			try {
				con = getConnection();
				
				String sql = "insert into inquiry(post_type, title, member_id, content, create_date, last_modified_date, notice_cnt, created_by ) values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, questionDTO.getPost_type());
				pstmt.setString(2, questionDTO.getTitle());
				pstmt.setInt(3,questionDTO.getMember_id());
				pstmt.setString(4, questionDTO.getContent());
				pstmt.setTimestamp(5, questionDTO.getCreate_date());
				pstmt.setTimestamp(6,  questionDTO.getLast_modified_date());
				pstmt.setInt(7, questionDTO.getNotice_cnt());
				pstmt.setString(8,  questionDTO.getCreated_by());

				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
		} //insertQuestion

		
		
		public QuestionDTO getQuestion(int inquiry_id) {
			QuestionDTO questionDTO = null;
			try {
				con = getConnection();
				
				String sql = "select * from inquiry where inquiry_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, inquiry_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					questionDTO = new QuestionDTO();			
					questionDTO.setInquiry_id(rs.getInt("inquiry_id"));
					questionDTO.setCreated_by(rs.getString("created_by")); // 생성자
					questionDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
					questionDTO.setTitle(rs.getString("title")); //제목
					questionDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
					questionDTO.setContent(rs.getString("content")); //댓글
					questionDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
					questionDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
					questionDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return questionDTO;
		} // getQuestion


		public List<QuestionDTO> getQuestionList() {
			List<QuestionDTO> questionList = null;
			try {
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				// 3단계  num 기준으로 내림차순
				String sql = "select * from inquiry";
				pstmt=con.prepareStatement(sql);
				// //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
				rs =pstmt.executeQuery();
				// 5단계 배열 객체생성
				questionList = new ArrayList<>();
				while(rs.next()) {
					QuestionDTO questionDTO = new QuestionDTO();
					questionDTO.setInquiry_id(rs.getInt("inquiry_id"));
					questionDTO.setCreated_by(rs.getString("created_by")); // 생성자
					questionDTO.setPost_type(rs.getInt("post_type")); //게시글 종류
					questionDTO.setTitle(rs.getString("title")); //제목
					questionDTO.setMember_id(rs.getInt("member_id")); //회원 아이디
					questionDTO.setContent(rs.getString("content")); //댓글
					questionDTO.setNotice_cnt(rs.getInt("notice_cnt")); //조회수
					questionDTO.setCreate_date(rs.getTimestamp("create_date")); // 작성날짜
					questionDTO.setLast_modified_date(rs.getTimestamp("last_modified_date")); //수정날짜
					//배열 한칸 저장
					questionList.add(questionDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			} //finally
			return questionList;
		}  // getBoardList()

		
		public void updateQuestion(QuestionDTO questionDTO) {
			try {
				con = getConnection();
				
				String sql = "update inquiry set post_type = ?, title = ?, content =? where inquiry_id = ?" ;
			
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, questionDTO.getPost_type());
				pstmt.setString(2, questionDTO.getTitle());
				pstmt.setString(3, questionDTO.getContent());
				pstmt.setInt(4, questionDTO.getInquiry_id());
				  
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
		} // updateQuestion
		
		public void deleteQuestion(int inquiry_id) {
			try {
				con = getConnection();
				String sql = "delete from inquiry where inquiry_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, inquiry_id);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
		} // deleteQuestion

		public void notice_cnt(int inquiry_id) {
			try {
				con = getConnection();
				
				String sql = "update inquiry set notice_cnt =notice_cnt+1 where inquiry_id = ?" ;
			
				pstmt=con.prepareStatement(sql);

				pstmt.setInt(1, inquiry_id);
				  
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
		}
	

}
