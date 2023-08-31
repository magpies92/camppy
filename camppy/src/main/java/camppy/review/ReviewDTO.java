package camppy.review;

import java.sql.Timestamp;

	public class ReviewDTO {
	    private int review_id;
	    private String content;
	    private String image_url;
	    private String like_cnt;
	    private String created_by;
	    private String last_modified_by;
	    private int member_id;
	    private int camp_id;
	    private int res_id;
	    private int review_rate;
	    private Timestamp created_date;
	    private Timestamp last_modified_time;
	    
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
		public int getReview_rate() {
			return review_rate;
		}
		public void setReview_rate(int review_rate) {
			this.review_rate = review_rate;
		}
		public Timestamp getCreated_date() {
			return created_date;
		}
		public void setCreated_date(Timestamp created_date) {
			this.created_date = created_date;
		}
		public Timestamp getLast_modified_time() {
			return last_modified_time;
		}
		public void setLast_modified_time(Timestamp last_modified_time) {
			this.last_modified_time = last_modified_time;
		}
		
	}
		
	    
	    