package camppy.review;

import java.sql.Timestamp;

	public class ReviewDTO {
	    private int review_id; // 리뷰 아이디
	    private String content; // 내용 
	    private String image_url; // 이미지
	    private String like_cnt; // 
	    private String created_by; // 작성자
	    private String last_modified_by; //마지막 수정한 사람
	    private int member_id; // 멤버아이디
	    private int camp_id; // 캠프 아이디
	    private int res_id; // 예약 번호
	    private int rating; // 별점
	    private Timestamp created_date; // 만든 날짜
	    private Timestamp last_modified_date; // 마지막 수정한 날짜
	    private String camp_name;
	    private String id;
	
	    
	    
	    
	    
	    
	    
	    
	    
	    public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getCamp_name() {
			return camp_name;
		}
		public void setCamp_name(String camp_name) {
			this.camp_name = camp_name;
		}
		public int getReview_id() {
			return review_id;
		}
		public void setReview_id(int review_id) {
			this.review_id = review_id;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getImage_url() {
			return image_url;
		}
		public void setImage_url(String image_url) {
			this.image_url = image_url;
		}
		public String getLike_cnt() {
			return like_cnt;
		}
		public void setLike_cnt(String like_cnt) {
			this.like_cnt = like_cnt;
		}
		public String getCreated_by() {
			return created_by;
		}
		public void setCreated_by(String created_by) {
			this.created_by = created_by;
		}
		public String getLast_modified_by() {
			return last_modified_by;
		}
		public void setLast_modified_by(String last_modified_by) {
			this.last_modified_by = last_modified_by;
		}
		public int getMember_id() {
			return member_id;
		}
		public void setMember_id(int member_id) {
			this.member_id = member_id;
		}
		public int getCamp_id() {
			return camp_id;
		}
		public void setCamp_id(int camp_id) {
			this.camp_id = camp_id;
		}
		public int getRes_id() {
			return res_id;
		}
		public void setRes_id(int res_id) {
			this.res_id = res_id;
		}
		public int getRating() {
			return rating;
		}
		public void setRating(int rating) {
			this.rating = rating;
		}
		public Timestamp getCreated_date() {
			return created_date;
		}
		public void setCreated_date(Timestamp created_date) {
			this.created_date = created_date;
		}
		public Timestamp getLast_modified_date() {
			return last_modified_date;
		}
		public void setLast_modified_time(Timestamp last_modified_date) {
			this.last_modified_date = last_modified_date;
		}
		
	}
		
	    
	    