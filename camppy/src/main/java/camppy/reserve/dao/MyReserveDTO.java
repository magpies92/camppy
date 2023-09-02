package camppy.reserve.dao;

import java.sql.Timestamp;

public class MyReserveDTO {
	
	private int res_id;
	private Timestamp res_time;
	private String camp_id;
	private Timestamp checkin_date;
	private Timestamp checkout_date;
	private int res_status;
	private int member_id;
	private int camp_price;
	
	
	
	
	
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
	public String getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(String camp_id) {
		this.camp_id = camp_id;
	}
	public Timestamp getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(Timestamp checkin_date) {
		this.checkin_date = checkin_date;
	}
	public Timestamp getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(Timestamp checkout_date) {
		this.checkout_date = checkout_date;
	}
	public int getRes_status() {
		return res_status;
	}
	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
}
