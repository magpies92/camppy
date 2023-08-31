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
	
	
	
	
	
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(String camp_id) {
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
