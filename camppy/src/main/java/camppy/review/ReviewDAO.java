package camppy.review;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Timestamp;
	import java.util.ArrayList;
	import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camppy.review.ReviewDTO;

	public class ReviewDAO {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
		public Connection getConnection() throws Exception {
			
			Context init = new InitialContext();
			DataSource ds=
			(DataSource)init.lookup("jdbc:mysql://itwillbs.com:3306/c1d2304t3?serverTimezone=Asia/Seoul");
			Connection con=ds.getConnection();
			return con;
			// 작업 속도가 빨라짐(1,2 단계 생략)=> 성능향상
			// 디비연결 정보를 context.xml에서만 수정하면 모든 자바파일 수정 됨 
		}
		
		//기억장소 해제 메서드()
		public void dbClose() {
			// 예외 상관 없이 마무리 작업 
						//  => con, pstmt, rs 기억장소 해제
			if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
			if(con != null) {try {con.close();} catch (SQLException e) {	}}
		}
		
//		insertReview(reviewDTO)
		public void insertReview(ReviewDTO reviewDTO) {
			try {
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				
				// 3단계 문자열 -> sql구문 변경  //(물음표 순서,값)
				String sql = "insert into review(review_id,member_id,content,rating,created_by,created_date) values(?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, reviewDTO.getReview_id());     
				pstmt.setInt(2, reviewDTO.getMember_id()); 
				pstmt.setString(3, reviewDTO.getContent());
				pstmt.setInt(4, reviewDTO.getRating());
				pstmt.setString(5, reviewDTO.getCreated_by());				
				pstmt.setTimestamp(6, reviewDTO.getCreated_date());
				// 4단계 sql구문 실행
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관 없이 마무리 작업 
				//  => con, pstmt, rs 기억장소 해제
				dbClose();
			}
		}//insertBoard()

		public int getMaxReview_id() {
			int review_id = 0;
			try {
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				// 3단계 문자열 -> sql구문 변경
				String sql = "select max(review_id) from review;";
				pstmt=con.prepareStatement(sql);
				//4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
				rs =pstmt.executeQuery();
				//5단계 : if  행 접근 -> 데이터 있으면 true 
				if(rs.next()) {
					review_id = rs.getInt("max(review_id)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관 없이 마무리 작업 
				//  => con, pstmt, rs 기억장소 해제
				dbClose();
			}
			return review_id;
		}

		public List<ReviewDTO> getReviewList() {
			List<ReviewDTO> reviewList = null;
			try {
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				// 3단계  num 기준으로 내림차순
				String sql = "select * from review order by num desc";
				pstmt=con.prepareStatement(sql);
				// //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
				rs =pstmt.executeQuery();
				// 5단계
				// 배열 객체생성
				reviewList = new ArrayList<>();
				while(rs.next()) {
					ReviewDTO reviewDTO =new ReviewDTO();
					reviewDTO.setReview_id(rs.getInt("review_id"));
					reviewDTO.setCreated_by(rs.getString("created_by"));
					reviewDTO.setRating(rs.getInt("rating"));
					reviewDTO.setContent(rs.getString("content"));
					reviewDTO.setCreated_date(rs.getTimestamp("created_date"));
					//배열 한칸 저장
					reviewList.add(reviewDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관 없이 마무리 작업 
				//  => con, pstmt, rs 기억장소 해제
				dbClose();
			}
			return reviewList;
		}

//		public ReviewDTO getreview(int num) {
//			ReviewDTO reviewDTO = null;
//			try {
//				// 1단계 JDBC 프로그램 가져오기 
//				// 2단계 디비 연결
//				con=getConnection();
//				// 3단계  num 기준으로 내림차순
//				String sql = "select * from review where num = ?";
//				pstmt=con.prepareStatement(sql);
//				pstmt.setInt(1, num);
//				// //4단계 sql구문 실행 => 실행결과 ResultSet 내장객체에 저장
//				rs =pstmt.executeQuery();
//				//5단계
//				if(rs.next()) {
//					reviewDTO = new ReviewDTO();
//					reviewDTO.setNum(rs.getInt("num"));
//					reviewDTO.setName(rs.getString("name"));
//					reviewDTO.setrating(rs.getInt("rating"));
//					reviewDTO.setReply(rs.getString("reply"));
//					reviewDTO.setDate(rs.getTimestamp("date"));
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				dbClose();
//			}
//			return reviewDTO;
//		}
//

		public void updateReview(ReviewDTO reviewDTO) {
			try {
				// => BoardDAO updateBoard() 1,2 디비연결,
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				//    3 sql구문 update board  set subject,content수정 where num =
				String sql = "update review set rating=?,content=? where review_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, reviewDTO.getRating());
				pstmt.setString(2, reviewDTO.getContent());
				pstmt.setInt(3, reviewDTO.getReview_id());      //(물음표 순서,값)
				//    4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}

		public void deleteReview(int review_id) {
			try {
			//  BoardDAO => deleteBoard() 메서드 정의
			//             1,2 디비연결, 3sql delete 4실행
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con=getConnection();
				// 3
				String sql = "delete from review where review_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, review_id);  
				// 4
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}
		
	}//class
