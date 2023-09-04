package camppy.reserve.dao;

import java.sql.Timestamp;

public class ReserveDetailDTO {
	
	private int res_id;	// 예약번호
	private int member_id; // 회원아이디
	private int res_status; // 예약상태
	private String checkin_date; // 체크인
	private String checkout_date; // 체크아웃
	private Timestamp res_time; //예약한 시간
	private int camp_id; //캠프 아이디
	private int camp_price; // 캠프 가격
	private int sprice; // 총가격
	
	
	
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
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
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getRes_status() {
		return res_status;
	}
	public void setRes_status(int res_status) {
		this.res_status = res_status;
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
	
	
	
	
	
	
	
	
}
