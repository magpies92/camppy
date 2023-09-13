package camppy.reserve.dao;

import java.sql.Timestamp;

public class MyReserveDTO {
	
	private int res_id;
	private Timestamp res_time;
	private int camp_id;
	private String checkin_date;
	private String checkout_date;
	private int res_status;
	private int member_id;
	private int camp_price;
	private int sprice;
	private int review_check;
	
	
	
	
	public int getReview_check() {
		return review_check;
	}
	public void setReview_check(int review_check) {
		this.review_check = review_check;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getCamp_price() {
		return camp_price;
	}
	public void setCamp_price(int camp_price) {
		this.camp_price = camp_price;
	}
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public Timestamp getRes_time() {
		return res_time;
	}
	public void setRes_time(Timestamp res_time) {
		this.res_time = res_time;
	}
	public int getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}
	public int getRes_status() {
		return res_status;
	}
	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
}
