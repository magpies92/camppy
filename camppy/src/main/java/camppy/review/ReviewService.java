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
			System.out.println(request.getParameter("camp_id"));
			
			String camp_name = request.getParameter("camp_name");
			int camp_id = Integer.parseInt(request.getParameter("camp_id"));
//			System.out.println(request.getParameter("camp_id"));
			int rating = Integer.parseInt(request.getParameter("rating"));
			int res_id = Integer.parseInt(request.getParameter("res_id"));
			String content = request.getParameter("content");
			int member_id = Integer.parseInt(request.getParameter("member_id"));		
			// 변수저장
			Timestamp created_date = new Timestamp(System.currentTimeMillis());
			
			int review_id = 1;
			// BoardDAO 객체생성
			reviewDAO = new ReviewDAO();
			
			//review_id = reviewDAO.getMaxReview_id() + 1;
			
		
			// ReviewDTO 객체생성
			ReviewDTO reviewDTO = new ReviewDTO();   
			// set 메서드 호출 변수값 저장
			reviewDTO.setRes_id(res_id);
			reviewDTO.setCamp_name(camp_name);
			reviewDTO.setCamp_id(camp_id);
			reviewDTO.setReview_id(review_id);
			reviewDTO.setMember_id(member_id);
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

	public ReviewDTO getReview(HttpServletRequest request) {
		System.out.println("ReviewService getReview()");
		ReviewDTO reviewDTO = null;
		try {
			// request 한글 처리
			request.setCharacterEncoding("utf-8");
			
			//request 파라미터 가져오기 -> int review_id 저장
			int res_id = Integer.parseInt(request.getParameter("res_id"));
			
			//ReviewDAO 객체 생성
			reviewDAO =new ReviewDAO();
			
			//ReviewDTO reviewDAO.getReview(res_id)메서드 호출
			reviewDTO = reviewDAO.getReview(res_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewDTO;
	}


	public void updateReview(HttpServletRequest request) {
		try {
			//한글 처리
			request.setCharacterEncoding("utf-8");
			
			// res_id, rating, content 파라미터 값 가져오기
			int res_id=Integer.parseInt(request.getParameter("res_id"));
			int rating=Integer.parseInt(request.getParameter("rating"));
			String content =request.getParameter("content");
			
			//ReviewDTo
			ReviewDTO reviewDTO =new ReviewDTO();
			// set 메서드 호출 파라미터값 저장
			reviewDTO.setRes_id(res_id);
			reviewDTO.setRating(rating);
			reviewDTO.setContent(content);
			
			//ReviewDAO 객체생성
			reviewDAO =new ReviewDAO();
			//updateReview(reviewDTO) 메서드 호출
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
