package camppy.review;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import camppy.review.ReviewDAO;
import camppy.review.ReviewDTO;

public class ReviewService {
	ReviewDAO reviewDAO = null;
	
//	insertReview(request)
	public void insertReview(HttpServletRequest request) {
		try {
			// request => name Rate Reply 가져오기 => 변수저장
			String created_by = request.getParameter("created_by");
			int rating = Integer.parseInt(request.getParameter("rating"));
			String content = request.getParameter("content");
			
			
			// 변수저장
			Timestamp created_date = new Timestamp(System.currentTimeMillis());
			
			int review_id = 1;
			// BoardDAO 객체생성
			reviewDAO = new ReviewDAO();
			
			//review_id = reviewDAO.getMaxReview_id() + 1;
			
		
			// ReviewDTO 객체생성
			ReviewDTO reviewDTO = new ReviewDTO();   
			// set 메서드 호출 변수값 저장
			reviewDTO.setReview_id(review_id);
			reviewDTO.setCreated_by(created_by);
			reviewDTO.setRating(rating);
			reviewDTO.setContent(content);			
			reviewDTO.setCreated_date(created_date);
			
			
			// insertBoard(boardDTO) 메서드호출
			reviewDAO.insertReview(reviewDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertReview()

	public List<ReviewDTO> getReviewList() {
		List<ReviewDTO> reviewList=null;
		try {
			reviewDAO = new ReviewDAO();
			reviewList=reviewDAO.getReviewList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}

//	public ReviewDTO getReview(HttpServletRequest request) {
//		ReviewDTO reviewDTO=null;
//		try {
//			// request에 num 파라미터 값 가져오기
//     int review_id = Integer.parseInt(request.getParameter("review_id"));
//			// BoardDAO 객체생성 
//     reviewDAO = new ReviewDAO();
//			// boardDTO = getBoard(num);
//     reviewDTO=reviewDAO.getReview(review_id);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return reviewDTO;
//	}


	public void updateReview(HttpServletRequest request) {
		try {
			// => request 한글처리, request 값 가져오기, BoardDTO 값저장
		    //    BoardDAO 객체생성 updateBoard(boardDTO) 호출
			request.setCharacterEncoding("utf-8");
			int review_id=Integer.parseInt(request.getParameter("review_id"));
			int rating=Integer.parseInt(request.getParameter("rating"));
			String content =request.getParameter("content");
			
			ReviewDTO reviewDTO =new ReviewDTO();
			reviewDTO.setReview_id(review_id);
			reviewDTO.setRating(rating);
			reviewDTO.setContent(content);
			
			reviewDAO =new ReviewDAO();
			reviewDAO.updateReview(reviewDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteReview(HttpServletRequest request) {
		try {
		//  BoardService => int num = request 파라미터값 가져오기
		int review_id=Integer.parseInt(request.getParameter("review_id"));
//			 => ReviewdDAO 객체생성 , deleteReview(review_id) 호출
		reviewDAO =new ReviewDAO();
		reviewDAO.deleteReview(review_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}//class
